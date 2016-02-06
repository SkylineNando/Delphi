//---------------------------------------------------------------------------

#ifndef ArithmeticsH
#define ArithmeticsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm5 : public TForm
{
__published:	// IDE-managed Components
	TButton *Button1;
	TButton *Button2;
	TRadioGroup *RadioGroup1;
	TRadioGroup *RadioGroup3;
	TRadioGroup *RadioGroup2;
	TRadioGroup *RadioGroup4;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm5(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm5 *Form5;
//---------------------------------------------------------------------------
#endif

void arithmetic(TImage *Img1, TImage *Img2, TImage *Img3);
