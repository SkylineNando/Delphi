//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "DMCSDemo.h"
#include "FrmQrySP.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmQueryProc *FrmQueryProc;
//---------------------------------------------------------------------------
__fastcall TFrmQueryProc::TFrmQueryProc(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmQueryProc::EmployeeSourceDataChange(TObject *Sender, TField *Field)

{
  // Execute the ProjectsQuery, which uses a query procedure
  EmployeeProjectsQuery->Close();
  EmployeeProjectsQuery->Params->Items[0]->AsInteger = DmEmployee->EmployeeTable->FieldByName("EMP_NO")->AsInteger;
  EmployeeProjectsQuery->Open();

  writeMsg("Employee " + DmEmployee->EmployeeTable->FieldByName("EMP_NO")->AsString +
		   " is assigned to " + IntToStr(EmployeeProjectsQuery->RecordCount) +
		   " project(s).");
}
//---------------------------------------------------------------------------
void __fastcall TFrmQueryProc::writeMsg(System::UnicodeString strWrite)
{
   StatusBar1->SimpleText = strWrite;
}
//---------------------------------------------------------------------------
void __fastcall TFrmQueryProc::FormHide(TObject *Sender)
{
  // Turn off the DataChange event for our form, since DmEmployee.EmployeeTable
  // is used elsewhere
  EmployeeSource->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFrmQueryProc::FormShow(TObject *Sender)
{
  DmEmployee->EmployeeTable->Open();
  // Allow data flow from the EmployeeTable to the local EmployeeSource.  This
  //  will allow DataChange events to execute the query procedure
  EmployeeSource->Enabled = true;
  // Explicit query preparation is not required, but gives the best possible
  //  performance
  if (!EmployeeProjectsQuery->Active)
	EmployeeProjectsQuery->Prepare();
}
//---------------------------------------------------------------------------

