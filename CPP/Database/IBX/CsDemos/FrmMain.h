//---------------------------------------------------------------------------

#ifndef FrmMainH
#define FrmMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TFrmLauncher : public TForm
{
__published:	// IDE-managed Components
	TButton *BtnTrigg;
	TButton *BtnViews;
	TButton *BtnQrySP;
	TButton *BtnExecSP;
	TButton *BtnClose;
	TButton *BtnTrans;
	void __fastcall BtnCloseClick(TObject *Sender);
	void __fastcall BtnViewsClick(TObject *Sender);
	void __fastcall BtnTriggClick(TObject *Sender);
	void __fastcall BtnQrySPClick(TObject *Sender);
	void __fastcall BtnExecSPClick(TObject *Sender);
	void __fastcall BtnTransClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmLauncher(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmLauncher *FrmLauncher;
//---------------------------------------------------------------------------
#endif
