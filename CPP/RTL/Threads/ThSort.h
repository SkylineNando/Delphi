//---------------------------------------------------------------------------
#ifndef ThSortH
#define ThSortH


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
#include <StdCtrls.hpp>
#include <ExtCtrls.hpp>
#include "SortThds.h"


//---------------------------------------------------------------------------
 class TThreadSortForm: public TForm
{
__published:	// IDE-managed Components
	TPaintBox *BubbleSortBox;
	TPaintBox *SelectionSortBox;
	TPaintBox *QuickSortBox;
	TBevel *Bevel1;
	TBevel *Bevel2;
	TBevel *Bevel3;
	TButton *StartBtn;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	void __fastcall StartBtnClick(TObject *Sender);
	void __fastcall BubbleSortBoxPaint(TObject *Sender);
	void __fastcall SelectionSortBoxPaint(TObject *Sender);
	void __fastcall QuickSortBoxPaint(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
private: // User declarations
	int ThreadsRunning;
	void __fastcall RandomizeArrays();
	void __fastcall ThreadDone(TObject *Sender);
public:  // User declarations
	void __fastcall PaintArray(TPaintBox *Box, TSortArray &A);
	__fastcall TThreadSortForm(TComponent *AOwner);
};

//---------------------------------------------------------------------------
extern PACKAGE   TThreadSortForm *ThreadSortForm;
//---------------------------------------------------------------------------

#endif

