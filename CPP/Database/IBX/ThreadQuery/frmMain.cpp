//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "frmMain.h"
#include "frmQueryResultsU.h"
#include "frmQueryGridResultsU.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMain *Main;
//---------------------------------------------------------------------------
__fastcall TMain::TMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMain::Button1Click(TObject *Sender)
{
	TfrmQueryResults *frmQueryResults = new TfrmQueryResults(this);
	frmQueryResults->Show();
}
//---------------------------------------------------------------------------
void __fastcall TMain::Button2Click(TObject *Sender)
{
	TfrmQueryGridResults *frmQueryGridResults = new TfrmQueryGridResults(this);
	frmQueryGridResults->Show();
}
//---------------------------------------------------------------------------

