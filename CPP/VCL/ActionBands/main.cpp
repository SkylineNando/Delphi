
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
 TForm1 *Form1;

//---------------------------------------------------------------------------
void __fastcall TForm1::FileOpen1Accept(TObject *)
{
  RichEdit1->Lines->LoadFromFile(FileOpen1->Dialog->FileName);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FileSaveAs1Accept(TObject *)
{
  RichEdit1->Lines->SaveToFile(FileSaveAs1->Dialog->FileName);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::ActionManager1StateChange(TObject *)
{
  RichEdit1->ReadOnly = (ActionManager1->State != asNormal);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::StdStyleActnExecute(TObject *)
{
  ActionManager1->Style = StandardStyle;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::XPStyleActnExecute(TObject *)
{
  ActionManager1->Style = XPStyle;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *)
{
  XPStyleActn->Checked = (ActionManager1->Style == XPStyle);
  StdStyleActn->Checked = (ActionManager1->Style == StandardStyle);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::ShadowActnExecute(TObject *)
{
  ActionMainMenuBar1->Shadows = ShadowActn->Checked;
}

