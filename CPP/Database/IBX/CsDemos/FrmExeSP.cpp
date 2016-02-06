// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "DMCSDemo.h"
#include "FrmExeSP.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmExecProc *FrmExecProc;

// ---------------------------------------------------------------------------
__fastcall TFrmExecProc::TFrmExecProc(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TFrmExecProc::FormShow(TObject *Sender) {
	DmEmployee->SalesTable->Open();
	DmEmployee->CustomerTable->Open();
	// Enable DataEvents from the SalesTable for this form now
	SalesSource->Enabled = true;
}
// ---------------------------------------------------------------------------

void __fastcall TFrmExecProc::FormHide(TObject *Sender) {
	// Disable DataEvents from the SalesTable for this form now
	SalesSource->Enabled = false;
}
// ---------------------------------------------------------------------------

void __fastcall TFrmExecProc::SalesSourceDataChange(TObject *Sender,
	TField *Field)

{
	if (DmEmployee->SalesTable->FieldByName("ORDER_STATUS") != NULL)
		BtnShipOrder->Enabled = DmEmployee->SalesTable->FieldByName
			("ORDER_STATUS") != "SHIPPED";
}

// ---------------------------------------------------------------------------
void __fastcall TFrmExecProc::BtnShipOrderClick(TObject *Sender) {
	DmEmployee->ShipOrderProc->Params->Items[0]->AsString =
		DmEmployee->SalesTable->FieldByName("PO_NUMBER")->AsString;
	DmEmployee->ShipOrderProc->ExecProc();
	DmEmployee->SalesTable->Refresh();
}
// ---------------------------------------------------------------------------
