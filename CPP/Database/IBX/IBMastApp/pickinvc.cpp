
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

#include "pickinvc.h"
#include "datamod.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TPickOrderNoDlg *PickOrderNoDlg;
//---------------------------------------------------------------------------
__fastcall TPickOrderNoDlg::TPickOrderNoDlg(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPickOrderNoDlg::FormShow(TObject *Sender)
{
	MastData->Orders->Open();	
}
//---------------------------------------------------------------------------
