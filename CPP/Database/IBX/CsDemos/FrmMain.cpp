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

#include "FrmMain.h"
#include "FrmViews.h"
#include "FrmTrigg.h"
#include "FrmTrans.h"
#include "FrmQrySP.h"
#include "FrmExeSP.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmLauncher *FrmLauncher;
//---------------------------------------------------------------------------
__fastcall TFrmLauncher::TFrmLauncher(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmLauncher::BtnCloseClick(TObject *Sender)
{
Close();
}
//---------------------------------------------------------------------------
void __fastcall TFrmLauncher::BtnViewsClick(TObject *Sender)
{
  FrmViewDemo->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFrmLauncher::BtnTriggClick(TObject *Sender)
{
  FrmTriggerDemo->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFrmLauncher::BtnQrySPClick(TObject *Sender)
{
  FrmQueryProc->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFrmLauncher::BtnExecSPClick(TObject *Sender)
{
  FrmExecProc->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFrmLauncher::BtnTransClick(TObject *Sender)
{
  FrmTransDemo->ShowModal();
}
//---------------------------------------------------------------------------

