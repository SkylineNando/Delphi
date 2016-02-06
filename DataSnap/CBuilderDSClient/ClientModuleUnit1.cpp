//----------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include <stdio.h>
#include <memory>

#include "ClientModuleUnit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TClientModule1 *ClientModule1;
//---------------------------------------------------------------------------
__fastcall TClientModule1::TClientModule1(TComponent* Owner)
	: TDataModule(Owner)
{
	FInstanceOwner = true;
}

__fastcall TClientModule1::~TClientModule1()
{
	delete FUserClient;
	delete FEmployeeServerRDMClient;
	delete FDSServerMethodsClient;
	delete FDMMainServerModuleClient;
	delete FLookupServerRDMClient;
	delete FDepartmentClient;
	delete FDSServerBatchClient;
}

TUserClient* TClientModule1::GetUserClient(void)
{
	if (FUserClient == NULL)
	{
		SQLConnection1->Open();
		FUserClient = new TUserClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FUserClient;
};
TEmployeeServerRDMClient* TClientModule1::GetEmployeeServerRDMClient(void)
{
	if (FEmployeeServerRDMClient == NULL)
	{
		SQLConnection1->Open();
		FEmployeeServerRDMClient = new TEmployeeServerRDMClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FEmployeeServerRDMClient;
};
TDSServerMethodsClient* TClientModule1::GetDSServerMethodsClient(void)
{
	if (FDSServerMethodsClient == NULL)
	{
		SQLConnection1->Open();
		FDSServerMethodsClient = new TDSServerMethodsClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FDSServerMethodsClient;
};
TDMMainServerModuleClient* TClientModule1::GetDMMainServerModuleClient(void)
{
	if (FDMMainServerModuleClient == NULL)
	{
		SQLConnection1->Open();
		FDMMainServerModuleClient = new TDMMainServerModuleClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FDMMainServerModuleClient;
};
TLookupServerRDMClient* TClientModule1::GetLookupServerRDMClient(void)
{
	if (FLookupServerRDMClient == NULL)
	{
		SQLConnection1->Open();
		FLookupServerRDMClient = new TLookupServerRDMClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FLookupServerRDMClient;
};
TDepartmentClient* TClientModule1::GetDepartmentClient(void)
{
	if (FDepartmentClient == NULL)
	{
		SQLConnection1->Open();
		FDepartmentClient = new TDepartmentClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FDepartmentClient;
};
TDSServerBatchClient* TClientModule1::GetDSServerBatchClient(void)
{
	if (FDSServerBatchClient == NULL)
	{
		SQLConnection1->Open();
		FDSServerBatchClient = new TDSServerBatchClient(SQLConnection1->DBXConnection, FInstanceOwner);
	}
	return FDSServerBatchClient;
};

