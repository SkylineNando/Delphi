{******************************************************************************}
{                                                                              }
{ RAD Studio Version Insight                                                   }
{                                                                              }
{ The contents of this file are subject to the Mozilla Public License          }
{ Version 1.1 (the "License"); you may not use this file except in compliance  }
{ with the License. You may obtain a copy of the License at                    }
{ http://www.mozilla.org/MPL/                                                  }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ The Original Code is delphisvn: Subversion plugin for CodeGear Delphi.       }
{                                                                              }
{ The Initial Developer of the Original Code is Embarcadero Technologies.      }
{ Portions created by Ondrej Kelle are Copyright Ondrej Kelle. All rights      }
{ reserved.                                                                    }
{                                                                              }
{ Portions created or modified by Embarcadero Technologies are                 }
{ Copyright � 2010 Embarcadero Technologies, Inc. All Rights Reserved          }
{ Modifications include a major re-write of delphisvn. New functionality for   }
{ diffing, international character support, asynchronous gathering of data,    }
{ check-out and import, usability, tighter integration into RAD Studio, and    }
{ other new features.  Most original source files not used or re-written.      }
{                                                                              }
{ Contributors:                                                                }
{ Ondrej Kelle (tondrej)                                                       }
{ Uwe Schuster (uschuster)                                                     }
{ Embarcadero Technologies                                                     }
{                                                                              }
{******************************************************************************}
unit SvnIDELog;

interface

uses Classes, SvnIDEMenus, SvnIDEClient;

type
  TBaseLogSvnMenu = class(TSvnMenu)
  protected
    FRootType: TRootType;
    FSvnIDEClient: TSvnIDEClient;
    procedure Execute(const MenuContextList: IInterfaceList); override;
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TParentLogSvnMenu = class(TSvnMenu)
  public
    constructor Create;
  end;

  TRootDirLogSvnMenu = class(TBaseLogSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TProjectDirLogSvnMenu = class(TBaseLogSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

 procedure Register;

implementation

uses SysUtils, SvnIDEConst, ToolsApi, SvnClientLog, SvnClient, DesignIntf, Forms,
  SvnUITypes, SvnIDEUtils, ExtCtrls;

const
  sPMVLogParent = 'SvnLogParent';
  sLogView = 'LogView';
  sPMVRootDirLog = 'RootDirLog';
  sPMVProjectDirLog = 'ProjectDirLog';
  sPMVExpicitFilesLog = 'ExpicitFilesLog';

var
  LogView: INTACustomEditorView;

type
  TLogView = class(TInterfacedObject, INTACustomEditorView,
    INTACustomEditorView150, IAsyncUpdate)
  protected
    FSvnClient: TSvnClient;
    FSvnLogFrame: TSvnLogFrame;
    FSvnItem: TSvnItem;
    FRootPath: string;
    FFirst: Integer;
    { INTACustomEditorView }
    function GetCanCloneView: Boolean;
    function CloneEditorView: INTACustomEditorView;
    function GetCaption: string;
    function GetEditorWindowCaption: string;
    function GetViewIdentifier: string;
    function GetEditState: TEditState;
    function EditAction(Action: TEditAction): Boolean;
    procedure CloseAllCalled(var ShouldClose: Boolean);
    procedure SelectView;
    procedure DeselectView;
    function GetFrameClass: TCustomFrameClass;
    procedure FrameCreated(AFrame: TCustomFrame);
    { INTACustomEditorView150 }
    function GetImageIndex: Integer;
    function GetTabHintText: string;
    procedure Close(var Allowed: Boolean);
    { AsyncUpdate }
    procedure UpdateHistoryItems(SvnItem: TSvnItem; FirstNewIndex, LastNewIndex: Integer;
      ForceUpdate: Boolean);
    procedure Completed;
    { CallBacks }
    procedure LoadRevisionsCallBack(FirstRevision: Integer; Count: Integer);
  public
    constructor Create(SvnClient: TSvnClient; const ARootPath: string);
    destructor Destroy; override;
  end;

{ TBaseLogSvnMenu }

constructor TBaseLogSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited;
  FParent := sPMVLogParent;
  FSvnIDEClient := ASvnIDEClient;
end;

procedure TBaseLogSvnMenu.Execute(const MenuContextList: IInterfaceList);
var
  RootPath: string;
  MenuContext: IOTAMenuContext;
begin
  if Supports(MenuContextList[0], IOTAMenuContext, MenuContext) then
  begin
    if FRootType = rtRootDir then
      RootPath := RootDirectory(FSvnIDEClient.SvnClient, MenuContext.Ident)
    else
    if FRootType = rtProjectDir then
      RootPath := ExtractFilePath(MenuContext.Ident)
    else
      RootPath := '';
    //TODO: check if path is not empty and is versioned
    //TODO: check if there is already a Log view
    // (otherwise you will currently receive an "A component named SvnLogFrame already exists." exception)
    LogView := TLogView.Create(FSvnIDEClient.SvnClient, RootPath);
    (BorlandIDEServices as IOTAEditorViewServices).ShowEditorView(LogView);
  end;
end;

{ TParentLogSvnMenu }

constructor TParentLogSvnMenu.Create;
begin
  inherited Create(nil);
  FCaption := sPMMLog;
  FVerb := sPMVLogParent;
  FParent := sPMVSvnParent;
  FPosition := pmmpParentLogSvnMenu;
  FHelpContext := 0;
end;

{ TRootDirLogSvnMenu }

constructor TRootDirLogSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtRootDir;
  FCaption := sPMMRootDir;
  FVerb := sPMVRootDirLog;
  FPosition := pmmpRootDirLogSvnMenu;
  FHelpContext := 0;
end;

{ TProjectDirLogSvnMenu }

constructor TProjectDirLogSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtProjectDir;
  FCaption := sPMMProjectDir;
  FVerb := sPMVProjectDirLog;
  FPosition := pmmpProjectDirLogSvnMenu;
  FHelpContext := 0;
end;

{ TLogView }

function TLogView.CloneEditorView: INTACustomEditorView;
begin
  Result := nil;
end;

procedure TLogView.Close(var Allowed: Boolean);
begin

end;

procedure TLogView.CloseAllCalled(var ShouldClose: Boolean);
begin
  ShouldClose := True;
end;

procedure TLogView.Completed;
begin
  if Assigned(FSvnLogFrame) then
    FSvnLogFrame.NextCompleted;
end;

constructor TLogView.Create(SvnClient: TSvnClient; const ARootPath: string);
begin
  inherited Create;
  FSvnClient := SvnClient;
  FRootPath := ARootPath;
end;

procedure TLogView.DeselectView;
begin
  // Not used
end;

destructor TLogView.Destroy;
begin
  if FSvnItem <> nil then
    FSvnItem.Free;
  inherited;
end;

function TLogView.EditAction(Action: TEditAction): Boolean;
var
  SvnEditAction: TSvnEditAction;
begin
  Result := False;
  if Assigned(FSvnLogFrame) then
  begin
    SvnEditAction := EditActionToSvnEditAction(Action);
    if SvnEditAction <> seaUnknown then
      Result := FSvnLogFrame.PerformEditAction(SvnEditAction);
  end;
end;

procedure TLogView.FrameCreated(AFrame: TCustomFrame);
begin
  FSvnLogFrame := TSvnLogFrame(AFrame);
  FSvnLogFrame.LoadRevisionsCallBack := LoadRevisionsCallBack;
  FSvnItem := TSvnItem.Create(FSvnClient, nil, FRootPath, True);
  FSvnItem.AsyncUpdate := Self;
  FSvnItem.IncludeChangeFiles := True;
  FSvnItem.LogLimit := DefaultRange;
  Application.ProcessMessages;
  FSvnLogFrame.StartAsync;
  FSvnItem.AsyncReloadHistory;
end;

function TLogView.GetCanCloneView: Boolean;
begin
  Result := False;
end;

function TLogView.GetCaption: string;
begin
  Result := sLog;
end;

function TLogView.GetEditorWindowCaption: string;
begin
  Result := sLog;
end;

function TLogView.GetEditState: TEditState;
begin
  Result := [];
  if Assigned(FSvnLogFrame) then
    Result := SvnEditStateToEditState(FSvnLogFrame.SvnEditState);
end;

function TLogView.GetFrameClass: TCustomFrameClass;
begin
  Result := TSvnLogFrame;
end;

function TLogView.GetImageIndex: Integer;
begin
  Result := 0;
end;

function TLogView.GetTabHintText: string;
begin
  Result := '';
  //TODO: provide a custom hint for the LogView tab
end;

function TLogView.GetViewIdentifier: string;
begin
  Result := sLogView;
end;

procedure TLogView.LoadRevisionsCallBack(FirstRevision, Count: Integer);
begin
  if FirstRevision = -1 then
    FFirst := 0;
  FSvnItem.LogLimit := Count;
  FSvnItem.LogFirstRev := FirstRevision;
  FSvnItem.AsyncUpdate := Self;
  FSvnLogFrame.StartAsync;
  FSvnItem.AsyncReloadHistory;
end;

procedure TLogView.SelectView;
begin
  // Not used
end;

procedure TLogView.UpdateHistoryItems(SvnItem: TSvnItem; FirstNewIndex, LastNewIndex: Integer;
  ForceUpdate: Boolean);
var
  I: Integer;
  HistoryItem: TSvnHistoryItem;
  CanUpdate: Boolean;
begin
  CanUpdate := (FirstNewIndex = 0) or ((LastNewIndex - FFirst <> 0 ) and ((LastNewIndex - FFirst) Mod 20 = 0));
  if CanUpdate or ForceUpdate then
  begin
    FSvnLogFrame.BeginUpdate;
    try
      for I := FFirst to LastNewIndex do
      begin
        HistoryItem := SvnItem.HistoryItems[I];
        FSvnLogFrame.AddRevisions(HistoryItem.Revision, HistoryItem.Time,
          HistoryItem.Author, HistoryItem.LogMessage, HistoryItem.ChangeFiles);
      end;
    finally
      FSvnLogFrame.EndUpdate;
    end;
    FFirst := LastNewIndex + 1;
    Application.ProcessMessages;
  end;
end;

function GetView: INTACustomEditorView;
begin
  Result := LogView;
end;

procedure Register;
begin
  (BorlandIDEServices as IOTAEditorViewServices).RegisterEditorView(sLogView, GetView);
end;

initialization
finalization
  (BorlandIDEServices as IOTAEditorViewServices).UnRegisterEditorView(sLogView);
end.
