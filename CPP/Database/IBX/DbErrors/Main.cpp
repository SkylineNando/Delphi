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

#include "Main.h"
#include "About.h"
#include "DM1.h"

// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;

// ---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TFrmMain::About1Click(TObject *Sender) {
	TFrmAbouBox *fmAboutBox = new TFrmAbouBox(this);
	fmAboutBox->ShowModal();

}
// ---------------------------------------------------------------------------
void __fastcall TFrmMain::GridCustomersEnter(TObject *Sender)
{
  DBNavigator1->DataSource = DM->CustomerSource;
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::GridCustomersExit(TObject *Sender)
{
// required if user clicks onto details
// after changing key so that cascaded
// update displays properly
if (DM->Customer->State==dsEdit || DM->Customer->State==dsInsert)
	DM->Customer->Post();


}

//---------------------------------------------------------------------------

void __fastcall TFrmMain::GridOrdersEnter(TObject *Sender)
{
  DBNavigator1->DataSource = DM->OrdersSource;
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::GridItemsEnter(TObject *Sender)
{
  DBNavigator1->DataSource = DM->ItemsSource;
}
//---------------------------------------------------------------------------

