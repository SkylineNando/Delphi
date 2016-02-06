
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

#include "VersionInfoSampleUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "VersionInfoComponent"
#pragma link "VersionInfoUI"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
   : TForm(Owner)
{

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btOKClick(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------




