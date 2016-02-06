//----------------------------------------------------------------------------
//C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//----------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "mainform.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TFormMain *FormMain;
soundinfo sounds[] = {
                        {"Standard", 0xFFFFFF, "0xFFFFFF"},
                        {"Asterisk", MB_ICONASTERISK, "MB_ICONASTERISK"},
                        {"Exclamation", MB_ICONEXCLAMATION, "MB_ICONEXCLAMATION"},
                        {"Hand", MB_ICONHAND, "MB_ICONHAND"},
                        {"Question", MB_ICONQUESTION, "MB_ICONQUESTION"},
                        {"Default", MB_OK, "MB_OK"}
                     };
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Button1Click(TObject *Sender)
{
    for (int x=0; x<6; x++)
        if (ListBox1->Selected[x])
        {
            MessageBeep(sounds[x].value);
            Label2->Caption = "MessageBeep(" + String(sounds[x].param) + ");";
        }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
    for (int x=0; x<6; x++)
        ListBox1->Items->Add(sounds[x].name);
}
//---------------------------------------------------------------------------
