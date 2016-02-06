//---------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

#include <vcl.h>
#pragma hdrstop

#include "MainUnit.h"
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
void __fastcall TForm1::bChangeFontClick(TObject *Sender)
{
  FontDialog1->Font = Memo1->Font;
  if (FontDialog1->Execute())
    Memo1->Font = FontDialog1->Font;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox1Click(TObject *Sender)
{
  SampleActn->Enabled = ((TCheckBox*)(Sender))->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SampleActnExecute(TObject *Sender)
{
  Memo1->Lines->Add("Sample action clicked");
}
//---------------------------------------------------------------------------
