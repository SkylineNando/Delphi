// 
// Created by the DataSnap proxy generator.
// 

namespace DataSnapdotnetClient;

interface

uses Borland.Data,
     System.Data.Common,
     System.Configuration;

type

  DbxConn = class
  public
    class method Get(user, pass : String) : TAdoDbxConnection;
  end;

  TUserClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FAddUserCommand: TAdoDbxCommand;
    FIsValidUserCommand: TAdoDbxCommand;
    FDisableUserCommand: TAdoDbxCommand;
    FEnableUserCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    procedure AddUser(FirstLastName: string; Login: string; Password: string);
    function IsValidUser(Login: string; Password: string): Boolean;
    procedure DisableUser(Login: string);
    procedure EnableUser(Login: string);
  end;

  TEmployeeServerRDMClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FAS_ApplyUpdatesCommand: TAdoDbxCommand;
    FAS_GetRecordsCommand: TAdoDbxCommand;
    FAS_DataRequestCommand: TAdoDbxCommand;
    FAS_GetProviderNamesCommand: TAdoDbxCommand;
    FAS_GetParamsCommand: TAdoDbxCommand;
    FAS_RowRequestCommand: TAdoDbxCommand;
    FAS_ExecuteCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    function AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
    function AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
    function AS_DataRequest(ProviderName: String; DataStream: object): object;
    function AS_GetProviderNames: string;
    function AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
    function AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
    procedure AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
  end;

  TDSServerMethodsClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FGetServerDateTimeCommand: TAdoDbxCommand;
    FExecuteJobCommand: TAdoDbxCommand;
    FMVPCustomerCommand: TAdoDbxCommand;
    FListofCustomerCommand: TAdoDbxCommand;
    FListofDifferentTypesCommand: TAdoDbxCommand;
    FAS_ApplyUpdatesCommand: TAdoDbxCommand;
    FAS_GetRecordsCommand: TAdoDbxCommand;
    FAS_DataRequestCommand: TAdoDbxCommand;
    FAS_GetProviderNamesCommand: TAdoDbxCommand;
    FAS_GetParamsCommand: TAdoDbxCommand;
    FAS_RowRequestCommand: TAdoDbxCommand;
    FAS_ExecuteCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    function GetServerDateTime: DateTime;
    procedure ExecuteJob(JobId: Integer);
    function MVPCustomer: Object;
    function ListofCustomer: Object;
    function ListofDifferentTypes: Object;
    function AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
    function AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
    function AS_DataRequest(ProviderName: String; DataStream: object): object;
    function AS_GetProviderNames: string;
    function AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
    function AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
    procedure AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
  end;

  TDMMainServerModuleClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FIpAddressCommand: TAdoDbxCommand;
    FServerComputerNameCommand: TAdoDbxCommand;
    FAS_ApplyUpdatesCommand: TAdoDbxCommand;
    FAS_GetRecordsCommand: TAdoDbxCommand;
    FAS_DataRequestCommand: TAdoDbxCommand;
    FAS_GetProviderNamesCommand: TAdoDbxCommand;
    FAS_GetParamsCommand: TAdoDbxCommand;
    FAS_RowRequestCommand: TAdoDbxCommand;
    FAS_ExecuteCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    function IpAddress: string;
    function ServerComputerName: string;
    function AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
    function AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
    function AS_DataRequest(ProviderName: String; DataStream: object): object;
    function AS_GetProviderNames: string;
    function AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
    function AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
    procedure AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
  end;

  TLookupServerRDMClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FAS_ApplyUpdatesCommand: TAdoDbxCommand;
    FAS_GetRecordsCommand: TAdoDbxCommand;
    FAS_DataRequestCommand: TAdoDbxCommand;
    FAS_GetProviderNamesCommand: TAdoDbxCommand;
    FAS_GetParamsCommand: TAdoDbxCommand;
    FAS_RowRequestCommand: TAdoDbxCommand;
    FAS_ExecuteCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    function AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
    function AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
    function AS_DataRequest(ProviderName: String; DataStream: object): object;
    function AS_GetProviderNames: string;
    function AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
    function AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
    procedure AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
  end;

  TDepartmentClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FDepartmentDefaultCommand: TAdoDbxCommand;
    FDepartmentOrderByIDCommand: TAdoDbxCommand;
    FDepartmentOrderByNameCommand: TAdoDbxCommand;
    FOrderByFieldCommand: TAdoDbxCommand;
    FGetDepartmentsOrderByCommand: TAdoDbxCommand;
    FGetDepartmentsCommand: TAdoDbxCommand;
    FInsertCommand: TAdoDbxCommand;
    FInsertAsDBXReaderCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    procedure DepartmentDefault;
    procedure DepartmentOrderByID;
    procedure DepartmentOrderByName;
    function OrderByField: string;
    function GetDepartmentsOrderBy: System.Data.IDataReader;
    function GetDepartments: System.Data.IDataReader;
    function Insert(sParams: System.Data.IDataReader): Boolean;
    function InsertAsDBXReader(sDbxParams: System.Data.IDataReader): Boolean;
  end;

  TDSServerBatchClient = class
  private
    FDBXConnection: TAdoDbxConnection;
    FInstanceOwner: Boolean;
    FStartBackupCommand: TAdoDbxCommand;
    FAS_ApplyUpdatesCommand: TAdoDbxCommand;
    FAS_GetRecordsCommand: TAdoDbxCommand;
    FAS_DataRequestCommand: TAdoDbxCommand;
    FAS_GetProviderNamesCommand: TAdoDbxCommand;
    FAS_GetParamsCommand: TAdoDbxCommand;
    FAS_RowRequestCommand: TAdoDbxCommand;
    FAS_ExecuteCommand: TAdoDbxCommand;
  protected
    procedure Dispose(ADisposing: Boolean); virtual;
  public
    constructor (ADBXConnection: TAdoDbxConnection);
    constructor (ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
    procedure Dispose; virtual;
    procedure StartBackup(sMessage: object; sBackupFileName: string);
    function AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
    function AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
    function AS_DataRequest(ProviderName: String; DataStream: object): object;
    function AS_GetProviderNames: string;
    function AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
    function AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
    procedure AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
  end;

implementation

class method DbxConn.Get(user, pass : String) : TAdoDbxConnection;
var
  FMyAdoDbxConnection : TAdoDbxConnection;
begin

  var port : String := ConfigurationManager.AppSettings['DSPort'];
  var hostname : String := ConfigurationManager.AppSettings['DSHostname'];
  var protocol : String := ConfigurationManager.AppSettings['DSProtocol'];
  var provider : String := ConfigurationManager.AppSettings['ProviderName'];

  var connstr : String := 'hostname={0};port={1};DSAuthenticationUser={2};DSAuthenticationPassword={3};communicationprotocol={4}';

  FMyAdoDbxConnection := TAdoDbxConnection.Create;
  FMyAdoDbxConnection := DbProviderFactories.GetFactory(provider).CreateConnection() as TAdoDbxConnection;
  FMyAdoDbxConnection.ConnectionString := '' + String.Format(connstr,[hostname, port, user, pass, protocol]);
  result := FMyAdoDbxConnection;
end;

procedure TUserClient.AddUser(FirstLastName: string; Login: string; Password: string);
begin
  if FAddUserCommand = nil then
  begin
    FAddUserCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAddUserCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAddUserCommand.CommandText := 'TUser.AddUser';
    FAddUserCommand.Prepare;
  end;
  FAddUserCommand.Parameters[0].Value := FirstLastName;
  FAddUserCommand.Parameters[1].Value := Login;
  FAddUserCommand.Parameters[2].Value := Password;
  FAddUserCommand.ExecuteNonQuery;
end;

function TUserClient.IsValidUser(Login: string; Password: string): Boolean;
begin
  if FIsValidUserCommand = nil then
  begin
    FIsValidUserCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FIsValidUserCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FIsValidUserCommand.CommandText := 'TUser.IsValidUser';
    FIsValidUserCommand.Prepare;
  end;
  FIsValidUserCommand.Parameters[0].Value := Login;
  FIsValidUserCommand.Parameters[1].Value := Password;
  FIsValidUserCommand.ExecuteNonQuery;
  Result := FIsValidUserCommand.Parameters[2].Value as Boolean;
end;

procedure TUserClient.DisableUser(Login: string);
begin
  if FDisableUserCommand = nil then
  begin
    FDisableUserCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FDisableUserCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FDisableUserCommand.CommandText := 'TUser.DisableUser';
    FDisableUserCommand.Prepare;
  end;
  FDisableUserCommand.Parameters[0].Value := Login;
  FDisableUserCommand.ExecuteNonQuery;
end;

procedure TUserClient.EnableUser(Login: string);
begin
  if FEnableUserCommand = nil then
  begin
    FEnableUserCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FEnableUserCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FEnableUserCommand.CommandText := 'TUser.EnableUser';
    FEnableUserCommand.Prepare;
  end;
  FEnableUserCommand.Parameters[0].Value := Login;
  FEnableUserCommand.ExecuteNonQuery;
end;


constructor TUserClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TUserClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TUserClient.Dispose;
begin
  Dispose(true);
end;

procedure TUserClient.Dispose(ADisposing: Boolean);
begin
  if FAddUserCommand <> nil then
    FAddUserCommand.Dispose;
  if FIsValidUserCommand <> nil then
    FIsValidUserCommand.Dispose;
  if FDisableUserCommand <> nil then
    FDisableUserCommand.Dispose;
  if FEnableUserCommand <> nil then
    FEnableUserCommand.Dispose;
end;

function TEmployeeServerRDMClient.AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_ApplyUpdatesCommand = nil then
  begin
    FAS_ApplyUpdatesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ApplyUpdatesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ApplyUpdatesCommand.CommandText := 'TEmployeeServerRDM.AS_ApplyUpdates';
    FAS_ApplyUpdatesCommand.Prepare;
  end;
  FAS_ApplyUpdatesCommand.Parameters[0].Value := ProviderName;
  FAS_ApplyUpdatesCommand.Parameters[1].Value := DeltaStream;
  FAS_ApplyUpdatesCommand.Parameters[2].Value := MaxErrors;
  if OwnerDataStream = nil then
    FAS_ApplyUpdatesCommand.Parameters[4].Value := DbNull.Value
  else
    FAS_ApplyUpdatesCommand.Parameters[4].Value := OwnerDataStream;
  FAS_ApplyUpdatesCommand.ExecuteNonQuery;
  ErrorCount := FAS_ApplyUpdatesCommand.Parameters[3].Value as Integer;
  if FAS_ApplyUpdatesCommand.Parameters[4].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ApplyUpdatesCommand.Parameters[4].Value as System.IO.Stream;
  Result := FAS_ApplyUpdatesCommand.Parameters[5].Value as object;
end;

function TEmployeeServerRDMClient.AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetRecordsCommand = nil then
  begin
    FAS_GetRecordsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetRecordsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetRecordsCommand.CommandText := 'TEmployeeServerRDM.AS_GetRecords';
    FAS_GetRecordsCommand.Prepare;
  end;
  FAS_GetRecordsCommand.Parameters[0].Value := ProviderName;
  FAS_GetRecordsCommand.Parameters[1].Value := Count;
  FAS_GetRecordsCommand.Parameters[3].Value := Options;
  FAS_GetRecordsCommand.Parameters[4].Value := CommandText;
  if ParamReader = nil then
    FAS_GetRecordsCommand.Parameters[5].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[5].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_GetRecordsCommand.Parameters[6].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[6].Value := OwnerDataStream;
  FAS_GetRecordsCommand.ExecuteNonQuery;
  RecsOut := FAS_GetRecordsCommand.Parameters[2].Value as Integer;
  if FAS_GetRecordsCommand.Parameters[5].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_GetRecordsCommand.Parameters[5].Value as System.IO.Stream;
  if FAS_GetRecordsCommand.Parameters[6].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetRecordsCommand.Parameters[6].Value as System.IO.Stream;
  Result := FAS_GetRecordsCommand.Parameters[7].Value as object;
end;

function TEmployeeServerRDMClient.AS_DataRequest(ProviderName: String; DataStream: object): object;
begin
  if FAS_DataRequestCommand = nil then
  begin
    FAS_DataRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_DataRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_DataRequestCommand.CommandText := 'TEmployeeServerRDM.AS_DataRequest';
    FAS_DataRequestCommand.Prepare;
  end;
  FAS_DataRequestCommand.Parameters[0].Value := ProviderName;
  FAS_DataRequestCommand.Parameters[1].Value := DataStream;
  FAS_DataRequestCommand.ExecuteNonQuery;
  Result := FAS_DataRequestCommand.Parameters[2].Value as object;
end;

function TEmployeeServerRDMClient.AS_GetProviderNames: string;
begin
  if FAS_GetProviderNamesCommand = nil then
  begin
    FAS_GetProviderNamesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetProviderNamesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetProviderNamesCommand.CommandText := 'TEmployeeServerRDM.AS_GetProviderNames';
    FAS_GetProviderNamesCommand.Prepare;
  end;
  FAS_GetProviderNamesCommand.ExecuteNonQuery;
  Result := FAS_GetProviderNamesCommand.Parameters[0].Value as string;
end;

function TEmployeeServerRDMClient.AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetParamsCommand = nil then
  begin
    FAS_GetParamsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetParamsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetParamsCommand.CommandText := 'TEmployeeServerRDM.AS_GetParams';
    FAS_GetParamsCommand.Prepare;
  end;
  FAS_GetParamsCommand.Parameters[0].Value := ProviderName;
  if OwnerDataStream = nil then
    FAS_GetParamsCommand.Parameters[1].Value := DbNull.Value
  else
    FAS_GetParamsCommand.Parameters[1].Value := OwnerDataStream;
  FAS_GetParamsCommand.ExecuteNonQuery;
  if FAS_GetParamsCommand.Parameters[1].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetParamsCommand.Parameters[1].Value as System.IO.Stream;
  Result := FAS_GetParamsCommand.Parameters[2].Value as object;
end;

function TEmployeeServerRDMClient.AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_RowRequestCommand = nil then
  begin
    FAS_RowRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_RowRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_RowRequestCommand.CommandText := 'TEmployeeServerRDM.AS_RowRequest';
    FAS_RowRequestCommand.Prepare;
  end;
  FAS_RowRequestCommand.Parameters[0].Value := ProviderName;
  FAS_RowRequestCommand.Parameters[1].Value := RowStream;
  FAS_RowRequestCommand.Parameters[2].Value := RequestType;
  if OwnerDataStream = nil then
    FAS_RowRequestCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_RowRequestCommand.Parameters[3].Value := OwnerDataStream;
  FAS_RowRequestCommand.ExecuteNonQuery;
  if FAS_RowRequestCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_RowRequestCommand.Parameters[3].Value as System.IO.Stream;
  Result := FAS_RowRequestCommand.Parameters[4].Value as object;
end;

procedure TEmployeeServerRDMClient.AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
begin
  if FAS_ExecuteCommand = nil then
  begin
    FAS_ExecuteCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ExecuteCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ExecuteCommand.CommandText := 'TEmployeeServerRDM.AS_Execute';
    FAS_ExecuteCommand.Prepare;
  end;
  FAS_ExecuteCommand.Parameters[0].Value := ProviderName;
  FAS_ExecuteCommand.Parameters[1].Value := CommandText;
  if ParamReader = nil then
    FAS_ExecuteCommand.Parameters[2].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[2].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_ExecuteCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[3].Value := OwnerDataStream;
  FAS_ExecuteCommand.ExecuteNonQuery;
  if FAS_ExecuteCommand.Parameters[2].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_ExecuteCommand.Parameters[2].Value as System.IO.Stream;
  if FAS_ExecuteCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ExecuteCommand.Parameters[3].Value as System.IO.Stream;
end;


constructor TEmployeeServerRDMClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TEmployeeServerRDMClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TEmployeeServerRDMClient.Dispose;
begin
  Dispose(true);
end;

procedure TEmployeeServerRDMClient.Dispose(ADisposing: Boolean);
begin
  if FAS_ApplyUpdatesCommand <> nil then
    FAS_ApplyUpdatesCommand.Dispose;
  if FAS_GetRecordsCommand <> nil then
    FAS_GetRecordsCommand.Dispose;
  if FAS_DataRequestCommand <> nil then
    FAS_DataRequestCommand.Dispose;
  if FAS_GetProviderNamesCommand <> nil then
    FAS_GetProviderNamesCommand.Dispose;
  if FAS_GetParamsCommand <> nil then
    FAS_GetParamsCommand.Dispose;
  if FAS_RowRequestCommand <> nil then
    FAS_RowRequestCommand.Dispose;
  if FAS_ExecuteCommand <> nil then
    FAS_ExecuteCommand.Dispose;
end;

function TDSServerMethodsClient.GetServerDateTime: DateTime;
begin
  if FGetServerDateTimeCommand = nil then
  begin
    FGetServerDateTimeCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FGetServerDateTimeCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FGetServerDateTimeCommand.CommandText := 'TDSServerMethods.GetServerDateTime';
    FGetServerDateTimeCommand.Prepare;
  end;
  FGetServerDateTimeCommand.ExecuteNonQuery;
  Result := FGetServerDateTimeCommand.Parameters[0].Value as DateTime;
end;

procedure TDSServerMethodsClient.ExecuteJob(JobId: Integer);
begin
  if FExecuteJobCommand = nil then
  begin
    FExecuteJobCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FExecuteJobCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FExecuteJobCommand.CommandText := 'TDSServerMethods.ExecuteJob';
    FExecuteJobCommand.Prepare;
  end;
  FExecuteJobCommand.Parameters[0].Value := JobId;
  FExecuteJobCommand.ExecuteNonQuery;
end;

function TDSServerMethodsClient.MVPCustomer: Object;
begin
  if FMVPCustomerCommand = nil then
  begin
    FMVPCustomerCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FMVPCustomerCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FMVPCustomerCommand.CommandText := 'TDSServerMethods.MVPCustomer';
    FMVPCustomerCommand.Prepare;
  end;
  FMVPCustomerCommand.ExecuteNonQuery;
  Result := FMVPCustomerCommand.Parameters[0].Value as object;
end;

function TDSServerMethodsClient.ListofCustomer: Object;
begin
  if FListofCustomerCommand = nil then
  begin
    FListofCustomerCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FListofCustomerCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FListofCustomerCommand.CommandText := 'TDSServerMethods.ListofCustomer';
    FListofCustomerCommand.Prepare;
  end;
  FListofCustomerCommand.ExecuteNonQuery;
  Result := FListofCustomerCommand.Parameters[0].Value as object;
end;

function TDSServerMethodsClient.ListofDifferentTypes: Object;
begin
  if FListofDifferentTypesCommand = nil then
  begin
    FListofDifferentTypesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FListofDifferentTypesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FListofDifferentTypesCommand.CommandText := 'TDSServerMethods.ListofDifferentTypes';
    FListofDifferentTypesCommand.Prepare;
  end;
  FListofDifferentTypesCommand.ExecuteNonQuery;
  Result := FListofDifferentTypesCommand.Parameters[0].Value as object;
end;

function TDSServerMethodsClient.AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_ApplyUpdatesCommand = nil then
  begin
    FAS_ApplyUpdatesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ApplyUpdatesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ApplyUpdatesCommand.CommandText := 'TDSServerMethods.AS_ApplyUpdates';
    FAS_ApplyUpdatesCommand.Prepare;
  end;
  FAS_ApplyUpdatesCommand.Parameters[0].Value := ProviderName;
  FAS_ApplyUpdatesCommand.Parameters[1].Value := DeltaStream;
  FAS_ApplyUpdatesCommand.Parameters[2].Value := MaxErrors;
  if OwnerDataStream = nil then
    FAS_ApplyUpdatesCommand.Parameters[4].Value := DbNull.Value
  else
    FAS_ApplyUpdatesCommand.Parameters[4].Value := OwnerDataStream;
  FAS_ApplyUpdatesCommand.ExecuteNonQuery;
  ErrorCount := FAS_ApplyUpdatesCommand.Parameters[3].Value as Integer;
  if FAS_ApplyUpdatesCommand.Parameters[4].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ApplyUpdatesCommand.Parameters[4].Value as System.IO.Stream;
  Result := FAS_ApplyUpdatesCommand.Parameters[5].Value as object;
end;

function TDSServerMethodsClient.AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetRecordsCommand = nil then
  begin
    FAS_GetRecordsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetRecordsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetRecordsCommand.CommandText := 'TDSServerMethods.AS_GetRecords';
    FAS_GetRecordsCommand.Prepare;
  end;
  FAS_GetRecordsCommand.Parameters[0].Value := ProviderName;
  FAS_GetRecordsCommand.Parameters[1].Value := Count;
  FAS_GetRecordsCommand.Parameters[3].Value := Options;
  FAS_GetRecordsCommand.Parameters[4].Value := CommandText;
  if ParamReader = nil then
    FAS_GetRecordsCommand.Parameters[5].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[5].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_GetRecordsCommand.Parameters[6].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[6].Value := OwnerDataStream;
  FAS_GetRecordsCommand.ExecuteNonQuery;
  RecsOut := FAS_GetRecordsCommand.Parameters[2].Value as Integer;
  if FAS_GetRecordsCommand.Parameters[5].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_GetRecordsCommand.Parameters[5].Value as System.IO.Stream;
  if FAS_GetRecordsCommand.Parameters[6].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetRecordsCommand.Parameters[6].Value as System.IO.Stream;
  Result := FAS_GetRecordsCommand.Parameters[7].Value as object;
end;

function TDSServerMethodsClient.AS_DataRequest(ProviderName: String; DataStream: object): object;
begin
  if FAS_DataRequestCommand = nil then
  begin
    FAS_DataRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_DataRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_DataRequestCommand.CommandText := 'TDSServerMethods.AS_DataRequest';
    FAS_DataRequestCommand.Prepare;
  end;
  FAS_DataRequestCommand.Parameters[0].Value := ProviderName;
  FAS_DataRequestCommand.Parameters[1].Value := DataStream;
  FAS_DataRequestCommand.ExecuteNonQuery;
  Result := FAS_DataRequestCommand.Parameters[2].Value as object;
end;

function TDSServerMethodsClient.AS_GetProviderNames: string;
begin
  if FAS_GetProviderNamesCommand = nil then
  begin
    FAS_GetProviderNamesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetProviderNamesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetProviderNamesCommand.CommandText := 'TDSServerMethods.AS_GetProviderNames';
    FAS_GetProviderNamesCommand.Prepare;
  end;
  FAS_GetProviderNamesCommand.ExecuteNonQuery;
  Result := FAS_GetProviderNamesCommand.Parameters[0].Value as string;
end;

function TDSServerMethodsClient.AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetParamsCommand = nil then
  begin
    FAS_GetParamsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetParamsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetParamsCommand.CommandText := 'TDSServerMethods.AS_GetParams';
    FAS_GetParamsCommand.Prepare;
  end;
  FAS_GetParamsCommand.Parameters[0].Value := ProviderName;
  if OwnerDataStream = nil then
    FAS_GetParamsCommand.Parameters[1].Value := DbNull.Value
  else
    FAS_GetParamsCommand.Parameters[1].Value := OwnerDataStream;
  FAS_GetParamsCommand.ExecuteNonQuery;
  if FAS_GetParamsCommand.Parameters[1].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetParamsCommand.Parameters[1].Value as System.IO.Stream;
  Result := FAS_GetParamsCommand.Parameters[2].Value as object;
end;

function TDSServerMethodsClient.AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_RowRequestCommand = nil then
  begin
    FAS_RowRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_RowRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_RowRequestCommand.CommandText := 'TDSServerMethods.AS_RowRequest';
    FAS_RowRequestCommand.Prepare;
  end;
  FAS_RowRequestCommand.Parameters[0].Value := ProviderName;
  FAS_RowRequestCommand.Parameters[1].Value := RowStream;
  FAS_RowRequestCommand.Parameters[2].Value := RequestType;
  if OwnerDataStream = nil then
    FAS_RowRequestCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_RowRequestCommand.Parameters[3].Value := OwnerDataStream;
  FAS_RowRequestCommand.ExecuteNonQuery;
  if FAS_RowRequestCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_RowRequestCommand.Parameters[3].Value as System.IO.Stream;
  Result := FAS_RowRequestCommand.Parameters[4].Value as object;
end;

procedure TDSServerMethodsClient.AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
begin
  if FAS_ExecuteCommand = nil then
  begin
    FAS_ExecuteCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ExecuteCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ExecuteCommand.CommandText := 'TDSServerMethods.AS_Execute';
    FAS_ExecuteCommand.Prepare;
  end;
  FAS_ExecuteCommand.Parameters[0].Value := ProviderName;
  FAS_ExecuteCommand.Parameters[1].Value := CommandText;
  if ParamReader = nil then
    FAS_ExecuteCommand.Parameters[2].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[2].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_ExecuteCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[3].Value := OwnerDataStream;
  FAS_ExecuteCommand.ExecuteNonQuery;
  if FAS_ExecuteCommand.Parameters[2].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_ExecuteCommand.Parameters[2].Value as System.IO.Stream;
  if FAS_ExecuteCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ExecuteCommand.Parameters[3].Value as System.IO.Stream;
end;


constructor TDSServerMethodsClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDSServerMethodsClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TDSServerMethodsClient.Dispose;
begin
  Dispose(true);
end;

procedure TDSServerMethodsClient.Dispose(ADisposing: Boolean);
begin
  if FGetServerDateTimeCommand <> nil then
    FGetServerDateTimeCommand.Dispose;
  if FExecuteJobCommand <> nil then
    FExecuteJobCommand.Dispose;
  if FMVPCustomerCommand <> nil then
    FMVPCustomerCommand.Dispose;
  if FListofCustomerCommand <> nil then
    FListofCustomerCommand.Dispose;
  if FListofDifferentTypesCommand <> nil then
    FListofDifferentTypesCommand.Dispose;
  if FAS_ApplyUpdatesCommand <> nil then
    FAS_ApplyUpdatesCommand.Dispose;
  if FAS_GetRecordsCommand <> nil then
    FAS_GetRecordsCommand.Dispose;
  if FAS_DataRequestCommand <> nil then
    FAS_DataRequestCommand.Dispose;
  if FAS_GetProviderNamesCommand <> nil then
    FAS_GetProviderNamesCommand.Dispose;
  if FAS_GetParamsCommand <> nil then
    FAS_GetParamsCommand.Dispose;
  if FAS_RowRequestCommand <> nil then
    FAS_RowRequestCommand.Dispose;
  if FAS_ExecuteCommand <> nil then
    FAS_ExecuteCommand.Dispose;
end;

function TDMMainServerModuleClient.IpAddress: string;
begin
  if FIpAddressCommand = nil then
  begin
    FIpAddressCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FIpAddressCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FIpAddressCommand.CommandText := 'TDMMainServerModule.IpAddress';
    FIpAddressCommand.Prepare;
  end;
  FIpAddressCommand.ExecuteNonQuery;
  Result := FIpAddressCommand.Parameters[0].Value as string;
end;

function TDMMainServerModuleClient.ServerComputerName: string;
begin
  if FServerComputerNameCommand = nil then
  begin
    FServerComputerNameCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FServerComputerNameCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FServerComputerNameCommand.CommandText := 'TDMMainServerModule.ServerComputerName';
    FServerComputerNameCommand.Prepare;
  end;
  FServerComputerNameCommand.ExecuteNonQuery;
  Result := FServerComputerNameCommand.Parameters[0].Value as string;
end;

function TDMMainServerModuleClient.AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_ApplyUpdatesCommand = nil then
  begin
    FAS_ApplyUpdatesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ApplyUpdatesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ApplyUpdatesCommand.CommandText := 'TDMMainServerModule.AS_ApplyUpdates';
    FAS_ApplyUpdatesCommand.Prepare;
  end;
  FAS_ApplyUpdatesCommand.Parameters[0].Value := ProviderName;
  FAS_ApplyUpdatesCommand.Parameters[1].Value := DeltaStream;
  FAS_ApplyUpdatesCommand.Parameters[2].Value := MaxErrors;
  if OwnerDataStream = nil then
    FAS_ApplyUpdatesCommand.Parameters[4].Value := DbNull.Value
  else
    FAS_ApplyUpdatesCommand.Parameters[4].Value := OwnerDataStream;
  FAS_ApplyUpdatesCommand.ExecuteNonQuery;
  ErrorCount := FAS_ApplyUpdatesCommand.Parameters[3].Value as Integer;
  if FAS_ApplyUpdatesCommand.Parameters[4].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ApplyUpdatesCommand.Parameters[4].Value as System.IO.Stream;
  Result := FAS_ApplyUpdatesCommand.Parameters[5].Value as object;
end;

function TDMMainServerModuleClient.AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetRecordsCommand = nil then
  begin
    FAS_GetRecordsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetRecordsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetRecordsCommand.CommandText := 'TDMMainServerModule.AS_GetRecords';
    FAS_GetRecordsCommand.Prepare;
  end;
  FAS_GetRecordsCommand.Parameters[0].Value := ProviderName;
  FAS_GetRecordsCommand.Parameters[1].Value := Count;
  FAS_GetRecordsCommand.Parameters[3].Value := Options;
  FAS_GetRecordsCommand.Parameters[4].Value := CommandText;
  if ParamReader = nil then
    FAS_GetRecordsCommand.Parameters[5].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[5].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_GetRecordsCommand.Parameters[6].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[6].Value := OwnerDataStream;
  FAS_GetRecordsCommand.ExecuteNonQuery;
  RecsOut := FAS_GetRecordsCommand.Parameters[2].Value as Integer;
  if FAS_GetRecordsCommand.Parameters[5].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_GetRecordsCommand.Parameters[5].Value as System.IO.Stream;
  if FAS_GetRecordsCommand.Parameters[6].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetRecordsCommand.Parameters[6].Value as System.IO.Stream;
  Result := FAS_GetRecordsCommand.Parameters[7].Value as object;
end;

function TDMMainServerModuleClient.AS_DataRequest(ProviderName: String; DataStream: object): object;
begin
  if FAS_DataRequestCommand = nil then
  begin
    FAS_DataRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_DataRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_DataRequestCommand.CommandText := 'TDMMainServerModule.AS_DataRequest';
    FAS_DataRequestCommand.Prepare;
  end;
  FAS_DataRequestCommand.Parameters[0].Value := ProviderName;
  FAS_DataRequestCommand.Parameters[1].Value := DataStream;
  FAS_DataRequestCommand.ExecuteNonQuery;
  Result := FAS_DataRequestCommand.Parameters[2].Value as object;
end;

function TDMMainServerModuleClient.AS_GetProviderNames: string;
begin
  if FAS_GetProviderNamesCommand = nil then
  begin
    FAS_GetProviderNamesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetProviderNamesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetProviderNamesCommand.CommandText := 'TDMMainServerModule.AS_GetProviderNames';
    FAS_GetProviderNamesCommand.Prepare;
  end;
  FAS_GetProviderNamesCommand.ExecuteNonQuery;
  Result := FAS_GetProviderNamesCommand.Parameters[0].Value as string;
end;

function TDMMainServerModuleClient.AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetParamsCommand = nil then
  begin
    FAS_GetParamsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetParamsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetParamsCommand.CommandText := 'TDMMainServerModule.AS_GetParams';
    FAS_GetParamsCommand.Prepare;
  end;
  FAS_GetParamsCommand.Parameters[0].Value := ProviderName;
  if OwnerDataStream = nil then
    FAS_GetParamsCommand.Parameters[1].Value := DbNull.Value
  else
    FAS_GetParamsCommand.Parameters[1].Value := OwnerDataStream;
  FAS_GetParamsCommand.ExecuteNonQuery;
  if FAS_GetParamsCommand.Parameters[1].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetParamsCommand.Parameters[1].Value as System.IO.Stream;
  Result := FAS_GetParamsCommand.Parameters[2].Value as object;
end;

function TDMMainServerModuleClient.AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_RowRequestCommand = nil then
  begin
    FAS_RowRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_RowRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_RowRequestCommand.CommandText := 'TDMMainServerModule.AS_RowRequest';
    FAS_RowRequestCommand.Prepare;
  end;
  FAS_RowRequestCommand.Parameters[0].Value := ProviderName;
  FAS_RowRequestCommand.Parameters[1].Value := RowStream;
  FAS_RowRequestCommand.Parameters[2].Value := RequestType;
  if OwnerDataStream = nil then
    FAS_RowRequestCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_RowRequestCommand.Parameters[3].Value := OwnerDataStream;
  FAS_RowRequestCommand.ExecuteNonQuery;
  if FAS_RowRequestCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_RowRequestCommand.Parameters[3].Value as System.IO.Stream;
  Result := FAS_RowRequestCommand.Parameters[4].Value as object;
end;

procedure TDMMainServerModuleClient.AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
begin
  if FAS_ExecuteCommand = nil then
  begin
    FAS_ExecuteCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ExecuteCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ExecuteCommand.CommandText := 'TDMMainServerModule.AS_Execute';
    FAS_ExecuteCommand.Prepare;
  end;
  FAS_ExecuteCommand.Parameters[0].Value := ProviderName;
  FAS_ExecuteCommand.Parameters[1].Value := CommandText;
  if ParamReader = nil then
    FAS_ExecuteCommand.Parameters[2].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[2].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_ExecuteCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[3].Value := OwnerDataStream;
  FAS_ExecuteCommand.ExecuteNonQuery;
  if FAS_ExecuteCommand.Parameters[2].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_ExecuteCommand.Parameters[2].Value as System.IO.Stream;
  if FAS_ExecuteCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ExecuteCommand.Parameters[3].Value as System.IO.Stream;
end;


constructor TDMMainServerModuleClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDMMainServerModuleClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TDMMainServerModuleClient.Dispose;
begin
  Dispose(true);
end;

procedure TDMMainServerModuleClient.Dispose(ADisposing: Boolean);
begin
  if FIpAddressCommand <> nil then
    FIpAddressCommand.Dispose;
  if FServerComputerNameCommand <> nil then
    FServerComputerNameCommand.Dispose;
  if FAS_ApplyUpdatesCommand <> nil then
    FAS_ApplyUpdatesCommand.Dispose;
  if FAS_GetRecordsCommand <> nil then
    FAS_GetRecordsCommand.Dispose;
  if FAS_DataRequestCommand <> nil then
    FAS_DataRequestCommand.Dispose;
  if FAS_GetProviderNamesCommand <> nil then
    FAS_GetProviderNamesCommand.Dispose;
  if FAS_GetParamsCommand <> nil then
    FAS_GetParamsCommand.Dispose;
  if FAS_RowRequestCommand <> nil then
    FAS_RowRequestCommand.Dispose;
  if FAS_ExecuteCommand <> nil then
    FAS_ExecuteCommand.Dispose;
end;

function TLookupServerRDMClient.AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_ApplyUpdatesCommand = nil then
  begin
    FAS_ApplyUpdatesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ApplyUpdatesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ApplyUpdatesCommand.CommandText := 'TLookupServerRDM.AS_ApplyUpdates';
    FAS_ApplyUpdatesCommand.Prepare;
  end;
  FAS_ApplyUpdatesCommand.Parameters[0].Value := ProviderName;
  FAS_ApplyUpdatesCommand.Parameters[1].Value := DeltaStream;
  FAS_ApplyUpdatesCommand.Parameters[2].Value := MaxErrors;
  if OwnerDataStream = nil then
    FAS_ApplyUpdatesCommand.Parameters[4].Value := DbNull.Value
  else
    FAS_ApplyUpdatesCommand.Parameters[4].Value := OwnerDataStream;
  FAS_ApplyUpdatesCommand.ExecuteNonQuery;
  ErrorCount := FAS_ApplyUpdatesCommand.Parameters[3].Value as Integer;
  if FAS_ApplyUpdatesCommand.Parameters[4].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ApplyUpdatesCommand.Parameters[4].Value as System.IO.Stream;
  Result := FAS_ApplyUpdatesCommand.Parameters[5].Value as object;
end;

function TLookupServerRDMClient.AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetRecordsCommand = nil then
  begin
    FAS_GetRecordsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetRecordsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetRecordsCommand.CommandText := 'TLookupServerRDM.AS_GetRecords';
    FAS_GetRecordsCommand.Prepare;
  end;
  FAS_GetRecordsCommand.Parameters[0].Value := ProviderName;
  FAS_GetRecordsCommand.Parameters[1].Value := Count;
  FAS_GetRecordsCommand.Parameters[3].Value := Options;
  FAS_GetRecordsCommand.Parameters[4].Value := CommandText;
  if ParamReader = nil then
    FAS_GetRecordsCommand.Parameters[5].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[5].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_GetRecordsCommand.Parameters[6].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[6].Value := OwnerDataStream;
  FAS_GetRecordsCommand.ExecuteNonQuery;
  RecsOut := FAS_GetRecordsCommand.Parameters[2].Value as Integer;
  if FAS_GetRecordsCommand.Parameters[5].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_GetRecordsCommand.Parameters[5].Value as System.IO.Stream;
  if FAS_GetRecordsCommand.Parameters[6].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetRecordsCommand.Parameters[6].Value as System.IO.Stream;
  Result := FAS_GetRecordsCommand.Parameters[7].Value as object;
end;

function TLookupServerRDMClient.AS_DataRequest(ProviderName: String; DataStream: object): object;
begin
  if FAS_DataRequestCommand = nil then
  begin
    FAS_DataRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_DataRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_DataRequestCommand.CommandText := 'TLookupServerRDM.AS_DataRequest';
    FAS_DataRequestCommand.Prepare;
  end;
  FAS_DataRequestCommand.Parameters[0].Value := ProviderName;
  FAS_DataRequestCommand.Parameters[1].Value := DataStream;
  FAS_DataRequestCommand.ExecuteNonQuery;
  Result := FAS_DataRequestCommand.Parameters[2].Value as object;
end;

function TLookupServerRDMClient.AS_GetProviderNames: string;
begin
  if FAS_GetProviderNamesCommand = nil then
  begin
    FAS_GetProviderNamesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetProviderNamesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetProviderNamesCommand.CommandText := 'TLookupServerRDM.AS_GetProviderNames';
    FAS_GetProviderNamesCommand.Prepare;
  end;
  FAS_GetProviderNamesCommand.ExecuteNonQuery;
  Result := FAS_GetProviderNamesCommand.Parameters[0].Value as string;
end;

function TLookupServerRDMClient.AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetParamsCommand = nil then
  begin
    FAS_GetParamsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetParamsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetParamsCommand.CommandText := 'TLookupServerRDM.AS_GetParams';
    FAS_GetParamsCommand.Prepare;
  end;
  FAS_GetParamsCommand.Parameters[0].Value := ProviderName;
  if OwnerDataStream = nil then
    FAS_GetParamsCommand.Parameters[1].Value := DbNull.Value
  else
    FAS_GetParamsCommand.Parameters[1].Value := OwnerDataStream;
  FAS_GetParamsCommand.ExecuteNonQuery;
  if FAS_GetParamsCommand.Parameters[1].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetParamsCommand.Parameters[1].Value as System.IO.Stream;
  Result := FAS_GetParamsCommand.Parameters[2].Value as object;
end;

function TLookupServerRDMClient.AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_RowRequestCommand = nil then
  begin
    FAS_RowRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_RowRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_RowRequestCommand.CommandText := 'TLookupServerRDM.AS_RowRequest';
    FAS_RowRequestCommand.Prepare;
  end;
  FAS_RowRequestCommand.Parameters[0].Value := ProviderName;
  FAS_RowRequestCommand.Parameters[1].Value := RowStream;
  FAS_RowRequestCommand.Parameters[2].Value := RequestType;
  if OwnerDataStream = nil then
    FAS_RowRequestCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_RowRequestCommand.Parameters[3].Value := OwnerDataStream;
  FAS_RowRequestCommand.ExecuteNonQuery;
  if FAS_RowRequestCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_RowRequestCommand.Parameters[3].Value as System.IO.Stream;
  Result := FAS_RowRequestCommand.Parameters[4].Value as object;
end;

procedure TLookupServerRDMClient.AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
begin
  if FAS_ExecuteCommand = nil then
  begin
    FAS_ExecuteCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ExecuteCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ExecuteCommand.CommandText := 'TLookupServerRDM.AS_Execute';
    FAS_ExecuteCommand.Prepare;
  end;
  FAS_ExecuteCommand.Parameters[0].Value := ProviderName;
  FAS_ExecuteCommand.Parameters[1].Value := CommandText;
  if ParamReader = nil then
    FAS_ExecuteCommand.Parameters[2].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[2].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_ExecuteCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[3].Value := OwnerDataStream;
  FAS_ExecuteCommand.ExecuteNonQuery;
  if FAS_ExecuteCommand.Parameters[2].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_ExecuteCommand.Parameters[2].Value as System.IO.Stream;
  if FAS_ExecuteCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ExecuteCommand.Parameters[3].Value as System.IO.Stream;
end;


constructor TLookupServerRDMClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TLookupServerRDMClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TLookupServerRDMClient.Dispose;
begin
  Dispose(true);
end;

procedure TLookupServerRDMClient.Dispose(ADisposing: Boolean);
begin
  if FAS_ApplyUpdatesCommand <> nil then
    FAS_ApplyUpdatesCommand.Dispose;
  if FAS_GetRecordsCommand <> nil then
    FAS_GetRecordsCommand.Dispose;
  if FAS_DataRequestCommand <> nil then
    FAS_DataRequestCommand.Dispose;
  if FAS_GetProviderNamesCommand <> nil then
    FAS_GetProviderNamesCommand.Dispose;
  if FAS_GetParamsCommand <> nil then
    FAS_GetParamsCommand.Dispose;
  if FAS_RowRequestCommand <> nil then
    FAS_RowRequestCommand.Dispose;
  if FAS_ExecuteCommand <> nil then
    FAS_ExecuteCommand.Dispose;
end;

procedure TDepartmentClient.DepartmentDefault;
begin
  if FDepartmentDefaultCommand = nil then
  begin
    FDepartmentDefaultCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FDepartmentDefaultCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FDepartmentDefaultCommand.CommandText := 'TDepartment.DepartmentDefault';
    FDepartmentDefaultCommand.Prepare;
  end;
  FDepartmentDefaultCommand.ExecuteNonQuery;
end;

procedure TDepartmentClient.DepartmentOrderByID;
begin
  if FDepartmentOrderByIDCommand = nil then
  begin
    FDepartmentOrderByIDCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FDepartmentOrderByIDCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FDepartmentOrderByIDCommand.CommandText := 'TDepartment.DepartmentOrderByID';
    FDepartmentOrderByIDCommand.Prepare;
  end;
  FDepartmentOrderByIDCommand.ExecuteNonQuery;
end;

procedure TDepartmentClient.DepartmentOrderByName;
begin
  if FDepartmentOrderByNameCommand = nil then
  begin
    FDepartmentOrderByNameCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FDepartmentOrderByNameCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FDepartmentOrderByNameCommand.CommandText := 'TDepartment.DepartmentOrderByName';
    FDepartmentOrderByNameCommand.Prepare;
  end;
  FDepartmentOrderByNameCommand.ExecuteNonQuery;
end;

function TDepartmentClient.OrderByField: string;
begin
  if FOrderByFieldCommand = nil then
  begin
    FOrderByFieldCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FOrderByFieldCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FOrderByFieldCommand.CommandText := 'TDepartment.OrderByField';
    FOrderByFieldCommand.Prepare;
  end;
  FOrderByFieldCommand.ExecuteNonQuery;
  Result := FOrderByFieldCommand.Parameters[0].Value as string;
end;

function TDepartmentClient.GetDepartmentsOrderBy: System.Data.IDataReader;
begin
  if FGetDepartmentsOrderByCommand = nil then
  begin
    FGetDepartmentsOrderByCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FGetDepartmentsOrderByCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FGetDepartmentsOrderByCommand.CommandText := 'TDepartment.GetDepartmentsOrderBy';
    FGetDepartmentsOrderByCommand.Prepare;
  end;
  FGetDepartmentsOrderByCommand.ExecuteNonQuery;
  Result := FGetDepartmentsOrderByCommand.Parameters[0].Value as System.Data.IDataReader;
end;

function TDepartmentClient.GetDepartments: System.Data.IDataReader;
begin
  if FGetDepartmentsCommand = nil then
  begin
    FGetDepartmentsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FGetDepartmentsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FGetDepartmentsCommand.CommandText := 'TDepartment.GetDepartments';
    FGetDepartmentsCommand.Prepare;
  end;
  FGetDepartmentsCommand.ExecuteNonQuery;
  Result := FGetDepartmentsCommand.Parameters[0].Value as System.Data.IDataReader;
end;

function TDepartmentClient.Insert(sParams: System.Data.IDataReader): Boolean;
begin
  if FInsertCommand = nil then
  begin
    FInsertCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FInsertCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FInsertCommand.CommandText := 'TDepartment.Insert';
    FInsertCommand.Prepare;
  end;
  FInsertCommand.Parameters[0].Value := sParams;
  FInsertCommand.ExecuteNonQuery;
  Result := FInsertCommand.Parameters[1].Value as Boolean;
end;

function TDepartmentClient.InsertAsDBXReader(sDbxParams: System.Data.IDataReader): Boolean;
begin
  if FInsertAsDBXReaderCommand = nil then
  begin
    FInsertAsDBXReaderCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FInsertAsDBXReaderCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FInsertAsDBXReaderCommand.CommandText := 'TDepartment.InsertAsDBXReader';
    FInsertAsDBXReaderCommand.Prepare;
  end;
  FInsertAsDBXReaderCommand.Parameters[0].Value := sDbxParams;
  FInsertAsDBXReaderCommand.ExecuteNonQuery;
  Result := FInsertAsDBXReaderCommand.Parameters[1].Value as Boolean;
end;


constructor TDepartmentClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDepartmentClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TDepartmentClient.Dispose;
begin
  Dispose(true);
end;

procedure TDepartmentClient.Dispose(ADisposing: Boolean);
begin
  if FDepartmentDefaultCommand <> nil then
    FDepartmentDefaultCommand.Dispose;
  if FDepartmentOrderByIDCommand <> nil then
    FDepartmentOrderByIDCommand.Dispose;
  if FDepartmentOrderByNameCommand <> nil then
    FDepartmentOrderByNameCommand.Dispose;
  if FOrderByFieldCommand <> nil then
    FOrderByFieldCommand.Dispose;
  if FGetDepartmentsOrderByCommand <> nil then
    FGetDepartmentsOrderByCommand.Dispose;
  if FGetDepartmentsCommand <> nil then
    FGetDepartmentsCommand.Dispose;
  if FInsertCommand <> nil then
    FInsertCommand.Dispose;
  if FInsertAsDBXReaderCommand <> nil then
    FInsertAsDBXReaderCommand.Dispose;
end;

procedure TDSServerBatchClient.StartBackup(sMessage: object; sBackupFileName: string);
begin
  if FStartBackupCommand = nil then
  begin
    FStartBackupCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FStartBackupCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FStartBackupCommand.CommandText := 'TDSServerBatch.StartBackup';
    FStartBackupCommand.Prepare;
  end;
  FStartBackupCommand.Parameters[0].Value := sMessage;
  FStartBackupCommand.Parameters[1].Value := sBackupFileName;
  FStartBackupCommand.ExecuteNonQuery;
end;

function TDSServerBatchClient.AS_ApplyUpdates(ProviderName: String; DeltaStream: object; MaxErrors: Integer; out ErrorCount: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_ApplyUpdatesCommand = nil then
  begin
    FAS_ApplyUpdatesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ApplyUpdatesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ApplyUpdatesCommand.CommandText := 'TDSServerBatch.AS_ApplyUpdates';
    FAS_ApplyUpdatesCommand.Prepare;
  end;
  FAS_ApplyUpdatesCommand.Parameters[0].Value := ProviderName;
  FAS_ApplyUpdatesCommand.Parameters[1].Value := DeltaStream;
  FAS_ApplyUpdatesCommand.Parameters[2].Value := MaxErrors;
  if OwnerDataStream = nil then
    FAS_ApplyUpdatesCommand.Parameters[4].Value := DbNull.Value
  else
    FAS_ApplyUpdatesCommand.Parameters[4].Value := OwnerDataStream;
  FAS_ApplyUpdatesCommand.ExecuteNonQuery;
  ErrorCount := FAS_ApplyUpdatesCommand.Parameters[3].Value as Integer;
  if FAS_ApplyUpdatesCommand.Parameters[4].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ApplyUpdatesCommand.Parameters[4].Value as System.IO.Stream;
  Result := FAS_ApplyUpdatesCommand.Parameters[5].Value as object;
end;

function TDSServerBatchClient.AS_GetRecords(ProviderName: String; Count: Integer; out RecsOut: Integer; Options: Integer; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetRecordsCommand = nil then
  begin
    FAS_GetRecordsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetRecordsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetRecordsCommand.CommandText := 'TDSServerBatch.AS_GetRecords';
    FAS_GetRecordsCommand.Prepare;
  end;
  FAS_GetRecordsCommand.Parameters[0].Value := ProviderName;
  FAS_GetRecordsCommand.Parameters[1].Value := Count;
  FAS_GetRecordsCommand.Parameters[3].Value := Options;
  FAS_GetRecordsCommand.Parameters[4].Value := CommandText;
  if ParamReader = nil then
    FAS_GetRecordsCommand.Parameters[5].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[5].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_GetRecordsCommand.Parameters[6].Value := DbNull.Value
  else
    FAS_GetRecordsCommand.Parameters[6].Value := OwnerDataStream;
  FAS_GetRecordsCommand.ExecuteNonQuery;
  RecsOut := FAS_GetRecordsCommand.Parameters[2].Value as Integer;
  if FAS_GetRecordsCommand.Parameters[5].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_GetRecordsCommand.Parameters[5].Value as System.IO.Stream;
  if FAS_GetRecordsCommand.Parameters[6].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetRecordsCommand.Parameters[6].Value as System.IO.Stream;
  Result := FAS_GetRecordsCommand.Parameters[7].Value as object;
end;

function TDSServerBatchClient.AS_DataRequest(ProviderName: String; DataStream: object): object;
begin
  if FAS_DataRequestCommand = nil then
  begin
    FAS_DataRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_DataRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_DataRequestCommand.CommandText := 'TDSServerBatch.AS_DataRequest';
    FAS_DataRequestCommand.Prepare;
  end;
  FAS_DataRequestCommand.Parameters[0].Value := ProviderName;
  FAS_DataRequestCommand.Parameters[1].Value := DataStream;
  FAS_DataRequestCommand.ExecuteNonQuery;
  Result := FAS_DataRequestCommand.Parameters[2].Value as object;
end;

function TDSServerBatchClient.AS_GetProviderNames: string;
begin
  if FAS_GetProviderNamesCommand = nil then
  begin
    FAS_GetProviderNamesCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetProviderNamesCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetProviderNamesCommand.CommandText := 'TDSServerBatch.AS_GetProviderNames';
    FAS_GetProviderNamesCommand.Prepare;
  end;
  FAS_GetProviderNamesCommand.ExecuteNonQuery;
  Result := FAS_GetProviderNamesCommand.Parameters[0].Value as string;
end;

function TDSServerBatchClient.AS_GetParams(ProviderName: String; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_GetParamsCommand = nil then
  begin
    FAS_GetParamsCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_GetParamsCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_GetParamsCommand.CommandText := 'TDSServerBatch.AS_GetParams';
    FAS_GetParamsCommand.Prepare;
  end;
  FAS_GetParamsCommand.Parameters[0].Value := ProviderName;
  if OwnerDataStream = nil then
    FAS_GetParamsCommand.Parameters[1].Value := DbNull.Value
  else
    FAS_GetParamsCommand.Parameters[1].Value := OwnerDataStream;
  FAS_GetParamsCommand.ExecuteNonQuery;
  if FAS_GetParamsCommand.Parameters[1].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_GetParamsCommand.Parameters[1].Value as System.IO.Stream;
  Result := FAS_GetParamsCommand.Parameters[2].Value as object;
end;

function TDSServerBatchClient.AS_RowRequest(ProviderName: String; RowStream: object; RequestType: Integer; var OwnerDataStream: System.IO.Stream): object;
begin
  if FAS_RowRequestCommand = nil then
  begin
    FAS_RowRequestCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_RowRequestCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_RowRequestCommand.CommandText := 'TDSServerBatch.AS_RowRequest';
    FAS_RowRequestCommand.Prepare;
  end;
  FAS_RowRequestCommand.Parameters[0].Value := ProviderName;
  FAS_RowRequestCommand.Parameters[1].Value := RowStream;
  FAS_RowRequestCommand.Parameters[2].Value := RequestType;
  if OwnerDataStream = nil then
    FAS_RowRequestCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_RowRequestCommand.Parameters[3].Value := OwnerDataStream;
  FAS_RowRequestCommand.ExecuteNonQuery;
  if FAS_RowRequestCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_RowRequestCommand.Parameters[3].Value as System.IO.Stream;
  Result := FAS_RowRequestCommand.Parameters[4].Value as object;
end;

procedure TDSServerBatchClient.AS_Execute(ProviderName: String; CommandText: String; var ParamReader: System.IO.Stream; var OwnerDataStream: System.IO.Stream);
begin
  if FAS_ExecuteCommand = nil then
  begin
    FAS_ExecuteCommand := FDBXConnection.CreateCommand as TAdoDbxCommand;
    FAS_ExecuteCommand.CommandType := System.Data.CommandType.StoredProcedure;
    FAS_ExecuteCommand.CommandText := 'TDSServerBatch.AS_Execute';
    FAS_ExecuteCommand.Prepare;
  end;
  FAS_ExecuteCommand.Parameters[0].Value := ProviderName;
  FAS_ExecuteCommand.Parameters[1].Value := CommandText;
  if ParamReader = nil then
    FAS_ExecuteCommand.Parameters[2].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[2].Value := ParamReader;
  if OwnerDataStream = nil then
    FAS_ExecuteCommand.Parameters[3].Value := DbNull.Value
  else
    FAS_ExecuteCommand.Parameters[3].Value := OwnerDataStream;
  FAS_ExecuteCommand.ExecuteNonQuery;
  if FAS_ExecuteCommand.Parameters[2].Value = DBNull.Value then
    ParamReader := nil
  else
    ParamReader := FAS_ExecuteCommand.Parameters[2].Value as System.IO.Stream;
  if FAS_ExecuteCommand.Parameters[3].Value = DBNull.Value then
    OwnerDataStream := nil
  else
    OwnerDataStream := FAS_ExecuteCommand.Parameters[3].Value as System.IO.Stream;
end;


constructor TDSServerBatchClient(ADBXConnection: TAdoDbxConnection);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDSServerBatchClient(ADBXConnection: TAdoDbxConnection; AInstanceOwner: Boolean);
begin
  if ADBXConnection = nil then
    raise new ArgumentException('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := AInstanceOwner;
end;


procedure TDSServerBatchClient.Dispose;
begin
  Dispose(true);
end;

procedure TDSServerBatchClient.Dispose(ADisposing: Boolean);
begin
  if FStartBackupCommand <> nil then
    FStartBackupCommand.Dispose;
  if FAS_ApplyUpdatesCommand <> nil then
    FAS_ApplyUpdatesCommand.Dispose;
  if FAS_GetRecordsCommand <> nil then
    FAS_GetRecordsCommand.Dispose;
  if FAS_DataRequestCommand <> nil then
    FAS_DataRequestCommand.Dispose;
  if FAS_GetProviderNamesCommand <> nil then
    FAS_GetProviderNamesCommand.Dispose;
  if FAS_GetParamsCommand <> nil then
    FAS_GetParamsCommand.Dispose;
  if FAS_RowRequestCommand <> nil then
    FAS_RowRequestCommand.Dispose;
  if FAS_ExecuteCommand <> nil then
    FAS_ExecuteCommand.Dispose;
end;

end.
