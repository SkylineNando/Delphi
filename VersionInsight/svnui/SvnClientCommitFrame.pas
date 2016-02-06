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
unit SvnClientCommitFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, svn_client, Generics.Collections, ActnList, Menus,
  ExtCtrls, SvnUITypes, SvnUIUtils, Clipbrd, Generics.Defaults, SvnImages, SvnTree;

type
  PSvnListViewItem = ^TSvnListViewItem;
  TSvnListViewItem = class
  protected
    FDirectory: Boolean;
    FPathName: string;
    FTextStatus: TSvnWCStatusKind;
    FChecked: Boolean;
    FVisible: Boolean;
    procedure SetTextStatus(Value: TSvnWCStatusKind);
  public
    constructor Create(const APathName: string; ATextStatus: TSvnWCStatusKind;
      ADirectory: Boolean);
    procedure NewValues(const APathName: string; ATextStatus: TSvnWCStatusKind;
      ADirectory: Boolean);
    property Directory: Boolean read FDirectory;
    property PathName: string read FPathName;
    property TextStatus: TSvnWCStatusKind read FTextStatus write SetTextStatus;
    property Checked: Boolean read FChecked write FChecked;
    property Visible: Boolean read FVisible write FVisible;
  end;

  TCommitCallBack = procedure(const CommitList: TStringList;
    const Comment: string; const RecentComments: TStringList) of object;
  TCloseCallBack = procedure of object;
  TDiffCallBack = procedure(const FileName: string) of object;
  TRevertCallBack = function(const FileName: string; ARecursive: Boolean; var ANewTextStatus: TSvnWCStatusKind): Boolean of object;
  TAddCallBack = function(const FileName: string): Boolean of object;
  TResolveCallBack = procedure(const FileName: string) of object;
  TGetFileStatusCallBack = procedure(const FileName: string; var SvnListViewItem: TSvnListViewItem) of object;

  TSvnCommitFrame = class(TFrame)
    Label1: TLabel;
    Location: TLabel;
    Comment: TMemo;
    Recent: TButton;
    Commit: TButton;
    Files: TListView;
    UnversionedFiles: TCheckBox;
    Externals: TCheckBox;
    CommitMenu: TPopupMenu;
    CommitActions: TActionList;
    DiffAction: TAction;
    Difference1: TMenuItem;
    RevertAction: TAction;
    Revert1: TMenuItem;
    CheckAll: TCheckBox;
    UpperPanel: TPanel;
    Splitter1: TSplitter;
    LowerPanel: TPanel;
    Label2: TLabel;
    AddAction: TAction;
    Add1: TMenuItem;
    ResolveAction: TAction;
    ResolveAction1: TMenuItem;

    procedure CommitClick(Sender: TObject);
    procedure UnversionedFilesClick(Sender: TObject);
    procedure ExternalsClick(Sender: TObject);
    procedure FilesItemChecked(Sender: TObject; Item: TListItem);
    procedure FilesColumnClick(Sender: TObject; Column: TListColumn);
    procedure DoDiff(Sender: TObject);
    procedure RevertActionExecute(Sender: TObject);
    procedure CheckAllClick(Sender: TObject);
    procedure FilesDblClick(Sender: TObject);
    procedure RecentClick(Sender: TObject);
    procedure AddActionUpdate(Sender: TObject);
    procedure RevertActionUpdate(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure DiffActionUpdate(Sender: TObject);
    procedure ResolveActionUpdate(Sender: TObject);
    procedure ResolveActionExecute(Sender: TObject);
    procedure LowerPanelResize(Sender: TObject);
    procedure FilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FilesCustomDraw(Sender: TCustomListView; const ARect: TRect;
      var DefaultDraw: Boolean);
  protected
    FCommitCallBack: TCommitCallBack;
    FCloseCallBack: TCloseCallBack;
    FDiffCallBack: TDiffCallBack;
    FRevertCallBack: TRevertCallBack;
    FAddCallBack: TAddCallBack;
    FResolveCallBack: TResolveCallBack;
    FGetFileStatusCallBack: TGetFileStatusCallBack;
    FExecutingCheckAllClick: Boolean;
    FExecutingUnversionedParentCheck: Boolean;
    FItemList: TList<TSvnListViewItem>;
    FIndexList: TList<Integer>;
    FSortColumn: Integer;
    FSortOrder: Boolean;
    FRecentComments: TStringList;
    FURL: string;
    FNoFiles: Boolean;
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
    function GetSvnEditState: TSvnEditState;
    procedure SetRecentComments(Value: TStringList);
    procedure Notify(Sender: TObject; const Item: TSvnListViewItem;
      Action: TCollectionNotification);
    procedure RebuildList;
    function ItemShown(const SvnListItem: TSvnListViewItem): Boolean;
    procedure SetURL(const AValue: string);
    procedure UpdateCommitButton;
    procedure UpdateListView(const SvnListItem: TSvnListViewItem; ItemIndex: Integer);
    procedure ResizeStuff;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Add(const SvnListItem: TSvnListViewItem);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure CheckForNoFilesVisible;
    function Found(const FileName: string): Boolean;
    function PerformEditAction(AEditAction: TSvnEditAction): Boolean;
    procedure HandleMissingFiles;
    property AddCallBack: TAddCallBack read FAddCallBack write FAddCallBack;
    property CloseCallBack: TCloseCallBack read FCloseCallBack write FCloseCallBack;
    property CommitCallBack: TCommitCallBack read FCommitCallBack write FCommitCallBack;
    property DiffCallBack: TDiffCallBack read FDiffCallBack write FDiffCallBack;
    property RevertCallBack: TRevertCallBack read FRevertCallBack write FRevertCallBack;
    property ResolveCallBack: TResolveCallBack read FResolveCallBack write FResolveCallBack;
    property GetFileStatusCallBack: TGetFileStatusCallBack read FGetFileStatusCallBack write FGetFileStatusCallBack;
    property RecentComments: TStringList read FRecentComments write SetRecentComments;
    property SvnEditState: TSvnEditState read GetSvnEditState;
    property URL: string read FURL write SetURL;
  end;

implementation

uses SvnClient, SvnUIConst, SvnClientRecentComments;

{$R *.dfm}

type
  TSvnListViewItemPathComparer = class(TInterfacedObject, IComparer<TSvnListViewItem>)
    function Compare(const Left, Right: TSvnListViewItem): Integer;
  end;

function ColumnSort(Item1, Item2: TListItem; Param: LParam): Integer; stdcall;
var
  SvnCommitFrame: TSvnCommitFrame;
  S1, S2: string;
begin
  SvnCommitFrame := TSvnCommitFrame(Param);
  if SvnCommitFrame.FSortColumn = 0 then
  begin
    S1 := AnsiLowerCase(Item1.Caption);
    S2 := AnsiLowerCase(Item2.Caption);
  end
  else
  begin
    S1 := AnsiLowerCase(Item1.SubItems[SvnCommitFrame.FSortColumn - 1]);
    S2 := AnsiLowerCase(Item2.SubItems[SvnCommitFrame.FSortColumn - 1]);
  end;
  if S1 = S2 then
    Result := 0
  else if (S1 < S2) xor SvnCommitFrame.FSortOrder then
    Result := 1
  else
    Result := -1;
end;

procedure TSvnCommitFrame.Add(const SvnListItem: TSvnListViewItem);
var
  ItemIndex: Integer;
begin
  ItemIndex := FItemList.Add(SvnListItem);
  UpdateListView(SvnListItem, ItemIndex);
end;

procedure TSvnCommitFrame.AddActionExecute(Sender: TObject);

  function CheckAddParents(ASvnListViewItem: TSvnListViewItem): Boolean;
  var
    I: Integer;
    S: string;
    UnversionedDirectories, UnversionedParents: TList<TSvnListViewItem>;
    FoundUnversionedParent: Boolean;
  begin
    Result := True;
    UnversionedParents := TList<TSvnListViewItem>.Create;
    UnversionedDirectories := TList<TSvnListViewItem>.Create;
    try
      for I := 0 to FItemList.Count - 1 do
        if FItemList[I].Directory and (FItemList[I].TextStatus = svnWcStatusUnversioned) then
          UnversionedDirectories.Add(FItemList[I]);
      FoundUnversionedParent := UnversionedDirectories.Count > 0;
      S := ExcludeTrailingPathDelimiter(ExtractFilePath(ASvnListViewItem.PathName));
      while FoundUnversionedParent do
      begin
        FoundUnversionedParent := False;
        for I := 0 to UnversionedDirectories.Count - 1 do
          if UnversionedDirectories[I].PathName = S then
          begin
            FoundUnversionedParent := True;
            UnversionedParents.Add(UnversionedDirectories[I]);
            S := ExcludeTrailingPathDelimiter(ExtractFilePath(S));
            Break;
          end;
      end;
      if UnversionedParents.Count > 0 then
      begin
        //sort list to make sure the parents are added first
        if UnversionedParents.Count > 1 then
          UnversionedParents.Sort(TSvnListViewItemPathComparer.Create);
        for I := 0 to UnversionedParents.Count - 1 do
          if FAddCallBack(UnversionedParents[I].FPathName) then
          begin
            UnversionedParents[I].FTextStatus := svnWcStatusAdded;
            UnversionedParents[I].Checked := True;
          end
          else
          begin
            Result := False;
            Break;
          end;
      end;
    finally
      UnversionedDirectories.Free;
      UnversionedParents.Free;
   end;
  end;

var
  I, StartIdx: Integer;
  SvnListViewItem: TSvnListViewItem;
begin
  if Files.SelCount > 0 then
  begin
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if (SvnListViewItem.FTextStatus = svnWcStatusUnversioned) and CheckAddParents(SvnListViewItem) then
        begin
          if FAddCallBack(SvnListViewItem.FPathName) then
          begin
            SvnListViewItem.FTextStatus := svnWcStatusAdded;
            SvnListViewItem.Checked := True;
          end;
        end;
      end;
    RebuildList;
  end;
end;

procedure TSvnCommitFrame.AddActionUpdate(Sender: TObject);
var
  I, StartIdx: Integer;
  AddState: Boolean;
begin
  if Files.SelCount > 0 then
  begin
    AddState := False;
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
        if FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]].FTextStatus = svnWcStatusUnversioned then
        begin
          AddState := True;
          Break;
        end;
    AddAction.Visible := AddState;
  end
  else
    AddAction.Visible := False;
