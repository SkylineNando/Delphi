//----------------------------------------------------------------------------
//C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//----------------------------------------------------------------------------
//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Switch1.h"
//---------------------------------------------------------------------
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent *Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------
void __fastcall TFormMain::Button1Click(TObject* /*Sender*/)
{
    MessageBox(NULL, "Event Hander # 1", "Hey", MB_OK);
    Button1->OnClick = Button1Click2;
}
//----------------------------------------------------------------------------
void __fastcall TFormMain::Button1Click2(TObject* /*Sender*/)
{
    MessageBox(NULL, "Event Hander # 2", "There", MB_OK);
    Button1->OnClick = Button1Click;
}
//----------------------------------------------------------------------------

