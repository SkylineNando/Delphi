//---------------------------------------------------------------------------

#ifndef ErrformH
#define ErrformH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>
#include <IBCustomDataSet.hpp>
//---------------------------------------------------------------------------
class TUpdateErrorForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *UpdateType;
	TLabel *Label3;
	TLabel *ErrorText;
	TStringGrid *UpdateData;
	TButton *RetryButton;
	TButton *SkipButton;
	TButton *AbortButton;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall UpdateDataSetEditText(System::TObject* Sender, int ACol, int ARow, const System::UnicodeString Value);
private:	// User declarations
	System::Classes::TStringList* FDataFields;
	void __fastcall GetFieldValues(Data::Db::TDataSet* DataSet);
	void __fastcall SetFieldValues(Data::Db::TDataSet* DataSet);
public:		// User declarations
	__fastcall TUpdateErrorForm(TComponent* Owner);
	  Ibcustomdataset::TIBUpdateAction __fastcall HandleError(Data::Db::TDataSet* DataSet, Data::Db::EDatabaseError* E, Data::Db::TUpdateKind UpdateKind);
};
//---------------------------------------------------------------------------
extern PACKAGE TUpdateErrorForm *UpdateErrorForm;
//---------------------------------------------------------------------------
#endif