end;

procedure TSvnCommitFrame.BeginUpdate;
begin
  Files.Items.BeginUpdate;
end;

procedure TSvnCommitFrame.CheckAllClick(Sender: TObject);
var
  I: Integer;
  Checked: Boolean;
begin
  FExecutingCheckAllClick := True;
  try
  if CheckAll.State <> cbGrayed then
  begin
    Checked := CheckAll.State = cbChecked;
    for I := 0 to Files.Items.Count - 1 do
      Files.Items[I].Checked := Checked;
  end;
  UpdateCommitButton;
  finally
    FExecutingCheckAllClick := False;
  end;
end;

procedure TSvnCommitFrame.CheckForNoFilesVisible;
begin
  FNoFiles := Files.Items.Count = 0;
end;

procedure TSvnCommitFrame.CMRelease(var Message: TMessage);
begin
  CloseCallBack;
end;

procedure TSvnCommitFrame.CommitClick(Sender: TObject);
var
  CommitList, AddList: TStringList;
  I, Idx: Integer;
  SortedIndexList: TList<Integer>;
begin
  Idx := FRecentComments.IndexOf(Comment.Text);
  if Idx <> -1 then
    FRecentComments.Move(Idx, 0)
  else
    FRecentComments.Insert(0, Comment.Text);
  CommitList := TStringList.Create;
  AddList := TStringList.Create;
  SortedIndexList := TList<Integer>.Create;
  try
    SortedIndexList.AddRange(FIndexList);
    SortedIndexList.Sort;
    for I := 0 to FItemList.Count - 1 do
      if FItemList[I].Checked and SortedIndexList.BinarySearch(I, Idx) then
      begin
        CommitList.Add(FItemList[I].PathName);
        if FItemList[I].TextStatus = svnWcStatusUnversioned then
          AddList.Add(FItemList[I].PathName);
      end;
    if AddList.Count > 0 then
    begin
      //sort list to make sure the parents are added first
      AddList.Sort;
      for I := 0 to AddList.Count - 1 do
        FAddCallBack(AddList[I]);
    end;
    FCommitCallBack(CommitList, Comment.Text, FRecentComments);
  finally
    SortedIndexList.Free;
    AddList.Free;
    CommitList.Free;
  end;
  PostMessage(Handle, CM_Release, 0, 0);
