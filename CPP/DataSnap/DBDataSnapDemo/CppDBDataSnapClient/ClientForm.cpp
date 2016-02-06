//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "ClientForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::CheckBox1Change(TObject *Sender)
{
	SQLConnection1->Connected = CheckBox1->IsChecked;
	CustClientDataSet->Active = CheckBox1->IsChecked;
	SalesClientDataSet->Active = CheckBox1->IsChecked;
}
//---------------------------------------------------------------------------
