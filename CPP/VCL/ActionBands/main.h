//---------------------------------------------------------------------------
#ifndef mainH
#define mainH

//---------------------------------------------------------------------------
#include <Windows.hpp>
#include <Messages.hpp>
#include <SysUtils.hpp>
#include <Variants.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ImgList.hpp>
#include <StdCtrls.hpp>
#include <ComCtrls.hpp>
#include <BandActn.hpp>
#include <StdActns.hpp>
#include <ExtActns.hpp>
#include <ActnList.hpp>
#include <ToolWin.hpp>
#include <ExtCtrls.hpp>
#include <ActnMan.hpp>
#include <ActnCtrls.hpp>
#include <ActnMenus.hpp>
#include <XPStyleActnCtrls.hpp>
#include <StdStyleActnCtrls.hpp>
#include <System.Actions.hpp>

//---------------------------------------------------------------------------
 class TForm1: public TForm
{
__published:	// IDE-managed Components
	TActionManager *ActionManager1;
	TActionMainMenuBar *ActionMainMenuBar1;
	TActionToolBar *ToolActionBar1;
	TActionToolBar *ToolActionBar2;
	TActionToolBar *ToolActionBar3;
	TEditCut *EditCut1;
	TEditCopy *EditCopy1;
	TEditPaste *EditPaste1;
	TEditSelectAll *EditSelectAll1;
	TEditUndo *EditUndo1;
	TEditDelete *EditDelete1;
	TRichEditBold *RichEditBold1;
	TRichEditItalic *RichEditItalic1;
	TRichEditUnderline *RichEditUnderline1;
	TRichEditStrikeOut *RichEditStrikeOut1;
	TRichEditBullets *RichEditBullets1;
	TRichEditAlignLeft *RichEditAlignLeft1;
	TRichEditAlignRight *RichEditAlignRight1;
	TRichEditAlignCenter *RichEditAlignCenter1;
	TFileOpen *FileOpen1;
	TFileSaveAs *FileSaveAs1;
	TFileRun *FileRun1;
	TFileExit *FileExit1;
	TSearchFind *SearchFind1;
	TSearchFindNext *SearchFindNext1;
	TSearchReplace *SearchReplace1;
	TSearchFindFirst *SearchFindFirst1;
	TCustomizeActionBars *CustomizeActionBars1;
	TRichEdit *RichEdit1;
	TImageList *ImageList1;
	TStatusBar *StatusBar1;
	TAction *StdStyleActn;
	TAction *XPStyleActn;
	TAction *ShadowActn;
	TFilePageSetup *FilePageSetup1;
	void __fastcall FileOpen1Accept(TObject *Sender);
	void __fastcall FileSaveAs1Accept(TObject *Sender);
	void __fastcall ActionManager1StateChange(TObject *Sender);
	void __fastcall StdStyleActnExecute(TObject *Sender);
	void __fastcall XPStyleActnExecute(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ShadowActnExecute(TObject *Sender);
private: // User declarations
public:  // User declarations
};

//---------------------------------------------------------------------------
extern PACKAGE   TForm1 *Form1;
//---------------------------------------------------------------------------

#endif


