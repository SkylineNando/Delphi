//---------------------------------------------------------------------------

#ifndef frmTraceFlagsUH
#define frmTraceFlagsUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Buttons.hpp>
#include <IB.hpp>
//---------------------------------------------------------------------------
class TfrmTraceFlags : public TForm
{
__published:	// IDE-managed Components
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	TCheckBox *CheckBox3;
	TCheckBox *CheckBox4;
	TCheckBox *CheckBox5;
	TCheckBox *CheckBox6;
	TCheckBox *CheckBox7;
	TCheckBox *CheckBox8;
	TCheckBox *CheckBox9;
	TCheckBox *CheckBox10;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmTraceFlags(TComponent* Owner);
public:
	TTraceFlags __fastcall GetTraceFlags(void);
	void __fastcall SetTraceFlags(TTraceFlags flags);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmTraceFlags *frmTraceFlags;
//---------------------------------------------------------------------------
#endif
