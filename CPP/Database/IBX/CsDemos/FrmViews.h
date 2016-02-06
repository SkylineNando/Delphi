//---------------------------------------------------------------------------

#ifndef FrmViewsH
#define FrmViewsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TFrmViewDemo : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TSpeedButton *BtnShowEmployee;
	TSpeedButton *BtnShowPhoneList;
	TDBNavigator *DBNavigator;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	TDataSource *VaryingTableSource;
	TIBDatabase *IBDatabase1;
	TIBTransaction *IBTransaction1;
	TIBDataSet *VaryingTable;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BtnShowEmployeeClick(TObject *Sender);
	void __fastcall BtnShowPhoneListClick(TObject *Sender);
private:	// User declarations
	void __fastcall ShowTable(System::UnicodeString ATable);
public:		// User declarations
	__fastcall TFrmViewDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmViewDemo *FrmViewDemo;
//---------------------------------------------------------------------------
#endif
