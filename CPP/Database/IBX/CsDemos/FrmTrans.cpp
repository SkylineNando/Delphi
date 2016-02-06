// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FrmTrans.h"
#include "DMCSDemo.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmTransDemo *FrmTransDemo;

// ---------------------------------------------------------------------------
__fastcall TFrmTransDemo::TFrmTransDemo(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TFrmTransDemo::FormShow(TObject *Sender) {
	if (!DmEmployee->IBTransaction1->Active)
		DmEmployee->IBTransaction1->StartTransaction();
	if (DmEmployee->EmployeeTable->Active == False)
		DmEmployee->EmployeeTable->Open();
}
// ---------------------------------------------------------------------------

void __fastcall TFrmTransDemo::FormHide(TObject *Sender) {
	DmEmployee->IBTransaction1->Commit();
}
// ---------------------------------------------------------------------------

void __fastcall TFrmTransDemo::BtnCommitEditsClick(TObject *Sender) {
	if ((DmEmployee->IBTransaction1->InTransaction) &&
		(MessageDlg("Are you sure you want to commit your changes?",
		mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)) {
		DmEmployee->IBTransaction1->Commit();
		DmEmployee->IBTransaction1->StartTransaction();
		DmEmployee->EmployeeTable->Open();
		DmEmployee->EmployeeTable->Refresh();
	}
	else
		MessageDlg("Can't Commit Changes: No Transaction Active", mtError,
		TMsgDlgButtons() << TMsgDlgBtn::mbOK, 0);
}

// ---------------------------------------------------------------------------
void __fastcall TFrmTransDemo::BtnUndoEditsClick(TObject *Sender) {
	if (DmEmployee->IBTransaction1->InTransaction &&
		(MessageDlg
		("Are you sure you want to undo all changes made during the current transaction?",
		mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)) {
		DmEmployee->IBTransaction1->Rollback();
		DmEmployee->IBTransaction1->StartTransaction();
		DmEmployee->EmployeeTable->Open();
		DmEmployee->EmployeeTable->Refresh();
	}
	else
		MessageDlg("Can't Undo Edits: No Transaction Active", mtError,
		TMsgDlgButtons() << TMsgDlgBtn::mbOK, 0);
}
// ---------------------------------------------------------------------------
