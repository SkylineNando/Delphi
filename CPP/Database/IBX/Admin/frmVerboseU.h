//---------------------------------------------------------------------------

#ifndef frmVerboseUH
#define frmVerboseUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmVerbose : public TForm
{
__published:	// IDE-managed Components
	TStatusBar *stbStatusBar;
	TRichEdit *edOutput;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmVerbose(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmVerbose *frmVerbose;
//---------------------------------------------------------------------------
#endif
