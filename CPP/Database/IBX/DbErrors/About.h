//---------------------------------------------------------------------------

#ifndef AboutH
#define AboutH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
//---------------------------------------------------------------------------
class TFrmAbouBox : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TImage *ProgramIcon;
	TLabel *ProductName;
	TLabel *Version;
	TPanel *Panel2;
	TLabel *Label2;
	TMemo *Memo1;
	TButton *Button1;
private:	// User declarations
public:		// User declarations
	__fastcall TFrmAbouBox(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmAbouBox *FrmAbouBox;
//---------------------------------------------------------------------------
#endif
