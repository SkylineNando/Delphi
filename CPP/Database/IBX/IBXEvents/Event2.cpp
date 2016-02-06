//---------------------------------------------------------------------------


#pragma hdrstop
#include "Event1.h"
#include "Event2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdmEvents *dmEvents;
//---------------------------------------------------------------------------
__fastcall TdmEvents::TdmEvents(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TdmEvents::IBEventAlerter1EventAlert(TObject *Sender, UnicodeString EventName,
          int EventCount, bool &CancelAlerts)
{
  frmEvents->lbReceived->Items->Add(EventName);
}
//---------------------------------------------------------------------------
