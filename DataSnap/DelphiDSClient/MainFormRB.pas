unit MainFormRB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RibbonLunaStyleActnCtrls, Ribbon, StdActns, ExtActns, ActnMan,
  ScreenTips, ActnList, ImgList, RibbonActnCtrls, ComCtrls, StdCtrls, ActnCtrls,
  ToolWin, ActnMenus, RibbonActnMenus, ExtCtrls, FormDataSet1, MasterForm,
  System.Actions;

type
  TFrmMainRB = class(TForm)
    Ribbon1: TRibbon;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    ilGFX16_d: TImageList;
    ilGFX16: TImageList;
    ilGFX32: TImageList;
    ilGFX32_d: TImageList;
    ilBulletNumberGallery: TImageList;
    ScreenTipsManager1: TScreenTipsManager;
    ActionManager1: TActionManager;
    FileExit1: TFileExit;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    AcGetSingleObject: TAction;
    acAddRemoveUsers: TAction;
    PanelFR: TPanel;
    PanelC: TPanel;
    RibbonPage3: TRibbonPage;
    RibbonGroup5: TRibbonGroup;
    AcDisconnect: TAction;
    AcConnect: TAction;
    RibbonGroup6: TRibbonGroup;
    AcAdvOOCache: TAction;
    AcAdvDataSetCache: TAction;
    AcGetListObject: TAction;
    AcProcessing: TAction;
    RibbonGroup3: TRibbonGroup;
    AcBackup: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure FileCloseActnExecute(Sender: TObject);
    procedure AcConnectExecute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure AcDisconnectExecute(Sender: TObject);
    procedure AcAdvOOCacheExecute(Sender: TObject);
    procedure AcAdvDataSetCacheExecute(Sender: TObject);
    procedure AcGetSingleObjectExecute(Sender: TObject);
    procedure AcGetListObjectExecute(Sender: TObject);
    procedure AcProcessingExecute(Sender: TObject);
    procedure AcBackupExecute(Sender: TObject);
    procedure AcProcessingUpdate(Sender: TObject);
    procedure acAddRemoveUsersExecute(Sender: TObject);
  private
    FCurrentFrame : TFormMaster;
    function GetCurrentFrame: TFormMaster;
    procedure SetCurrentFrame(const Value: TFormMaster);
    { Private declarations }
  public
    { Public declarations }
    property CurrentFrame : TFormMaster read GetCurrentFrame write SetCurrentFrame;
  end;

var
  FrmMainRB: TFrmMainRB;

implementation

uses FormDataSet2, FormDataSet3, DMClient, FormDataSet4, FormDataSet5,
  FormDataSet6, FormDataSet5b, FormJSONCollection, FormJSONSimple, FormBatch,
  FormDBBackup, FormMaintUser, Login;

{$R *.dfm}

procedure TFrmMainRB.AcAdvDataSetCacheExecute(Sender: TObject);
begin
  if not Assigned(FormDM5b) then
  begin
    FormDM5b := TFormDM5b.Create(Self);
  end;
  CurrentFrame := FormDM5b;

end;

procedure TFrmMainRB.AcAdvOOCacheExecute(Sender: TObject);
begin
  if not Assigned(FormDM5) then
  begin
    FormDM5 := TFormDM5.Create(Self);
  end;
  CurrentFrame := FormDM5;

end;

procedure TFrmMainRB.AcBackupExecute(Sender: TObject);
begin
  if not Assigned(FormBackup) then
  begin
    FormBackup := TFormBackup.Create(Self);
  end;
  CurrentFrame := FormBackup;

end;

procedure TFrmMainRB.AcConnectExecute(Sender: TObject);
begin

  if not FrmLogin.DoLogin then
     Close;
end;

procedure TFrmMainRB.AcDisconnectExecute(Sender: TObject);
begin
  DMClientContainer.MyDSServer.Close;
end;

procedure TFrmMainRB.acAddRemoveUsersExecute(Sender: TObject);
begin
  if not Assigned(FormUser) then
  begin
    FormUser := TFormUser.Create(Self);
    FormUser.doInit;
  end;
  CurrentFrame := FormUser;
end;

procedure TFrmMainRB.Action1Execute(Sender: TObject);
begin

  if not Assigned(FormDM1) then
  begin
    FormDM1 := TFormDM1.Create(Self);
    FormDM1.doInit;
  end;
  CurrentFrame := FormDM1;

end;

procedure TFrmMainRB.Action2Execute(Sender: TObject);
begin
  if not Assigned(FormDM2) then
  begin
    FormDM2 := TFormDM2.Create(Self);
    FormDM2.doInit;
  end;
  CurrentFrame := FormDM2;

end;

procedure TFrmMainRB.Action5Execute(Sender: TObject);
begin
  if not Assigned(FormDM4) then
  begin
    FormDM4 := TFormDM4.Create(Self);
  end;
  CurrentFrame := FormDM4;

end;

procedure TFrmMainRB.Action6Execute(Sender: TObject);
begin
  if not Assigned(FormDM3) then
  begin
    FormDM3 := TFormDM3.Create(Self);
    FormDM3.doInit;
  end;
  CurrentFrame := FormDM3;

end;

procedure TFrmMainRB.AcGetListObjectExecute(Sender: TObject);
begin
  if not Assigned(FormCollectionJSON) then
  begin
    FormCollectionJSON := TFormCollectionJSON.Create(Self);
  end;
  CurrentFrame := FormCollectionJSON;

end;

procedure TFrmMainRB.AcGetSingleObjectExecute(Sender: TObject);
begin
  if not Assigned(FormSimpleJSON) then
  begin
    FormSimpleJSON := TFormSimpleJSON.Create(Self);
  end;
  CurrentFrame := FormSimpleJSON;

end;

procedure TFrmMainRB.AcProcessingExecute(Sender: TObject);
begin
  if not Assigned(FormServerBatch) then
  begin
    FormServerBatch := TFormServerBatch.Create(Self);
  end;
  CurrentFrame := FormServerBatch;

end;

procedure TFrmMainRB.AcProcessingUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DMClientContainer.MyDSServer.Connected;
end;

procedure TFrmMainRB.FileCloseActnExecute(Sender: TObject);
begin
  DMClientContainer.MyDSServer.Close;
end;

function TFrmMainRB.GetCurrentFrame: TFormMaster;
begin
  Result := FCurrentFrame;
end;

procedure TFrmMainRB.SetCurrentFrame(const Value: TFormMaster);
begin

  Value.Parent := PanelC;
  FCurrentFrame := Value;
  FCurrentFrame.Align := alClient;
  FCurrentFrame.Show;
end;

end.
