//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#include <System.IOUtils.hpp>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TFireDAC_SQLiteForm *FireDAC_SQLiteForm;
//---------------------------------------------------------------------------
__fastcall TFireDAC_SQLiteForm::TFireDAC_SQLiteForm(TComponent* Owner)
	: TForm(Owner)
{
	try {
		// For unidirectional dataset, don't refill automatically when dataset is activated
		// because dataset is reactivated everytime use DataSet.First.
		LinkFillControlToField1->AutoActivate = false;
		LinkFillControlToField1->AutoFill = false;
		Application->OnIdle = OnIdle;
		FireTaskList->Connected = true;
		FDTableTask->Active = true;
		LinkFillControlToField1->BindList->FillList();
	} catch (Exception &e) {
		ShowMessage(e.Message);
	}
}
//---------------------------------------------------------------------------
void __fastcall TFireDAC_SQLiteForm::btnAddClick(TObject *Sender)
{
	String TaskName;
	try {
		if (InputQuery("Enter New Task", "Task", TaskName) && (!(Trim(TaskName) == ""))) {
			FDQueryInsert->ParamByName("TaskName")->AsString = TaskName;
			FDQueryInsert->ExecSQL();
			FDTableTask->Refresh();
			LinkFillControlToField1->BindList->FillList();
		}
	}
	catch(Exception &e)
	{
		ShowMessage(e.Message);
	}
}
//---------------------------------------------------------------------------

void __fastcall TFireDAC_SQLiteForm::btnDeleteClick(TObject *Sender)
{
	String TaskName;
	TaskName = ListView1->Selected->Text;
	try {
		FDQueryDelete->ParamByName("TaskName")->AsString = TaskName;
		FDQueryDelete->ExecSQL();
		FDTableTask->Refresh();
		LinkFillControlToField1->BindList->FillList();
		if ((ListView1->Selected) && (ListView1->ItemCount > 0)) {
			ListView1->ItemIndex = ListView1->ItemCount - 1;
		}
	} catch (Exception &e) {
		ShowMessage(e.Message);
	}
}
//---------------------------------------------------------------------------
void __fastcall TFireDAC_SQLiteForm::OnIdle(TObject* Sender, bool &Done)
{
	btnDelete->Visible = ListView1->Selected;
}
//---------------------------------------------------------------------------
void __fastcall TFireDAC_SQLiteForm::FireTaskListAfterConnect(TObject *Sender)
{
	FireTaskList->ExecSQL("CREATE TABLE IF NOT EXISTS Task (TaskName TEXT NOT NULL)");
}
//---------------------------------------------------------------------------

void __fastcall TFireDAC_SQLiteForm::FireTaskListBeforeConnect(TObject *Sender)
{
#if defined(TARGET_OS_IPHONE) || defined(TARGET_IPHONE_SIMULATOR)
	FireTaskList->Params->Values["Database"] = IncludeTrailingPathDelimiter(
		System::Ioutils::TPath::GetDocumentsPath()) + "tasks.s3db";
#else
	FireTaskList->Params->Values["Database"] = "tasks.s3db";
#endif
}
//---------------------------------------------------------------------------

