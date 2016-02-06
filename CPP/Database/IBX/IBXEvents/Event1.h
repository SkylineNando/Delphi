//---------------------------------------------------------------------------

#ifndef Event1H
#define Event1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TfrmEvents : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox1;
	TButton *btnOpenDatabase;
	TButton *btnCloseDatabase;
	TGroupBox *GroupBox2;
	TButton *btnRegisterEvents;
	TMemo *moRegister;
	TGroupBox *GroupBox3;
	TButton *btnClearEvents;
	TListBox *lbReceived;
	TGroupBox *GroupBox4;
	TLabel *Label1;
	TButton *btnGenerateEvent;
	TEdit *ebEvent;
	void __fastcall btnOpenDatabaseClick(TObject *Sender);
	void __fastcall btnCloseDatabaseClick(TObject *Sender);
	void __fastcall btnGenerateEventClick(TObject *Sender);
	void __fastcall btnRegisterEventsClick(TObject *Sender);
	void __fastcall btnClearEventsClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmEvents(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmEvents *frmEvents;
//---------------------------------------------------------------------------
#endif
