//---------------------------------------------------------------------------

#ifndef FrmTransH
#define FrmTransH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TFrmTransDemo : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TSpeedButton *BtnUndoEdits;
	TSpeedButton *BtnCommitEdits;
	TDBNavigator *DBNavigator;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall BtnCommitEditsClick(TObject *Sender);
	void __fastcall BtnUndoEditsClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmTransDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmTransDemo *FrmTransDemo;
//---------------------------------------------------------------------------
#endif
