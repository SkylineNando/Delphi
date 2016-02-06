//---------------------------------------------------------------------------

#ifndef GridFormH
#define GridFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GdsData.h"
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TGridViewForm : public TStdDataForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
private:	// User declarations
public:		// User declarations
	__fastcall TGridViewForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGridViewForm *GridViewForm;
//---------------------------------------------------------------------------
#endif
