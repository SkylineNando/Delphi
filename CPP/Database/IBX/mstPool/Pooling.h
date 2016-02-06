//---------------------------------------------------------------------------

#ifndef PoolingH
#define PoolingH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TCheckBox *MTSPooling;
	TButton *TestBtn;
	TEdit *StartTimeEdt;
	TEdit *EndTimeEdt;
	TEdit *ElpTimeEdt;
	TEdit *Count;
	TIBDatabase *Database1;
	TIBQuery *Query1;
	TIBTransaction *IBTransaction1;
	void __fastcall MTSPoolingClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall TestBtnClick(TObject *Sender);
	void __fastcall DoTest(void);
private:	// User declarations
	System::TDateTime dtStart;
	System::TDateTime dtEnd;
	System::TDateTime dtElp;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