end;

constructor TSvnCommitFrame.Create(AOwner: TComponent);
begin
  inherited;
  FItemList := TList<TSvnListViewItem>.Create;
  FItemList.OnNotify := Notify;
  FIndexList := TList<Integer>.Create;
  FSortColumn := 0;
  FSortOrder := True;
  FRecentComments := TStringList.Create;
  FExecutingCheckAllClick := False;
  FExecutingUnversionedParentCheck := False;
  FNoFiles := False;
end;

destructor TSvnCommitFrame.Destroy;
begin
  FIndexList.Free;
  FItemList.Free;
  FRecentComments.Free;
  inherited;
end;

procedure TSvnCommitFrame.DiffActionUpdate(Sender: TObject);
var
  I, StartIdx: Integer;
  DiffState: Boolean;
  SvnListViewItem: TSvnListViewItem;
begin
  if Files.SelCount > 0 then
  begin
    DiffState := False;
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if not (SvnListViewItem.FTextStatus in [svnWcStatusUnversioned, svnWcStatusAdded])
          and not SvnListViewItem.Directory then
        begin
          DiffState := True;
          Break;
        end;
      end;
    DiffAction.Enabled := DiffState;
  end
  else
    DiffAction.Enabled := False;
end;

procedure TSvnCommitFrame.DoDiff(Sender: TObject);
var
  I, StartIdx: Integer;
  SvnListViewItem: TSvnListViewItem;
begin
  if Files.SelCount > 0 then
  begin
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if not (SvnListViewItem.FTextStatus in [svnWcStatusUnversioned, svnWcStatusAdded])
          and not SvnListViewItem.Directory then
          DiffCallBack(SvnListViewItem.FPathName);
      end;
  end;
end;

procedure TSvnCommitFrame.EndUpdate;
begin
  Files.CustomSort(@ColumnSort, LPARAM(Self));
  Files.Items.EndUpdate;
end;

procedure TSvnCommitFrame.ExternalsClick(Sender: TObject);
begin
  RebuildList;
end;

procedure TSvnCommitFrame.FilesColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if FSortColumn = Column.Index then
    FSortOrder := not FSortOrder
  else
  begin
    FSortColumn := Column.Index;
    FSortOrder := True;
  end;
  Files.CustomSort(@ColumnSort, LPARAM(Self));
