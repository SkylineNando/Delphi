unit ServerContainer;

interface

uses SysUtils, Classes, DSCommonServer, DSTCPServerTransport, DSServer,
  WideStrings, FMTBcd, DB, SqlExpr, Provider, DBClient, Dialogs,
  Generics.Collections, DbxDatasnap, DBXInterbase, User, DBXTransport,
  EmployeeRDM, MethodsServerModule, MainServerModule, DbxCompressionFilter,
  DBXCommon, DSHTTPCommon, DSHTTP, IdHTTPWebBrokerBridge, DSAuth, DSSession,
  IndyPeerImpl, Datasnap.DSClientMetadata, IPPeerServer, IPPeerClient;

type
  TDMServerContainer = class(TDataModule)
    MyDSServer: TDSServer;
    MyDSTCPServerTransport: TDSTCPServerTransport;
    DSSCUser: TDSServerClass;
    DSEmployeeRDM: TDSServerClass;
    DSServerMethods: TDSServerClass;
    DataSnap_Server_Log: TSQLConnection;
    SqlLOG: TSQLDataSet;
    SqlLOGIP_ADDRESS: TWideStringField;
    SqlLOGEVENT: TWideStringField;
    SqlLOGCREATED: TSQLTimeStampField;
    SQLLocalDSServer: TSQLConnection;
    DSMainServerModule: TDSServerClass;
    Employee: TSQLConnection;
    DSLookupRDM: TDSServerClass;
    DSSDepartament: TDSServerClass;
    DSServerBatch: TDSServerClass;
    DSHTTPService1: TDSHTTPService;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerMasterDetail: TDSServerClass;
    DSDMDataSet1: TDSServerClass;
    DSDMDataSet2: TDSServerClass;
    DSDMDataSet3: TDSServerClass;
    DSDMDataSet5: TDSServerClass;
    DSDMDataSet6: TDSServerClass;
    DSProxyGenerator1: TDSProxyGenerator;
    procedure DSSCUserGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerMethodsGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSEmployeeRDMGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSEmployeeRDMCreateInstance(DSCreateInstanceEventObject
      : TDSCreateInstanceEventObject);
    procedure MyDSServerDisconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSSCUserCreatereInstance(DSCreateInstanceEventObject
      : TDSCreateInstanceEventObject);
    procedure DSSCUserDestroyInstance(DSDestroyInstanceEventObject
      : TDSDestroyInstanceEventObject);
    procedure MyDSServerError(DSErrorEventObject: TDSErrorEventObject);
    procedure DSMainServerModuleGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSLookupRDMGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSSDepartamentGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DSServerBatchGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      const UserRoles: TStrings);
    procedure MyDSServerConnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerMasterDetailGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSDMDataSet1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSDMDataSet2GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSDMDataSet3GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSDMDataSet5GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSDMDataSet6GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);

  private
    { Private declarations }

    User: TUser;
    ConnectionList : TDictionary<Integer,TSQLConnection>;
    procedure LogEvent(Event: String; ChannelInfo: TDBXChannelInfo); overload;
    procedure LogEvent(Event: String; Error: String); overload;

  public
    { Public declarations }
    procedure StartServer(port: Integer);
    procedure Shutdown;
    function GetEmployeeDBName: String;
    function GetLogDBName: String;

    function GetConnection : TSQLConnection;

  end;

var
  DMServerContainer: TDMServerContainer;

implementation

uses DBXMetadataHelper, DSServerLogDB, LookupRDM, Department, DebugHelper,
  ServerBatch, MasterDetail, DataSetDM1, DataSetDM2, DataSetDM3, DataSetDM5,
  DataSetDM6;
{$R *.dfm}

procedure TDMServerContainer.DataModuleCreate(Sender: TObject);
begin
  DataSnap_Server_Log.Params.Values['Database'] := 'localhost:' + GetDatabaseDirectory
    + DB_NAME;
  Employee.Params.Values['Database'] := 'localhost:' + GetDatabaseDirectory + DBEMPLOYEE_NAME;
  ConnectionList := TDictionary<Integer, TSQLConnection>.Create;
end;

procedure TDMServerContainer.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(User) then
    FreeAndNil(User);

end;

procedure TDMServerContainer.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; const UserRoles: TStrings);
var
  userConn: TUser;
begin

  userConn := TUser.Create;
  try
    valid := userConn.IsValidUser(User, Password);
    if User = 'admin' then
       UserRoles.Add('admin')
    else
       UserRoles.Add('user');
  finally
    userConn.Free;
  end;

end;

procedure TDMServerContainer.DSDMDataSet1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMDataSet1;
end;

procedure TDMServerContainer.DSDMDataSet2GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMDataSet2;
end;

procedure TDMServerContainer.DSDMDataSet3GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMDataSet3;
end;

procedure TDMServerContainer.DSDMDataSet5GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMDataSet5;
end;

