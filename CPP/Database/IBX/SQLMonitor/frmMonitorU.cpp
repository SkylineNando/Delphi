// ---------------------------------------------------------------------------

#include <vcl.h>
#include <System.SysUtils.hpp>
#include <System.hpp>
#include <stdlib.h>
#pragma hdrstop

#include "frmMonitorU.h"
#include "frmTraceFlagsU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMonitor *frmMonitor;

// ---------------------------------------------------------------------------
__fastcall TfrmMonitor::TfrmMonitor(TComponent* Owner) : TForm(Owner) {
	mon = new TIBSQLMonitor(this);
	mon->OnSQL = IBSQLMonitor1SQL;
}

//----------------------------------------------------------------------------
__fastcall TfrmMonitor::~TfrmMonitor(void ) {

}

// ---------------------------------------------------------------------------
void __fastcall TfrmMonitor::IBSQLMonitor1SQL(UnicodeString EventText,
	TDateTime EventTime) {

	System::UnicodeString s, rest;
	int Start, Ending, len;
	char *FBuffer, *tmp;
	WideChar *pp;

	TListItem *Item;
	Item = ListView1->Items->Add();
	Item->Caption = FormatDateTime("hh:nn:ss.zzz", EventTime);
	rest = EventText.SubString(EventText.Pos1("]")+3, EventText.Length());
	Item->SubItems->Add(rest.SubString(1,rest.Pos1("]")));

	len = EventText.Length() * sizeof(Char);
	FBuffer = (char *)malloc(len + sizeof(int));
	tmp = FBuffer;
	memcpy(tmp,  &len, sizeof(int));
	pp = EventText.c_str();
	tmp = tmp + sizeof(int)*sizeof(char);
	memcpy(tmp,pp,len);
	Item->Data = FBuffer;

}

// ---------------------------------------------------------------------------
void _fastcall TfrmMonitor::Clear1Click(TObject* Sender) {
	Integer i;

	Memo1->Lines->Clear();
	ListView1->Items->BeginUpdate();
	for (i = 0; i <= (ListView1->Items->Count) - 1; i++) {
		free(ListView1->Items->Item[i]->Data);
		ListView1->Items->Item[i]->Data = NULL;
	}
	ListView1->Items->Clear();
	ListView1->Items->EndUpdate();

}

void __fastcall TfrmMonitor::Monitoring1Click(TObject* Sender) {
	TMenuItem *menuItem = (dynamic_cast<TMenuItem *>(Sender));
	menuItem->Checked = !menuItem->Checked;
	mon->Enabled = menuItem->Checked;
}

void __fastcall TfrmMonitor::Flags1Click(TObject* Sender) {

	TfrmTraceFlags *frmTraceFlags = new TfrmTraceFlags(this);
	try {
		frmTraceFlags->SetTraceFlags(mon->TraceFlags);
		if (frmTraceFlags->ShowModal() == true)
			mon->TraceFlags = frmTraceFlags->GetTraceFlags();
	}
	catch (Exception *e) {
		ShowMessage("Exception Monitor:" + e->Message);
	}
}

// --------------------------------------------------------------------------
void __fastcall TfrmMonitor::ListView1SelectItem(TObject* Sender,
	TListItem* Item, bool Selected) {

	wchar_t *wpst, *wst;
	if (Selected) {
		Memo1->Lines->Clear();
		wpst = (wchar_t *)Item->Data;
		wst = wpst + sizeof(int);
		Memo1->Lines->Add(wst);
	}
}
