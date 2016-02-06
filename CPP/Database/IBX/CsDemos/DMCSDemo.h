//---------------------------------------------------------------------------

#ifndef DMCSDemoH
#define DMCSDemoH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBStoredProc.hpp>
//---------------------------------------------------------------------------
class TDmEmployee : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *SalesSource;
	TDataSource *CustomerSource;
	TDataSource *EmployeeSource;
	TDataSource *SalaryHistorySource;
	TIBDatabase *EmployeeDatabase;
	TIBTransaction *IBTransaction1;
	TIBStoredProc *ShipOrderProc;
	TIBStoredProc *DeleteEmployeeProc;
	TIBDataSet *EmployeeLookUp;
	TSmallintField *EmployeeLookUpEMP_NO;
	TIBStringField *EmployeeLookUpFIRST_NAME;
	TIBStringField *EmployeeLookUpLAST_NAME;
	TIBStringField *EmployeeLookUpPHONE_EXT;
	TDateTimeField *EmployeeLookUpHIRE_DATE;
	TIBStringField *EmployeeLookUpDEPT_NO;
	TIBStringField *EmployeeLookUpJOB_CODE;
	TSmallintField *EmployeeLookUpJOB_GRADE;
	TIBStringField *EmployeeLookUpJOB_COUNTRY;
	TIBBCDField *EmployeeLookUpSALARY;
	TIBStringField *EmployeeLookUpFULL_NAME;
	TIBDataSet *SalesTable;
	TIBDataSet *EmployeeTable;
	TIBDataSet *CustomerTable;
	TIBDataSet *SalaryHistoryTable;
private:	// User declarations
public:		// User declarations
	__fastcall TDmEmployee(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDmEmployee *DmEmployee;
//---------------------------------------------------------------------------
#endif
