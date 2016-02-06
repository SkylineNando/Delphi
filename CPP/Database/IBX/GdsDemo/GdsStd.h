//---------------------------------------------------------------------------

#ifndef GdsStdH
#define GdsStdH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
//---------------------------------------------------------------------------
class TGDSStdForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *GDSStdPanel;
	TBevel *ImageBevel;
	TLabel *GDSSloganLabel2;
	TLabel *GDSLabel2;
	TImage *GDSStdImage;
	TLabel *GDSLabel;
	TLabel *GDSSloganLabel;
private:	// User declarations
public:		// User declarations
	__fastcall TGDSStdForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGDSStdForm *GDSStdForm;
//---------------------------------------------------------------------------
#endif
