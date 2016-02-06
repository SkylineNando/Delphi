//---------------------------------------------------------------------------

#ifndef ffactwinH
#define ffactwinH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "IBCustomDataSet.hpp"
#include "IBDatabase.hpp"
#include "IBTable.hpp"
#include <DB.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBText *DBLabel1;
	TDBImage *DBImage1;
	TPanel *Panel2;
	TLabel *Label1;
	TDBText *DBLabel2;
	TPanel *Panel3;
	TDBMemo *DBMemo1;
	TPanel *Panel4;
	TDBGrid *DBGrid1;
	TDataSource *DataSource1;
	TIBTable *IBTable1;
	TIBStringField *IBTable1CATEGORY;
	TIBStringField *IBTable1SPECIES_NAME;
	TFloatField *IBTable1LENGTH__CM_;
	TFloatField *IBTable1LENGTH_IN;
	TIBStringField *IBTable1COMMON_NAME;
	TMemoField *IBTable1NOTES;
	TBlobField *IBTable1GRAPHIC;
	TIBDatabase *IBDatabase1;
	TIBTransaction *IBTransaction1;
	TBitBtn *ExitButton;
	TBitBtn *SaveButton;
	TSaveDialog *SaveDialog1;
	void __fastcall SaveButtonClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
