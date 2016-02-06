// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Errform.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TUpdateErrorForm *UpdateErrorForm;

// ---------------------------------------------------------------------------
__fastcall TUpdateErrorForm::TUpdateErrorForm(TComponent* Owner) : TForm(Owner)
{
}

// ---------------------------------------------------------------------------
Ibcustomdataset::TIBUpdateAction __fastcall TUpdateErrorForm::HandleError
	(Data::Db::TDataSet* DataSet, Data::Db::EDatabaseError* E,
	Data::Db::TUpdateKind UpdateKind) {
	const System::UnicodeString UpdateKindStr[3] = {
		"Modified", "Inserted", "Deleted"};
	// Put the error context information into the labels on the form
	UpdateType->Caption = UpdateKindStr[UpdateKind];
	ErrorText->Caption = E->Message;
	// Fill the string grid with the update field values
	GetFieldValues(DataSet);
	ShowModal();
	switch (ModalResult) {
	case mrRetry:
		// If user wants to retry, then put any changed values from the
		// string grid back into the associated field's NewValue property }
		SetFieldValues(DataSet);
		return Ibcustomdataset::uaRetry;
		break;
	case mrIgnore:
		return Ibcustomdataset::uaSkip;
		break;
	default:
		return Ibcustomdataset::uaAbort;
	}
}

// ---------------------------------------------------------------------------
void __fastcall TUpdateErrorForm::GetFieldValues(Data::Db::TDataSet* DataSet) {
	int i;
	TField *F;
	TObject *O;

	// Create a list of the data fields in the dataset, and store them in
	// a stringlist which we can use to determine which values the user
	// has edited

	FDataFields->Clear();
	for (i = 1; i < DataSet->FieldCount; i++) {
		F = DataSet->Fields->FieldByNumber(i);
		if (F->FieldKind == fkData)
			{
			O =  dynamic_cast<TObject *>(DataSet->Fields->FieldByNumber(i));
			FDataFields->AddObject("",O);
			}
	}

	// Now fill up the string grid with the Old and New values of each field.
	// OldValue and NewValue are public properties of TDataSet which are used
	// from within the OnUpdateError event handler to determine what data a
	// user has updated.  We use the VarToStr RTL function to ensure that null
	// fields are displayed as blank strings

	UpdateData->RowCount = FDataFields->Count + 1;
	for (i = 0; i < FDataFields->Count - 1; i++) {
		O = dynamic_cast<TObject *>(FDataFields->Objects[i]);
		F = dynamic_cast<TField *>(O);
		UpdateData->Cells[0][i+1] = VarToStr(F->NewValue);
		UpdateData->Cells[1][i+1] = VarToStr(F->OldValue);
	}

}

void __fastcall TUpdateErrorForm::SetFieldValues(Data::Db::TDataSet* DataSet) {
	int i;
	TField *F;
	for (i = 0; i < FDataFields->Count; i++) {
		// We set the string in the data field list to '*' for any fields the
		// user edited in the string grid.  Those are the only fields we need
		// to write back into the associated TField's NewValue property
		if (FDataFields->Strings[i] == "*") {
			F = new TField(dynamic_cast<TComponent*>(FDataFields->Objects[i]));
			F->NewValue = UpdateData->Cells[0][ i + 1];
		}
	}
}
void __fastcall TUpdateErrorForm::FormCreate(TObject *Sender)
{
  FDataFields = new TStringList(NULL);
  // Fill in the titles of the string grid
  UpdateData->Cells[0][0] = "New Value";
  UpdateData->Cells[1][0] = "Old Value";
}
//---------------------------------------------------------------------------

void __fastcall TUpdateErrorForm::FormDestroy(TObject *Sender)
{
  free(FDataFields);
}
//---------------------------------------------------------------------------

void __fastcall TUpdateErrorForm::UpdateDataSetEditText(System::TObject* Sender, int ACol, int ARow, const System::UnicodeString Value)
{
  // Set a flag in the list of datafields indicating that this value was changed.
  FDataFields->Strings[ARow - 1] = "*";
}