end;

procedure TSvnCommitFrame.FilesCustomDraw(Sender: TCustomListView;
  const ARect: TRect; var DefaultDraw: Boolean);
var
  ItemRect: TRect;
  S: string;
begin
  if FNoFiles then
  begin
    ItemRect := ARect;
    ItemRect.Top := ItemRect.Top + (ItemRect.Bottom div 3);
    S := sNoFiles;
    Files.Canvas.TextRect(ItemRect, S, [tfCenter, tfWordBreak]);
  end;
  DefaultDraw := not FNoFiles;
end;

procedure TSvnCommitFrame.FilesDblClick(Sender: TObject);
begin
  DoDiff(Sender);
end;

procedure TSvnCommitFrame.FilesItemChecked(Sender: TObject; Item: TListItem);

  procedure UnversionedParentCheck(ASvnListViewItem: TSvnListViewItem);
  var
    I: Integer;
    TestSvnListViewItem: TSvnListViewItem;
    S: string;
    UnversionedDirectories: TList<TListItem>;
    FoundUnversionedParent: Boolean;
  begin
    if Item.Checked then
    begin
      //check all unversioned parent directories
      UnversionedDirectories := TList<TListItem>.Create;
      try
        for I := 0 to Files.Items.Count - 1 do
          if not Files.Items[I].Checked and (Files.Items[I].Data <> nil) then
          begin
            TestSvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
            if TestSvnListViewItem.Directory and
              (TestSvnListViewItem.TextStatus = svnWcStatusUnversioned) then
              UnversionedDirectories.Add(Files.Items[I]);
          end;
        FoundUnversionedParent := UnversionedDirectories.Count > 0;
        S := ExcludeTrailingPathDelimiter(ExtractFilePath(ASvnListViewItem.PathName));
        while FoundUnversionedParent do
        begin
          FoundUnversionedParent := False;
          for I := 0 to UnversionedDirectories.Count - 1 do
          begin
            TestSvnListViewItem := FItemList[FIndexList[Integer(UnversionedDirectories[I].Data) - 1]];
            if TestSvnListViewItem.PathName = S then
            begin
              FoundUnversionedParent := True;
              UnversionedDirectories[I].Checked := True;
              S := ExcludeTrailingPathDelimiter(ExtractFilePath(S));
              Break;
            end;
          end;
        end;
      finally
        UnversionedDirectories.Free;
      end;
    end
    else
    if not Item.Checked and ASvnListViewItem.Directory then
    begin
      //uncheck all unversioned child files and directories
      S := ASvnListViewItem.PathName;
      for I := 0 to Files.Items.Count - 1 do
        if Files.Items[I].Checked and (Files.Items[I].Data <> nil) then
        begin
          TestSvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
          if (TestSvnListViewItem.TextStatus = svnWcStatusUnversioned) and
            (Pos(S, TestSvnListViewItem.PathName) = 1) then
            Files.Items[I].Checked := False;
        end;
    end;
  end;

var
  I: Integer;
begin
  if Item.Data <> nil then
    FItemList[FIndexList[Integer(Item.Data) - 1]].Checked := Item.Checked;
  if not FExecutingCheckAllClick and not FExecutingUnversionedParentCheck then
  begin
    if (Item.Data <> nil) and
      (FItemList[FIndexList[Integer(Item.Data) - 1]].TextStatus = svnWcStatusUnversioned) then
    begin
      FExecutingUnversionedParentCheck := True;
      try
        UnversionedParentCheck(FItemList[FIndexList[Integer(Item.Data) - 1]]);
      finally
        FExecutingUnversionedParentCheck := False;
      end;
    end;
  for I := 0 to Files.Items.Count - 1 do
    if Files.Items[I].Checked <> Item.Checked then
    begin
      CheckAll.State := cbGrayed;
        UpdateCommitButton;
      Exit;
    end;
  if Item.Checked then
    CheckAll.State := cbChecked
  else
    CheckAll.State := cbUnChecked;
  UpdateCommitButton;
end;
end;

procedure TSvnCommitFrame.FilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DoDiff(Sender);
end;

