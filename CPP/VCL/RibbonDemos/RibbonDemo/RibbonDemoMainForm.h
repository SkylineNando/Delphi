//---------------------------------------------------------------------------

#ifndef RibbonDemoMainFormH
#define RibbonDemoMainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnCtrls.hpp>
#include <ActnList.hpp>
#include <ActnMan.hpp>
#include <ActnMenus.hpp>
#include <ComCtrls.hpp>
#include <ExtActns.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
#include <Ribbon.hpp>
#include <RibbonActnCtrls.hpp>
#include <RibbonActnMenus.hpp>
#include <RibbonLunaStyleActnCtrls.hpp>
#include <RibbonObsidianStyleActnCtrls.hpp>
#include <ScreenTips.hpp>
#include <StdActns.hpp>
#include <ToolWin.hpp>
#include <Windows.hpp>
#include <System.Actions.hpp>
//---------------------------------------------------------------------------

const String FormatExt[3] = {".rtf", ".rtf", ".txt"};
enum TFileFormat {ffDefault, ffRTF, ffTXT};

class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TRibbon *Ribbon1;
	TRibbonApplicationMenuBar *RibbonApplicationMenuBar1;
	TRibbonPage *rpControlTypes;
	TRibbonGroup *rgRadioButtons;
	TRibbonGroup *rgCheckBoxes;
	TRibbonGroup *rgSpinEdit;
	TRibbonSpinEdit *RibbonSpinEdit1;
	TRibbonSpinEdit *RibbonSpinEdit2;
	TRibbonSpinEdit *RibbonSpinEdit3;
	TRibbonSpinEdit *RibbonSpinEdit4;
	TRibbonGroup *rgOtherControls;
	TDateTimePicker *DateTimePicker1;
	TTreeView *TreeView1;
	TRibbonPage *rpStyle;
	TRibbonGroup *rpStyleRibbonStyle;
	TRibbonPage *rpHome;
	TRibbonGroup *rgHomeClipboard;
	TRibbonGroup *rgHomeFont;
	TRibbonComboBox *rcbFonts;
	TRibbonComboBox *rcbFontSize;
	TRibbonGroup *rgHomeParagraph;
	TRibbonGroup *rgHomeEditing;
	TActionManager *ActionManager1;
	TFileOpen *FileOpen1;
	TFileSaveAs *FileSaveAs1;
	TFilePrintSetup *FilePrintSetup1;
	TFilePageSetup *FilePageSetup1;
	TFileExit *FileExit1;
	TEditCut *EditCut1;
	TEditCopy *EditCopy1;
	TEditPaste *EditPaste1;
	TEditSelectAll *EditSelectAll1;
	TEditUndo *EditUndo1;
	TEditDelete *EditDelete1;
	TAction *FileSaveActn;
	TAction *FileNewActn;
	TRichEditBold *RichEditBold1;
	TRichEditItalic *RichEditItalic1;
	TAction *FontCalibriActn;
	TAction *FontCambriaActn;
	TAction *FontCourierNewActn;
	TAction *FontArialRoundedMTBoldActn;
	TAction *FontArialActn;
	TAction *FontArialNarrowActn;
	TAction *FontTahomaActn;
	TAction *FontSegoeUIActn;
	TAction *FontSegoeScriptActn;
	TRichEditUnderline *RichEditUnderline1;
	TRichEditStrikeOut *RichEditStrikeOut1;
	TRichEditBullets *RichEditBullets1;
	TRichEditAlignLeft *RichEditAlignLeft1;
	TRichEditAlignRight *RichEditAlignRight1;
	TRichEditAlignCenter *RichEditAlignCenter1;
	TSearchFind *SearchFind1;
	TSearchReplace *SearchReplace1;
	TAction *LunaStyleActn;
	TAction *ObsidianStyleActn;
	TAction *SilverStyleActn;
	TAction *FileCloseActn;
	TAction *FileSaveAsText;
	TAction *FileSaveAsRTF;
	TAction *FileQuickPrint;
	TAction *FilePrintPreview;
	TAction *FontGrowSizeActn;
	TAction *FontShrinkSizeActn;
	TAction *FontSubscriptActn;
	TAction *FontSuperScriptActn;
	TAction *ChangeCaseSentenceActn;
	TAction *ChangeCaseLowerActn;
	TAction *ChangeCaseUpperActn;
	TAction *ChangeCaseCapitalizeActn;
	TAction *ChangeCaseToggleActn;
	TAction *FontHighlightActn;
	TAction *FontColorActn;
	TAction *ChangeCaseActn;
	TAction *EditPasteSpecial;
	TAction *EditPasteHyperlink;
	TFileRun *FileRun1;
	TFontEdit *FontEdit1;
	TPrintDlg *PrintDlg1;
	TAction *RadioAction1;
	TAction *RadioAction2;
	TAction *RadioAction3;
	TAction *CheckboxAction1;
	TAction *CheckboxAction2;
	TAction *CheckboxAction3;
	TAction *NumberingActn;
	TActionList *alBulletNumberGallery;
	TAction *NumberNoneActn;
	TAction *NumberArabicDotActn;
	TAction *NumberArabicParenActn;
	TAction *NumberUpperRomanActn;
	TAction *NumberUpperActn;
	TAction *NumberLowerParenActn;
	TAction *NumberLowerDotActn;
	TAction *NumberLowerRomanActn;
	TImageList *ilBulletNumberGallery;
	TImageList *ilGFX16;
	TImageList *ilGFX16_d;
	TImageList *ilGFX32;
	TImageList *ilGFX32_d;
	TScreenTipsManager *ScreenTipsManager1;
	TGridPanel *GridPanel1;
	TRichEdit *RichEdit1;
	TRibbonQuickAccessToolbar *RibbonQuickAccessToolbar1;
	void __fastcall ActionManager1StyleChanged(TCustomActionManager *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ChangeCaseLowerActnExecute(TObject *Sender);
	void __fastcall FontCalibriActnExecute(TObject *Sender);
	void __fastcall FontGrowSizeActnExecute(TObject *Sender);
	void __fastcall FontShrinkSizeActnExecute(TObject *Sender);
	void __fastcall FontSubscriptActnExecute(TObject *Sender);
	void __fastcall FontSubscriptActnUpdate(TObject *Sender);
	void __fastcall FontSuperScriptActnExecute(TObject *Sender);
	void __fastcall FontSuperScriptActnUpdate(TObject *Sender);
	void __fastcall NumberingActnExecute(TObject *Sender);
	void __fastcall NumberingActnUpdate(TObject *Sender);
	void __fastcall CheckboxAction1Execute(TObject *Sender);
	void __fastcall FontEdit1BeforeExecute(TObject *Sender);
	void __fastcall FontEdit1Accept(TObject *Sender);
	void __fastcall FileOpen1Accept(TObject *Sender);
	void __fastcall FileSaveAs1Accept(TObject *Sender);
	void __fastcall FileSaveAs1Update(TObject *Sender);
	void __fastcall FileSaveActnExecute(TObject *Sender);
	void __fastcall FileNewActnExecute(TObject *Sender);
	void __fastcall FileCloseActnExecute(TObject *Sender);
	void __fastcall FileSaveAsTextExecute(TObject *Sender);
	void __fastcall FileSaveAsRTFExecute(TObject *Sender);
	void __fastcall FileQuickPrintExecute(TObject *Sender);
	void __fastcall RadioAction1Execute(TObject *Sender);
	void __fastcall LunaStyleActnExecute(TObject *Sender);
	void __fastcall ObsidianStyleActnExecute(TObject *Sender);
	void __fastcall SilverStyleActnExecute(TObject *Sender);
	void __fastcall NumberNoneActnExecute(TObject *Sender);
	void __fastcall NumberArabicDotActnExecute(TObject *Sender);
	void __fastcall NumberArabicParenActnExecute(TObject *Sender);
	void __fastcall NumberUpperRomanActnExecute(TObject *Sender);
	void __fastcall NumberUpperActnExecute(TObject *Sender);
	void __fastcall NumberLowerParenActnExecute(TObject *Sender);
	void __fastcall NumberLowerDotActnExecute(TObject *Sender);
	void __fastcall NumberLowerRomanActnExecute(TObject *Sender);
	void __fastcall RichEdit1Change(TObject *Sender);
	void __fastcall RichEdit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall RichEdit1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall rcbFontSizeChange(TObject *Sender);
private:	// User declarations
        String FFileName;

        void SaveFile(const String FileName, const TFileFormat Format = ffDefault);
        void LoadFile(const String FileName);
        void CreateNewFile();
        void CloseFile();
        bool GetIsFileOpen();
        void UpdateUI();
        void LoadRecentFiles();
        void EnableEmptyActions();
        void SetNumberStyle(Word Numbering, Word Style);
        void SetFontSize(Integer NewSize);

public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
