// 
// Created by the DataSnap proxy generator.
// 8/16/2010 2:15:18 PM
// 

#include "ClientClassesUnit1.h"

void __fastcall TUserClient::AddUser(System::UnicodeString FirstLastName, System::UnicodeString Login, System::UnicodeString Password)
{
  if (FAddUserCommand == NULL)
  {
    FAddUserCommand = FDBXConnection->CreateCommand();
    FAddUserCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FAddUserCommand->Text = "TUser.AddUser";
    FAddUserCommand->Prepare();
  }
  FAddUserCommand->Parameters->Parameter[0]->Value->SetWideString(FirstLastName);
  FAddUserCommand->Parameters->Parameter[1]->Value->SetWideString(Login);
  FAddUserCommand->Parameters->Parameter[2]->Value->SetWideString(Password);
  FAddUserCommand->ExecuteUpdate();
}

bool __fastcall TUserClient::IsValidUser(System::UnicodeString Login, System::UnicodeString Password)
{
  if (FIsValidUserCommand == NULL)
  {
    FIsValidUserCommand = FDBXConnection->CreateCommand();
    FIsValidUserCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FIsValidUserCommand->Text = "TUser.IsValidUser";
    FIsValidUserCommand->Prepare();
  }
  FIsValidUserCommand->Parameters->Parameter[0]->Value->SetWideString(Login);
  FIsValidUserCommand->Parameters->Parameter[1]->Value->SetWideString(Password);
  FIsValidUserCommand->ExecuteUpdate();
  bool result = FIsValidUserCommand->Parameters->Parameter[2]->Value->GetBoolean();
  return result;
}

void __fastcall TUserClient::DisableUser(System::UnicodeString Login)
{
  if (FDisableUserCommand == NULL)
  {
    FDisableUserCommand = FDBXConnection->CreateCommand();
    FDisableUserCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDisableUserCommand->Text = "TUser.DisableUser";
    FDisableUserCommand->Prepare();
  }
  FDisableUserCommand->Parameters->Parameter[0]->Value->SetWideString(Login);
  FDisableUserCommand->ExecuteUpdate();
}

void __fastcall TUserClient::EnableUser(System::UnicodeString Login)
{
  if (FEnableUserCommand == NULL)
  {
    FEnableUserCommand = FDBXConnection->CreateCommand();
    FEnableUserCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FEnableUserCommand->Text = "TUser.EnableUser";
    FEnableUserCommand->Prepare();
  }
  FEnableUserCommand->Parameters->Parameter[0]->Value->SetWideString(Login);
  FEnableUserCommand->ExecuteUpdate();
}


__fastcall  TUserClient::TUserClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
  FDBXConnection = ADBXConnection;
  FInstanceOwner = True;
}


__fastcall  TUserClient::TUserClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
  FDBXConnection = ADBXConnection;
  FInstanceOwner = AInstanceOwner;
}


__fastcall  TUserClient::~TUserClient()
{
  delete FAddUserCommand;
  delete FIsValidUserCommand;
  delete FDisableUserCommand;
  delete FEnableUserCommand;
}


__fastcall  TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TEmployeeServerRDMClient::~TEmployeeServerRDMClient()
{
}

System::TDateTime __fastcall TDSServerMethodsClient::GetServerDateTime()
{
  if (FGetServerDateTimeCommand == NULL)
  {
    FGetServerDateTimeCommand = FDBXConnection->CreateCommand();
    FGetServerDateTimeCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetServerDateTimeCommand->Text = "TDSServerMethods.GetServerDateTime";
    FGetServerDateTimeCommand->Prepare();
}
FGetServerDateTimeCommand->ExecuteUpdate();
System::TDateTime result = FGetServerDateTimeCommand->Parameters->Parameter[0]->Value->AsDateTime;
return result;
}

void __fastcall TDSServerMethodsClient::ExecuteJob(int JobId)
{
  if (FExecuteJobCommand == NULL)
  {
    FExecuteJobCommand = FDBXConnection->CreateCommand();
    FExecuteJobCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FExecuteJobCommand->Text = "TDSServerMethods.ExecuteJob";
    FExecuteJobCommand->Prepare();
}
FExecuteJobCommand->Parameters->Parameter[0]->Value->SetInt32(JobId);
FExecuteJobCommand->ExecuteUpdate();
}