function TSvnCommitFrame.Found(const FileName: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to FItemList.Count - 1 do
    if SameText(FItemList[I].PathName, FileName) then
      Exit;
  Result := False;
end;

function TSvnCommitFrame.GetSvnEditState: TSvnEditState;
begin
  if Comment.Focused then
    Result := ControlToSvnEditState(Comment)
  else
  if Files.Focused and (Files.SelCount > 0) then
  begin
    Result := [sesCanCopy];
    if Files.MultiSelect then
      Include(Result, sesCanSelectAll);
  end
  else
    Result := [];
end;

procedure TSvnCommitFrame.HandleMissingFiles;
var
  UnversionedFiles: TDictionary<string, string>;
  MissingList: TStringList;
  I, J: Integer;
  SvnListViewItem: TSvnListViewItem;
  FileName: string;
begin
  UnversionedFiles := TDictionary<string, string>.Create(0, TOrdinalStringComparer.Create);
  try
    MissingList := TStringList.Create;
    try
      for I := 0 to FItemList.Count - 1 do
        if FItemList[I].TextStatus = svnWcStatusUnversioned then
          UnversionedFiles.Add(FItemList[I].PathName, FItemList[I].PathName)
        else if FItemList[I].TextStatus = svnWcStatusMissing then
          MissingList.Add(FItemList[I].PathName);
      for I := 0 to MissingList.Count - 1 do
        if UnversionedFiles.TryGetValue(MissingList[I], FileName) then
        begin
          try
            RenameFile(FileName, MissingList[I]);
          except
            // If an error occures renaming the file then it is ok to ignore it.
          end;
          SvnListViewItem := TSvnListViewItem.Create('', svnWcStatusNormal, False);
          try
            GetFileStatusCallBack(MissingList[I], SvnListViewItem);
            if SvnListViewItem.FTextStatus <> svnWcStatusMissing then
            begin
              for J := 0 to FItemList.Count - 1 do
                if (FItemList[J].FTextStatus = svnWcStatusMissing)
                  and SameText(FItemList[J].PathName, MissingList[I]) then
                begin
                  if SvnListViewItem.TextStatus = svnWcStatusNormal then
                    FItemList.Delete(J)
                  else
                    FItemList[J].TextStatus := SvnListViewItem.FTextStatus;
                  Break;
                end;
              for J := 0 to FItemList.Count - 1 do
                if (FItemList[J].TextStatus = svnWcStatusUnversioned)
                  and SameText(FItemList[J].PathName, MissingList[I]) then
                begin
                  FItemList.Delete(J);
                  Break;
                end;
            end;
          finally
            SvnListViewItem.Free;
          end;
        end;
        RebuildList;
    finally
      MissingList.Free;
    end;
  finally
    UnversionedFiles.Free;
  end;
end;

function TSvnCommitFrame.ItemShown(const SvnListItem: TSvnListViewItem): Boolean;
begin
  Result := UnversionedFiles.Checked or (SvnListItem.TextStatus <> svnWcStatusUnversioned);
  Result := Result and (Externals.Checked or (SvnListItem.TextStatus <> svnWcStatusExternal));
  Result := Result and SvnListItem.Visible;
end;

procedure TSvnCommitFrame.LowerPanelResize(Sender: TObject);
begin
  LowerPanel.OnResize := nil;
  try
    ResizeStuff;
  finally
    LowerPanel.OnResize := LowerPanelResize;
  end;
end;

procedure TSvnCommitFrame.ResizeStuff;
var
  StackButtons: Boolean;
  LongestCheckBoxWidth: Integer;
  HeightDelta: Integer;
begin
  //find widest checkbox (they *should* all be the smae width)
  LongestCheckBoxWidth := UnversionedFiles.Width;
  if Externals.Width > LongestCheckBoxWidth then
    LongestCheckBoxWidth := Externals.Width;
  if CheckAll.Width > LongestCheckBoxWidth then
    LongestCheckBoxWidth := CheckAll.Width;
  //calculate the difference in height for the Comments memo (also used for adjusting the top of the checkboxes)
  HeightDelta := Recent.Height + Recent.Margins.Top + Recent.Margins.Bottom + Commit.Height + Commit.Margins.Top + Commit.Margins.Bottom;
  //should the two buttons get stacked under the checkboxes?
  StackButtons := Width < UnversionedFiles.Left + UnversionedFiles.Margins.Left + LongestCheckBoxWidth + Recent.Width + Recent.Margins.Left;
  DisableAlign;
  try
    if StackButtons then
    begin
      if Recent.Left <> UnversionedFiles.Left then //have we already adjusted for this situation?
      begin
        //make Comments memo shorter, move checkboxes up and position the buttons under the checkboxes
        Comment.Height := Comment.Height - HeightDelta;
        UnversionedFiles.Top := UnversionedFiles.Top - HeightDelta;
        Externals.Top := Externals.Top - HeightDelta;
        CheckAll.Top := CheckAll.Top - HeightDelta;
        LowerPanel.Height := LowerPanel.Height + Recent.Height + Recent.Margins.Top + Recent.Margins.Bottom + Commit.Height + Commit.Margins.Top + Commit.Margins.Bottom;
        Recent.Top := CheckAll.Top + CheckAll.Height + CheckAll.Margins.Bottom + Recent.Margins.Top;
        Recent.Left := UnversionedFiles.Left;
        Commit.Top := Recent.Top + Recent.Height + Recent.Margins.Bottom + Commit.Margins.Top;
        Commit.Left := Recent.Left;
        Recent.Anchors := [akLeft, akBottom];
        Commit.Anchors := [akLeft, akBottom];
      end;
    end else
    begin
      if Recent.Left = CheckAll.Left then //have we already adjusted for this situation?
      begin
        //make Comments memo taller, move checkboxes down and position the buttons right aligned in the LowerPanel
        Comment.Height := Comment.Height + HeightDelta;
        UnversionedFiles.Top := UnversionedFiles.Top + HeightDelta;
        Externals.Top := Externals.Top + HeightDelta;
        CheckAll.Top := CheckAll.Top + HeightDelta;
        LowerPanel.Height := LowerPanel.Height - (Recent.Height + Recent.Margins.Top + Recent.Margins.Bottom + Commit.Height + Commit.Margins.Top + Commit.Margins.Bottom);
        Recent.Left := Comment.Left + Comment.Width - Recent.Width;
        Recent.Top := Comment.Top + Comment.Height + Comment.Margins.Bottom + Recent.Margins.Top;
        Commit.Left := Comment.Left + Comment.Width - Commit.Width;
        Commit.Top := Recent.Top + Recent.Height + Recent.Margins.Bottom + Commit.Margins.Top;
        Recent.Anchors := [akRight, akBottom];
        Commit.Anchors := [akRight, akBottom];
      end;
    end;
  finally
    EnableAlign
  end;
end;

procedure TSvnCommitFrame.Notify(Sender: TObject; const Item: TSvnListViewItem;
  Action: TCollectionNotification);
begin
  if Action = cnRemoved then
    Item.Free;
end;

function TSvnCommitFrame.PerformEditAction(AEditAction: TSvnEditAction): Boolean;
var
  I, StartIdx: Integer;
  SL: TStringList;
begin
  if Comment.Focused then
  begin
    Result := PerformDefaultSvnEditAction(Comment, AEditAction);
    UpdateCommitButton;
  end
  else
  if Files.Focused then
  begin
    if AEditAction = seaCopy then
    begin
      SL := TStringList.Create;
      try
        StartIdx := Files.Selected.Index;
        for I := StartIdx to Files.Items.Count - 1 do
          if Files.Items[I].Selected then //path + filename
            SL.Add(Files.Items[I].SubItems[0] + Files.Items[I].Caption);
        Clipboard.AsText := SL.Text;
      finally
        SL.Free;
      end;
      Result := True;
    end
    else
    if AEditAction = seaSelectAll then
    begin
      Files.SelectAll;
      Result := True;
    end
    else
      Result := False;
  end
  else
    Result := False;
end;

procedure TSvnCommitFrame.RebuildList;
var
  I: Integer;
  Cursor: TCursor;
begin
  Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Files.Items.BeginUpdate;
    try
      FNoFiles := False;
      Files.Clear;
      FIndexList.Clear;
      for I := 0 to FItemList.Count - 1 do
        UpdateListView(FItemList[I], I);
      Files.CustomSort(@ColumnSort, LPARAM(Self));
      if Files.Items.Count = 0 then
      begin
        FNoFiles := True;
        for I := 0 to Files.Columns.Count - 1 do
          Files.Columns.Items[I].Width := -2;
      end;
    finally
      Files.Items.EndUpdate;
    end;
  finally
    Screen.Cursor := Cursor;
  end;
end;

procedure TSvnCommitFrame.RecentClick(Sender: TObject);
var
  S: string;
begin
  S := SelectRecentComments(Self, FRecentComments);
  if Comment.Text = '' then
    Comment.Text := S
  else
    Comment.Text := Comment.Text + ' ' + S;
end;

procedure TSvnCommitFrame.ResolveActionExecute(Sender: TObject);
var
  I, StartIdx: Integer;
  SvnListViewItem: TSvnListViewItem;
begin
  if Files.SelCount > 0 then
  begin
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if SvnListViewItem.TextStatus = svnWcStatusConflicted then
        begin
          FResolveCallBack(SvnListViewItem.FPathName);
          SvnListViewItem.FTextStatus := svnWcStatusModified;
          SvnListViewItem.Checked := True;
        end;
      end;
    RebuildList;
  end;
end;

procedure TSvnCommitFrame.ResolveActionUpdate(Sender: TObject);
var
  I, StartIdx: Integer;
  ResolveState: Boolean;
begin
  if Files.SelCount > 0 then
  begin
    ResolveState := False;
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        if FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]].FTextStatus = svnWcStatusConflicted then
        begin
          ResolveState := True;
          Break;
        end;
      end;
    ResolveAction.Visible := ResolveState;
  end
  else
    ResolveAction.Visible := False;
