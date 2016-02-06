//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Event1.h"
#include "Event2.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmEvents *frmEvents;

// ---------------------------------------------------------------------------
__fastcall TfrmEvents::TfrmEvents(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TfrmEvents::btnOpenDatabaseClick(TObject *Sender) {
	dmEvents->Database1->Connected = true;
	GroupBox2->Enabled = true;
	GroupBox3->Enabled = true;
	GroupBox4->Enabled = true;
	Label1->Enabled = true;
	btnGenerateEvent->Enabled = true;
	btnRegisterEvents->Enabled = true;
	btnClearEvents->Enabled = true;
	btnCloseDatabase->Enabled = true;
	btnOpenDatabase->Enabled = false;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmEvents::btnCloseDatabaseClick(TObject *Sender) {
	dmEvents->IBEventAlerter1->UnRegisterEvents();
	dmEvents->Database1->Connected = false;
	GroupBox2->Enabled = false;
	GroupBox3->Enabled = false;
	GroupBox4->Enabled = false;
	Label1->Enabled = false;
	btnGenerateEvent->Enabled = false;
	btnRegisterEvents->Enabled = false;
	btnClearEvents->Enabled = false;
	btnCloseDatabase->Enabled = false;
	btnOpenDatabase->Enabled = true;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmEvents::btnGenerateEventClick(TObject *Sender) {
	dmEvents->IBTransaction1->StartTransaction();
	dmEvents->StoredProc1->Prepare();
	dmEvents->StoredProc1->Params->Items[0]->AsString = ebEvent->Text;
	dmEvents->StoredProc1->ExecProc();
	dmEvents->IBTransaction1->Commit();
}
// ---------------------------------------------------------------------------

void __fastcall TfrmEvents::btnRegisterEventsClick(TObject *Sender) {
	dmEvents->IBEventAlerter1->UnRegisterEvents();
	dmEvents->IBEventAlerter1->Events->Assign(moRegister->Lines);
	dmEvents->IBEventAlerter1->RegisterEvents();
}
// ---------------------------------------------------------------------------
void __fastcall TfrmEvents::btnClearEventsClick(TObject *Sender)
{
  lbReceived->Clear();
}
//---------------------------------------------------------------------------

