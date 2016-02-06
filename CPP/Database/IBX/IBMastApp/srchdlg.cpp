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

#include "srchdlg.h"
#include "Datamod.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TSearchDlg *SearchDlg;
//---------------------------------------------------------------------------
__fastcall TSearchDlg::TSearchDlg(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSearchDlg::DBGrid1DblClick(TObject *Sender)
{
  ModalResult = mrOk;
}
//---------------------------------------------------------------------------
void __fastcall TSearchDlg::SearchButtonClick(TObject *Sender)
{
  TLocateOptions flags;
  flags << loPartialKey << loCaseInsensitive;
  if (!DataSource->DataSet->Locate(OrderCombo->Text, SearchEd->Text, flags))
	  MessageBox(NULL,_T("No matching record found."), _T("Information"), MB_OK);
}
//---------------------------------------------------------------------------
void __fastcall TSearchDlg::OrderComboChange(TObject *Sender)
{
  SrchFld = DataSource->DataSet->FieldByName(OrderCombo->Text);
  SearchEd->Text = " ";
}
//---------------------------------------------------------------------------
void __fastcall TSearchDlg::SearchEdKeyPress(TObject *Sender, char &Key)
{
  if ((SrchFld!=NULL) && (Key != ' ') &&  !SrchFld->IsValidChar(Key) )
  {
    MessageBeep(0);
    Key = '0';
  }
}
//---------------------------------------------------------------------------
void __fastcall TSearchDlg::SearchEdChange(TObject *Sender)
{
  SearchButton->Enabled =  !SearchEd->Text.IsEmpty();
}
//---------------------------------------------------------------------------
double TSearchDlg::GetCustNo()
{
  return MastData->CustCustNo->Value;
}
//---------------------------------------------------------------------------
void TSearchDlg::SetCustNo(double NewCustNo)
{
  TLocateOptions flags;
  MastData->Cust->Locate("CustNo", NewCustNo, flags);
}
//---------------------------------------------------------------------------
double TSearchDlg::GetPartNo()
{
  return MastData->PartsPartNo->Value;
}
//---------------------------------------------------------------------------
void TSearchDlg::SetPartNo(double NewPartNo)
{
  TLocateOptions flags;
  MastData->Parts->Locate("PartNo", NewPartNo, flags);
}
//---------------------------------------------------------------------------
int TSearchDlg::ShowModalCust()
{
  OrderCombo->Items->Clear();
  OrderCombo->Items->Add("Company");
  OrderCombo->Items->Add("CustNo");
  OrderCombo->ItemIndex = 0;
  DataSource->DataSet = MastData->Cust;
  OrderComboChange(0);
  Caption = "Select a Customer";
  return ShowModal();
}
//---------------------------------------------------------------------------
int TSearchDlg::ShowModalParts()
{
  OrderCombo->Items->Clear();
  OrderCombo->Items->Add("Description");
  OrderCombo->Items->Add("PartNo");
  OrderCombo->ItemIndex = 0;
  DataSource->DataSet = MastData->Parts;
  OrderComboChange(0);
  Caption = "Select a Part";
  return ShowModal();
}
//---------------------------------------------------------------------------

