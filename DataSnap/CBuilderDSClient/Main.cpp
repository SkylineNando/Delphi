// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
#include "Login.h"
#include "DMClient.h"
#include <except.h>
#include <DBXCDSReaders.hpp>
#include <memory>
#include "RecError.h"
#include "DSCClientProxy.h"

// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;

// ---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::Button4Click(TObject *Sender) {

	std::auto_ptr<TDSServerMethodsClient>Sm
		(new TDSServerMethodsClient
		(DMClientContainer->MyDSServer->DBXConnection, false));

	try {
		LBDateTime->Caption = DateTimeToStr(Sm->GetServerDateTime());
	}
	catch (Exception &E) {
		MessageDlg(__ThrowExceptionName(), mtError,
		TMsgDlgButtons() << mbOK, 0);
	}
}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::Button1Click(TObject *Sender) {
  if (CDSProject->ApplyUpdates(-1) > 0) {
	 MessageDlg("Error during the applyupdates!!!", mtError, TMsgDlgButtons() << mbOK, 0);
  }
  else {
	 MessageDlg("Record saved!!!", mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
// ---------------------------------------------------------------------------

void __fastcall TFrmMain::Button2Click(TObject *Sender) {
  CDSBudget->Open();
  CDSDepartment->Open();
  CDSEmployee->Open();

}
// ---------------------------------------------------------------------------

void __fastcall TFrmMain::Button3Click(TObject *Sender) {
  CDSBudget->Close();
  CDSDepartment->Close();
  CDSEmployee->Close();

}
// ---------------------------------------------------------------------------

void __fastcall TFrmMain::BTGetDepartamentClick(TObject *Sender) {

	std::auto_ptr<TDepartmentClient>Sm
		(new TDepartmentClient(DMClientContainer->MyDSServer->DBXConnection,
		false));

	BTGetDepartament->Caption = "Get Departament (" + Sm->OrderByField() + ")";

	std::auto_ptr<TDBXReader>reader(Sm->GetDepartmentsOrderBy());
	if (reader.get()) {
		Memo1->Lines->Clear();

		while (reader->Next()) {
			Memo1->Lines->Add(reader->Value[0]->GetAnsiString() + " - " +
				reader->Value[1]->GetAnsiString());
		}

	}

}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::Button8Click(TObject *Sender) {

	std::auto_ptr<TDepartmentClient>Sm
		(new TDepartmentClient(DMClientContainer->MyDSServer->DBXConnection,
		false));
	Sm->DepartmentOrderByID();

}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::Button6Click(TObject *Sender) {
	std::auto_ptr<TDepartmentClient>Sm
		(new TDepartmentClient(DMClientContainer->MyDSServer->DBXConnection,
		false));
	Sm->DepartmentOrderByName();

}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::Button7Click(TObject *Sender) {
	std::auto_ptr<TDepartmentClient>Sm
		(new TDepartmentClient(DMClientContainer->MyDSServer->DBXConnection,
		false));

	TParams* Params = new TParams();
	Params->CreateParam(ftString, "DEPARTMENT", ptInput)->Value =
		"New Department";
	Params->CreateParam(ftString, "HEAD_DEPT", ptInput)->Value = "000";
	Params->CreateParam(ftString, "MNGR_NO", ptInput)->Value = "105";
	Params->CreateParam(ftString, "BUDGET", ptInput)->Value = 100000;
	Params->CreateParam(ftString, "LOCATION", ptInput)->Value = "Scotts Valley";
	Params->CreateParam(ftString, "PHONE_NO", ptInput)->Value = "N/A";

	Sm->Insert(Params);

}
// ---------------------------------------------------------------------------

void __fastcall TFrmMain::Button13Click(TObject *Sender) {

	std::auto_ptr<TDMDataSet6Client>Sm
		(new TDMDataSet6Client(DMClientContainer->MyDSServer->DBXConnection,
		false));

	std::auto_ptr<TDBXReader>reader(Sm->GetDepartments());
	if (reader.get()) {
		TDBXClientDataSetReader::CopyReaderToClientDataSet(reader.get(),
			DMClientContainer->CDSCopy);
	}
}
// ---------------------------------------------------------------------------

void __fastcall TFrmMain::Button5Click(TObject *Sender) {

	std::auto_ptr<TDSServerMethodsClient>Sm
		(new TDSServerMethodsClient
		(DMClientContainer->MyDSServer->DBXConnection, false));

	Sm->ExecuteJob(DMClientContainer->CDSJobsJOBID->Value);
}
// ---------------------------------------------------------------------------



void __fastcall TFrmMain::Button9Click(TObject *Sender)
{
 CDSProject->CancelUpdates();

}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::CDSProjectReconcileError(TCustomClientDataSet *DataSet,
          EReconcileError *E, TUpdateKind UpdateKind, TReconcileAction &Action)

{
  HandleReconcileError(this, DataSet, UpdateKind, E);
}
//---------------------------------------------------------------------------


void __fastcall TFrmMain::StyleClick(TObject *Sender)
{
  String StyleName = StringReplace(((TMenuItem*)(Sender))->Caption, "&", "",
	TReplaceFlags() << rfReplaceAll << rfIgnoreCase);
  TStyleManager::TrySetStyle(StyleName);
  FrmMain->Show();

}

void __fastcall TFrmMain::FormCreate(TObject *Sender)
{
  PMStyles->Items->Clear();

  String Style;
  for (int i = 0; i < TStyleManager::StyleNames.Length-1; i++) {
	Style = TStyleManager::StyleNames[i];
	TMenuItem* Item  = new TMenuItem(this);
	Item->Caption = Style;
	Item->OnClick = StyleClick;
	PMStyles->Items->Add(Item);
  }
}
//---------------------------------------------------------------------------


void __fastcall TFrmMain::Button12Click(TObject *Sender)
{
  DSJobs->DataSet->Open();
}
//---------------------------------------------------------------------------

