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
#ifndef SHOW_MISSING_THUNK
	#include <windows.h>
	#if defined(_Windows)
	 #undef FindText
	#endif
#endif
#include <vcl.h>
#pragma hdrstop

#include <tchar.h>
#include "mainform.h"
//---------------------------------------------------------------------------


#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Find1Click(TObject *Sender)
{
    FindDialog1->FindText = RichEdit1->SelText;
    FindDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Replace1Click(TObject *Sender)
{
    ReplaceDialog1->FindText = RichEdit1->SelText;
    ReplaceDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Find(TObject *Sender)
{
    TSearchTypes st;
    TFindDialog *cd;
    int newpos;

    if ((cd = dynamic_cast<TFindDialog *> (Sender)) == 0)
		MessageBox(NULL, _T("Dynamic Cast Failed!"), _T("Find/Rep"), MB_OK);

    if (cd->Options.Contains(frMatchCase))
        st << stMatchCase;
    if (cd->Options.Contains(frWholeWord))
        st << stWholeWord;

    if (RichEdit1->SelLength)
        RichEdit1->SelStart += 1;

    newpos = RichEdit1->FindText(cd->FindText,
                        RichEdit1->SelStart,
                        RichEdit1->Text.Length(),
                        st);

    if (newpos != -1)
    {
        RichEdit1->SelStart = newpos;
        RichEdit1->SelLength = cd->FindText.Length();
    }
	else
	{
		MessageBox(NULL, _T("End of document reached."), _T("Find/Rep"), MB_OK);
		RichEdit1->SelStart = 0;
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Replace(TObject *Sender)
{
    if (RichEdit1->SelLength == 0)
        Find(Sender);
    else
    {
        RichEdit1->SelText =  ReplaceDialog1->ReplaceText;
        Find(Sender);
    }

    if (ReplaceDialog1->Options.Contains(frReplaceAll))
        while (RichEdit1->SelLength !=0)
            Replace(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
    RichEdit1->SelStart = 0;
}
//---------------------------------------------------------------------------
