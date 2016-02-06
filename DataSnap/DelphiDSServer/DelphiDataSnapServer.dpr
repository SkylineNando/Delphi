program DelphiDataSnapServer;

{$R *.dres}

uses
  Forms,
  MainForm in 'MainForm.pas' {FrmMain},
  DMImages in 'DMImages.pas' {MyDMImages: TDataModule},
  ServerContainer in 'ServerContainer.pas' {DMServerContainer: TDataModule},
  EmployeeRDM in 'ServerModules\EmployeeRDM.pas' {EmployeeServerRDM: TDSServerModule},
  LookupRDM in 'ServerModules\LookupRDM.pas' {LookupServerRDM: TDSServerModule},
  MainServerModule in 'ServerModules\MainServerModule.pas' {DMMainServerModule: TDSServerModule},
  BaseServerClass in 'Classes\BaseServerClass.pas',
  Department in 'Classes\Department.pas',
  MethodsServerModule in 'ServerModules\MethodsServerModule.pas' {DSServerMethods: TDSServerModule},
  DSServerLogDB in 'Classes\DSServerLogDB.pas',
  DBXMetadataHelper in 'Classes\DBXMetadataHelper.pas',
  User in 'Classes\User.pas',
  DebugHelper in 'DebugHelper.pas',
  ServerBatch in 'ServerModules\ServerBatch.pas' {DSServerBatch: TDSServerModule},
  Customer in 'Classes\Customer.pas',
  BaseObject in 'Classes\BaseObject.pas',
  MasterDetail in 'ServerModules\MasterDetail.pas' {DSMasterDetail: TDSServerModule},
  DataSetDM1 in 'ServerModules\DataSetDM1.pas' {DMDataSet1: TDataModule},
  DataSetDM3 in 'ServerModules\DataSetDM3.pas' {DMDataSet3: TDSServerModule},
  DataSetDM2 in 'ServerModules\DataSetDM2.pas' {DMDataSet2: TDSServerModule},
  DataSetDM5 in 'ServerModules\DataSetDM5.pas' {DMDataSet5: TDSServerModule},
  Location in 'Classes\Location.pas',
  DataSetDM6 in 'ServerModules\DataSetDM6.pas' {DMDataSet6: TDSServerModule},
  RotateImage in 'RotateImage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DataSnap Server Demo';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TMyDMImages, MyDMImages);
  Application.CreateForm(TDMServerContainer, DMServerContainer);
  Application.CreateForm(TDMMainServerModule, DMMainServerModule);
  Application.Run;
  DMServerContainer.Shutdown;
end.