end;

type
  TSvnTreeCommitData = class(TSvnTreeData)
    ListItem: TSvnListViewItem;
    Selected: Boolean;
  end;

  TRevertData = class(TObject)
  private
    FListItem: TSvnListViewItem;
    FListItems: TList<TSvnListViewItem>;
    FRecursive: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property ListItem: TSvnListViewItem read FListItem write FListItem;
    property ListItems: TList<TSvnListViewItem> read FListItems;
    property Recursive: Boolean read FRecursive write FRecursive;
  end;

{ TRevertData }

constructor TRevertData.Create;
begin
  inherited Create;
  FListItems := TList<TSvnListViewItem>.Create;
end;

destructor TRevertData.Destroy;
begin
  FListItems.Free;
  inherited Destroy;
end;

procedure TSvnCommitFrame.RevertActionExecute(Sender: TObject);
var
  SvnListViewItem: TSvnListViewItem;
  S: string;
  I, J, AdditionalDirCount, AdditionalFileCount: Integer;
  FilesToRevertText: TList<TSvnListViewItem>;
  NewState: TSvnWCStatusKind;
  UpdateList: Boolean;
  SvnRoot: TSvnRootNode<TSvnTreeCommitData>;
  ItemsToRevert: TObjectList<TRevertData>;
  RevertData: TRevertData;
  SvnCommitData: TSvnTreeCommitData;
