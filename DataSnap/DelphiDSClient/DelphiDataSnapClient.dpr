program DelphiDataSnapClient;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  DMClient in 'DMClient.pas' {DMClientContainer: TDataModule},
  BaseObject in '..\DelphiDSServer\Classes\BaseObject.pas',
  Customer in '..\DelphiDSServer\Classes\Customer.pas',
  DSClientProxy in 'DSClientProxy.pas',
  MainFormRB in 'MainFormRB.pas' {FrmMainRB},
  RecError in 'RecError.pas' {ReconcileErrorForm},
  FormDataSet2 in 'FormDataSet2.pas' {FormDM2: TFrame},
  MasterForm in 'MasterForm.pas' {FormMaster: TFrame},
  FormDataSet3 in 'FormDataSet3.pas' {FormDM3},
  FormDataSet5b in 'FormDataSet5b.pas' {FormDM5b},
  FormMaintUser in 'FormMaintUser.pas' {FormUser},
  LocationMigration in 'LocationMigration.pas',
  Location in '..\DelphiDSServer\Classes\Location.pas',
  PerfCounter in 'PerfCounter.pas',
  FormDBBackup in 'FormDBBackup.pas' {FormBackup},
  FormJSONCollection in 'FormJSONCollection.pas' {FormCollectionJSON},
  FormDataSet5 in 'FormDataSet5.pas' {FormDM5},
  FormDataSet4 in 'FormDataSet4.pas' {FormDM4},
  FormJSONSimple in 'FormJSONSimple.pas' {FormSimpleJSON},
  FormDataSet6 in 'FormDataSet6.pas' {FormDM6},
  FormBatch in 'FormBatch.pas' {FormServerBatch},
  FormDataSet1 in 'FormDataSet1.pas' {FormDM1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DataSnap Client Example';
  Application.CreateForm(TFrmMainRB, FrmMainRB);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDMClientContainer, DMClientContainer);
  Application.Run;
end.
