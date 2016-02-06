//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "frmVerboseU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmVerbose *frmVerbose;
//---------------------------------------------------------------------------
__fastcall TfrmVerbose::TfrmVerbose(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmVerbose::FormClose(TObject *Sender, TCloseAction &Action)
{
  Action = caFree;
}
//---------------------------------------------------------------------------
