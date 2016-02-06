//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FrmViews.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmViewDemo *FrmViewDemo;
//---------------------------------------------------------------------------
__fastcall TFrmViewDemo::TFrmViewDemo(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmViewDemo::ShowTable(System::UnicodeString ATable)
{
  Screen->Cursor = crHourGlass;		// show user something's happening
  VaryingTable->DisableControls();    // hide data changes from user
  VaryingTable->Active = false;     // close the table
  VaryingTable->SelectSQL->Text = "SELECT * FROM " + ATable;
  VaryingTable->Open();               // open the table
  VaryingTable->EnableControls();     // paint the changes
  Screen->Cursor = crDefault;       // reset the pointer
}
//---------------------------------------------------------------------------
void __fastcall TFrmViewDemo::FormShow(TObject *Sender)
{
  VaryingTable->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFrmViewDemo::BtnShowEmployeeClick(TObject *Sender)
{
  ShowTable("EMPLOYEE");
}
//---------------------------------------------------------------------------

void __fastcall TFrmViewDemo::BtnShowPhoneListClick(TObject *Sender)
{
  ShowTable("PHONE_LIST");
}
//---------------------------------------------------------------------------

