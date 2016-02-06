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
#include <tchar.h>
#pragma hdrstop

#include "edparts.h"
#include "Datamod.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TEdPartsForm *EdPartsForm;
//---------------------------------------------------------------------------
__fastcall TEdPartsForm::TEdPartsForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TEdPartsForm::Edit(Double PartNo)
{
  TLocateOptions flags;
  MastData->Parts->Open();
  MastData->Parts->Locate("PartNo", PartNo, flags);
  ShowModal();
}

void __fastcall TEdPartsForm::PrintBtnClick(TObject *Sender)
{
  if ( MessageBox(Handle,_T("  Print this form?"),_T("Confirmation"),MB_YESNO) )
     Print();
}
//---------------------------------------------------------------------------

void __fastcall TEdPartsForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  CanClose = MastData->DataSetApplyUpdates(MastData->Parts, ModalResult==mrOk);
}
//---------------------------------------------------------------------------
