//---------------------------------------------------------------------------
#ifndef GraphWinH
#define GraphWinH


//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Windows.hpp>
#include <Messages.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <StdCtrls.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>


enum TDrawingTool {dtLine, dtRectangle, dtEllipse, dtRoundRect};

//---------------------------------------------------------------------------
 class TForm1: public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TSpeedButton *LineButton;
	TSpeedButton *RectangleButton;
	TSpeedButton *EllipseButton;
	TSpeedButton *RoundRectButton;
	TSpeedButton *PenButton;
	TSpeedButton *BrushButton;
	TPanel *PenBar;
	TPanel *BrushBar;
	TSpeedButton *SolidPen;
	TSpeedButton *DashPen;
	TSpeedButton *DotPen;
	TSpeedButton *DashDotPen;
	TSpeedButton *DashDotDotPen;
	TSpeedButton *ClearPen;
	TUpDown *PenWidth;
	TEdit *PenSize;
	TStatusBar *StatusBar1;
	TScrollBox *ScrollBox1;
	TImage *Image;
	TSpeedButton *SolidBrush;
	TSpeedButton *ClearBrush;
	TSpeedButton *HorizontalBrush;
	TSpeedButton *VerticalBrush;
	TSpeedButton *FDiagonalBrush;
	TSpeedButton *BDiagonalBrush;
	TSpeedButton *CrossBrush;
	TSpeedButton *DiagCrossBrush;
	TSpeedButton *PenColor;
	TSpeedButton *BrushColor;
	TColorDialog *ColorDialog1;
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *New1;
	TMenuItem *Open1;
	TMenuItem *Save1;
	TMenuItem *Saveas1;
	TMenuItem *N1;
	TMenuItem *Exit1;
	TMenuItem *Edit1;
	TMenuItem *Cut1;
	TMenuItem *Copy1;
	TMenuItem *Paste1;
	TOpenDialog *OpenDialog1;
	TSaveDialog *SaveDialog1;
	void __fastcall FormMouseDown(TObject *Sender, TMouseButton *Button,
	   TShiftState *Shift, int X, int Y);
	void __fastcall FormMouseUp(TObject *Sender, TMouseButton *Button,
	   TShiftState *Shift, int X, int Y);
	void __fastcall FormMouseMove(TObject *Sender, TShiftState *Shift, int X, int Y);
	void __fastcall LineButtonClick(TObject *Sender);
	void __fastcall RectangleButtonClick(TObject *Sender);
	void __fastcall EllipseButtonClick(TObject *Sender);
	void __fastcall RoundRectButtonClick(TObject *Sender);
	void __fastcall PenButtonClick(TObject *Sender);
	void __fastcall BrushButtonClick(TObject *Sender);
	void __fastcall SetPenStyle(TObject *Sender);
	void __fastcall PenSizeChange(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall SetBrushStyle(TObject *Sender);
	void __fastcall PenColorClick(TObject *Sender);
	void __fastcall BrushColorClick(TObject *Sender);
	void __fastcall Exit1Click(TObject *Sender);
	void __fastcall Open1Click(TObject *Sender);
	void __fastcall Save1Click(TObject *Sender);
	void __fastcall Saveas1Click(TObject *Sender);
	void __fastcall New1Click(TObject *Sender);
	void __fastcall Copy1Click(TObject *Sender);
	void __fastcall Cut1Click(TObject *Sender);
	void __fastcall Paste1Click(TObject *Sender);
private: // User declarations
public:  // User declarations
	TBrushStyle BrushStyle;
	TPenStyle PenStyle;
	int PenWide;
	bool Drawing;
	TPoint Origin;
	TPoint MovePt;
	TDrawingTool DrawingTool;
	String CurrentFile;
	void __fastcall SaveStyles();
	void __fastcall RestoreStyles();
	void __fastcall DrawShape(TPoint TopLeft, TPoint BottomRight, TPenMode AMode);
	__fastcall TForm1(TComponent *Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE   TForm1 *Form1;
//---------------------------------------------------------------------------

#endif

