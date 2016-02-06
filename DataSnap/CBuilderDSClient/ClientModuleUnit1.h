//----------------------------------------------------------------------------

#ifndef ClientModuleUnit1H
#define ClientModuleUnit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include "ClientClassesUnit1.h"
#include <DB.hpp>
#include <DBXCommon.hpp>
#include <DBXDataSnap.hpp>
#include <SqlExpr.hpp>
//----------------------------------------------------------------------------
class TClientModule1 : public TDataModule
{
__published:	// IDE-managed Components
	TSQLConnection *SQLConnection1;
private:	// User declarations
	bool FInstanceOwner;
	TUserClient* FUserClient;
	TEmployeeServerRDMClient* FEmployeeServerRDMClient;
	TDSServerMethodsClient* FDSServerMethodsClient;
	TDMMainServerModuleClient* FDMMainServerModuleClient;
	TLookupServerRDMClient* FLookupServerRDMClient;
	TDepartmentClient* FDepartmentClient;
	TDSServerBatchClient* FDSServerBatchClient;
	TUserClient* GetUserClient(void);
	TEmployeeServerRDMClient* GetEmployeeServerRDMClient(void);
	TDSServerMethodsClient* GetDSServerMethodsClient(void);
	TDMMainServerModuleClient* GetDMMainServerModuleClient(void);
	TLookupServerRDMClient* GetLookupServerRDMClient(void);
	TDepartmentClient* GetDepartmentClient(void);
	TDSServerBatchClient* GetDSServerBatchClient(void);
public:		// User declarations
	__fastcall TClientModule1(TComponent* Owner);
	__fastcall ~TClientModule1();
	__property bool InstanceOwner = {read=FInstanceOwner, write=FInstanceOwner};
	__property TUserClient* UserClient = {read=GetUserClient, write=FUserClient};
	__property TEmployeeServerRDMClient* EmployeeServerRDMClient = {read=GetEmployeeServerRDMClient, write=FEmployeeServerRDMClient};
	__property TDSServerMethodsClient* DSServerMethodsClient = {read=GetDSServerMethodsClient, write=FDSServerMethodsClient};
	__property TDMMainServerModuleClient* DMMainServerModuleClient = {read=GetDMMainServerModuleClient, write=FDMMainServerModuleClient};
	__property TLookupServerRDMClient* LookupServerRDMClient = {read=GetLookupServerRDMClient, write=FLookupServerRDMClient};
	__property TDepartmentClient* DepartmentClient = {read=GetDepartmentClient, write=FDepartmentClient};
	__property TDSServerBatchClient* DSServerBatchClient = {read=GetDSServerBatchClient, write=FDSServerBatchClient};
};
//---------------------------------------------------------------------------
extern PACKAGE TClientModule1 *ClientModule1;
//---------------------------------------------------------------------------
#endif
