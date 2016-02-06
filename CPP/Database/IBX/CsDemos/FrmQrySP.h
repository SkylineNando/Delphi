//---------------------------------------------------------------------------

#ifndef FrmQrySPH
#define FrmQrySPH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TFrmQueryProc : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBNavigator *DBNavigator;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	TPanel *Panel3;
	TDBGrid *DBGrid2;
	TStatusBar *StatusBar1;
	TDataSource *EmployeeProjectsSource;
	TDataSource *EmployeeSource;
	TIBQuery *EmployeeProjectsQuery;
	void __fastcall EmployeeSourceDataChange(TObject *Sender, TField *Field);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
	void __fastcall writeMsg(System::UnicodeString strWrite);
public:		// User declarations
	__fastcall TFrmQueryProc(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmQueryProc *FrmQueryProc;
//---------------------------------------------------------------------------
#endif
