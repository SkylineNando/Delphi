//---------------------------------------------------------------------------

#ifndef frmConnectUH
#define frmConnectUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.Dialogs.hpp>
//---------------------------------------------------------------------------
class TfrmConnect : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TBitBtn *btnOK;
	TBitBtn *btnCancel;
	TEdit *edtDatabase;
	TEdit *edtUser;
	TEdit *edtPassword;
	TEdit *edtRole;
	TButton *btnBrowse;
	TOpenDialog *dlgOpen;
	void __fastcall edtDatabaseChange(System::TObject* Sender);
	void __fastcall btnBrowseClick(System::TObject* Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmConnect(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmConnect *frmConnect;
//---------------------------------------------------------------------------
#endif
