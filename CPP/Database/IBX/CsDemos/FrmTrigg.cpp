//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "DMCSDemo.h"
#include "FrmTrigg.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmTriggerDemo *FrmTriggerDemo;
//---------------------------------------------------------------------------
__fastcall TFrmTriggerDemo::TFrmTriggerDemo(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmTriggerDemo::FormShow(TObject *Sender)
{
  DmEmployee->EmployeeTable->Open();
  DmEmployee->SalaryHistoryTable->Open();
}
//---------------------------------------------------------------------------

