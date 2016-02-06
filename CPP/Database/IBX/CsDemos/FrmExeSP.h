//---------------------------------------------------------------------------

#ifndef FrmExeSPH
#define FrmExeSPH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Mask.hpp>
//---------------------------------------------------------------------------
class TFrmExecProc : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TSpeedButton *BtnShipOrder;
	TDBNavigator *DBNavigator;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	TPanel *Panel3;
	TScrollBox *ScrollBox;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label6;
	TLabel *Label4;
	TDBEdit *EditCUST_NO;
	TDBEdit *EditCUSTOMER;
	TDBEdit *EditCONTACT_FIRST;
	TDBEdit *EditCONTACT_LAST;
	TDBEdit *EditPHONE_NO;
	TDBEdit *EditADDRESS_LINE;
	TDBEdit *EditADDRESS_LINE2;
	TDBEdit *EditCITY;
	TDBEdit *EditSTATE_PROVINCE;
	TDBEdit *EditCOUNTRY;
	TDBEdit *EditPOSTAL_CODE;
	TDBCheckBox *DBCheckBox1;
	TDataSource *SalesSource;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall SalesSourceDataChange(TObject *Sender, TField *Field);
	void __fastcall BtnShipOrderClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmExecProc(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmExecProc *FrmExecProc;
//---------------------------------------------------------------------------
#endif
