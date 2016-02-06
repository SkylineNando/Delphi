// ---------------------------------------------------------------------------

#include <fmx.h>
#include <System.IOUtils.hpp>
#pragma hdrstop

#include "uMain.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TIBLiteForm *IBLiteForm;

// ---------------------------------------------------------------------------
__fastcall TIBLiteForm::TIBLiteForm(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TIBLiteForm::OnIdle(TObject* Sender, bool &Done) {
	DeleteButton->Visible = ListView1->Selected;
}

// ---------------------------------------------------------------------------

void __fastcall TIBLiteForm::AddButtonClick(TObject *Sender) {
	String TaskName;
	try {
		if (InputQuery("Enter New Task", "Task", TaskName) && !(Trim(TaskName) == "")) {
			SQLQueryInsert->ParamByName("TaskName")->AsString = TaskName;
			SQLQueryInsert->ExecSQL();
			SQLDataSetTask->Refresh();
			LinkFillControlToField1->BindList->FillList();
		}
	}
	catch (Exception &e) {
		ShowMessage(e.Message);
	}
}

// ---------------------------------------------------------------------------
void __fastcall TIBLiteForm::DeleteButtonClick(TObject *Sender) {
	String TaskName = ListView1->Selected->Text;
	try {
		SQLQueryDelete->ParamByName("TaskName")->AsString = TaskName;
		SQLQueryDelete->ExecSQL();
		SQLDataSetTask->Refresh();
		LinkFillControlToField1->BindList->FillList();
		if ((ListView1->Selected) && (ListView1->Items->Count > 0))
			// Select last item
				ListView1->ItemIndex = ListView1->Items->Count - 1;
	}
	catch (Exception &e) {
		ShowMessage(e.Message);
	}
}

// ---------------------------------------------------------------------------
void __fastcall TIBLiteForm::FormCreate(TObject *Sender)
{
	LinkFillControlToField1->AutoActivate = false;
	LinkFillControlToField1->AutoFill = false;
	Application->OnIdle = OnIdle;
	try {
	  TaskList->Connected = true;
	  SQLDataSetTask->Active = true;
	  LinkFillControlToField1->BindList->FillList();
	}
	catch (Exception &e) {
	  ShowMessage(e.Message);
	}
}
//---------------------------------------------------------------------------

void __fastcall TIBLiteForm::TaskListBeforeConnect(TObject *Sender)
{
#if defined(TARGET_OS_IPHONE) || defined(TARGET_IPHONE_SIMULATOR)
	TaskList->Params->Values["Database"] =
		IncludeTrailingPathDelimiter(System::Ioutils::TPath::GetDocumentsPath()) +"TASKS.GDB";

#endif
	TaskList->Params->Values["Username"] = "sysdba";
	TaskList->Params->Values["Password"] = "masterkey";
	TaskList->Params->Values["ServerCharSet"] = "UTF8";
}
//---------------------------------------------------------------------------

