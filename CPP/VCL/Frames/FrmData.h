//---------------------------------------------------------------------------
#ifndef FrmDataH
#define FrmDataH


//---------------------------------------------------------------------------
#include <Windows.hpp>
#include <Messages.hpp>
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <Db.hpp>
#include <Grids.hpp>
#include <DBGrids.hpp>
#include "FrmFancy.h"
#include <DB.hpp>
#include <DBClient.hpp>

//---------------------------------------------------------------------------
 class TDataFrame: public TFrame
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
	TDataSource *DataSource1;
	TDBNavigator *DBNavigator1;
	TFancyFrame *FancyFrame1;
	TSplitter *Splitter1;
	TClientDataSet *ClientDataSet1;
private: // User declarations
public:  // User declarations
	__fastcall TDataFrame(TComponent* AOwner);
};

#endif

