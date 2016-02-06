//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Data.DB.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Mask.hpp>
#include <DBClient.hpp>
#include <DSConnect.hpp>
#include <Vcl.Menus.hpp>
//---------------------------------------------------------------------------
class TFrmMain : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TLabel *LBDateTime;
	TButton *Button4;
	TGroupBox *GroupBox1;
	TPageControl *PageControl2;
	TTabSheet *TBJobList;
	TDBGrid *DBGrid3;
	TTabSheet *TabSheet4;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TDBEdit *DBEJobId;
	TDBEdit *DBEdit2;
	TDBEdit *DBEdit3;
	TDBEdit *DBEdit4;
	TButton *Button5;
	TDBNavigator *DBNavigator3;
	TButton *ApplyUpdates;
	TTabSheet *TabSheet2;
	TPanel *Panel1;
	TButton *Button1;
	TButton *Button3;
	TButton *Button2;
	TTabSheet *TabSheet3;
	TLabel *Label5;
	TButton *BTGetDepartament;
	TButton *Button8;
	TMemo *Memo1;
	TButton *Button6;
	TTabSheet *TabSheet5;
	TButton *Button7;
	TTabSheet *TabSheet8;
	TDBGrid *DBGrid4;
	TButton *Button13;
	TDataSource *DSDepartment;
	TDataSource *DSJobs;
	TDataSource *DSCopy;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label10;
	TDBEdit *DBEdit1;
	TDBMemo *DBMemo1;
	TDBEdit *DBEdit5;
	TDBEdit *DBEdit6;
	TDBEdit *DBEdit7;
	TDBGrid *DBGrid1;
	TGroupBox *GroupBox2;
	TDBGrid *DBGrid2;
	TDBNavigator *DBNavigator2;
	TPanel *Panel2;
	TDBText *DBText1;
	TGroupBox *GroupBox3;
	TDBGrid *DBGrid5;
	TDBNavigator *DBNavigator4;
	TDBNavigator *DBNavigator5;
	TDSProviderConnection *DSProvDM3;
	TClientDataSet *CDSProject;
	TStringField *CDSProjectPRODUCT;
	TMemoField *CDSProjectPROJ_DESC;
	TStringField *CDSProjectPROJ_ID;
	TStringField *CDSProjectPROJ_NAME;
	TSmallintField *CDSProjectTEAM_LEADER;
	TDataSetField *CDSProjectSQLProjectEmployee;
	TDataSetField *CDSProjectSQLProjectBudget;
	TDataSource *DSProject;
	TClientDataSet *CDSBudget;
	TStringField *CDSBudgetDEPT_NO;
	TIntegerField *CDSBudgetFISCAL_YEAR;
	TStringField *CDSBudgetPROJ_ID;
	TFMTBCDField *CDSBudgetPROJECTED_BUDGET;
	TStringField *CDSBudgetDepartment;
	TAggregateField *CDSBudgetTotalBudget;
	TDataSource *DSBudget;
	TClientDataSet *CDSDepartment;
	TDataSource *DataSource1;
	TClientDataSet *CDSProjectEmployee;
	TSmallintField *CDSProjectEmployeeEMP_NO;
	TStringField *CDSProjectEmployeePROJ_ID;
	TStringField *CDSProjectEmployeeEmployee;
	TDataSource *DSProjectEmployee;
	TClientDataSet *CDSEmployee;
	TDataSource *DSEmployee;
	TButton *Button9;
	TButton *Button10;
	TPanel *Panel3;
	TButton *Button11;
	TPopupMenu *PMStyles;
	TMenuItem *Style11;
	TMenuItem *Style21;
	TMenuItem *Style31;
	TButton *Button12;
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall BTGetDepartamentClick(TObject *Sender);
	void __fastcall Button8Click(TObject *Sender);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall Button13Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button9Click(TObject *Sender);
	void __fastcall CDSProjectReconcileError(TCustomClientDataSet *DataSet, EReconcileError *E,
          TUpdateKind UpdateKind, TReconcileAction &Action);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall StyleClick(TObject *Sender);
	void __fastcall Button12Click(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TFrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmMain *FrmMain;
//---------------------------------------------------------------------------
#endif
