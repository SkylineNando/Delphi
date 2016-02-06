//---------------------------------------------------------------------------

#ifndef frmQueryGridResultsUH
#define frmQueryGridResultsUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>

#include "frmMain.h"
#include "ThreadQueryU.h"
//---------------------------------------------------------------------------
class TfrmQueryGridResults : public TForm
{
__published:	// IDE-managed Components
	TStringGrid *StringGrid1;

	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormClose(TObject* Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	ThreadQuery *thdQuery;
public:
	__fastcall TfrmQueryGridResults(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmQueryGridResults *frmQueryGridResults;
//---------------------------------------------------------------------------
#endif
