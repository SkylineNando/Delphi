//---------------------------------------------------------------------------

#ifndef frmQueryResultsUH
#define frmQueryResultsUH
//---------------------------------------------------------------------------
#include <System.hpp>
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <System.UITypes.hpp>

#include "ThreadQueryU.h"
//---------------------------------------------------------------------------
class TfrmQueryResults : public TForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
	TDataSource *dtsQuery;

private:	// User declarations

public:		// User declarations
	ThreadQuery *thdQuery;


	__fastcall TfrmQueryResults(TComponent* Owner);
	__fastcall virtual ~TfrmQueryResults(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmQueryResults *frmQueryResults;
//---------------------------------------------------------------------------
#endif
