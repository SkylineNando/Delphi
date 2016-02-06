//---------------------------------------------------------------------------

#ifndef DelegateFormH
#define DelegateFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <FMTBcd.hpp>
#include <Grids.hpp>
#include <Provider.hpp>
#include <SqlExpr.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *TraceFileLabel;
	TLabel *DbxConnectionsLabel;
	TLabel *DbxDriverLabel;
	TSQLConnection *SQLConnection1;
	TMemo *Memo1;
	TComboBox *ComboBox1;
	TClientDataSet *ClientDataSet1;
	TEdit *PooledBenchEdit;
	TLabel *PooledBenchLabel;
	TEdit *NonPooledBenchEdit;
	TLabel *NonPooledBenchLabel;
	TEdit *PoolConnectEdit;
	TEdit *PoolTraceConnectEdit;
	TPageControl *Pagecontrol;
	TTabSheet *QuerySheet;
	TComboBox *ComboBox2;
	TDBGrid *DBGrid1;
	TSQLDataSet *SQLDataSet1;
	TEdit *EditResult;
	TButton *PoolConnectButton;
	TPanel *ConnectSheet;
	TDBNavigator *DBNavigator1;
	TDataSetProvider *DataSetProvider1;
	TDataSource *DataSource1;
	TRadioGroup *RadioGroup2;
	TLabel *Label4;
	TListBox *ListBox1;
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Memo1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall ComboBox1Enter(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall DbxConnectionsButtonClick(TObject *Sender);
	void __fastcall DbxDriversButtonClick(TObject *Sender);
	void __fastcall NonPooledBenchButtonClick(TObject *Sender);
	void __fastcall PoolConnectButtonbClick(TObject *Sender);
	void __fastcall PooledBenchButtonClick(TObject *Sender);
	void __fastcall PoolTraceConnectButtonClick(TObject *Sender);
	void __fastcall TraceFileButtonClick(TObject *Sender);
	void __fastcall ComboBox2Enter(TObject *Sender);
	void __fastcall ListBox1Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
	String FConnectionName;
	String FPoolConnectionName;
	String FTraceConnectionName;
	String FPoolTraceConnectionName;
	String FLastConnectionName;
	TStringList *FPoolConnections;
	TStringList *FPoolTraceConnections;
	String FConnectionsFileName;
	String FDriversFileName;
	void __fastcall CopyConnection(TMemIniFile *IniFile, String SourceName,
	  String DestName);
	String __fastcall GetConnectionsIniFile();
	String __fastcall GetDriversIniFile();
	void __fastcall AddDelegatesToIniFile(String ConnectionName);
	void __fastcall ExecuteQuery();
	void __fastcall InitCommandTypes();
	void __fastcall InitCommands();
	void __fastcall ConnectDisConnect(bool Pooled);
	void __fastcall OpenConnections(bool PoolTrace);
	void __fastcall EditFile(String FileName);
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
