// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "frmConnectU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmConnect *frmConnect;

// ---------------------------------------------------------------------------
__fastcall TfrmConnect::TfrmConnect(TComponent* Owner) : TForm(Owner) {
}
// ---------------------------------------------------------------------------

void __fastcall TfrmConnect::edtDatabaseChange(TObject* Sender)
{
  if((edtDatabase->Text != "") && (edtUser->Text != "") && (edtPassword->Text != ""))
	btnOK->Enabled = true;
  else
	btnOK->Enabled = false;
}
void __fastcall TfrmConnect::btnBrowseClick(TObject* Sender)
{
	if(dlgOpen->Execute() ) {
		edtDatabase->Text = dlgOpen->FileName;
    }
}
