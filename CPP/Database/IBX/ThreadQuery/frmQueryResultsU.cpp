//---------------------------------------------------------------------------

#include <vcl.h>
#include <System.UITypes.hpp>
#pragma hdrstop

#include "frmMain.h"
#include "frmQueryResultsU.h"
#include "ThreadQueryU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmQueryResults *frmQueryResults;
//---------------------------------------------------------------------------
__fastcall TfrmQueryResults::TfrmQueryResults(TComponent* Owner)
	: TForm(Owner)
{
	thdQuery = new ThreadQuery(Main->mmoSQL->Lines->Text, dtsQuery, Main->edtDatabase->Text, Main->edtUsername->Text, Main->edtPassword->Text);
}

//---------------------------------------------------------------------------
__fastcall TfrmQueryResults::~TfrmQueryResults(void)
{
	free(thdQuery);
}

