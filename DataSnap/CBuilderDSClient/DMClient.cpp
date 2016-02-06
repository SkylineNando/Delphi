//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DMClient.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDMClientContainer *DMClientContainer;
//---------------------------------------------------------------------------
__fastcall TDMClientContainer::TDMClientContainer(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