begin
  if Files.SelCount > 0 then
  begin
    FilesToRevertText := TList<TSvnListViewItem>.Create;
    ItemsToRevert := TObjectList<TRevertData>.Create;
    SvnRoot := TSvnRootNode<TSvnTreeCommitData>.Create;
    try
      for I := 0 to Files.Items.Count - 1 do
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if SvnListViewItem.Visible and (SvnListViewItem.TextStatus <> svnWcStatusUnversioned) then
        begin
          if SvnListViewItem.Directory then
            SvnCommitData := SvnRoot.AddDir(SvnListViewItem.PathName).Data
          else
            SvnCommitData := SvnRoot.AddFile(SvnListViewItem.PathName).Data;
          SvnCommitData.ListItem := SvnListViewItem;
          SvnCommitData.Selected := Files.Items[I].Selected;
        end;
      end;
      SvnRoot.WalkThrough(procedure(ANode: TObject; AData: TSvnTreeCommitData; var AWalkModes: TSvnRootNodeWalkModes)
        begin
          if wmInfo in AWalkModes then
            FilesToRevertText.Add(AData.ListItem)
          else
          if AData.Selected then
          begin
            if (AData.Kind = dkFolder) and (AData.ListItem.TextStatus = svnWcStatusAdded) then
            begin
              Include(AWalkModes, wmInfo);
              ItemsToRevert.Add(TRevertData.Create);
              RevertData := ItemsToRevert.Last;
              RevertData.ListItem := AData.ListItem;
              RevertData.ListItems.Add(AData.ListItem);
              RevertData.Recursive := True;
              FilesToRevertText.Add(AData.ListItem);
              SvnRoot.WalkThrough(procedure(AChildNode: TObject; AChildData: TSvnTreeCommitData;
                  var AChildWalkModes: TSvnRootNodeWalkModes)
                begin
                  RevertData.ListItems.Add(AChildData.ListItem);
                end, ANode);
            end
            else
            begin
              ItemsToRevert.Add(TRevertData.Create);
              RevertData := ItemsToRevert.Last;
              RevertData.ListItem := AData.ListItem;
              RevertData.Recursive := False;
              FilesToRevertText.Add(AData.ListItem);
            end;
          end;
        end);

      FilesToRevertText.Sort(TSvnListViewItemPathComparer.Create);
      S := sRevertCheck;
      if FilesToRevertText.Count <= 7 then
        for I := 0 to FilesToRevertText.Count - 1 do
          S := S + sLineBreak + Format('[%s] %s', [StatusKindStr(FilesToRevertText[I].TextStatus),
            FilesToRevertText[I].PathName])
      else
      begin
        AdditionalDirCount := 0;
        AdditionalFileCount := 0;
        for I := 0 to FilesToRevertText.Count - 1 do
        begin
          if I <= 4 then
            S := S + sLineBreak + Format('[%s] %s', [StatusKindStr(FilesToRevertText[I].TextStatus),
              FilesToRevertText[I].PathName])
          else
          begin
            if FilesToRevertText[I].Directory then
              Inc(AdditionalDirCount)
            else
              Inc(AdditionalFileCount);
          end;
        end;
        if AdditionalDirCount > 0 then
          S := S + sLineBreak + Format(sRevertDirMoreDirectories, [AdditionalDirCount]);
        if AdditionalFileCount > 0 then
          S := S + sLineBreak + Format(sRevertDirMoreFiles, [AdditionalFileCount]);
      end;

      if MessageDlg(S, mtConfirmation, mbYesNo, 0) = mrYes then
      begin
        UpdateList := False;
        for I := 0 to ItemsToRevert.Count - 1 do
          if ItemsToRevert[I].Recursive then
          begin
            if RevertCallBack(ItemsToRevert[I].ListItem.PathName, True, NewState) and
              (NewState = svnWcStatusUnversioned) then
            begin
              UpdateList := True;
              for J := 0 to ItemsToRevert[I].ListItems.Count - 1 do
              begin
                SvnListViewItem := ItemsToRevert[I].ListItems[J];
                SvnListViewItem.FTextStatus := svnWcStatusUnversioned;
                SvnListViewItem.Checked := False;
              end;
            end
          end
          else
          if RevertCallBack(ItemsToRevert[I].ListItem.PathName, False, NewState) then
          begin
            UpdateList := True;
            SvnListViewItem := ItemsToRevert[I].ListItem;
            SvnListViewItem.FTextStatus := NewState;
            SvnListViewItem.Visible := not (NewState in [svnWcStatusNone, svnWcStatusNormal]);
            SvnListViewItem.Checked := False;
          end;
        if UpdateList then
        begin
          RebuildList;
          UpdateCommitButton;
        end;
      end;
    finally
      SvnRoot.Free;
      ItemsToRevert.Free;
      FilesToRevertText.Free;
    end;
  end;
