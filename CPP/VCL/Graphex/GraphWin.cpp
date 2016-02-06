
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "GraphWin.h"
#include "BMPDlg.h"
#include <Clipbrd.hpp>
#include <Windows.hpp>
#include <Graphics.hpp>
#include <SysUtils.hpp>

#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
TForm1 *Form1;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent *AOwner)
	: TForm(AOwner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormMouseDown(TObject *, TMouseButton *,
   TShiftState *, int X, int Y)
{
  Drawing = true;
  Image->Canvas->MoveTo(X, Y);
  Origin = Point(X, Y);
  MovePt = Origin;
  StatusBar1->Panels->Items[0]->Text = Format("Origin: (%d, %d)", ARRAYOFCONST((X, Y)));
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormMouseUp(TObject *, TMouseButton *,
   TShiftState *, int X, int Y)
{
  if( Drawing ) {

	DrawShape(Origin, Point(X, Y), pmCopy);
	Drawing = false;
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormMouseMove(TObject *, TShiftState *, int X, int Y)
{
  if( Drawing ) {

	DrawShape(Origin, MovePt, pmNotXor);
	MovePt = Point(X, Y);
	DrawShape(Origin, MovePt, pmNotXor);
  }
  StatusBar1->Panels->Items[1]->Text = Format("Current: (%d, %d)", ARRAYOFCONST((X, Y)));
}

//---------------------------------------------------------------------------
void __fastcall TForm1::LineButtonClick(TObject *)
{
  DrawingTool = dtLine;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::RectangleButtonClick(TObject *)
{
  DrawingTool = dtRectangle;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::EllipseButtonClick(TObject *)
{
  DrawingTool = dtEllipse;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::RoundRectButtonClick(TObject *)
{
  DrawingTool = dtRoundRect;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::DrawShape(TPoint TopLeft, TPoint BottomRight, TPenMode AMode)
{
  Image->Canvas->Pen->Mode = AMode;
  switch(DrawingTool) {
  case dtLine:
	Image->Canvas->MoveTo(TopLeft.x, TopLeft.y);
	Image->Canvas->LineTo(BottomRight.x, BottomRight.y);
	break;
  case dtRectangle:
	Image->Canvas->Rectangle(TopLeft.x, TopLeft.y, BottomRight.x, BottomRight.y);
	break;
  case dtEllipse:
	Image->Canvas->Ellipse(TopLeft.x, TopLeft.y, BottomRight.x, BottomRight.y);
	break;
  case dtRoundRect:
	Image->Canvas->RoundRect(TopLeft.x, TopLeft.y, BottomRight.x,
		  BottomRight.y, (TopLeft.x - BottomRight.x) / 2,
		  (TopLeft.y - BottomRight.y) / 2);
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::PenButtonClick(TObject *)
{
  PenBar->Visible = PenButton->Down;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::BrushButtonClick(TObject *)
{
  BrushBar->Visible = BrushButton->Down;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::SetPenStyle(TObject *Sender)
{
 if( Sender == SolidPen )
   Image->Canvas->Pen->Style = psSolid;
 else if( Sender == DashPen )
   Image->Canvas->Pen->Style = psDash;
 else if( Sender == DotPen )
   Image->Canvas->Pen->Style = psDot;
 else if( Sender == DashDotPen )
   Image->Canvas->Pen->Style = psDashDot;
 else if( Sender == DashDotDotPen )
   Image->Canvas->Pen->Style = psDashDotDot;
 else if( Sender == ClearPen )
   Image->Canvas->Pen->Style = psClear;
 }


//---------------------------------------------------------------------------
void __fastcall TForm1::PenSizeChange(TObject *)
{
  Image->Canvas->Pen->Width = PenWidth->Position;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *)
{
  Graphics::TBitmap *Bitmap = new Graphics::TBitmap();
  assert(Bitmap != NULL);
  Bitmap->Width = 200;
  Bitmap->Height = 200;
  Image->Picture->Graphic = Bitmap;
  delete Bitmap;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::SetBrushStyle(TObject *Sender)
{
  if( Sender == SolidBrush )
	Image->Canvas->Brush->Style = bsSolid;
  else if( Sender == ClearBrush )
	Image->Canvas->Brush->Style = bsClear;
  else if( Sender == HorizontalBrush )
	Image->Canvas->Brush->Style = bsHorizontal;
  else if( Sender == VerticalBrush )
	Image->Canvas->Brush->Style = bsVertical;
  else if( Sender == FDiagonalBrush )
	Image->Canvas->Brush->Style = bsFDiagonal;
  else if( Sender == BDiagonalBrush )
	Image->Canvas->Brush->Style = bsBDiagonal;
  else if( Sender == CrossBrush )
	Image->Canvas->Brush->Style = bsCross;
  else if( Sender == DiagCrossBrush )
	Image->Canvas->Brush->Style = bsDiagCross;
}

void __fastcall TForm1::PenColorClick(TObject *)
{
  ColorDialog1->Color = Image->Canvas->Pen->Color;
  if( ColorDialog1->Execute() )

	Image->Canvas->Pen->Color = ColorDialog1->Color;
}

void __fastcall TForm1::BrushColorClick(TObject *)
{
  ColorDialog1->Color = Image->Canvas->Brush->Color;
  if( ColorDialog1->Execute() )

	Image->Canvas->Brush->Color = ColorDialog1->Color;
}

void __fastcall TForm1::Exit1Click(TObject *)
{
  Close();
}

void __fastcall TForm1::Open1Click(TObject *)
{
  if( OpenDialog1->Execute() ) {

	CurrentFile = OpenDialog1->FileName;
	SaveStyles();
	Image->Picture->LoadFromFile(CurrentFile);
	RestoreStyles();
  }
}

void __fastcall TForm1::Save1Click(TObject *Sender)
{
  if( CurrentFile != EmptyStr )

	Image->Picture->SaveToFile(CurrentFile);
  else
	Saveas1Click(Sender);
}

void __fastcall TForm1::Saveas1Click(TObject *Sender)
{
  if( SaveDialog1->Execute() ) {

	CurrentFile = SaveDialog1->FileName;
	Save1Click(Sender);
  }
}

void __fastcall TForm1::New1Click(TObject *)
{
	NewBMPForm->ActiveControl = NewBMPForm->WidthEdit;
	NewBMPForm->WidthEdit->Text = IntToStr(Image->Picture->Graphic->Width);
	NewBMPForm->HeightEdit->Text = IntToStr(Image->Picture->Graphic->Height);
	if( ShowModal() != ID_CANCEL ) {

	  Graphics::TBitmap *Bitmap = new Graphics::TBitmap();
	  assert(Bitmap != NULL);
	  Bitmap->Width = StrToInt(NewBMPForm->WidthEdit->Text);
	  Bitmap->Height = StrToInt(NewBMPForm->HeightEdit->Text);
	  SaveStyles();
	  Image->Picture->Graphic = Bitmap;
	  RestoreStyles();
	  CurrentFile = EmptyStr;
	  delete Bitmap;
	}
}

void __fastcall TForm1::Copy1Click(TObject *)
{
  Clipboard()->Assign(Image->Picture);
}

void __fastcall TForm1::Cut1Click(TObject *Sender)
{
  Copy1Click(Sender);
  Image->Canvas->CopyMode = cmWhiteness;
  TRect ARect = Rect(0, 0, Image->Width, Image->Height);
  CopyRect(&ARect, &ARect);
  Image->Canvas->CopyMode = cmSrcCopy;
}

void __fastcall TForm1::Paste1Click(TObject *)
{
  if( Clipboard()->HasFormat(CF_BITMAP) ) {
	Graphics::TBitmap *Bitmap = new Graphics::TBitmap();
	assert(Bitmap != NULL);
	Bitmap->Assign(Clipboard());
	Image->Canvas->Draw(0, 0, Bitmap);
	delete Bitmap;
  }
}

void __fastcall TForm1::SaveStyles()
{
	BrushStyle = Image->Canvas->Brush->Style;
	PenStyle = Image->Canvas->Pen->Style;
	PenWide = Image->Canvas->Pen->Width;
}

void __fastcall TForm1::RestoreStyles()
{
	Image->Canvas->Brush->Style = BrushStyle;
	Image->Canvas->Pen->Style = PenStyle;
	Image->Canvas->Pen->Width = PenWide;
}

