//---------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

#include <vcl.h>
#pragma hdrstop

#include "MainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ApplicationEvents1ActionExecute(TBasicAction *Action, bool &Handled)

{
  Memo1->Lines->Add("Executed: " + Action->Name);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ExitDemoActnExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CreateAppointmentActnExecute(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NewMailMessageActnExecute(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TForm1::PermissionNoRestrictionsActnExecute(TObject *Sender)
{
// Permission handlers
}
//---------------------------------------------------------------------------
void __fastcall TForm1::PrintQuickPrintActnExecute(TObject *Sender)
{
// Print handlers
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SaveActnExecute(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------
