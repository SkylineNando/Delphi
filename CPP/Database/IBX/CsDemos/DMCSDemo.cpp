//---------------------------------------------------------------------------


#pragma hdrstop

#include "DMCSDemo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TDmEmployee *DmEmployee;
//---------------------------------------------------------------------------
__fastcall TDmEmployee::TDmEmployee(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
