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
unit SvnIDECommit;

interface

uses Classes, SvnIDEMenus, SvnIDEClient, SvnClient;

type
  TBaseCommitSvnMenu = class(TSvnMenu)
  protected
    FRootType: TRootType;
    FSvnIDEClient: TSvnIDEClient;
    procedure Execute(const MenuContextList: IInterfaceList); override;
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TParentCommitSvnMenu = class(TSvnMenu)
  public
    constructor Create;
  end;

  TRootDirCommitSvnMenu = class(TBaseCommitSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TProjectDirCommitSvnMenu = class(TBaseCommitSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TExpicitFilesCommitSvnMenu = class(TBaseCommitSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  TFileCommitSvnMenu = class(TBaseCommitSvnMenu)
  public
    constructor Create(ASvnIDEClient: TSvnIDEClient);
  end;

  procedure DoCommit(const SvnClient: TSvnClient; const CommitList: TStringList;
    const Comment: string; const RecentComments: TStringList);

  procedure LoadRecentComments(const RecentComments:TStringList);

  procedure SaveRecentComments(const RecentComments:TStringList);

  procedure Register;

implementation

uses SysUtils, ToolsApi, Forms, DesignIntf, ComCtrls, Controls, SvnIDEConst,
  SvnClientCommitFrame, svn_client, FileHistoryAPI, IStreams,
  ActiveX, Dialogs, SvnIDEClean, SvnIDEMessageView, Registry, SvnUITypes,
  SvnIDEUtils;

const
  sPMVCommit = 'Commit';
  sSvnCommitView = 'SvnCommitView';
  sPMVCommitParent = 'CommitParent';
  sPMVRootDirCommit = 'RootDirCommit';
  sPMVProjectDirCommit = 'ProjectDirCommit';
  sPMVExpicitFilesCommit = 'ExpicitFilesCommit';
  sSubversion = 'Subversion';
  sRecentComments = 'RecentComments';
  sComment = 'Comment%d';
  MaxRecentComments = 15;

var
  CommitView: INTACustomEditorView;

type
  TCommit = class(TInterfacedObject, INTACustomEditorView, INTACustomEditorView150)
  protected
    FDirectoryList: TStringList;
    FSvnClient: TSvnClient;
    FSvnCommitFrame: TSvnCommitFrame;
    FRootType: TRootType;
    FFoundMissing: Boolean;
    FStatusItem: PSvnListViewItem;
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

    { CallBacks }
    procedure ModificationCallBack(Sender: TObject; Item: TSvnItem;
      var Cancel: Boolean);
    procedure CommitCallBack(const CommitList: TStringList;
      const Comment: string; const RecentComments: TStringList);
    procedure DiffCallBack(const FileName: string);
    function RevertCallBack(const FileName: string; ARecursive: Boolean; var ANewTextStatus: TSvnWCStatusKind): Boolean;
    procedure CloseCallBack;
    function AddCallBack(const FileName: string): Boolean;
    procedure ResolveCallBack(const FileName: string);
    procedure GetFileStatusCallBack(const FileName: string; var SvnListViewItem: TSvnListViewItem);
    procedure StatusCallBack(Sender: TObject; Item: TSvnItem; var Cancel: Boolean);
    { Misc }
  public
    constructor Create(SvnClient: TSvnClient; const DirectoryList: TStringList;
      RootType: TRootType);
    destructor Destroy; override;
  end;

{ TBaseCommitSvnMenu }

constructor TBaseCommitSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited;
  FCaption := sPMMCommit;
  FVerb := sPMVCommit;
  FParent := sPMVCommitParent;
  FHelpContext := 0;
  FSvnIDEClient := ASvnIDEClient;
  CommitView := nil;
  FRootType := rtRootDir;
end;

procedure TBaseCommitSvnMenu.Execute(const MenuContextList: IInterfaceList);
var
  DirectoryList: TStringList;
  ProjectFound: Boolean;
begin
  if CommitView <> nil then
  begin
    (BorlandIDEServices as IOTAEditorViewServices).ShowEditorView(CommitView);
    MessageDlg(sCommitLoaded, mtWarning, [mbOK], 0);
  end
  else
  begin
  DirectoryList := TStringList.Create;
  try
    BuildFileList(MenuContextList, DirectoryList, FSvnIDEClient.SvnClient, FRootType, ProjectFound);
    CommitView := TCommit.Create(FSvnIDEClient.SvnClient, DirectoryList, FRootType);
    (BorlandIDEServices as IOTAEditorViewServices).ShowEditorView(CommitView);
  finally
    DirectoryList.Free;
  end;
end;
end;

{ TParentCommitSvnMenu }

constructor TParentCommitSvnMenu.Create;
begin
  inherited Create(nil);
  FCaption := sPMMCommit;
  FVerb := sPMVCommitParent;
  FParent := sPMVSvnParent;
  FPosition := pmmpParentCommitSvnMenu;
  FHelpContext := 0;
end;

{ TRootDirCommitSvnMenu }

constructor TRootDirCommitSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtRootDir;
  FParent := sPMVCommitParent;
  FCaption := sPMMRootDir;
  FVerb := sPMVRootDirCommit;
  FPosition := pmmpRootDirCommitSvnMenu;
  FHelpContext := 0;
end;

{ TProjectDirCommitSvnMenu }

constructor TProjectDirCommitSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtProjectDir;
  FParent := sPMVCommitParent;
  FCaption := sPMMProjectDir;
  FVerb := sPMVProjectDirCommit;
  FPosition := pmmpProjectDirCommitSvnMenu;
  FHelpContext := 0;
end;

{ TExpicitFilesCommitSvnMenu }

constructor TExpicitFilesCommitSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtExpicitFiles;
  FParent := sPMVCommitParent;
  FCaption := sPMMExpicitFiles;
  FVerb := sPMVExpicitFilesCommit;
  FPosition := pmmpExpicitFilesCommitSvnMenu;
  FHelpContext := 0;
end;

{ TFileCommitSvnMenu }

constructor TFileCommitSvnMenu.Create(ASvnIDEClient: TSvnIDEClient);
begin
  inherited Create(ASvnIDEClient);
  FRootType := rtRootDir;
  FParent := sPMVSvnParent;
  FCaption := sPMMCommit;
  FVerb := sPMVCommit;
  FPosition := pmmpFileCommitSvnMenu;
  FHelpContext := 0;
end;

{ TCommit }

function TCommit.AddCallBack(const FileName: string): Boolean;
begin
  Result := False;
  try
    FSvnClient.Add(FileName);
    Result := True;
  except
    if not HandleSvnException(ExceptObject) then
      raise;
  end;
end;

function TCommit.CloneEditorView: INTACustomEditorView;
begin
  Result := nil;
end;

procedure TCommit.Close(var Allowed: Boolean);
begin
  Allowed := True;
  CommitView := nil;
end;

procedure TCommit.CloseAllCalled(var ShouldClose: Boolean);
begin
  ShouldClose := True;
end;

procedure TCommit.CloseCallBack;
begin
  (BorlandIDEServices as IOTAEditorViewServices).CloseActiveEditorView;
end;

procedure TCommit.CommitCallBack(const CommitList: TStringList;
  const Comment: string; const RecentComments: TStringList);
begin
  DoCommit(FSvnClient, CommitList, Comment, RecentComments);
end;

constructor TCommit.Create(SvnClient: TSvnClient; const DirectoryList: TStringList;
  RootType: TRootType);
begin
  inherited Create;
  FSvnClient := SvnClient;
  FDirectoryList := TStringList.Create;
  FDirectoryList.Assign(DirectoryList);
  FRootType := RootType;
  SaveAll;
end;

procedure TCommit.DeselectView;
begin
  // Not used
end;

destructor TCommit.Destroy;
begin
  FDirectoryList.Free;
  inherited;
end;

procedure TCommit.DiffCallBack(const FileName: string);
var
  SvnItem: TSvnItem;
  Stream1: IStream;
  Stream2: IStream;
  TempStream: IStream;
  Rev: Integer;
  Flag2: TOTADiffFlag;
  StreamLength: Largeint;
  Dummy: Largeint;
begin
  SvnItem := TSvnItem.Create(FSvnClient, nil, FileName, False, False, True);
  try
    Rev := SvnItem.BaseRevision;
    Stream1 := TIStreamAdapter.Create(TStringStream.Create(SvnItem.GetBaseFile), soOwned);
  finally
    SvnItem.Free;
  end;
  TempStream := TIFileStream.Create(FileName, fmShareDenyNone);
  Stream2 := TStreamAdapter.Create(TMemoryStream.Create, soOwned);
  TempStream.Seek(0, STREAM_SEEK_END, StreamLength);
  TempStream.Seek(0, STREAM_SEEK_SET, Dummy);
  TempStream.CopyTo(Stream2 as IStream, StreamLength, Dummy, Dummy);
  TempStream := nil;
  if SameText(ExtractFileExt(FileName), '.dproj') or SameText(ExtractFileExt(FileName), '.cbproj') then
    Flag2 := dfOTAFile
  else
    Flag2 := dfOTABuffer;
  (BorlandIDEServices as IOTACustomDifferenceManager).
    ShowDifference(Stream1, Stream2, FileName + '-' + IntToStr(Rev),
      FileName + sWorking, '', FileName, dfOTARevision, Flag2, dtOTADefault);
  Stream1 := nil;
  Stream2 := nil;
end;

function TCommit.EditAction(Action: TEditAction): Boolean;
var
  SvnEditAction: TSvnEditAction;
begin
  Result := False;
  if Assigned(FSvnCommitFrame) then
  begin
    SvnEditAction := EditActionToSvnEditAction(Action);
    if SvnEditAction <> seaUnknown then
      Result := FSvnCommitFrame.PerformEditAction(SvnEditAction);
  end;
end;

procedure TCommit.FrameCreated(AFrame: TCustomFrame);

  // make sure that all files/paths are versioned
  procedure CheckVersionProjectFiles(AFilesAndDirectoriesInRepo,
    AddedDirectories, AUnversionedFilesAndDirectories: TStringList; AutoAdd: Boolean = False);
  var
    I, J, Idx, StartUnversionedIdx: Integer;
    S: string;
    TestPaths, VersionedPaths: TStringList;
  begin
    VersionedPaths := TStringList.Create;
    try
      VersionedPaths.Sorted := True;
      for I := AFilesAndDirectoriesInRepo.Count - 1 downto 0 do
        if not FSvnClient.IsPathVersioned(AFilesAndDirectoriesInRepo[I]) then
        begin
          TestPaths := TStringList.Create;
          try
            S := ExtractFilePath(AFilesAndDirectoriesInRepo[I]);
            while Pos(PathDelim, S) > 0 do
            begin
              Delete(S, Length(S), 1);
              TestPaths.Add(S);
              Idx := LastDelimiter(PathDelim, S);
              if Idx > 0 then
                Delete(S, Idx + 1, Length(S) - Idx);
            end;
            TestPaths.Sort;
            StartUnversionedIdx := -1;
            for J := TestPaths.Count - 1 downto 0 do
              if VersionedPaths.IndexOf(TestPaths[J]) <> -1 then
              begin
                StartUnversionedIdx := J + 1;
                Break;
              end
              else
              if FSvnClient.IsPathVersioned(TestPaths[J]) then
              begin
                VersionedPaths.Add(TestPaths[J]);
                StartUnversionedIdx := J + 1;
                Break;
              end;
            if StartUnversionedIdx <> -1 then
            begin
              for J := StartUnversionedIdx to TestPaths.Count - 1 do
                if AutoAdd then
              begin
                FSvnClient.Add(TestPaths[J]);
                AddedDirectories.Add(TestPaths[J]);
                end
                else
                if AUnversionedFilesAndDirectories.IndexOf(TestPaths[J]) = -1 then
                  AUnversionedFilesAndDirectories.AddObject(TestPaths[J], TObject(1));
              if TestPaths[Pred(TestPaths.Count)] <> AFilesAndDirectoriesInRepo[I] then
                if AutoAdd then
                  FSvnClient.Add(AFilesAndDirectoriesInRepo[I])
                else
                begin
                  AUnversionedFilesAndDirectories.Add(AFilesAndDirectoriesInRepo[I]);
                  AFilesAndDirectoriesInRepo.Delete(I);
              end;
            end
            else
              //remove files outside of the working copy (they cannot be committed)
              AFilesAndDirectoriesInRepo.Delete(I);
          finally
            TestPaths.Free;
          end;
        end;
    finally
      VersionedPaths.Free;
    end;
  end;

var
  I: Integer;
  Cursor: TCursor;
  RecentComments: TStringList;
  TempBasePath: string;
  FilesAndDirectoriesInRepo, AddedDirectories, UnversionedFilesAndDirectories: TStringList;
begin
  FSvnCommitFrame := TSvnCommitFrame(AFrame);
  Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  try
    FilesAndDirectoriesInRepo := TStringList.Create;
    AddedDirectories := TStringList.Create;
    UnversionedFilesAndDirectories := TStringList.Create;
    FSvnCommitFrame.BeginUpdate;
    try
      UnversionedFilesAndDirectories.Sorted := True;
      FilesAndDirectoriesInRepo.Assign(FDirectoryList);
      if FRootType = rtExpicitFiles then
      begin
        CheckVersionProjectFiles(FilesAndDirectoriesInRepo, AddedDirectories,
          UnversionedFilesAndDirectories);
        for I := 0 to UnversionedFilesAndDirectories.Count - 1 do
          FSvnCommitFrame.Add(TSvnListViewItem.Create(UnversionedFilesAndDirectories[I],
            svnWcStatusUnversioned, UnversionedFilesAndDirectories.Objects[I] <> nil));
      end;
      for I := 0 to FilesAndDirectoriesInRepo.Count - 1 do
        FSvnClient.GetModifications(FilesAndDirectoriesInRepo[I], ModificationCallBack, True,
          False, False, True);
      if (FRootType = rtExpicitFiles) and (AddedDirectories.Count > 0) then
      begin
        for I := 0 to AddedDirectories.Count - 1 do
          FSvnCommitFrame.Add(TSvnListViewItem.Create(AddedDirectories[I], svnWcStatusAdded, True));
        FilesAndDirectoriesInRepo.AddStrings(AddedDirectories);
      end;
      FSvnCommitFrame.CheckForNoFilesVisible;
      FSvnCommitFrame.URL := FSvnClient.GetBaseURL(FilesAndDirectoriesInRepo, TempBasePath);
      FSvnCommitFrame.CommitCallBack := CommitCallBack;
      FSvnCommitFrame.CloseCallBack := CloseCallBack;
      FSvnCommitFrame.DiffCallBack := DiffCallBack;
      FSvnCommitFrame.RevertCallBack := RevertCallBack;
      FSvnCommitFrame.AddCallBack := AddCallBack;
      FSvnCommitFrame.ResolveCallBack := ResolveCallBack;
      FSvnCommitFrame.GetFileStatusCallBack := GetFileStatusCallBack;
      if FFoundMissing then
        FSvnCommitFrame.HandleMissingFiles;
      RecentComments := TStringList.Create;
      try
        LoadRecentComments(RecentComments);
        FSvnCommitFrame.RecentComments := RecentComments;
      finally
        RecentComments.Free;
      end;
    finally
      FSvnCommitFrame.EndUpdate;
      FilesAndDirectoriesInRepo.Free;
      AddedDirectories.Free;
      UnversionedFilesAndDirectories.Free;
    end;
  finally
    Screen.Cursor := Cursor;
  end;
end;

function TCommit.GetCanCloneView: Boolean;
begin
  Result := False;
end;

function TCommit.GetCaption: string;
begin
  Result := sCommit;
end;

function TCommit.GetEditorWindowCaption: string;
begin
  Result := sCommit;
end;

function TCommit.GetEditState: TEditState;
begin
  Result := [];
  if Assigned(FSvnCommitFrame) then
    Result := SvnEditStateToEditState(FSvnCommitFrame.SvnEditState);
end;

procedure TCommit.GetFileStatusCallBack(const FileName: string;
  var SvnListViewItem: TSvnListViewItem);
begin
  FStatusItem := @SvnListViewItem;
  FSvnClient.GetModifications(FileName, StatusCallBack, False);
end;

function TCommit.GetFrameClass: TCustomFrameClass;
begin
  Result := TSvnCommitFrame;
end;

function TCommit.GetImageIndex: Integer;
begin
  Result := 0;
end;

function TCommit.GetTabHintText: string;
begin
  Result := '';
  //TODO: provide a custom hint for the Commit tab
end;

function TCommit.GetViewIdentifier: string;
begin
  Result := sSvnCommitView;
end;

procedure TCommit.ModificationCallBack(Sender: TObject; Item: TSvnItem;
  var Cancel: Boolean);
begin
  if (FRootType <> rtExpicitFiles) or (not FSvnCommitFrame.Found(Item.PathName)) then
  begin
    if Item.TextStatus = svnWcStatusMissing then
      FFoundMissing := True;
    FSvnCommitFrame.Add(TSvnListViewItem.Create(Item.PathName, Item.TextStatus, Item.IsDirectory));
  end;
end;

procedure TCommit.ResolveCallBack(const FileName: string);
begin
  try
    FSvnClient.Resolved(FileName);
  except
    if not HandleSvnException(ExceptObject) then
      raise;
  end;
end;

function TCommit.RevertCallBack(const FileName: string; ARecursive: Boolean; var ANewTextStatus: TSvnWCStatusKind): Boolean;
var
  FileNameList: TStringList;
  Module: IOTAModule;
  SvnItem: TSvnItem;
begin
  Result := False;
  FileNameList := TStringList.Create;
  try
    FileNameList.Add(FileName);
    try
      FSvnClient.Revert(FileNameList, SvnMessageView.MessageViewCallBack, ARecursive);
      SvnItem := TSvnItem.Create(FSvnClient, nil, FileName);
      try
        SvnItem.ReloadStatus;
        ANewTextStatus := SvnItem.TextStatus;
      finally
        SvnItem.Free;
      end;
      Result := True;
    except
      if not HandleSvnException(ExceptObject) then
        raise;
    end;
  finally
    FileNameList.Free;
  end;
  Module := (BorlandIDEServices as IOTAModuleServices).FindModule(FileName);
  if Module <> nil then
    Module.Refresh(True);
end;

procedure TCommit.SelectView;
begin
  // Not used
end;

procedure TCommit.StatusCallBack(Sender: TObject; Item: TSvnItem;
  var Cancel: Boolean);
begin
  FStatusItem^.NewValues(Item.PathName, Item.TextStatus, Item.IsDirectory);
end;

procedure DoCommit(const SvnClient: TSvnClient; const CommitList: TStringList;
  const Comment: string; const RecentComments: TStringList);
var
  I: Integer;
  S: string;
  NeedToClean: Boolean;
begin
  SvnMessageView.CheckMessageGroup(True);
  SaveRecentComments(RecentComments);
  try
    if SvnClient.Commit(CommitList, TrimRight(Comment), SvnMessageView.MessageViewCallBack) then
      SvnMessageView.WriteTitle(Format(sCommitCompleted, [SvnClient.LastCommitInfoRevision]));
  except
    if ExceptObject is ESvnError then
    begin
      S := '';
      NeedToClean := False;
      for I := 0 to ESvnError(ExceptObject).Count - 1 do
      begin
        S := S + ESvnError(ExceptObject).Messages[I] + sLineBreak;
        if ESvnError(ExceptObject).ErrorCodes[I] = SVN_ERR_WC_LOCKED then  // Need to clean error
        begin
          S := S + sNeedToClean + sLineBreak + sRunClean + sLineBreak;
          NeedToClean := True;
        end;
      end;
      if NeedToClean then
      begin
        if MessageDlg(S, mtError, [mbYes, mbNo], 0) = mrYes then
          DoClean(SvnClient, CommitList)
      end
      else
        MessageDlg(ESvnError(ExceptObject).Message, mtError, [mbOK], 0);
    end
    else
      raise;
  end;
end;

procedure LoadRecentComments(const RecentComments: TStringList);
var
  Reg: TRegistry;
  BaseKey: string;
  Key: string;
  S: string;
  I: Integer;
begin
  Reg := TRegistry.Create;
  BaseKey := BaseRegKey + sRecentComments;
  if not Reg.KeyExists(BaseKey) then
    Exit;
  Reg.OpenKeyReadOnly(BaseKey);
  for I := 0 to MaxRecentComments - 1 do
  begin
    Key := Format(sComment, [I]);
    S := Reg.ReadString(Key);
    if S = '' then
      Break
    else
      RecentComments.Add(S);
  end;
end;

procedure SaveRecentComments(const RecentComments: TStringList);
var
  Reg: TRegistry;
  BaseKey: string;
  Key: string;
  I: Integer;
  WriteCount: Integer;
begin
  Reg := TRegistry.Create;
  BaseKey := BaseRegKey + sRecentComments;
  Reg.OpenKey(BaseKey, True);
  WriteCount := MaxRecentComments;
  if WriteCount > RecentComments.Count then
    WriteCount := RecentComments.Count;
  for I := 0 to WriteCount - 1 do
  begin
    Key := Format(sComment, [I]);
    Reg.WriteString(Key, RecentComments[I]);
  end;
end;

function GetView: INTACustomEditorView;
begin
  Result := CommitView;
end;

procedure Register;
begin
  (BorlandIDEServices as IOTAEditorViewServices).RegisterEditorView(sSvnCommitView, GetView);
end;

initialization
finalization
  (BorlandIDEServices as IOTAEditorViewServices).UnRegisterEditorView(sSvnCommitView);
end.
