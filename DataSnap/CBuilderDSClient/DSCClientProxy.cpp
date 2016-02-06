// 
// Created by the DataSnap proxy generator.
// 2/7/2011 12:19:28 PM
// 

#include "DSCClientProxy.h"

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

void __fastcall TEmployeeServerRDMClient::DSServerModuleCreate(TJSONObject* Sender)
{
  if (FDSServerModuleCreateCommand == NULL)
  {
    FDSServerModuleCreateCommand = FDBXConnection->CreateCommand();
    FDSServerModuleCreateCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDSServerModuleCreateCommand->Text = "TEmployeeServerRDM.DSServerModuleCreate";
    FDSServerModuleCreateCommand->Prepare();
}
FDSServerModuleCreateCommand->Parameters->Parameter[0]->Value->SetJSONValue(Sender, FInstanceOwner);
FDSServerModuleCreateCommand->ExecuteUpdate();
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
  delete FDSServerModuleCreateCommand;
}

void __fastcall TDSServerMethodsClient::DSServerModuleCreate(TJSONObject* Sender)
{
  if (FDSServerModuleCreateCommand == NULL)
  {
    FDSServerModuleCreateCommand = FDBXConnection->CreateCommand();
    FDSServerModuleCreateCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDSServerModuleCreateCommand->Text = "TDSServerMethods.DSServerModuleCreate";
    FDSServerModuleCreateCommand->Prepare();
}
FDSServerModuleCreateCommand->Parameters->Parameter[0]->Value->SetJSONValue(Sender, FInstanceOwner);
FDSServerModuleCreateCommand->ExecuteUpdate();
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
TJSONValue* result = FMVPCustomerCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONObject* __fastcall TDSServerMethodsClient::Customer()
{
  if (FCustomerCommand == NULL)
  {
    FCustomerCommand = FDBXConnection->CreateCommand();
    FCustomerCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FCustomerCommand->Text = "TDSServerMethods.Customer";
    FCustomerCommand->Prepare();
}
FCustomerCommand->ExecuteUpdate();
TJSONObject* result = (TJSONObject*)FCustomerCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
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
  delete FDSServerModuleCreateCommand;
  delete FGetServerDateTimeCommand;
  delete FExecuteJobCommand;
  delete FMVPCustomerCommand;
  delete FCustomerCommand;
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

void __fastcall TDepartmentClient::SendValue(System::UnicodeString i)
{
  if (FSendValueCommand == NULL)
  {
    FSendValueCommand = FDBXConnection->CreateCommand();
    FSendValueCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FSendValueCommand->Text = "TDepartment.SendValue";
    FSendValueCommand->Prepare();
}
FSendValueCommand->Parameters->Parameter[0]->Value->SetWideString(i);
FSendValueCommand->ExecuteUpdate();
}

System::UnicodeString __fastcall TDepartmentClient::GetValue()
{
  if (FGetValueCommand == NULL)
  {
    FGetValueCommand = FDBXConnection->CreateCommand();
    FGetValueCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetValueCommand->Text = "TDepartment.GetValue";
    FGetValueCommand->Prepare();
}
FGetValueCommand->ExecuteUpdate();
System::UnicodeString result = FGetValueCommand->Parameters->Parameter[0]->Value->GetWideString();
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
  delete FSendValueCommand;
  delete FGetValueCommand;
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

void __fastcall TDSServerBatchClient::OutProcessImage(TDBXCallback* Args, TStream* LStream, TStream* OutStream)
{
  if (FOutProcessImageCommand == NULL)
  {
    FOutProcessImageCommand = FDBXConnection->CreateCommand();
    FOutProcessImageCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FOutProcessImageCommand->Text = "TDSServerBatch.OutProcessImage";
    FOutProcessImageCommand->Prepare();
}
FOutProcessImageCommand->Parameters->Parameter[0]->Value->SetCallbackValue(Args);
FOutProcessImageCommand->Parameters->Parameter[1]->Value->SetStream(LStream, FInstanceOwner);
FOutProcessImageCommand->ExecuteUpdate();
OutStream = FOutProcessImageCommand->Parameters->Parameter[2]->Value->GetStream(FInstanceOwner);
}

TStream* __fastcall TDSServerBatchClient::RetProcessImage(TDBXCallback* Args, TStream* LStream)
{
  if (FRetProcessImageCommand == NULL)
  {
    FRetProcessImageCommand = FDBXConnection->CreateCommand();
    FRetProcessImageCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FRetProcessImageCommand->Text = "TDSServerBatch.RetProcessImage";
    FRetProcessImageCommand->Prepare();
}
FRetProcessImageCommand->Parameters->Parameter[0]->Value->SetCallbackValue(Args);
FRetProcessImageCommand->Parameters->Parameter[1]->Value->SetStream(LStream, FInstanceOwner);
FRetProcessImageCommand->ExecuteUpdate();
TStream* result = FRetProcessImageCommand->Parameters->Parameter[2]->Value->GetStream(FInstanceOwner);
return result;
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
  delete FOutProcessImageCommand;
  delete FRetProcessImageCommand;
}

void __fastcall TDSMasterDetailClient::DSPDepartmentBeforeGetRecords(TJSONObject* Sender, System::OleVariant  &OwnerData)
{
  if (FDSPDepartmentBeforeGetRecordsCommand == NULL)
  {
    FDSPDepartmentBeforeGetRecordsCommand = FDBXConnection->CreateCommand();
    FDSPDepartmentBeforeGetRecordsCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FDSPDepartmentBeforeGetRecordsCommand->Text = "TDSMasterDetail.DSPDepartmentBeforeGetRecords";
    FDSPDepartmentBeforeGetRecordsCommand->Prepare();
}
FDSPDepartmentBeforeGetRecordsCommand->Parameters->Parameter[0]->Value->SetJSONValue(Sender, FInstanceOwner);
FDSPDepartmentBeforeGetRecordsCommand->Parameters->Parameter[1]->Value->AsVariant = OwnerData;
FDSPDepartmentBeforeGetRecordsCommand->ExecuteUpdate();
OwnerData = FDSPDepartmentBeforeGetRecordsCommand->Parameters->Parameter[1]->Value->AsVariant;
}


__fastcall  TDSMasterDetailClient::TDSMasterDetailClient(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDSMasterDetailClient::TDSMasterDetailClient(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDSMasterDetailClient::~TDSMasterDetailClient()
{
  delete FDSPDepartmentBeforeGetRecordsCommand;
}


__fastcall  TDMDataSet1Client::TDMDataSet1Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMDataSet1Client::TDMDataSet1Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMDataSet1Client::~TDMDataSet1Client()
{
}


__fastcall  TDMDataSet2Client::TDMDataSet2Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMDataSet2Client::TDMDataSet2Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMDataSet2Client::~TDMDataSet2Client()
{
}


__fastcall  TDMDataSet3Client::TDMDataSet3Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMDataSet3Client::TDMDataSet3Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMDataSet3Client::~TDMDataSet3Client()
{
}

TDBXReader* __fastcall TDMDataSet5Client::GetRegion()
{
  if (FGetRegionCommand == NULL)
  {
    FGetRegionCommand = FDBXConnection->CreateCommand();
    FGetRegionCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetRegionCommand->Text = "TDMDataSet5.GetRegion";
    FGetRegionCommand->Prepare();
}
FGetRegionCommand->ExecuteUpdate();
TDBXReader* result = FGetRegionCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

TDBXReader* __fastcall TDMDataSet5Client::GetCountry()
{
  if (FGetCountryCommand == NULL)
  {
    FGetCountryCommand = FDBXConnection->CreateCommand();
    FGetCountryCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetCountryCommand->Text = "TDMDataSet5.GetCountry";
    FGetCountryCommand->Prepare();
}
FGetCountryCommand->ExecuteUpdate();
TDBXReader* result = FGetCountryCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

TDBXReader* __fastcall TDMDataSet5Client::GetState()
{
  if (FGetStateCommand == NULL)
  {
    FGetStateCommand = FDBXConnection->CreateCommand();
    FGetStateCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetStateCommand->Text = "TDMDataSet5.GetState";
    FGetStateCommand->Prepare();
}
FGetStateCommand->ExecuteUpdate();
TDBXReader* result = FGetStateCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

TDBXReader* __fastcall TDMDataSet5Client::GetCity()
{
  if (FGetCityCommand == NULL)
  {
    FGetCityCommand = FDBXConnection->CreateCommand();
    FGetCityCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetCityCommand->Text = "TDMDataSet5.GetCity";
    FGetCityCommand->Prepare();
}
FGetCityCommand->ExecuteUpdate();
TDBXReader* result = FGetCityCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDMDataSet5Client::ListofClassRegion()
{
  if (FListofClassRegionCommand == NULL)
  {
    FListofClassRegionCommand = FDBXConnection->CreateCommand();
    FListofClassRegionCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofClassRegionCommand->Text = "TDMDataSet5.ListofClassRegion";
    FListofClassRegionCommand->Prepare();
}
FListofClassRegionCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofClassRegionCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDMDataSet5Client::ListofClassCountry()
{
  if (FListofClassCountryCommand == NULL)
  {
    FListofClassCountryCommand = FDBXConnection->CreateCommand();
    FListofClassCountryCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofClassCountryCommand->Text = "TDMDataSet5.ListofClassCountry";
    FListofClassCountryCommand->Prepare();
}
FListofClassCountryCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofClassCountryCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDMDataSet5Client::ListofClassState()
{
  if (FListofClassStateCommand == NULL)
  {
    FListofClassStateCommand = FDBXConnection->CreateCommand();
    FListofClassStateCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofClassStateCommand->Text = "TDMDataSet5.ListofClassState";
    FListofClassStateCommand->Prepare();
}
FListofClassStateCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofClassStateCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}

TJSONArray* __fastcall TDMDataSet5Client::ListofClassCity()
{
  if (FListofClassCityCommand == NULL)
  {
    FListofClassCityCommand = FDBXConnection->CreateCommand();
    FListofClassCityCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FListofClassCityCommand->Text = "TDMDataSet5.ListofClassCity";
    FListofClassCityCommand->Prepare();
}
FListofClassCityCommand->ExecuteUpdate();
TJSONArray* result = (TJSONArray*)FListofClassCityCommand->Parameters->Parameter[0]->Value->GetJSONValue(FInstanceOwner);
return result;
}


__fastcall  TDMDataSet5Client::TDMDataSet5Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMDataSet5Client::TDMDataSet5Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMDataSet5Client::~TDMDataSet5Client()
{
  delete FGetRegionCommand;
  delete FGetCountryCommand;
  delete FGetStateCommand;
  delete FGetCityCommand;
  delete FListofClassRegionCommand;
  delete FListofClassCountryCommand;
  delete FListofClassStateCommand;
  delete FListofClassCityCommand;
}

TDBXReader* __fastcall TDMDataSet6Client::GetDepartments()
{
  if (FGetDepartmentsCommand == NULL)
  {
    FGetDepartmentsCommand = FDBXConnection->CreateCommand();
    FGetDepartmentsCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FGetDepartmentsCommand->Text = "TDMDataSet6.GetDepartments";
    FGetDepartmentsCommand->Prepare();
}
FGetDepartmentsCommand->ExecuteUpdate();
TDBXReader* result = FGetDepartmentsCommand->Parameters->Parameter[0]->Value->GetDBXReader(FInstanceOwner);
return result;
}


__fastcall  TDMDataSet6Client::TDMDataSet6Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = True;
}


__fastcall  TDMDataSet6Client::TDMDataSet6Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
FDBXConnection = ADBXConnection;
FInstanceOwner = AInstanceOwner;
}


__fastcall  TDMDataSet6Client::~TDMDataSet6Client()
{
  delete FGetDepartmentsCommand;
}

