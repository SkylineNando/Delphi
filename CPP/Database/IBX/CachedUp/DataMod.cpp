//---------------------------------------------------------------------------


#pragma hdrstop

#include "DataMod.h"
#include "Errform.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TCachedData *CachedData;

const  System::UnicodeString UpdateStatusStr[4] = {"Unmodified", "Modified","Inserted", "Deleted"};

//---------------------------------------------------------------------------
__fastcall TCachedData::TCachedData(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCachedData::IBCacheQueryCalcFields(TDataSet *DataSet)
{
  IBCacheQueryUpdateStatus->AsString = UpdateStatusStr[IBCacheQuery->UpdateStatus()];
}
//---------------------------------------------------------------------------

void __fastcall TCachedData::IBCachedDataSetCalcFields(TDataSet *DataSet)
{
  IBCachedDataSetUpdateStatus->AsString = UpdateStatusStr[IBCachedDataSet->UpdateStatus()];
}
//---------------------------------------------------------------------------

void __fastcall TCachedData::IBCachedTableCalcFields(TDataSet *DataSet)
{
  IBCachedTableUpdateStatus->AsString = UpdateStatusStr[IBCachedTable->UpdateStatus()];
}
//---------------------------------------------------------------------------

void __fastcall TCachedData::IBCacheQueryUpdateError(TDataSet *DataSet, EDatabaseError *E,
          TUpdateKind UpdateKind, TIBUpdateAction &UpdateAction)
{
  UpdateAction = UpdateErrorForm->HandleError(DataSet, E, UpdateKind);
}
//---------------------------------------------------------------------------

