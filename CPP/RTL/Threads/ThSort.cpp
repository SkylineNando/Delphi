//---------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ThSort.h"
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
TThreadSortForm *ThreadSortForm;


bool ArraysRandom;
TSortArray BubbleSortArray;
TSortArray SelectionSortArray;
TSortArray QuickSortArray;

/* TThreadSortForm */
//---------------------------------------------------------------------------

__fastcall TThreadSortForm::TThreadSortForm(TComponent *AOwner)

		:TForm(AOwner)

{

}


//---------------------------------------------------------------------------

void __fastcall TThreadSortForm::PaintArray(TPaintBox *Box, TSortArray &A)
{
  Box->Canvas->Pen->Color = clRed;
  for(int i = 0; i < ASize(A) - 1; ++i)
		PaintLine(Box->Canvas, i, A[i]);
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::BubbleSortBoxPaint(TObject *)
{
  PaintArray(BubbleSortBox, BubbleSortArray);
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::SelectionSortBoxPaint(TObject *)
{
  PaintArray(SelectionSortBox, SelectionSortArray);
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::QuickSortBoxPaint(TObject *)
{
  PaintArray(QuickSortBox, QuickSortArray);
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::FormCreate(TObject *)
{
  RandomizeArrays();
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::StartBtnClick(TObject *)
{
  RandomizeArrays();
  ThreadsRunning = 3;
  TBubbleSort *BubbleSort = new TBubbleSort(BubbleSortBox, BubbleSortArray);
  BubbleSort->OnTerminate = ThreadDone;
  TSelectionSort *SelectionSort = new TSelectionSort(SelectionSortBox, SelectionSortArray);
  SelectionSort->OnTerminate = ThreadDone;
  TQuickSort *QuickSort = new TQuickSort(QuickSortBox, QuickSortArray);
  QuickSort->OnTerminate = ThreadDone;
  StartBtn->Enabled = false;
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::RandomizeArrays()
{
  if( ! ArraysRandom ) {
	Randomize();
	for(int i = 0; i < ASize(BubbleSortArray); ++i) {
		BubbleSortArray[i] = Random(ARRAY_SIZE - 1);
		SelectionSortArray[i] = BubbleSortArray[i];
		QuickSortArray[i] = BubbleSortArray[i];
	}
	ArraysRandom = true;
	Repaint();
  }
}

//---------------------------------------------------------------------------
void __fastcall TThreadSortForm::ThreadDone(TObject *)
{
  ThreadsRunning--;
  if( ThreadsRunning == 0 ) {

	StartBtn->Enabled = true;
	ArraysRandom = false;
  }
}

 

