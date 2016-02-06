//---------------------------------------------------------------------------

#ifndef BrightnessH
#define BrightnessH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TForm3 : public TForm
{
__published:	// IDE-managed Components
	TScrollBar *ScrollBar1;
	TLabel *Brightness;
	TScrollBar *ScrollBar2;
	TLabel *Contrast;
	TButton *Button1;
	TButton *Button2;
	void __fastcall ScrollBar1Change(TObject *Sender);
	void __fastcall ScrollBar2Change(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm3(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm3 *Form3;
//---------------------------------------------------------------------------
#endif

void brightnessContrast(TImage *imageSelected);
