#ifndef ClientClassesUnit1H
#define ClientClassesUnit1H

#include "DBXCommon.hpp"
#include "Classes.hpp"
#include "SysUtils.hpp"
#include "DB.hpp"
#include "SqlExpr.hpp"
#include "DBXDBReaders.hpp"

  class TUserClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FAddUserCommand;
    TDBXCommand *FIsValidUserCommand;
    TDBXCommand *FDisableUserCommand;
    TDBXCommand *FEnableUserCommand;
  public:
    __fastcall TUserClient::TUserClient(TDBXConnection *ADBXConnection);
    __fastcall TUserClient::TUserClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TUserClient::~TUserClient();
    void __fastcall AddUser(System::UnicodeString FirstLastName, System::UnicodeString Login, System::UnicodeString Password);
    bool __fastcall IsValidUser(System::UnicodeString Login, System::UnicodeString Password);
    void __fastcall DisableUser(System::UnicodeString Login);
    void __fastcall EnableUser(System::UnicodeString Login);
  };

  class TEmployeeServerRDMClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
  public:
    __fastcall TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection);
    __fastcall TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TEmployeeServerRDMClient::~TEmployeeServerRDMClient();
  };

  class TDSServerMethodsClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FGetServerDateTimeCommand;
    TDBXCommand *FExecuteJobCommand;
    TDBXCommand *FMVPCustomerCommand;
    TDBXCommand *FListofCustomerCommand;
    TDBXCommand *FListofDifferentTypesCommand;
  public:
    __fastcall TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection);
    __fastcall TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDSServerMethodsClient::~TDSServerMethodsClient();
    System::TDateTime __fastcall GetServerDateTime();
    void __fastcall ExecuteJob(int JobId);
    TJSONValue* __fastcall MVPCustomer();
    TJSONArray* __fastcall ListofCustomer();
    TJSONArray* __fastcall ListofDifferentTypes();
  };

  class TDMMainServerModuleClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FIpAddressCommand;
    TDBXCommand *FServerComputerNameCommand;
  public:
    __fastcall TDMMainServerModuleClient::TDMMainServerModuleClient(TDBXConnection *ADBXConnection);
    __fastcall TDMMainServerModuleClient::TDMMainServerModuleClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMMainServerModuleClient::~TDMMainServerModuleClient();
    System::UnicodeString __fastcall IpAddress();
    System::UnicodeString __fastcall ServerComputerName();
  };

  class TLookupServerRDMClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
  public:
    __fastcall TLookupServerRDMClient::TLookupServerRDMClient(TDBXConnection *ADBXConnection);
    __fastcall TLookupServerRDMClient::TLookupServerRDMClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TLookupServerRDMClient::~TLookupServerRDMClient();
  };

  class TDepartmentClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FDepartmentDefaultCommand;
    TDBXCommand *FDepartmentOrderByIDCommand;
    TDBXCommand *FDepartmentOrderByNameCommand;
    TDBXCommand *FOrderByFieldCommand;
    TDBXCommand *FGetDepartmentsOrderByCommand;
    TDBXCommand *FGetDepartmentsCommand;
    TDBXCommand *FInsertCommand;
    TDBXCommand *FInsertAsDBXReaderCommand;
  public:
    __fastcall TDepartmentClient::TDepartmentClient(TDBXConnection *ADBXConnection);
    __fastcall TDepartmentClient::TDepartmentClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDepartmentClient::~TDepartmentClient();
    void __fastcall DepartmentDefault();
    void __fastcall DepartmentOrderByID();
    void __fastcall DepartmentOrderByName();
    System::UnicodeString __fastcall OrderByField();
    TDBXReader* __fastcall GetDepartmentsOrderBy();
    TDBXReader* __fastcall GetDepartments();
    bool __fastcall Insert(TParams* sParams);
    bool __fastcall InsertAsDBXReader(TDBXReader* sDbxParams);
  };

  class TDSServerBatchClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FStartBackupCommand;
  public:
    __fastcall TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection);
    __fastcall TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDSServerBatchClient::~TDSServerBatchClient();
    void __fastcall StartBackup(TDBXCallback* sMessage, System::UnicodeString sBackupFileName);
  };

#endif
