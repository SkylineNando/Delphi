#ifndef DSCClientProxyH
#define DSCClientProxyH

#include "DBXCommon.hpp"
#include "Classes.hpp"
#include "SysUtils.hpp"
#include "Data.DB.hpp"
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
    TDBXCommand *FDSServerModuleCreateCommand;
  public:
    __fastcall TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection);
    __fastcall TEmployeeServerRDMClient::TEmployeeServerRDMClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TEmployeeServerRDMClient::~TEmployeeServerRDMClient();
    void __fastcall DSServerModuleCreate(TJSONObject* Sender);
  };

  class TDSServerMethodsClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FDSServerModuleCreateCommand;
    TDBXCommand *FGetServerDateTimeCommand;
    TDBXCommand *FExecuteJobCommand;
    TDBXCommand *FMVPCustomerCommand;
    TDBXCommand *FCustomerCommand;
    TDBXCommand *FListofCustomerCommand;
    TDBXCommand *FListofDifferentTypesCommand;
  public:
    __fastcall TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection);
    __fastcall TDSServerMethodsClient::TDSServerMethodsClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDSServerMethodsClient::~TDSServerMethodsClient();
    void __fastcall DSServerModuleCreate(TJSONObject* Sender);
    System::TDateTime __fastcall GetServerDateTime();
    void __fastcall ExecuteJob(int JobId);
    TJSONValue* __fastcall MVPCustomer();
    TJSONObject* __fastcall Customer();
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
    TDBXCommand *FSendValueCommand;
    TDBXCommand *FGetValueCommand;
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
    void __fastcall SendValue(System::UnicodeString i);
    System::UnicodeString __fastcall GetValue();
  };

  class TDSServerBatchClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FStartBackupCommand;
    TDBXCommand *FOutProcessImageCommand;
    TDBXCommand *FRetProcessImageCommand;
  public:
    __fastcall TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection);
    __fastcall TDSServerBatchClient::TDSServerBatchClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDSServerBatchClient::~TDSServerBatchClient();
    void __fastcall StartBackup(TDBXCallback* sMessage, System::UnicodeString sBackupFileName);
    void __fastcall OutProcessImage(TDBXCallback* Args, TStream* LStream, TStream* OutStream);
    TStream* __fastcall RetProcessImage(TDBXCallback* Args, TStream* LStream);
  };

  class TDSMasterDetailClient : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FDSPDepartmentBeforeGetRecordsCommand;
  public:
    __fastcall TDSMasterDetailClient::TDSMasterDetailClient(TDBXConnection *ADBXConnection);
    __fastcall TDSMasterDetailClient::TDSMasterDetailClient(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDSMasterDetailClient::~TDSMasterDetailClient();
    void __fastcall DSPDepartmentBeforeGetRecords(TJSONObject* Sender, System::OleVariant  &OwnerData);
  };

  class TDMDataSet1Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
  public:
    __fastcall TDMDataSet1Client::TDMDataSet1Client(TDBXConnection *ADBXConnection);
    __fastcall TDMDataSet1Client::TDMDataSet1Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMDataSet1Client::~TDMDataSet1Client();
  };

  class TDMDataSet2Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
  public:
    __fastcall TDMDataSet2Client::TDMDataSet2Client(TDBXConnection *ADBXConnection);
    __fastcall TDMDataSet2Client::TDMDataSet2Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMDataSet2Client::~TDMDataSet2Client();
  };

  class TDMDataSet3Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
  public:
    __fastcall TDMDataSet3Client::TDMDataSet3Client(TDBXConnection *ADBXConnection);
    __fastcall TDMDataSet3Client::TDMDataSet3Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMDataSet3Client::~TDMDataSet3Client();
  };

  class TDMDataSet5Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FGetRegionCommand;
    TDBXCommand *FGetCountryCommand;
    TDBXCommand *FGetStateCommand;
    TDBXCommand *FGetCityCommand;
    TDBXCommand *FListofClassRegionCommand;
    TDBXCommand *FListofClassCountryCommand;
    TDBXCommand *FListofClassStateCommand;
    TDBXCommand *FListofClassCityCommand;
  public:
    __fastcall TDMDataSet5Client::TDMDataSet5Client(TDBXConnection *ADBXConnection);
    __fastcall TDMDataSet5Client::TDMDataSet5Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMDataSet5Client::~TDMDataSet5Client();
    TDBXReader* __fastcall GetRegion();
    TDBXReader* __fastcall GetCountry();
    TDBXReader* __fastcall GetState();
    TDBXReader* __fastcall GetCity();
    TJSONArray* __fastcall ListofClassRegion();
    TJSONArray* __fastcall ListofClassCountry();
    TJSONArray* __fastcall ListofClassState();
    TJSONArray* __fastcall ListofClassCity();
  };

  class TDMDataSet6Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FGetDepartmentsCommand;
  public:
    __fastcall TDMDataSet6Client::TDMDataSet6Client(TDBXConnection *ADBXConnection);
    __fastcall TDMDataSet6Client::TDMDataSet6Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall TDMDataSet6Client::~TDMDataSet6Client();
    TDBXReader* __fastcall GetDepartments();
  };

#endif
