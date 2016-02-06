//---------------------------------------------------------------------------

#ifndef frmMainUH
#define frmMainUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBSQLMonitor.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.ToolWin.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TSplitter *Splitter1;
	TSplitter *Splitter2;
	TMemo *Memo1;
	TMemo *Memo2;
	TDBGrid *DBGrid1;
	TToolBar *ToolBar1;
	TToolButton *btnRun;
	TToolButton *btnLaunch;
	TLabel *Label2;
	TLabel *Label1;
	TIBDatabase *IBDatabase1;
	TIBTransaction *IBTransaction1;
	TIBDataSet *IBDataSet1;
	TDataSource *DataSource1;
	TIBSQLMonitor *IBSQLMonitor1;
	TMainMenu *MainMenu1;
	TMenuItem *Trace1;
	TMenuItem *Connect3;
	TMenuItem *Trace2;
	TMenuItem *SQLMonitor1;
	TMenuItem *Flags1;
	TMenuItem *Database1;
	TMenuItem *MonitorHook1;
	TMenuItem *SQLMonitor2;
	TMenuItem *Clear1;
	TMenuItem *MonitorCount1;
	TImageList *ImageList1;
	void __fastcall RunClick(TObject* Sender);
	void __fastcall IBSQLMonitor1SQL(UnicodeString EventText, TDateTime EventTime);
	void __fastcall LaunchClick(TObject* Sender);
	void __fastcall Clear1Click(TObject* Sender);
	void __fastcall Trace2Click(TObject* Sender);
	void __fastcall Connect3Click(TObject* Sender);
	void __fastcall SQLMonitor1Click(TObject* Sender);
	void __fastcall Database1Click(TObject* Sender);
	void __fastcall MonitorHook1Click(TObject* Sender);
	void __fastcall SQLMonitor2Click(TObject* Sender);
	void __fastcall MonitorCount1Click(TObject* Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
   //	inline __fastcall virtual TfrmMain(TComponent* AOwner) : TForm(AOwner);
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmMain(TComponent* AOwner, int Dummy) : TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmMain(void) { }

};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
