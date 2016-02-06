//---------------------------------------------------------------------------
#ifndef BMPDlgH
#define BMPDlgH


//---------------------------------------------------------------------------
#include <Windows.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <Controls.hpp>
#include <Buttons.hpp>
#include <StdCtrls.hpp>
#include <ExtCtrls.hpp>


//---------------------------------------------------------------------------
 class TNewBMPForm: public TForm
{
__published:	// IDE-managed Components
	TButton *OKBtn;
	TButton *CancelBtn;
	TBevel *Bevel1;
	TLabel *Label1;
	TEdit *WidthEdit;
	TLabel *Label2;
	TEdit *HeightEdit;
private: // User declarations
public:  // User declarations
	__fastcall TNewBMPForm(TComponent *AOwner);
};

//---------------------------------------------------------------------------
extern PACKAGE TNewBMPForm *NewBMPForm;
//---------------------------------------------------------------------------

#endif

