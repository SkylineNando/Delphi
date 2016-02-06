//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "brparts.h"
#include "Datamod.h"
#include "edparts.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TBrPartsForm *BrPartsForm;
//---------------------------------------------------------------------------
__fastcall TBrPartsForm::TBrPartsForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
double TBrPartsForm::GetPartNo()
{
  return MastData->PartsSource->DataSet->Fields->Fields[0]->AsFloat;
}
//---------------------------------------------------------------------------
void TBrPartsForm::SetPartNo(double NewPartNo)
{
  TLocateOptions flags;
  MastData->PartsSource->DataSet = MastData->Parts;
  MastData->Parts->Locate("PartNo", NewPartNo, flags);
}
//---------------------------------------------------------------------------
void __fastcall TBrPartsForm::EditBtnClick(TObject *Sender)
{
  if (ActivateBtn->Down)
  {
    EdPartsForm->Edit(MastData->PartsQueryPartNo->Value);
    MastData->PartsQuery->Close();
    MastData->PartsQuery->Open();
  }
  else
    EdPartsForm->Edit(MastData->PartsPartNo->Value);

}
//---------------------------------------------------------------------------
void __fastcall TBrPartsForm::CloseBtnClick(TObject *Sender)
{
 Close();
}
//---------------------------------------------------------------------------
void __fastcall TBrPartsForm::ActivateQuery(TObject *Sender)
{
  if (!ActivateBtn->Down)
    MastData->PartsSource->DataSet = MastData->Parts;
  else
    try
    {
      MastData->PartsQuery->Close();
      MastData->PartsQuery->Open();
      MastData->PartsSource->DataSet = MastData->PartsQuery;
    }
    catch(...)
    {
      MastData->PartsSource->DataSet = MastData->Parts;
    }
  PartsGrid->Update();
}
//---------------------------------------------------------------------------
void __fastcall TBrPartsForm::FormShow(TObject *Sender)
{
  MastData->Parts->Open();
}
//---------------------------------------------------------------------------
