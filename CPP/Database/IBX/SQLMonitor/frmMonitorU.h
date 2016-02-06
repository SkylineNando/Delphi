//---------------------------------------------------------------------------

#ifndef frmMonitorUH
#define frmMonitorUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <IBSQLMonitor.hpp>
//---------------------------------------------------------------------------
class TfrmMonitor : public TForm
{
__published:	// IDE-managed Components
	TSplitter *Splitter1;
	TMemo *Memo1;
	TListView *ListView1;
	TStatusBar *StatusBar1;
	TMainMenu *MainMenu1;
	TMenuItem *SQLMonitor1;
	TMenuItem *Clear2;
	TMenuItem *Flags1;
	TMenuItem *Monitoring1;
	void __fastcall IBSQLMonitor1SQL(UnicodeString EventText, TDateTime EventTime);
	void __fastcall Clear1Click(TObject* Sender);
	void __fastcall Monitoring1Click(TObject* Sender);
	void __fastcall Flags1Click(TObject* Sender);
	void __fastcall ListView1SelectItem(TObject* Sender, TListItem* Item, bool Selected);

private:	// User declarations
	TIBSQLMonitor *mon;
public:		// User declarations
	__fastcall TfrmMonitor(TComponent* Owner);
	inline __fastcall virtual TfrmMonitor(TComponent* AOwner, int Dummy) : TForm(AOwner, Dummy) { }
	inline __fastcall virtual ~TfrmMonitor(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMonitor *frmMonitor;
//---------------------------------------------------------------------------
#endif
