
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

#include "MainUnit.h"
#pragma package(smart_init)
#pragma resource "*.dfm"
#pragma link "Vcl.XPMan"

//---------------------------------------------------------------------------
TMainForm *MainForm;

   // controls to create
  const MAX_CTRLS = 60;
  // String representation of the FlowStyles
  const int FlowStylesCount = 8;
  const String FlowStyles[] = {
   "fsLeftRightTopBottom",
   "fsRightLeftTopBottom",
   "fsLeftRightBottomTop",
   "fsRightLeftBottomTop",
   "fsTopBottomLeftRight",
   "fsBottomTopLeftRight",
   "fsTopBottomRightLeft",
   "fsBottomTopRightLeft"   };

//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent *AOwner)
	:TForm(AOwner)
{
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::bExitClick(TObject *)
{
  Close();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::cboxFlowStyleChange(TObject *)
{
  FlowPanel1->FlowStyle = TFlowStyle(cboxFlowStyle->ItemIndex);
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *)
{
  // container to hold the created controls
  // make the object list destroy the created controls
  FControlList = new TObjectList(true);

  // place all of the flowstyle strings into the combobox
  for(int i=0; i<FlowStylesCount; ++i) {
	cboxFlowStyle->Items->Add(FlowStyles[i]);
  }

  // if the flow style combobox has entries select the first one
  if( cboxFlowStyle->Items->Count > 0 ) {
	cboxFlowStyle->ItemIndex = 0;
	CreateControls();
  }
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormDestroy(TObject *)
{
  // free the container of controls created
  delete FControlList;
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::CreateControls()
{
  FlowPanel1->FlowStyle = TFlowStyle(cboxFlowStyle->ItemIndex);
  FControlList->Clear();
  for(int i = 1; i < MAX_CTRLS; ++i) {
	TEdit *lEdit = new TEdit(this);
	lEdit->Parent = FlowPanel1;
	lEdit->Text = Format("Control %d", ARRAYOFCONST((i)));
	FControlList->Add(lEdit);
  }
}

