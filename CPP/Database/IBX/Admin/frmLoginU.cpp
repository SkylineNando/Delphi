//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "frmLoginU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmLogin *frmLogin;
//---------------------------------------------------------------------------
__fastcall TfrmLogin::TfrmLogin(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmLogin::FormCreate(TObject *Sender)
{
  cbxProtocol->ItemIndex = 0;
}
//---------------------------------------------------------------------------
