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

#include "edcust.h"
#include "Datamod.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TEdCustForm *EdCustForm;
//---------------------------------------------------------------------------
__fastcall TEdCustForm::TEdCustForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEdCustForm::PrintBtnClick(TObject *Sender)
{
  if(MessageBox(Handle,_T("   Print this form?"), _T("Confirmation"),MB_YESNO)==IDYES)
	Print();
}
//---------------------------------------------------------------------------
void __fastcall TEdCustForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  CanClose = MastData->DataSetApplyUpdates(MastData->Cust, ModalResult==mrOk);
}
//---------------------------------------------------------------------------
void TEdCustForm::Edit(double CustNo)
{
  Set<TLocateOption,TLocateOption(0),TLocateOption(1)>flags;
  MastData->Cust->Open();
  MastData->Cust->Locate("CustNo", CustNo, flags);
  ShowModal();
}
