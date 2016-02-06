// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GdsData.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GdsStd"
#pragma resource "*.dfm"
TStdDataForm *StdDataForm;

// ---------------------------------------------------------------------------
__fastcall TStdDataForm::TStdDataForm(TComponent* Owner) : TGDSStdForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::FilterOnRadioGroupClick(TObject *Sender) {

	FilterOnLabel->Caption = "Records where " +
		FilterOnRadioGroup->Items->Strings[FilterOnRadioGroup->ItemIndex] + " >=";
	switch (FilterOnRadioGroup->ItemIndex) {
	case 0:
		Orders->OnFilterRecord = OrdersFilterOnDate;
		FilterCriteria->Text = DateToStr(FLastDate);
		break;
	case 1:
		Orders->OnFilterRecord = OrdersFilterOnAmount;
		FilterCriteria->Text = FloatToStr(FLastAmount);
		break;
	}
	ActiveControl = FilterCriteria;
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::FormCreate(TObject *Sender) {
	FLastDate = EncodeDate(2010, 1, 1);
	FLastAmount = 1000;
	FilterOnRadioGroup->ItemIndex = 0;
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::OrdersFilterOnDate(Data::Db::TDataSet* DataSet,
	bool &Accept) {
	Accept = Orders->FieldByName("SaleDate")->Value >= FLastDate;
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::OrdersFilterOnAmount(Data::Db::TDataSet* DataSet,
	bool &Accept) {
	double d = CalcAmountDue();
	Accept = d >= FLastAmount;
}

// ---------------------------------------------------------------------------
double __fastcall TStdDataForm::CalcAmountDue(void) {
	return Orders->FieldByName("ItemsTotal")->AsFloat *
		(1.0 + Orders->FieldByName("TaxRate")->AsFloat / 100) +
		Orders->FieldByName("freight")->AsFloat - Orders->FieldByName
		("AmountPaid")->AsFloat;
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::ConvertFilterCriteria(void) {
	if (FilterCriteria->Text != "") {
		switch (FilterOnRadioGroup->ItemIndex) {
		case 0:
			FLastDate = StrToDate(FilterCriteria->Text);
			break;
		case 1:
			FLastAmount = StrToFloat(FilterCriteria->Text);
			break;
		}
	}
	if (Orders->Filtered)
		Orders->Refresh();
}

// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::FilterCriteriaExit(TObject *Sender) {
	ConvertFilterCriteria();
}
// ---------------------------------------------------------------------------

void __fastcall TStdDataForm::FilterCriteriaKeyPress(TObject *Sender,
	System::WideChar &Key)

{
	if (Key == 13) {
		ConvertFilterCriteria();
		Key = 0;
	}

}
// ---------------------------------------------------------------------------
void __fastcall TStdDataForm::FilterCheckBoxClick(TObject *Sender)
{
  ConvertFilterCriteria();
  Orders->Filtered = FilterCheckBox->Checked;
  NextBtn->Enabled = !FilterCheckBox->Checked;
  PriorBtn->Enabled = !FilterCheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TStdDataForm::NextBtnClick(TObject *Sender)
{
  ConvertFilterCriteria();
  Orders->FindNext();
}
//---------------------------------------------------------------------------

void __fastcall TStdDataForm::PriorBtnClick(TObject *Sender)
{
  ConvertFilterCriteria();
  Orders->FindPrior();
}
//---------------------------------------------------------------------------

void __fastcall TStdDataForm::OrdersCalcFields(Data::Db::TDataSet* DataSet)
{
  double d = CalcAmountDue();
  OrdersTaxAmount->Value = Orders->FieldByName("ItemsTotal")->AsFloat * (Orders->FieldByName("TaxRate")->AsFloat / 100);
  OrdersAmountDue->Value = d;
}
