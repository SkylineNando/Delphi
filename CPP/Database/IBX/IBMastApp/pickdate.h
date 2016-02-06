//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#ifndef pickdateH
#define pickdateH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
//#include "CCALENDR.h"
//---------------------------------------------------------------------------
class TBrDateForm : public TForm
{
__published:	// IDE-managed Components
	TButton *OkBtn;
	TButton *CancelBtn;
	TMonthCalendar *MonthCalendar1;
private:	// User declarations
	void SetDate(TDateTime Date);
	TDateTime GetDate();
public:		// User declarations
	__property TDateTime Date={read=GetDate,write=SetDate};
	virtual __fastcall TBrDateForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TBrDateForm *BrDateForm;
//---------------------------------------------------------------------------
#endif
