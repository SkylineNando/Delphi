//
// Created by the DataSnap proxy generator.
// 12/16/2011 3:12:43 PM
//

unit DSClientProxy;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, DSProxy, Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Customer, Data.DBXJSONReflect;

type
  TUserClient = class(TDSAdminClient)
  private
    FAddUserCommand: TDBXCommand;
    FIsValidUserCommand: TDBXCommand;
    FDisableUserCommand: TDBXCommand;
    FEnableUserCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure AddUser(FirstLastName: string; Login: string; Password: string);
    function IsValidUser(Login: string; Password: string): Boolean;
    procedure DisableUser(Login: string);
    procedure EnableUser(Login: string);
  end;

  TEmployeeServerRDMClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TDSServerMethodsClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FGetServerDateTimeCommand: TDBXCommand;
    FExecuteJobCommand: TDBXCommand;
    FMVPCustomerCommand: TDBXCommand;
    FCustomerCommand: TDBXCommand;
    FSendCustomerCommand: TDBXCommand;
    FListofCustomerCommand: TDBXCommand;
    FListofDifferentTypesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    function GetServerDateTime: TDateTime;
    procedure ExecuteJob(JobId: Integer);
    function MVPCustomer: TJSONValue;
    function Customer: TCustomer;
    procedure SendCustomer(C: TJSONObject);
    function ListofCustomer: TJSONArray;
    function ListofDifferentTypes: TJSONArray;
  end;

  TDMMainServerModuleClient = class(TDSAdminClient)
  private
    FIpAddressCommand: TDBXCommand;
    FServerComputerNameCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function IpAddress: string;
    function ServerComputerName: string;
  end;

  TLookupServerRDMClient = class(TDSAdminClient)
  private
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

  TDepartmentClient = class(TDSAdminClient)
  private
    FDepartmentDefaultCommand: TDBXCommand;
    FDepartmentOrderByIDCommand: TDBXCommand;
    FDepartmentOrderByNameCommand: TDBXCommand;
    FOrderByFieldCommand: TDBXCommand;
    FGetDepartmentsOrderByCommand: TDBXCommand;
    FGetDepartmentsCommand: TDBXCommand;
    FGetBioLifeCommand: TDBXCommand;
    FInsertCommand: TDBXCommand;
    FInsertAsDBXReaderCommand: TDBXCommand;
    FSendValueCommand: TDBXCommand;
    FGetValueCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DepartmentDefault;
    procedure DepartmentOrderByID;
    procedure DepartmentOrderByName;
    function OrderByField: string;
    function GetDepartmentsOrderBy: TDBXReader;
    function GetDepartments: TDBXReader;
    function GetBioLife: TDBXReader;
    function Insert(sParams: TParams): Boolean;
    function InsertAsDBXReader(sDbxParams: TDBXReader): Boolean;
    procedure SendValue(i: string);
    function GetValue: string;
  end;

  TDSServerBatchClient = class(TDSAdminClient)
  private
    FStartBackupCommand: TDBXCommand;
    FOutProcessImageCommand: TDBXCommand;
    FRetProcessImageCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure StartBackup(sMessage: TDBXCallback; sBackupFileName: string);
    procedure OutProcessImage(Args: TDBXCallback; LStream: TStream; out OutStream: TStream);
    function RetProcessImage(Args: TDBXCallback; LStream: TStream): TStream;
  end;

  TDSMasterDetailClient = class(TDSAdminClient)
  private
    FDSPDepartmentBeforeGetRecordsCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSPDepartmentBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
  end;

  TDMDataSet1Client = class(TDSAdminClient)
  private
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

  TDMDataSet2Client = class(TDSAdminClient)
  private
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

  TDMDataSet3Client = class(TDSAdminClient)
  private
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

  TDMDataSet5Client = class(TDSAdminClient)
  private
    FGetRegionCommand: TDBXCommand;
    FGetCountryCommand: TDBXCommand;
    FGetStateCommand: TDBXCommand;
    FGetCityCommand: TDBXCommand;
    FListofClassRegionCommand: TDBXCommand;
    FListofClassCountryCommand: TDBXCommand;
    FListofClassStateCommand: TDBXCommand;
    FListofClassCityCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetRegion: TDBXReader;
    function GetCountry: TDBXReader;
    function GetState: TDBXReader;
    function GetCity: TDBXReader;
    function ListofClassRegion: TJSONArray;
    function ListofClassCountry: TJSONArray;
    function ListofClassState: TJSONArray;
    function ListofClassCity: TJSONArray;
  end;

  TDMDataSet6Client = class(TDSAdminClient)
  private
    FGetDepartmentsCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetDepartments: TDBXReader;
  end;

