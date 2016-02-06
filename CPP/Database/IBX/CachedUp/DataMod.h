//---------------------------------------------------------------------------

#ifndef DataModH
#define DataModH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include <IBTable.hpp>
#include <IBUpdateSQL.hpp>
//---------------------------------------------------------------------------
class TCachedData : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *CacheDS;
	TIBDatabase *IBDatabase1;
	TIBQuery *IBCacheQuery;
	TIBStringField *IBCacheQueryPROJ_ID;
	TIBStringField *IBCacheQueryPROJ_NAME;
	TStringField *IBCacheQueryUpdateStatus;
	TIBUpdateSQL *IBUpdateSQL;
	TIBTransaction *IBTransaction1;
	TIBDataSet *IBCachedDataSet;
	TIBStringField *IBCachedDataSetPROJ_ID;
	TIBStringField *IBCachedDataSetPROJ_NAME;
	TStringField *IBCachedDataSetUpdateStatus;
	TIBTable *IBCachedTable;
	TIBStringField *IBCachedTablePROJ_ID;
	TIBStringField *IBCachedTablePROJ_NAME;
	TStringField *IBCachedTableUpdateStatus;
	void __fastcall IBCacheQueryCalcFields(TDataSet *DataSet);
	void __fastcall IBCachedDataSetCalcFields(TDataSet *DataSet);
	void __fastcall IBCachedTableCalcFields(TDataSet *DataSet);
	void __fastcall IBCacheQueryUpdateError(TDataSet *DataSet, EDatabaseError *E, TUpdateKind UpdateKind,
          TIBUpdateAction &UpdateAction);
private:	// User declarations
public:		// User declarations
	__fastcall TCachedData(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCachedData *CachedData;
//---------------------------------------------------------------------------
#endif