procedure TDMServerContainer.DSDMDataSet6GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMDataSet6;
end;

procedure TDMServerContainer.DSEmployeeRDMCreateInstance
  (DSCreateInstanceEventObject: TDSCreateInstanceEventObject);
begin
  // EmployeeServerRDM := TEmployeeServerRDM.Create(Self);
end;

procedure TDMServerContainer.DSEmployeeRDMGetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TEmployeeServerRDM;
end;

procedure TDMServerContainer.DSLookupRDMGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TLookupServerRDM;
end;

procedure TDMServerContainer.DSMainServerModuleGetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMMainServerModule;
end;

procedure TDMServerContainer.DSSCUserCreatereInstance
  (DSCreateInstanceEventObject: TDSCreateInstanceEventObject);
begin
  if not Assigned(User) then
  begin
    User := TUser.Create;
    TDebuggerHelper.LogDebug('Create a TUser instance');
  end
  else
    TDebuggerHelper.LogDebug('TUser already exist');
  DSCreateInstanceEventObject.ServerClassInstance := User;
end;

procedure TDMServerContainer.DSSCUserDestroyInstance
  (DSDestroyInstanceEventObject: TDSDestroyInstanceEventObject);
begin

  // TDebugerHelper.LogDebug('TUser destroyed');
end;

procedure TDMServerContainer.DSSCUserGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TUser;

end;

procedure TDMServerContainer.DSSDepartamentGetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDepartment;
end;

procedure TDMServerContainer.DSServerBatchGetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSServerBatch;
end;

procedure TDMServerContainer.DSServerMasterDetailGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSMasterDetail;
end;

procedure TDMServerContainer.DSServerMethodsGetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSServerMethods;
end;

function TDMServerContainer.GetConnection: TSQLConnection;
var
  dbconn : TSQLConnection;
begin

//  CodeSite.Send('Thread ID', TDSSessionManager.GetThreadSession.Id);

  if ConnectionList.ContainsKey(TDSSessionManager.GetThreadSession.Id) then
  begin
     Result := ConnectionList[TDSSessionManager.GetThreadSession.Id];
  end
  else
  begin
    dbconn := TSQLConnection.Create(nil);
    dbconn.Params.Clear;
    dbconn.LoadParamsOnConnect := false;
    dbconn.DriverName := 'INTERBASE';  // dbconn.Params.Values['drivername'];
    dbconn.LibraryName := 'dbxint.dll';
    dbconn.Params.Values['Database'] := GetDatabaseDirectory + 'states.ib';
    dbconn.LoginPrompt := false;

    ConnectionList.Add(TDSSessionManager.GetThreadSession.Id, dbconn);
    Result := dbconn;
  end;

end;

function TDMServerContainer.GetEmployeeDBName: String;
begin
  Result := DMServerContainer.Employee.Params.Values['Database']
end;

function TDMServerContainer.GetLogDBName: String;
begin
  Result := DMServerContainer.DataSnap_Server_Log.Params.Values['Database']
end;

procedure TDMServerContainer.LogEvent(Event, Error: String);
begin
  SqlLOG.ParamByName('IP_ADDRESS').AsString := 'Undefined';
  SqlLOG.ParamByName('Event').AsString := Copy(Event + Error, 1, 50);
  SqlLOG.ExecSQL();
  // DMMainServerModule.CDSLog.Refresh;
end;

procedure TDMServerContainer.LogEvent(Event: String;
  ChannelInfo: TDBXChannelInfo);
begin

  SqlLOG.ParamByName('IP_ADDRESS').AsString := ChannelInfo.Info;
  SqlLOG.ParamByName('Event').AsString := Event;
  SqlLOG.ExecSQL();
  // DMMainServerModule.CDSLog.Refresh;

end;

procedure TDMServerContainer.MyDSServerConnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  if Assigned(DSConnectEventObject.ChannelInfo) then
  begin
    LogEvent('Connect', DSConnectEventObject.ChannelInfo);
    LogEvent('Properties', DSConnectEventObject.ConnectProperties.
      Properties.Text);
  end;
  try
    GetConnection.Open;
  except
    Raise;
  end;
end;

procedure TDMServerContainer.MyDSServerDisconnect(DSConnectEventObject
  : TDSConnectEventObject);
begin
  // LogEvent('Disconnect', DSConnectEventObject.ChannelInfo);
end;

procedure TDMServerContainer.MyDSServerError(DSErrorEventObject
  : TDSErrorEventObject);
begin
  LogEvent('Error', DSErrorEventObject.Error.Message);
end;

procedure TDMServerContainer.Shutdown;
begin
  MyDSServer.Stop;
end;

procedure TDMServerContainer.StartServer(port: Integer);
begin

  MyDSTCPServerTransport.port := port;
  MyDSServer.Start;

  DSHTTPService1.Active := True;

end;

end.
