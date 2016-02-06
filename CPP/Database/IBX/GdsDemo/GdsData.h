//---------------------------------------------------------------------------

#ifndef GdsDataH
#define GdsDataH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GdsStd.h"
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
//---------------------------------------------------------------------------
class TStdDataForm : public TGDSStdForm
{
__published:	// IDE-managed Components
	TDataSource *OrdersSource;
	TIBTransaction *IBTransaction1;
	TIBDatabase *Database;
	TIBDataSet *Orders;
	TFloatField *OrdersORDERNO;
	TFloatField *OrdersCUSTNO;
	TDateTimeField *OrdersSALEDATE;
	TDateTimeField *OrdersSHIPDATE;
	TIntegerField *OrdersEMPNO;
	TIBStringField *OrdersSHIPTOCONTACT;
	TIBStringField *OrdersSHIPTOADDR1;
	TIBStringField *OrdersSHIPTOADDR2;
	TIBStringField *OrdersSHIPTOCITY;
	TIBStringField *OrdersSHIPTOSTATE;
	TIBStringField *OrdersSHIPTOZIP;
	TIBStringField *OrdersSHIPTOCOUNTRY;
	TIBStringField *OrdersSHIPTOPHONE;
	TIBStringField *OrdersSHIPVIA;
	TIBStringField *OrdersPO;
	TIBStringField *OrdersTERMS;
	TIBStringField *OrdersPAYMENTMETHOD;
	TFloatField *OrdersITEMSTOTAL;
	TFloatField *OrdersTAXRATE;
	TFloatField *OrdersFREIGHT;
	TFloatField *OrdersAMOUNTPAID;
	TFloatField *OrdersAmountDue;
	TFloatField *OrdersTaxAmount;
	TStringField *OrdersCustName;
	TIBDataSet *Cust;
	TFloatField *CustCUSTNO;
	TIBStringField *CustCOMPANY;
	TIBStringField *CustADDR1;
	TIBStringField *CustADDR2;
	TIBStringField *CustCITY;
	TIBStringField *CustSTATE;
	TIBStringField *CustZIP;
	TIBStringField *CustCOUNTRY;
	TIBStringField *CustPHONE;
	TIBStringField *CustFAX;
	TFloatField *CustTAXRATE;
	TIBStringField *CustCONTACT;
	TDateTimeField *CustLASTINVOICEDATE;
	TPanel *StdCtrlPanel;
	TRadioGroup *FilterOnRadioGroup;
	TGroupBox *GroupBox1;
	TLabel *FilterOnLabel;
	TEdit *FilterCriteria;
	TCheckBox *FilterCheckBox;
	TButton *NextBtn;
	TButton *PriorBtn;
	void __fastcall FilterOnRadioGroupClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FilterCriteriaExit(TObject *Sender);
	void __fastcall FilterCriteriaKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall FilterCheckBoxClick(TObject *Sender);
	void __fastcall NextBtnClick(TObject *Sender);
	void __fastcall PriorBtnClick(TObject *Sender);

private:	// User declarations
protected:
	double FLastAmount;
	System::TDateTime FLastDate;
	double __fastcall CalcAmountDue(void);
	void __fastcall ConvertFilterCriteria(void);
public:		// User declarations
	__fastcall TStdDataForm(TComponent* Owner);
	void __fastcall OrdersFilterOnDate(Data::Db::TDataSet* DataSet, bool &Accept);
	void __fastcall OrdersFilterOnAmount(Data::Db::TDataSet* DataSet, bool &Accept);
	void __fastcall OrdersCalcFields(Data::Db::TDataSet* DataSet);
};
//---------------------------------------------------------------------------
extern PACKAGE TStdDataForm *StdDataForm;
//---------------------------------------------------------------------------
#endif
