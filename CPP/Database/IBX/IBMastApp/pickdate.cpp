//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "pickdate.h"
//---------------------------------------------------------------------------
//#pragma link "CCALENDR"
#pragma resource "*.dfm"
TBrDateForm *BrDateForm;
//---------------------------------------------------------------------------
__fastcall TBrDateForm::TBrDateForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TBrDateForm::SetDate(TDateTime Date)
{
  MonthCalendar1->Date = Date;
}

//---------------------------------------------------------------------------
TDateTime TBrDateForm::GetDate()
{
  TDateTime Date = MonthCalendar1->Date;
  return Date;
}
/*---------------------------------------------------------------------------
void __fastcall TBrDateForm::PrevMonthBtnClick(TObject *Sender)
{
  Calendar1->PrevMonth();
}
//---------------------------------------------------------------------------
void __fastcall TBrDateForm::NextMonthBtnClick(TObject *Sender)
{
  Calendar1->NextMonth();
}
//---------------------------------------------------------------------------
void __fastcall TBrDateForm::Calendar1Change(TObject *Sender)
{
   TitleLabel->Caption = FormatDateTime("MMMM, YYYY", Calendar1->CalendarDate);
}
*/
//---------------------------------------------------------------------------
