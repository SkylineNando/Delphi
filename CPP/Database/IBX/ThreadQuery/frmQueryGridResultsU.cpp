//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop


#include "frmQueryGridResultsU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmQueryGridResults *frmQueryGridResults;
//---------------------------------------------------------------------------
__fastcall TfrmQueryGridResults::TfrmQueryGridResults(TComponent* Owner)
	: TForm(Owner)
{
	thdQuery = new ThreadQuery(Main->mmoSQL->Lines->Text, StringGrid1, Main->edtDatabase->Text, Main->edtUsername->Text, Main->edtPassword->Text);
}
//---------------------------------------------------------------------------
void __fastcall TfrmQueryGridResults::FormCreate(System::TObject* Sender)
{
	thdQuery = new ThreadQuery(Main->mmoSQL->Lines->Text, StringGrid1, Main->edtDatabase->Text, Main->edtUsername->Text, Main->edtPassword->Text);
}

void __fastcall TfrmQueryGridResults::FormClose(TObject* Sender, TCloseAction &Action)
{
	free(thdQuery);
}