end;

procedure TSvnCommitFrame.RevertActionUpdate(Sender: TObject);
var
  I, StartIdx: Integer;
  RevertState: Boolean;
  SvnListViewItem: TSvnListViewItem;
begin
  if Files.SelCount > 0 then
  begin
    RevertState := False;
    StartIdx := Files.Selected.Index;
    for I := StartIdx to Files.Items.Count - 1 do
      if Files.Items[I].Selected then
      begin
        SvnListViewItem := FItemList[FIndexList[Integer(Files.Items[I].Data) - 1]];
        if (SvnListViewItem.FTextStatus <> svnWcStatusUnversioned)
          and ((not SvnListViewItem.Directory) or (SvnListViewItem.FTextStatus = svnWcStatusAdded)) then
        begin
          RevertState := True;
          Break;
        end;
      end;
    RevertAction.Visible := RevertState;
  end
  else
    RevertAction.Visible := False;
end;

procedure TSvnCommitFrame.SetRecentComments(Value: TStringList);
begin
  FRecentComments.Assign(Value);
  Recent.Enabled := FRecentComments.Count <> 0;
end;

procedure TSvnCommitFrame.SetURL(const AValue: string);
begin
  if FURL <> AValue then
  begin
    FURL := AValue;
    Location.Caption := FURL;
  end;
end;


procedure TSvnCommitFrame.UnversionedFilesClick(Sender: TObject);
begin
  RebuildList;
  UpdateCommitButton;
end;

procedure TSvnCommitFrame.UpdateCommitButton;
var
  I: Integer;
begin
  for I := 0 to Files.Items.Count - 1 do
    if Files.Items[I].Checked then
    begin
      Commit.Enabled := True;
      Exit;
    end;
    Commit.Enabled := False;
end;

procedure TSvnCommitFrame.UpdateListView(const SvnListItem: TSvnListViewItem;
  ItemIndex: Integer);
var
  ListItem: TListItem;
  CheckedState: Boolean;
  IndexIndex: Integer;
  I: Integer;
  FirstAdded: Boolean;
begin
  if ItemShown(SvnListItem) then
  begin
    FirstAdded := Files.Items.Count = 0;
    IndexIndex := FIndexList.Add(ItemIndex);
    CheckedState := SvnListItem.Checked;
    ListItem := Files.Items.Add;
    ListItem.Data := TCustomData(IndexIndex + 1);
    ListItem.Caption := ExtractFileName(SvnListItem.PathName);
    ListItem.SubItems.Add(ExtractFilePath(SvnListItem.PathName));
    ListItem.SubItems.Add(ExtractFileExt(SvnListItem.PathName));
    ListItem.SubItems.Add(StatusKindStr(SvnListItem.TextStatus));
    ListItem.Checked := CheckedState;
    ListItem.ImageIndex := SvnImageModule.GetShellImageIndex(SvnListItem.PathName);
    if FirstAdded then
    begin
      for I := 0 to Files.Columns.Count - 1 do
        Files.Columns.Items[I].Width := -1;
      FNoFiles := False;
    end;
  end;
end;

{ TSvnListViewItem }

constructor TSvnListViewItem.Create(const APathName: string;
  ATextStatus: TSvnWCStatusKind; ADirectory: Boolean);
begin
  inherited Create;
  NewValues(APathName, ATextStatus, ADirectory);
end;

procedure TSvnListViewItem.NewValues(const APathName: string;
  ATextStatus: TSvnWCStatusKind; ADirectory: Boolean);
begin
  FDirectory := ADirectory;
  FPathName := APathName;
  FTextStatus := ATextStatus;
  FVisible := True;
  FChecked := (FTextStatus <> svnWcStatusUnversioned) and
    (FTextStatus <> svnWcStatusExternal) and (FTextStatus <> svnWcStatusMissing) and
    (FTextStatus <> svnWcStatusConflicted) and (FTextStatus <> svnWcStatusIgnored);
end;

procedure TSvnListViewItem.SetTextStatus(Value: TSvnWCStatusKind);
begin
  FTextStatus := Value;
  FChecked := (FTextStatus <> svnWcStatusUnversioned) and
    (FTextStatus <> svnWcStatusExternal) and (FTextStatus <> svnWcStatusMissing) and
    (FTextStatus <> svnWcStatusConflicted) and (FTextStatus <> svnWcStatusIgnored);
end;

{ TSvnListViewItemPathComparer }

function TSvnListViewItemPathComparer.Compare(const Left, Right: TSvnListViewItem): Integer;
begin
  Result := CompareStr(Left.PathName, Right.PathName);
end;

end.
