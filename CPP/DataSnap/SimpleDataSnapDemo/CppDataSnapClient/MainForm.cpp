//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "MainForm.h"
#include "DataSnapClientClasses.h"
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
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	TServerMethods1Client *Temp;
	Temp = new TServerMethods1Client(SQLConnection1->DBXConnection);
	try {
		Label1->Text = Temp->EchoString(Edit1->Text);
	}
	__finally {
		delete Temp;
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button2Click(TObject *Sender)
{
	TServerMethods1Client *Temp;
	Temp = new TServerMethods1Client(SQLConnection1->DBXConnection);
	try {
		Label1->Text = Temp->ReverseString(Edit1->Text);
	}
	__finally {
		delete Temp;
	}
}
//---------------------------------------------------------------------------
