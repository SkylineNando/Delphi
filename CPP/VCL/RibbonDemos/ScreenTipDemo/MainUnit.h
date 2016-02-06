//---------------------------------------------------------------------------

#ifndef MainUnitH
#define MainUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnCtrls.hpp>
#include <ActnList.hpp>
#include <ActnMan.hpp>
#include <Dialogs.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
#include <ScreenTips.hpp>
#include <StdActns.hpp>
#include <ToolWin.hpp>
#include <XPStyleActnCtrls.hpp>
#include <System.Actions.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TActionManager *ActionManager1;
	TAction *SampleActn;
	TActionList *ActionList1;
	TEditCut *EditCut1;
	TEditCopy *EditCopy1;
	TEditPaste *EditPaste1;
	TEditSelectAll *EditSelectAll1;
	TEditUndo *EditUndo1;
	TEditDelete *EditDelete1;
	TFontDialog *FontDialog1;
	TScreenTipsManager *ScreenTipsManager1;
	TImageList *SmallImages;
	TImageList *DisabledImages;
	TMemo *Memo1;
	TActionToolBar *ActionToolBar1;
	TScreenTipsPopup *ScreenTipsPopup1;
	TCheckBox *CheckBox1;
	TScreenTipsPopup *ScreenTipsPopup2;
	TButton *bChangeFont;
	void __fastcall bChangeFontClick(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall SampleActnExecute(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