implementation

procedure TUserClient.AddUser(FirstLastName: string; Login: string; Password: string);
begin
  if FAddUserCommand = nil then
  begin
    FAddUserCommand := FDBXConnection.CreateCommand;
    FAddUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddUserCommand.Text := 'TUser.AddUser';
    FAddUserCommand.Prepare;
  end;
  FAddUserCommand.Parameters[0].Value.SetWideString(FirstLastName);
  FAddUserCommand.Parameters[1].Value.SetWideString(Login);
  FAddUserCommand.Parameters[2].Value.SetWideString(Password);
  FAddUserCommand.ExecuteUpdate;
end;

function TUserClient.IsValidUser(Login: string; Password: string): Boolean;
begin
  if FIsValidUserCommand = nil then
  begin
    FIsValidUserCommand := FDBXConnection.CreateCommand;
    FIsValidUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIsValidUserCommand.Text := 'TUser.IsValidUser';
    FIsValidUserCommand.Prepare;
  end;
  FIsValidUserCommand.Parameters[0].Value.SetWideString(Login);
  FIsValidUserCommand.Parameters[1].Value.SetWideString(Password);
  FIsValidUserCommand.ExecuteUpdate;
  Result := FIsValidUserCommand.Parameters[2].Value.GetBoolean;
end;

procedure TUserClient.DisableUser(Login: string);
begin
  if FDisableUserCommand = nil then
  begin
    FDisableUserCommand := FDBXConnection.CreateCommand;
    FDisableUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDisableUserCommand.Text := 'TUser.DisableUser';
    FDisableUserCommand.Prepare;
  end;
  FDisableUserCommand.Parameters[0].Value.SetWideString(Login);
  FDisableUserCommand.ExecuteUpdate;
end;

procedure TUserClient.EnableUser(Login: string);
begin
  if FEnableUserCommand = nil then
  begin
    FEnableUserCommand := FDBXConnection.CreateCommand;
    FEnableUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEnableUserCommand.Text := 'TUser.EnableUser';
    FEnableUserCommand.Prepare;
  end;
  FEnableUserCommand.Parameters[0].Value.SetWideString(Login);
  FEnableUserCommand.ExecuteUpdate;
end;


constructor TUserClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TUserClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TUserClient.Destroy;
begin
  FreeAndNil(FAddUserCommand);
  FreeAndNil(FIsValidUserCommand);
  FreeAndNil(FDisableUserCommand);
  FreeAndNil(FEnableUserCommand);
  inherited;
end;

procedure TEmployeeServerRDMClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TEmployeeServerRDM.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TEmployeeServerRDMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TEmployeeServerRDMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TEmployeeServerRDMClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  inherited;
end;

procedure TDSServerMethodsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSServerMethods.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.GetServerDateTime: TDateTime;
begin
  if FGetServerDateTimeCommand = nil then
  begin
    FGetServerDateTimeCommand := FDBXConnection.CreateCommand;
    FGetServerDateTimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerDateTimeCommand.Text := 'TDSServerMethods.GetServerDateTime';
    FGetServerDateTimeCommand.Prepare;
  end;
  FGetServerDateTimeCommand.ExecuteUpdate;
  Result := FGetServerDateTimeCommand.Parameters[0].Value.AsDateTime;