TJSONValue* __fastcall TDSServerMethodsClient::MVPCustomer()
{
  if (FMVPCustomerCommand == NULL)
  {
    FMVPCustomerCommand = FDBXConnection->CreateCommand();
    FMVPCustomerCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FMVPCustomerCommand->Text = "TDSServerMethods.MVPCustomer";
    FMVPCustomerCommand->Prepare();
}
FMVPCustomerCommand->ExecuteUpdate();
TJSONValue* result = (TJSONValue*)FMVPCustomerCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDSServerMethodsClient::ListofCustomer()
{
  if (FListofCustomerCommand == NULL)
  {
    FListofCustomerCommand = FDBXConnection->CreateCommand();
    FListofCustomerCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofCustomerCommand->Text = "TDSServerMethods.ListofCustomer";
    FListofCustomerCommand->Prepare();
}
FListofCustomerCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofCustomerCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDSServerMethodsClient::ListofDifferentTypes()
{
  if (FListofDifferentTypesCommand == NULL)
  {
    FListofDifferentTypesCommand = FDBXConnection->CreateCommand();
    FListofDifferentTypesCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofDifferentTypesCommand->Text = "TDSServerMethods.ListofDifferentTypes";
    FListofDifferentTypesCommand->Prepare();
}
FListofDifferentTypesCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofDifferentTypesCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}


__fastcall  TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDSServerMethodsClient::~TDSServerMethodsClient()
{
  delete FGetServerDateTimeCommand;
  delete FExecuteJobCommand;
  delete FMVPCustomerCommand;
  delete FListofCustomerCommand;
  delete FListofDifferentTypesCommand;
}

System::UnicodeString __fastcall TDMMainServerModuleClient::IpAddress()
{
  if (FIpAddressCommand == NULL)
  {
    FIpAddressCommand = FDBXConnection->CreateCommand();
    FIpAddressCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FIpAddressCommand->Text = "TDMMainServerModule.IpAddress";
    FIpAddressCommand->Prepare();
}
FIpAddressCommand->ExecuteUpdate();
System::UnicodeString result = FIpAddressCommand->Parameters->Parameter[0]->Value->GetWideString();
return result;
}

System::UnicodeString __fastcall TDMMainServerModuleClient::ServerComputerName()
{
  if (FServerComputerNameCommand == NULL)
  {
    FServerComputerNameCommand = FDBXConnection->CreateCommand();
    FServerComputerNameCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FServerComputerNameCommand->Text = "TDMMainServerModule.ServerComputerName";
    FServerComputerNameCommand->Prepare();
}
FServerComputerNameCommand->ExecuteUpdate();
System::UnicodeString result = FServerComputerNameCommand->Parameters->Parameter[0]->Value->GetWideString();
return result;
}


__fastcall  TDMMainServerModuleClient::TDMMainServerModuleClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMMainServerModuleClient::TDMMainServerModuleClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMMainServerModuleClient::~TDMMainServerModuleClient()
{
  delete FIpAddressCommand;
  delete FServerComputerNameCommand;
}


__fastcall  TLookupServerRDMClient::TLookupServerRDMClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TLookupServerRDMClient::TLookupServerRDMClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TLookupServerRDMClient::~TLookupServerRDMClient()
{
}

void __fastcall TDepartmentClient::DepartmentDefault()
{
  if (FDepartmentDefaultCommand == NULL)
  {
    FDepartmentDefaultCommand = FDBXConnection->CreateCommand();
    FDepartmentDefaultCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDepartmentDefaultCommand->Text = "TDepartment.DepartmentDefault";
    FDepartmentDefaultCommand->Prepare();
}
FDepartmentDefaultCommand->ExecuteUpdate();
}

void __fastcall TDepartmentClient::DepartmentOrderByID()
{
  if (FDepartmentOrderByIDCommand == NULL)
  {
    FDepartmentOrderByIDCommand = FDBXConnection->CreateCommand();
    FDepartmentOrderByIDCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDepartmentOrderByIDCommand->Text = "TDepartment.DepartmentOrderByID";
    FDepartmentOrderByIDCommand->Prepare();
}
FDepartmentOrderByIDCommand->ExecuteUpdate();
}

void __fastcall TDepartmentClient::DepartmentOrderByName()
{
  if (FDepartmentOrderByNameCommand == NULL)
  {
    FDepartmentOrderByNameCommand = FDBXConnection->CreateCommand();
    FDepartmentOrderByNameCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDepartmentOrderByNameCommand->Text = "TDepartment.DepartmentOrderByName";
    FDepartmentOrderByNameCommand->Prepare();
}
FDepartmentOrderByNameCommand->ExecuteUpdate();
}

System::UnicodeString __fastcall TDepartmentClient::OrderByField()
{
  if (FOrderByFieldCommand == NULL)
  {
    FOrderByFieldCommand = FDBXConnection->CreateCommand();
    FOrderByFieldCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FOrderByFieldCommand->Text = "TDepartment.OrderByField";
    FOrderByFieldCommand->Prepare();
}
FOrderByFieldCommand->ExecuteUpdate();
System::UnicodeString result = FOrderByFieldCommand->Parameters->Parameter[0]->Value->GetWideString();
return result;
}

TDBXReader* __fastcall TDepartmentClient::GetDepartmentsOrderBy()
{
  if (FGetDepartmentsOrderByCommand == NULL)
  {
    FGetDepartmentsOrderByCommand = FDBXConnection->CreateCommand();
    FGetDepartmentsOrderByCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetDepartmentsOrderByCommand->Text = "TDepartment.GetDepartmentsOrderBy";
    FGetDepartmentsOrderByCommand->Prepare();
}
FGetDepartmentsOrderByCommand->ExecuteUpdate();
TDBXReader* result = FGetDepartmentsOrderByCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

TDBXReader* __fastcall TDepartmentClient::GetDepartments()
{
  if (FGetDepartmentsCommand == NULL)
  {
    FGetDepartmentsCommand = FDBXConnection->CreateCommand();
    FGetDepartmentsCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetDepartmentsCommand->Text = "TDepartment.GetDepartments";
    FGetDepartmentsCommand->Prepare();
}
FGetDepartmentsCommand->ExecuteUpdate();
TDBXReader* result = FGetDepartmentsCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

bool __fastcall TDepartmentClient::Insert(TParams* sParams)
{
  if (FInsertCommand == NULL)
  {
    FInsertCommand = FDBXConnection->CreateCommand();
    FInsertCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FInsertCommand->Text = "TDepartment.Insert";
    FInsertCommand->Prepare();
}
FInsertCommand->Parameters->Parameter[0]->Value->SetDBXReader(new TDBXParamsReader(sParams, FInstanceOwner), True);
FInsertCommand->ExecuteUpdate();
bool result = FInsertCommand->Parameters->Parameter[1]->Value->GetBoolean();
return result;
}

bool __fastcall TDepartmentClient::InsertAsDBXReader(TDBXReader* sDbxParams)
{
  if (FInsertAsDBXReaderCommand == NULL)
  {
    FInsertAsDBXReaderCommand = FDBXConnection->CreateCommand();
    FInsertAsDBXReaderCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FInsertAsDBXReaderCommand->Text = "TDepartment.InsertAsDBXReader";
    FInsertAsDBXReaderCommand->Prepare();
}
FInsertAsDBXReaderCommand->Parameters->Parameter[0]->Value->SetDBXReader(sDbxParams, FInstanceOwner);
FInsertAsDBXReaderCommand->ExecuteUpdate();
bool result = FInsertAsDBXReaderCommand->Parameters->Parameter[1]->Value->GetBoolean();
return result;
}


__fastcall  TDepartmentClient::TDepartmentClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDepartmentClient::TDepartmentClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDepartmentClient::~TDepartmentClient()
{
  delete FDepartmentDefaultCommand;
  delete FDepartmentOrderByIDCommand;
  delete FDepartmentOrderByNameCommand;
  delete FOrderByFieldCommand;
  delete FGetDepartmentsOrderByCommand;
  delete FGetDepartmentsCommand;
  delete FInsertCommand;
  delete FInsertAsDBXReaderCommand;
}

void __fastcall TDSServerBatchClient::StartBackup(TDBXCallback* sMessage, System::UnicodeString sBackupFileName)
{
  if (FStartBackupCommand == NULL)
  {
    FStartBackupCommand = FDBXConnection->CreateCommand();
    FStartBackupCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FStartBackupCommand->Text = "TDSServerBatch.StartBackup";
    FStartBackupCommand->Prepare();
}
FStartBackupCommand->Parameters->Parameter[0]->Value->SetCallbackValue(sMessage);
FStartBackupCommand->Parameters->Parameter[1]->Value->SetWideString(sBackupFileName);
FStartBackupCommand->ExecuteUpdate();
}


__fastcall  TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDSServerBatchClient::~TDSServerBatchClient()
{
  delete FStartBackupCommand;
}

