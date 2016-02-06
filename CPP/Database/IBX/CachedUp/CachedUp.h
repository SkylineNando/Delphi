//---------------------------------------------------------------------------

#ifndef CachedUpH
#define CachedUpH
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
#include <IBCustomDataSet.hpp>	// Pascal unit
//---------------------------------------------------------------------------
class TCacheDemoForm : public TForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
	TDBNavigator *DBNavigator1;
	TGroupBox *GroupBox1;
	TCheckBox *UnmodifiedCB;
	TCheckBox *ModifiedCB;
	TCheckBox *InsertedCB;
	TCheckBox *DeletedCB;
	TPanel *Panel2;
	TButton *ApplyUpdatesBtn;
	TButton *CancelUpdatesBtn;
	TButton *RevertRecordBtn;
	TButton *ReExecuteButton;
	TRadioGroup *RadioGroup1;
	TButton *btnUpdateStatus;
	TMainMenu *MainMenu1;
	TMenuItem *miAbout;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ToggleUpdateMode(System::TObject* Sender);
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall ReExecuteButtonClick(TObject *Sender);
	void __fastcall btnUpdateStatusClick(TObject *Sender);
	void __fastcall RadioGroup1Click(TObject *Sender);
	void __fastcall ApplyUpdatesBtnClick(TObject *Sender);
	void __fastcall CancelUpdatesBtnClick(TObject *Sender);
	void __fastcall RevertRecordBtnClick(TObject *Sender);
	void __fastcall UpdateRecordsToShow(System::TObject* Sender);
private:	// User declarations
	Ibcustomdataset::TIBCustomDataSet* FDataSet;
	void __fastcall SetControlStates(bool Enabled);
public:		// User declarations
	__fastcall TCacheDemoForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCacheDemoForm *CacheDemoForm;
//---------------------------------------------------------------------------
#endif