end;

procedure TDSServerMethodsClient.ExecuteJob(JobId: Integer);
begin
  if FExecuteJobCommand = nil then
  begin
    FExecuteJobCommand := FDBXConnection.CreateCommand;
    FExecuteJobCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteJobCommand.Text := 'TDSServerMethods.ExecuteJob';
    FExecuteJobCommand.Prepare;
  end;
  FExecuteJobCommand.Parameters[0].Value.SetInt32(JobId);
  FExecuteJobCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.MVPCustomer: TJSONValue;
begin
  if FMVPCustomerCommand = nil then
  begin
    FMVPCustomerCommand := FDBXConnection.CreateCommand;
    FMVPCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMVPCustomerCommand.Text := 'TDSServerMethods.MVPCustomer';
    FMVPCustomerCommand.Prepare;
  end;
  FMVPCustomerCommand.ExecuteUpdate;
  Result := TJSONValue(FMVPCustomerCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.Customer: TCustomer;
begin
  if FCustomerCommand = nil then
  begin
    FCustomerCommand := FDBXConnection.CreateCommand;
    FCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCustomerCommand.Text := 'TDSServerMethods.Customer';
    FCustomerCommand.Prepare;
  end;
  FCustomerCommand.ExecuteUpdate;
  if not FCustomerCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FCustomerCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TCustomer(FUnMarshal.UnMarshal(FCustomerCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCustomerCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

procedure TDSServerMethodsClient.SendCustomer(C: TJSONObject);
begin
  if FSendCustomerCommand = nil then
  begin
    FSendCustomerCommand := FDBXConnection.CreateCommand;
    FSendCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSendCustomerCommand.Text := 'TDSServerMethods.SendCustomer';
    FSendCustomerCommand.Prepare;
  end;
  FSendCustomerCommand.Parameters[0].Value.SetJSONValue(C, FInstanceOwner);
  FSendCustomerCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.ListofCustomer: TJSONArray;
begin
  if FListofCustomerCommand = nil then
  begin
    FListofCustomerCommand := FDBXConnection.CreateCommand;
    FListofCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofCustomerCommand.Text := 'TDSServerMethods.ListofCustomer';
    FListofCustomerCommand.Prepare;
  end;
  FListofCustomerCommand.ExecuteUpdate;
  Result := TJSONArray(FListofCustomerCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.ListofDifferentTypes: TJSONArray;
begin
  if FListofDifferentTypesCommand = nil then
  begin
    FListofDifferentTypesCommand := FDBXConnection.CreateCommand;
    FListofDifferentTypesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofDifferentTypesCommand.Text := 'TDSServerMethods.ListofDifferentTypes';
    FListofDifferentTypesCommand.Prepare;
  end;
  FListofDifferentTypesCommand.ExecuteUpdate;
  Result := TJSONArray(FListofDifferentTypesCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


constructor TDSServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDSServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDSServerMethodsClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FGetServerDateTimeCommand);
  FreeAndNil(FExecuteJobCommand);
  FreeAndNil(FMVPCustomerCommand);
  FreeAndNil(FCustomerCommand);
  FreeAndNil(FSendCustomerCommand);
  FreeAndNil(FListofCustomerCommand);
  FreeAndNil(FListofDifferentTypesCommand);
  inherited;
end;

function TDMMainServerModuleClient.IpAddress: string;
begin
  if FIpAddressCommand = nil then
  begin
    FIpAddressCommand := FDBXConnection.CreateCommand;
    FIpAddressCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIpAddressCommand.Text := 'TDMMainServerModule.IpAddress';
    FIpAddressCommand.Prepare;
  end;
  FIpAddressCommand.ExecuteUpdate;
  Result := FIpAddressCommand.Parameters[0].Value.GetWideString;
end;

function TDMMainServerModuleClient.ServerComputerName: string;
begin
  if FServerComputerNameCommand = nil then
  begin
    FServerComputerNameCommand := FDBXConnection.CreateCommand;
    FServerComputerNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FServerComputerNameCommand.Text := 'TDMMainServerModule.ServerComputerName';
    FServerComputerNameCommand.Prepare;
  end;
  FServerComputerNameCommand.ExecuteUpdate;
  Result := FServerComputerNameCommand.Parameters[0].Value.GetWideString;
end;


constructor TDMMainServerModuleClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMMainServerModuleClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMMainServerModuleClient.Destroy;
begin
  FreeAndNil(FIpAddressCommand);
  FreeAndNil(FServerComputerNameCommand);
  inherited;
end;


constructor TLookupServerRDMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TLookupServerRDMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TLookupServerRDMClient.Destroy;
begin
  inherited;
end;

procedure TDepartmentClient.DepartmentDefault;
begin
  if FDepartmentDefaultCommand = nil then
  begin
    FDepartmentDefaultCommand := FDBXConnection.CreateCommand;
    FDepartmentDefaultCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartmentDefaultCommand.Text := 'TDepartment.DepartmentDefault';
    FDepartmentDefaultCommand.Prepare;
  end;
  FDepartmentDefaultCommand.ExecuteUpdate;
end;

procedure TDepartmentClient.DepartmentOrderByID;
begin
  if FDepartmentOrderByIDCommand = nil then
  begin
    FDepartmentOrderByIDCommand := FDBXConnection.CreateCommand;
    FDepartmentOrderByIDCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartmentOrderByIDCommand.Text := 'TDepartment.DepartmentOrderByID';
    FDepartmentOrderByIDCommand.Prepare;
  end;
  FDepartmentOrderByIDCommand.ExecuteUpdate;
end;

procedure TDepartmentClient.DepartmentOrderByName;
begin
  if FDepartmentOrderByNameCommand = nil then
  begin
    FDepartmentOrderByNameCommand := FDBXConnection.CreateCommand;
    FDepartmentOrderByNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartmentOrderByNameCommand.Text := 'TDepartment.DepartmentOrderByName';
    FDepartmentOrderByNameCommand.Prepare;
  end;
  FDepartmentOrderByNameCommand.ExecuteUpdate;
end;

function TDepartmentClient.OrderByField: string;
begin
  if FOrderByFieldCommand = nil then
  begin
    FOrderByFieldCommand := FDBXConnection.CreateCommand;
    FOrderByFieldCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrderByFieldCommand.Text := 'TDepartment.OrderByField';
    FOrderByFieldCommand.Prepare;
  end;
  FOrderByFieldCommand.ExecuteUpdate;
  Result := FOrderByFieldCommand.Parameters[0].Value.GetWideString;
end;

function TDepartmentClient.GetDepartmentsOrderBy: TDBXReader;
begin
  if FGetDepartmentsOrderByCommand = nil then
  begin
    FGetDepartmentsOrderByCommand := FDBXConnection.CreateCommand;
    FGetDepartmentsOrderByCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDepartmentsOrderByCommand.Text := 'TDepartment.GetDepartmentsOrderBy';
    FGetDepartmentsOrderByCommand.Prepare;
  end;
  FGetDepartmentsOrderByCommand.ExecuteUpdate;
  Result := FGetDepartmentsOrderByCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDepartmentClient.GetDepartments: TDBXReader;
begin
  if FGetDepartmentsCommand = nil then
  begin
    FGetDepartmentsCommand := FDBXConnection.CreateCommand;
    FGetDepartmentsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDepartmentsCommand.Text := 'TDepartment.GetDepartments';
    FGetDepartmentsCommand.Prepare;
  end;
  FGetDepartmentsCommand.ExecuteUpdate;
  Result := FGetDepartmentsCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDepartmentClient.GetBioLife: TDBXReader;
begin
  if FGetBioLifeCommand = nil then
  begin
    FGetBioLifeCommand := FDBXConnection.CreateCommand;
    FGetBioLifeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetBioLifeCommand.Text := 'TDepartment.GetBioLife';
    FGetBioLifeCommand.Prepare;
  end;
  FGetBioLifeCommand.ExecuteUpdate;
  Result := FGetBioLifeCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDepartmentClient.Insert(sParams: TParams): Boolean;
begin
  if FInsertCommand = nil then
  begin
    FInsertCommand := FDBXConnection.CreateCommand;
    FInsertCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertCommand.Text := 'TDepartment.Insert';
    FInsertCommand.Prepare;
  end;
  FInsertCommand.Parameters[0].Value.SetDBXReader(TDBXParamsReader.Create(sParams, FInstanceOwner), True);
  FInsertCommand.ExecuteUpdate;
  Result := FInsertCommand.Parameters[1].Value.GetBoolean;
end;

function TDepartmentClient.InsertAsDBXReader(sDbxParams: TDBXReader): Boolean;
begin
  if FInsertAsDBXReaderCommand = nil then
  begin
    FInsertAsDBXReaderCommand := FDBXConnection.CreateCommand;
    FInsertAsDBXReaderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertAsDBXReaderCommand.Text := 'TDepartment.InsertAsDBXReader';
    FInsertAsDBXReaderCommand.Prepare;
  end;
  FInsertAsDBXReaderCommand.Parameters[0].Value.SetDBXReader(sDbxParams, FInstanceOwner);
  FInsertAsDBXReaderCommand.ExecuteUpdate;
  Result := FInsertAsDBXReaderCommand.Parameters[1].Value.GetBoolean;
end;

procedure TDepartmentClient.SendValue(i: string);
begin
  if FSendValueCommand = nil then
  begin
    FSendValueCommand := FDBXConnection.CreateCommand;
    FSendValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSendValueCommand.Text := 'TDepartment.SendValue';
    FSendValueCommand.Prepare;
  end;
  FSendValueCommand.Parameters[0].Value.SetWideString(i);
  FSendValueCommand.ExecuteUpdate;
end;

function TDepartmentClient.GetValue: string;
begin
  if FGetValueCommand = nil then
  begin
    FGetValueCommand := FDBXConnection.CreateCommand;
    FGetValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetValueCommand.Text := 'TDepartment.GetValue';
    FGetValueCommand.Prepare;
  end;
  FGetValueCommand.ExecuteUpdate;
  Result := FGetValueCommand.Parameters[0].Value.GetWideString;
end;


constructor TDepartmentClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDepartmentClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDepartmentClient.Destroy;
begin
  FreeAndNil(FDepartmentDefaultCommand);
  FreeAndNil(FDepartmentOrderByIDCommand);
  FreeAndNil(FDepartmentOrderByNameCommand);
  FreeAndNil(FOrderByFieldCommand);
  FreeAndNil(FGetDepartmentsOrderByCommand);
  FreeAndNil(FGetDepartmentsCommand);
  FreeAndNil(FGetBioLifeCommand);
  FreeAndNil(FInsertCommand);
  FreeAndNil(FInsertAsDBXReaderCommand);
  FreeAndNil(FSendValueCommand);
  FreeAndNil(FGetValueCommand);
  inherited;
end;

procedure TDSServerBatchClient.StartBackup(sMessage: TDBXCallback; sBackupFileName: string);
begin
  if FStartBackupCommand = nil then
  begin
    FStartBackupCommand := FDBXConnection.CreateCommand;
    FStartBackupCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStartBackupCommand.Text := 'TDSServerBatch.StartBackup';
    FStartBackupCommand.Prepare;
  end;
  FStartBackupCommand.Parameters[0].Value.SetCallbackValue(sMessage);
  FStartBackupCommand.Parameters[1].Value.SetWideString(sBackupFileName);
  FStartBackupCommand.ExecuteUpdate;
end;

procedure TDSServerBatchClient.OutProcessImage(Args: TDBXCallback; LStream: TStream; out OutStream: TStream);
begin
  if FOutProcessImageCommand = nil then
  begin
    FOutProcessImageCommand := FDBXConnection.CreateCommand;
    FOutProcessImageCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOutProcessImageCommand.Text := 'TDSServerBatch.OutProcessImage';
    FOutProcessImageCommand.Prepare;
  end;
  FOutProcessImageCommand.Parameters[0].Value.SetCallbackValue(Args);
  FOutProcessImageCommand.Parameters[1].Value.SetStream(LStream, FInstanceOwner);
  FOutProcessImageCommand.ExecuteUpdate;
  OutStream := FOutProcessImageCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;

function TDSServerBatchClient.RetProcessImage(Args: TDBXCallback; LStream: TStream): TStream;
begin
  if FRetProcessImageCommand = nil then
  begin
    FRetProcessImageCommand := FDBXConnection.CreateCommand;
    FRetProcessImageCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetProcessImageCommand.Text := 'TDSServerBatch.RetProcessImage';
    FRetProcessImageCommand.Prepare;
  end;
  FRetProcessImageCommand.Parameters[0].Value.SetCallbackValue(Args);
  FRetProcessImageCommand.Parameters[1].Value.SetStream(LStream, FInstanceOwner);
  FRetProcessImageCommand.ExecuteUpdate;
  Result := FRetProcessImageCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;


constructor TDSServerBatchClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDSServerBatchClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDSServerBatchClient.Destroy;
begin
  FreeAndNil(FStartBackupCommand);
  FreeAndNil(FOutProcessImageCommand);
  FreeAndNil(FRetProcessImageCommand);
  inherited;
end;

procedure TDSMasterDetailClient.DSPDepartmentBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  if FDSPDepartmentBeforeGetRecordsCommand = nil then
  begin
    FDSPDepartmentBeforeGetRecordsCommand := FDBXConnection.CreateCommand;
    FDSPDepartmentBeforeGetRecordsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSPDepartmentBeforeGetRecordsCommand.Text := 'TDSMasterDetail.DSPDepartmentBeforeGetRecords';
    FDSPDepartmentBeforeGetRecordsCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSPDepartmentBeforeGetRecordsCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSPDepartmentBeforeGetRecordsCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSPDepartmentBeforeGetRecordsCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSPDepartmentBeforeGetRecordsCommand.Parameters[1].Value.AsVariant := OwnerData;
  FDSPDepartmentBeforeGetRecordsCommand.ExecuteUpdate;
  OwnerData := FDSPDepartmentBeforeGetRecordsCommand.Parameters[1].Value.AsVariant;
end;


constructor TDSMasterDetailClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDSMasterDetailClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDSMasterDetailClient.Destroy;
begin
  FreeAndNil(FDSPDepartmentBeforeGetRecordsCommand);
  inherited;
end;


constructor TDMDataSet1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMDataSet1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMDataSet1Client.Destroy;
begin
  inherited;
end;


constructor TDMDataSet2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMDataSet2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMDataSet2Client.Destroy;
begin
  inherited;
end;


constructor TDMDataSet3Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMDataSet3Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMDataSet3Client.Destroy;
begin
  inherited;
end;

function TDMDataSet5Client.GetRegion: TDBXReader;
begin
  if FGetRegionCommand = nil then
  begin
    FGetRegionCommand := FDBXConnection.CreateCommand;
    FGetRegionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetRegionCommand.Text := 'TDMDataSet5.GetRegion';
    FGetRegionCommand.Prepare;
  end;
  FGetRegionCommand.ExecuteUpdate;
  Result := FGetRegionCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDMDataSet5Client.GetCountry: TDBXReader;
begin
  if FGetCountryCommand = nil then
  begin
    FGetCountryCommand := FDBXConnection.CreateCommand;
    FGetCountryCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCountryCommand.Text := 'TDMDataSet5.GetCountry';
    FGetCountryCommand.Prepare;
  end;
  FGetCountryCommand.ExecuteUpdate;
  Result := FGetCountryCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDMDataSet5Client.GetState: TDBXReader;
begin
  if FGetStateCommand = nil then
  begin
    FGetStateCommand := FDBXConnection.CreateCommand;
    FGetStateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetStateCommand.Text := 'TDMDataSet5.GetState';
    FGetStateCommand.Prepare;
  end;
  FGetStateCommand.ExecuteUpdate;
  Result := FGetStateCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDMDataSet5Client.GetCity: TDBXReader;
begin
  if FGetCityCommand = nil then
  begin
    FGetCityCommand := FDBXConnection.CreateCommand;
    FGetCityCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCityCommand.Text := 'TDMDataSet5.GetCity';
    FGetCityCommand.Prepare;
  end;
  FGetCityCommand.ExecuteUpdate;
  Result := FGetCityCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function TDMDataSet5Client.ListofClassRegion: TJSONArray;
begin
  if FListofClassRegionCommand = nil then
  begin
    FListofClassRegionCommand := FDBXConnection.CreateCommand;
    FListofClassRegionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofClassRegionCommand.Text := 'TDMDataSet5.ListofClassRegion';
    FListofClassRegionCommand.Prepare;
  end;
  FListofClassRegionCommand.ExecuteUpdate;
  Result := TJSONArray(FListofClassRegionCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDMDataSet5Client.ListofClassCountry: TJSONArray;
begin
  if FListofClassCountryCommand = nil then
  begin
    FListofClassCountryCommand := FDBXConnection.CreateCommand;
    FListofClassCountryCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofClassCountryCommand.Text := 'TDMDataSet5.ListofClassCountry';
    FListofClassCountryCommand.Prepare;
  end;
  FListofClassCountryCommand.ExecuteUpdate;
  Result := TJSONArray(FListofClassCountryCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDMDataSet5Client.ListofClassState: TJSONArray;
begin
  if FListofClassStateCommand = nil then
  begin
    FListofClassStateCommand := FDBXConnection.CreateCommand;
    FListofClassStateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofClassStateCommand.Text := 'TDMDataSet5.ListofClassState';
    FListofClassStateCommand.Prepare;
  end;
  FListofClassStateCommand.ExecuteUpdate;
  Result := TJSONArray(FListofClassStateCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDMDataSet5Client.ListofClassCity: TJSONArray;
begin
  if FListofClassCityCommand = nil then
  begin
    FListofClassCityCommand := FDBXConnection.CreateCommand;
    FListofClassCityCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofClassCityCommand.Text := 'TDMDataSet5.ListofClassCity';
    FListofClassCityCommand.Prepare;
  end;
  FListofClassCityCommand.ExecuteUpdate;
  Result := TJSONArray(FListofClassCityCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


constructor TDMDataSet5Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMDataSet5Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMDataSet5Client.Destroy;
begin
  FreeAndNil(FGetRegionCommand);
  FreeAndNil(FGetCountryCommand);
  FreeAndNil(FGetStateCommand);
  FreeAndNil(FGetCityCommand);
  FreeAndNil(FListofClassRegionCommand);
  FreeAndNil(FListofClassCountryCommand);
  FreeAndNil(FListofClassStateCommand);
  FreeAndNil(FListofClassCityCommand);
  inherited;
end;

function TDMDataSet6Client.GetDepartments: TDBXReader;
begin
  if FGetDepartmentsCommand = nil then
  begin
    FGetDepartmentsCommand := FDBXConnection.CreateCommand;
    FGetDepartmentsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDepartmentsCommand.Text := 'TDMDataSet6.GetDepartments';
    FGetDepartmentsCommand.Prepare;
  end;
  FGetDepartmentsCommand.ExecuteUpdate;
  Result := FGetDepartmentsCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;


constructor TDMDataSet6Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMDataSet6Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMDataSet6Client.Destroy;
begin
  FreeAndNil(FGetDepartmentsCommand);
  inherited;
end;

end.

