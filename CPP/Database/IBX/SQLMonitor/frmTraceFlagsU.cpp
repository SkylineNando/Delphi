//---------------------------------------------------------------------------

#include <vcl.h>

#pragma hdrstop

#include "frmTraceFlagsU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmTraceFlags *frmTraceFlags;
//---------------------------------------------------------------------------
__fastcall TfrmTraceFlags::TfrmTraceFlags(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------


TTraceFlags __fastcall TfrmTraceFlags::GetTraceFlags(void)
{
	TTraceFlags Result;
	Result = TTraceFlags();

  if(CheckBox1->Checked)
	Result<<tfQPrepare;
  if(CheckBox2->Checked)
	Result<<tfQExecute;
  if(CheckBox3->Checked)
	Result<<tfQFetch;
  if(CheckBox4->Checked)
	Result<<tfError;
  if(CheckBox5->Checked)
	Result<<tfStmt;
  if(CheckBox6->Checked)
	Result<<tfConnect;
  if(CheckBox7->Checked)
	Result<<tfTransact;
  if(CheckBox8->Checked)
	Result<<tfBlob;
  if(CheckBox9->Checked)
	Result<<tfService;
  if(CheckBox10->Checked)
	Result<<tfMisc;

  return Result;

}

void __fastcall TfrmTraceFlags::SetTraceFlags(TTraceFlags flags)
{
  CheckBox1->Checked = flags.Contains(tfQPrepare);
  CheckBox2->Checked = flags.Contains(tfQExecute);
  CheckBox3->Checked = flags.Contains(tfQFetch);
  CheckBox4->Checked = flags.Contains(tfError);
  CheckBox5->Checked = flags.Contains(tfStmt);
  CheckBox6->Checked = flags.Contains(tfConnect);
  CheckBox7->Checked = flags.Contains(tfTransact);
  CheckBox8->Checked = flags.Contains(tfBlob);
  CheckBox9->Checked = flags.Contains(tfService);
  CheckBox10->Checked = flags.Contains(tfMisc);
}

