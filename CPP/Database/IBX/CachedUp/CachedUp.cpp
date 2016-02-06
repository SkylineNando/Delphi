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

#include <System.TypInfo.hpp>
#include <IBCustomDataSet.hpp>	// Pascal unit
#include "CachedUp.h"
#include "DataMod.h"
#include "About.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TCacheDemoForm *CacheDemoForm;

// ---------------------------------------------------------------------------
__fastcall TCacheDemoForm::TCacheDemoForm(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TCacheDemoForm::FormCreate(TObject *Sender) {
	FDataSet = (dynamic_cast<TIBCustomDataSet*>(CachedData->CacheDS->DataSet));
	FDataSet->Close();
	SetControlStates(true);
	FDataSet->Open();
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::SetControlStates(bool Enabled) {
	ApplyUpdatesBtn->Enabled = Enabled;
	CancelUpdatesBtn->Enabled = Enabled;
	RevertRecordBtn->Enabled = Enabled;
	UnmodifiedCB->Enabled = Enabled;
	ModifiedCB->Enabled = Enabled;
	InsertedCB->Enabled = Enabled;
	DeletedCB->Enabled = Enabled;
}

// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::ToggleUpdateMode(System::TObject* Sender) {
	bool NewState;
	// Toggle the state of the CachedUpdates property
	if (IsPublishedProp(FDataSet, "CachedUpdates")) {
		FDataSet->Close();
		NewState = !GetOrdProp(FDataSet, "CachedUpdates");
		SetOrdProp(FDataSet, "CachedUpdates", NewState);
		// Enable/Disable Controls
		SetControlStates(NewState);
		FDataSet->Open();
	}
}

// ---------------------------------------------------------------------------
void __fastcall TCacheDemoForm::miAboutClick(TObject *Sender) {
	ShowAboutDialog();
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::ReExecuteButtonClick(TObject *Sender) {
	FDataSet->Close();
	FDataSet->Open();
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::btnUpdateStatusClick(TObject *Sender) {
	switch (FDataSet->UpdateStatus()) {
	case usUnmodified:
		ShowMessage("Unmodified");
		break;
	case usModified:
		ShowMessage("Modified");
		break;
	case usInserted:
		ShowMessage("Inserted");
		break;
	case usDeleted:
		ShowMessage("Deleted");
		break;
	}
}

// ---------------------------------------------------------------------------
void __fastcall TCacheDemoForm::RadioGroup1Click(TObject *Sender) {
	TIBCustomDataSet *NewDataSet;
	switch ((dynamic_cast<TRadioGroup*>(Sender))->ItemIndex) {
	case 0:
		NewDataSet = CachedData->IBCacheQuery;
		break;
	case 1:
		NewDataSet = CachedData->IBCachedDataSet;
		break;
	default:
		NewDataSet = CachedData->IBCachedTable;
	}
	if (NewDataSet != FDataSet) {
		if (FDataSet->UpdatesPending) {
			if (MessageDlg
				("Updates Pending.  Are you certain you want to discard?",
				mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrNo) {
				RadioGroup1->ItemIndex = FDataSet->Tag;
				exit(0);
			}
		}
		FDataSet->Close();
		FDataSet = NewDataSet;
		CachedData->CacheDS->DataSet = FDataSet;
		FDataSet->Open();
	}
}

// ---------------------------------------------------------------------------
void __fastcall TCacheDemoForm::ApplyUpdatesBtnClick(TObject *Sender) {
	TDataSet *ds = dynamic_cast<TDataSet*>(FDataSet);
	TDataSet *dsp[1];
	dsp[0] = ds;
	TDataSet* const *pdsa = &dsp[0];
	FDataSet->Database->ApplyUpdates(pdsa, 1);
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::CancelUpdatesBtnClick(TObject *Sender) {
	FDataSet->CancelUpdates();
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::RevertRecordBtnClick(TObject *Sender) {
	FDataSet->RevertRecord();
}
// ---------------------------------------------------------------------------

void __fastcall TCacheDemoForm::UpdateRecordsToShow(System::TObject* Sender) {
	TIBUpdateRecordTypes UpdRecTypes = TIBUpdateRecordTypes();
	if (UnmodifiedCB->Checked)
		UpdRecTypes << cusUnmodified;
	if (ModifiedCB->Checked)
		UpdRecTypes << cusModified;
	if (InsertedCB->Checked)
		UpdRecTypes << cusInserted;
	if (DeletedCB->Checked)
		UpdRecTypes << cusDeleted;
	FDataSet->UpdateRecordTypes = UpdRecTypes;
}
