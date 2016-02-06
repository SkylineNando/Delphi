//---------------------------------------------------------------------------

#ifndef FrmTriggH
#define FrmTriggH
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
class TFrmTriggerDemo : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBNavigator *DBNavigator;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	TPanel *Panel3;
	TDBGrid *DBGrid2;
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmTriggerDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmTriggerDemo *FrmTriggerDemo;
//---------------------------------------------------------------------------
#endif
