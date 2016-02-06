//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#include <IBSQLMonitor.hpp>


#pragma hdrstop

#include "frmMainU.h"
#include "frmMonitorU.h"
#include "frmConnectU.h"
#include "frmTraceFlagsU.h"

// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;

// ---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner) : TForm(Owner) {
}

// -------------------------------------------------------
void __fastcall TfrmMain::RunClick(TObject* Sender) {

	Memo2->Lines->Clear();
	IBDataSet1->Close();
	IBDataSet1->SelectSQL->Clear();
	IBDataSet1->SelectSQL->AddStrings(Memo1->Lines);
	IBDataSet1->Open();
	Label1->Caption = "Line count = " + IntToStr(Memo2->Lines->Count);
}

// -------------------------------------------------------
void __fastcall TfrmMain::IBSQLMonitor1SQL(UnicodeString EventText,
	TDateTime EventTime) {

	Memo2->Lines->Add(EventText);
	Label1->Caption = "Memo line count = " + IntToStr(Memo2->Lines->Count);
}

// -------------------------------------------------------
void __fastcall TfrmMain::LaunchClick(TObject* Sender) {
	TfrmMonitor *frmMonitor = new TfrmMonitor(this);
	frmMonitor->Show();

}

// -------------------------------------------------------
void __fastcall TfrmMain::Clear1Click(TObject* Sender) {
	Memo2->Lines->Clear();
}

// -------------------------------------------------------
void __fastcall TfrmMain::Trace2Click(TObject* Sender) {
	TMenuItem *menuItem = (dynamic_cast<TMenuItem *>(Sender));
	menuItem->Checked = !menuItem->Checked;
	if(menuItem->Checked) {
		EnableMonitoring();
	}
	else {
		DisableMonitoring();
	}
}

// -------------------------------------------------------
void __fastcall TfrmMain::Connect3Click(TObject* Sender) {
	TfrmConnect *frmConnect = new TfrmConnect(this);
	try {
		if (frmConnect->ShowModal() == true) {
			btnRun->Enabled = false;
			IBDataSet1->Active = false;
			IBTransaction1->Active = false;
			IBDatabase1->Connected = false;
			IBDatabase1->DatabaseName = frmConnect->edtDatabase->Text;
			IBDatabase1->Params->Clear();

			this->IBDatabase1->Params->Add
				("user_name=" + frmConnect->edtUser->Text);
			this->IBDatabase1->Params->Add
				("password=" + frmConnect->edtPassword->Text);
			if (frmConnect->edtRole->Text != "")
				IBDatabase1->Params->Add("ROLE=" + frmConnect->edtRole->Text);
			IBDatabase1->Connected = true;
			IBTransaction1->Active = true;
			btnRun->Enabled = true;
		}
	}
	catch (Exception *e) {
	}
}

// -------------------------------------------------------
void __fastcall TfrmMain::SQLMonitor1Click(TObject* Sender) {
	TMenuItem *menuItem = (dynamic_cast<TMenuItem *>(Sender));
	menuItem->Checked = !menuItem->Checked;
	IBSQLMonitor1->Enabled = menuItem->Checked;
}

// -------------------------------------------------------
void __fastcall TfrmMain::Database1Click(TObject* Sender) {
	TfrmTraceFlags *frmTraceFlags = new TfrmTraceFlags(this);
	try {
		frmTraceFlags->SetTraceFlags(IBDatabase1->TraceFlags);
		if (frmTraceFlags->ShowModal() == true)
			IBDatabase1->TraceFlags = frmTraceFlags->GetTraceFlags();
	}
	catch (Exception *e) {
		ShowMessage("Exception: " + e->Message);
	}
}

// -------------------------------------------------------
void __fastcall TfrmMain::MonitorHook1Click(TObject* Sender) {
	TfrmTraceFlags *frmTraceFlags = new TfrmTraceFlags(this);
	try {
		frmTraceFlags->SetTraceFlags(MonitorHook()->TraceFlags);
		if (frmTraceFlags->ShowModal() == IDOK)
			MonitorHook()->TraceFlags = frmTraceFlags->GetTraceFlags();
	}
	catch (Exception *e) {
		ShowMessage("Exception: " + e->Message);
	}
}

// -------------------------------------------------------
void __fastcall TfrmMain::SQLMonitor2Click(TObject* Sender) {
	TfrmTraceFlags *frmTraceFlags = new TfrmTraceFlags(this);
	try {
		frmTraceFlags->SetTraceFlags(IBSQLMonitor1->TraceFlags);
		if (frmTraceFlags->ShowModal() == IDOK)
			IBSQLMonitor1->TraceFlags = frmTraceFlags->GetTraceFlags();
	}
	catch (Exception *e) {
		ShowMessage("Exception: " + e->Message);
	}
}

// -------------------------------------------------------
void __fastcall TfrmMain::MonitorCount1Click(TObject* Sender) {
	ShowMessage("Monitor count = " + IntToStr(MonitorHook()->GetMonitorCount()));
}
