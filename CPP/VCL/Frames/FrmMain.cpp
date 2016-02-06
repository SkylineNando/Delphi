
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "FrmMain.h"
#include <ShlObj.h>
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
TForm1 *Form1;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent *AOwner)
		:TForm(AOwner)
{
}


String GetDataPath()
{
	return "..\\..\\..\\Data\\";
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *)
{

  if (!FileExists(GetDataPath() +"biolife.cds")) {
	ShowMessage("Unable to locate demo data at "+GetDataPath());
	return;
  }
  SimpleFrame->ClientDataSet1->FileName = GetDataPath() + "biolife.cds";
  SimpleFrame->FancyFrame1->DBMemo1->DataSource = SimpleFrame->DataSource1;
  SimpleFrame->FancyFrame1->DBMemo1->DataField = "Notes";
  SimpleFrame->FancyFrame1->DBImage1->DataSource = SimpleFrame->DataSource1;
  SimpleFrame->FancyFrame1->DBImage1->DataField = "Graphic";
  SimpleFrame->ClientDataSet1->Open();

  delete MDFrame->MasterFrame->FancyFrame1;
  MDFrame->MasterFrame->DataSource1->DataSet =  MDFrame->MasterFrame->ClientDataSet1;
  MDFrame->MasterFrame->ClientDataSet1->FileName = GetDataPath() + "Customer.cds";
  MDFrame->MasterFrame->ClientDataSet1->Open();

  delete MDFrame->DetailFrame->FancyFrame1;
  MDFrame->DetailFrame->ClientDataSet1->MasterSource = MDFrame->MasterFrame->DataSource1;
  MDFrame->DetailFrame->DataSource1->DataSet =  MDFrame->DetailFrame->ClientDataSet1;
  MDFrame->DetailFrame->ClientDataSet1->MasterFields = "CustNo";
  MDFrame->DetailFrame->ClientDataSet1->FileName = GetDataPath() + "orders.cds";
  MDFrame->DetailFrame->ClientDataSet1->Open();
}

