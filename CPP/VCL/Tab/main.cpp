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

#include "main.h"
#include <stdlib.h>
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TabControl1Change(TObject *Sender)
{
    char buf[3];

    if (TabControl1->TabIndex == -1)
        StatusBar1->SimpleText = "No tab selected.";
    else
    {
        StatusBar1->SimpleText = "Tab index: " +
                                 String(itoa(TabControl1->TabIndex, buf, 10));

        switch (TabControl1->TabIndex)
        {
            case 0:
                Label1->Caption = "This is an example of using a tab control.";
                break;
            case 1:
                Label1->Caption = "The OnChange event is triggered when the user selects a tab."
                                  "  The TabIndex property tells you which tab was selected.";
                break;
            case 2:
                Label1->Caption = "Using a TabControl, much of the work is left up to the developer.";
                break;
            case 3:
                Label1->Caption = "For multi-page dialogs, a PageControl with "
                                  "TabSheets for each page is much more powerful.";
                break;
            case 4:
                Label1->Caption = "See the \"MULTIPAGE\" example to learn more about TPageControl and TTabSheet.";
                break;
            default:
                break;
        }
    }
}
//---------------------------------------------------------------------------
