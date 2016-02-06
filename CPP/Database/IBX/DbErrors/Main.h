//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Menus.hpp>
//---------------------------------------------------------------------------
class TFrmMain : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label3;
	TLabel *Label4;
	TDBNavigator *DBNavigator1;
	TDBGrid *GridCustomers;
	TDBGrid *GridOrders;
	TDBGrid *GridItems;
	TMainMenu *MainMenu1;
	TMenuItem *About1;
	void __fastcall About1Click(TObject *Sender);
	void __fastcall GridCustomersEnter(TObject *Sender);
	void __fastcall GridCustomersExit(TObject *Sender);
	void __fastcall GridOrdersEnter(TObject *Sender);
	void __fastcall GridItemsEnter(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmMain *FrmMain;
//---------------------------------------------------------------------------
#endif
