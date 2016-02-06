
//--------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//--------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "MainFormUnit.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)
#pragma resource "*.dfm"

const int   MIN_BLOCKSIZE = 15;
  //once 5 lines and more were removed increase the speed...
const int   SPEEDUPATLINES = 5;

// Rotate -- rotate the block (only rotates one direction)
//
void TBlock::rotate() {
  int i,j;
  char tempBlock[17];

  switch (size) {
    case 4:
      strcpy(tempBlock,elements);
      for (i=0;i<4;i++)
       for (j=0;j<4;j++)
         tempBlock[i*4+j]=elements[j*4+i];
      strcpy(elements,tempBlock);
      break;

    case 3:
      strcpy(tempBlock,elements);
      for (i=0;i<3;i++)
       for (j=0;j<3;j++)
         tempBlock[(2-i)*4+j]=elements[j*4+i];
      strcpy(elements,tempBlock);
      break;

    case 2:  // no 2x2 blocks can rotate, so do nothing
      break;
  }
}

// Define all the game pieces.

TBlock blocks[7] = { {4, " *  "
                         " *  "
                         " *  "
                         " *  "},
                     {3, " ** "
                         " *  "
                         " *  "
                         "    "},
                     {3, "**  "
                         " *  "
                         " *  "
                         "    "},
                     {3, " *  "
                         "*** "
                         "    "
                         "    "},
                     {3, "**  "
                         " ** "
                         "    "
                         "    "},
                     {3, " ** "
                         "**  "
                         "    "
                         "    "},
                     {2, "**  "
                         "**  "
                         "    "
						 "    "} };

const char* sHelpString ="F1 to see this crude help\nF2 to start a new game\n" \
			   "F3 to pause the game\n" \
			   "'+' to increase block size'-' to reduce block size\n" \
			   "PageUp to increase speed, PageDn to reduce\n" \
			   "Left and Right arrow keys move the blocks\n" \
			   "Up arrow or spacebar of Numpad 5 rotates\n" \
			   "Down arrow drops";


// these define the pens and brushes to be used for the various
// blocks.  each block type is a different color
//

TColor cpen[8] = {  TColor(RGB( 0, 0, 64  )) ,
					TColor(RGB( 0, 0, 255 )) ,
					TColor(RGB( 0, 255, 0 )) ,
					TColor(RGB( 255, 0, 0 )) ,
					TColor(RGB( 255,255,0 )) ,
					TColor(RGB( 255,0,255 )) ,
					TColor(RGB( 0,255,255 )) ,
					TColor(RGB( 255,255,255  )) };

TColor cbrush[8] = { 	TColor(RGB( 0, 0, 64  )) ,
						TColor(RGB( 0, 0, 128 )) ,
						TColor(RGB( 0, 128, 0 )),
						TColor(RGB( 128, 0, 0 )) ,
						TColor(RGB( 128,128,0 )) ,
						TColor(RGB( 128,0,128 )) ,
						TColor(RGB( 0,128,128 )) ,
						TColor(RGB( 128,128,128 )) };


TBlockForm *BlockForm;
//---------------------------------------------------------------------------
__fastcall TBlockForm::TBlockForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

// NewGame -- start a new game.  First clear the board, then
// add the first block, and change the game state to gsBlockDropping
//
void __fastcall TBlockForm::NewGame() {
  ClearBoard();
  NewBlock( random(7) );
  gameState = gsBlockDropping;
  Timer1->Enabled = true;
  Invalidate();
}

// ClearBoard -- resets the game board to be empty
//
void __fastcall TBlockForm::ClearBoard() {
  int i,j;

  for (i=0;i<(GAME_HEIGHT+1);i++)
	for (j=0;j<(GAME_WIDTH+2);j++)
	  board[i][j]=0;
  for (i=0;i<(GAME_HEIGHT+1);i++) {
	board[i][0] = -1;
	board[i][GAME_WIDTH+1] = -1;
  }
  for (j=0;j<(GAME_WIDTH+2);j++)
	board[GAME_HEIGHT][j]=-1;
}

// HitTest -- tests to see if a block overlaps any occupied square
//            on the board
//
bool __fastcall TBlockForm::HitTest( TBlock& block, int x, int y )
{
  int i,j;
  for (i=0;i<4;i++)
	for (j=0;j<4;j++)
	  if ( ((x+i)<(GAME_WIDTH+2)) &&
		   ((x+i+1)>=0)  &&
		   ((y+j)<(GAME_HEIGHT+1)) &&
		   ((y+j)>=0) )             // make sure block in question is in range
		if (board[y+j][x+1+i]!=0)   // if the board piece is empty, skip test
		  if (block.elements[j*4+i]=='*')
			return true;
  return false;
}

// PlaceBlock -- puts the current block permanently into the board array.
//               this function is called when the block reaches the bottom
//               of the game board.
//
void __fastcall TBlockForm::PlaceBlock() {
  int i,j;
  for (i=0;i<4;i++)
	for (j=0;j<4;j++)
	  if (currentBlock.elements[j*4+i]=='*')
		board[y+j][x+1+i]= BColor;

  Invalidate();
  RemoveLines();
}

// NewBlock -- creates a new block at the top of the screen
//
void __fastcall TBlockForm::NewBlock( int blockType ) {
  currentBlock = blocks[ blockType ];
  BColor = blockType+1;
  x = 4;
  y = 0;
  // if the new block hits anything on the screen, the game is over
  //
  if (HitTest( currentBlock, x, y )) {
	PlaceBlock();
	Invalidate();
	gameState = gsGameOver;
  }
}

// Pause -- handler for the 'Pause' menu item
//
void __fastcall TBlockForm::Pause() {
  if (gameState==gsBlockDropping)
	gameState=gsPaused;
  else
	if (gameState==gsPaused)
	  gameState=gsBlockDropping;
  Invalidate();
}

void __fastcall TBlockForm::Timer1Timer(TObject *Sender)
{

  switch (gameState) {
	case gsGameOver:            // no game in progress, do nothing
	  break;

    case gsBlockDropping:       // game in progress
      dropCount++;                             // increment drop counter
      if ((dropping) ||
		  (dropCount == gameSpeed))
		  {            // if time to drop
		dropCount=0;                           // reset counter
        y++;                                   // move block down
        if (HitTest( currentBlock, x, y ) ) {  // if it hit something
          y--;                                 // move it back up
          PlaceBlock();                        // make it permanent
          RemoveLines();
          NewBlock( random(7) );
         }
        Invalidate();                          // redraw game board
      }
      break;

    case gsPaused:            // game is paused
      break;
  }
}

void __fastcall TBlockForm::ChangeWindowSize()
{

  //Size the form
  ClientWidth  = blockSize*GAME_WIDTH;
  ClientHeight = blockSize*GAME_HEIGHT;
}

//---------------------------------------------------------------------------
void __fastcall TBlockForm::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)

{
  if ( gameState == gsPaused ) {
    gameState = gsBlockDropping;
    Invalidate();
    return;
  }
  switch (Key) {

	case VK_PRIOR : IncreaseSpeed(); break;
	case VK_NEXT  : DecreaseSpeed(); break;

	case VK_ADD      : IncreaseBlockSize(); break;
	case VK_SUBTRACT : DecreaseBlockSize(); break;
	// move block left

	case VK_NUMPAD4:
    case VK_LEFT:
      x--;
      if (HitTest( currentBlock, x, y ))
        x++;
     else
       Invalidate();
     break;

    // move block right

    case VK_NUMPAD6:
    case VK_RIGHT:
      x++;
      if (HitTest( currentBlock, x, y ))
        x--;
      else
        Invalidate();
      break;

    // turn on fast dropping

    case VK_NUMPAD2:
    case VK_DOWN:
      dropping = true;
      break;

    // rotate block

    case VK_UP:
    case VK_NUMPAD5:
    case VK_SPACE:
      currentBlock.rotate();
      if (HitTest( currentBlock, x, y )) {
        currentBlock.rotate();
        currentBlock.rotate();
        currentBlock.rotate();
      }
      Invalidate();
      break;
  }

}
//---------------------------------------------------------------------------

void __fastcall TBlockForm::FormKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
  switch (Key) {
	case VK_NUMPAD2:
	case VK_DOWN:
	  dropping = false;
	  break;
  }

}



//---------------------------------------------------------------------------
void __fastcall TBlockForm::RemoveLines() {
  int i,j,k,l;
  bool lineFull, linesRemoved;

  linesRemoved = false;
  j = GAME_HEIGHT-1;
  while (j>=0) {
	lineFull=true;
	for (i=1;i<=GAME_WIDTH;i++)
	  if (board[j][i]==0)
		lineFull=false;
	if (lineFull) {
	  linesRemoved=true;
	  for (k=j;k>=1;k--)
		for (l=1;l<=GAME_WIDTH;l++)
		  board[k][l]=board[k-1][l];
	  for (l=1;l<=GAME_WIDTH;l++)
		board[0][l]=0;
	} else
	  j--;
  }
  if (linesRemoved) {
	Invalidate();
  }
}

void __fastcall TBlockForm::FormCreate(TObject *Sender)
{
  ClearBoard();
  /* TODO : Need add support */
  //CountRemovedLines = 0;
  blockSize      = MIN_BLOCKSIZE + 5;
  gameSpeed      = 20;
  dropCount      = 0;
  gameState      = gsGameOver;
  dropping       = false;
  ChangeWindowSize();
}
//---------------------------------------------------------------------------

void __fastcall TBlockForm::PaintBox1Paint(TObject *Sender)
{
  DrawGameWindow(PaintBox1->Canvas);
}
//---------------------------------------------------------------------------

void __fastcall TBlockForm::DrawBlock( TCanvas *ACanvas, TBlock &block ,TPoint pos)
{
  int i,j,bsize;
  bsize = block.size;
  ACanvas->Brush->Color = cbrush[BColor];
  ACanvas->Pen->Color   = cpen[ BColor ];
  for (i=0;i<bsize;i++)
	for (j=0;j<bsize;j++)
	  if (block.elements[j*4+i]=='*')
		ACanvas->Rectangle( pos.x*blockSize+i*blockSize,
					  pos.y*blockSize+j*blockSize,
					  pos.x*blockSize+i*blockSize+blockSize,
					  pos.y*blockSize+j*blockSize+blockSize );
}


void __fastcall TBlockForm::DrawGameWindow( TCanvas *ACanvas )
{
  int i,j;

  // if the game is paused, blank the screen (to prevent cheating!)
  if (gameState == gsPaused)
  {
	   ACanvas->Pen->Color   = TColor(RGB( 0, 255, 255 )) ;
	   ACanvas->Brush->Color = clFuchsia;
	   ACanvas->TextOut( (blockSize*3 / 2) , blockSize * 9,  " * * P A U S E D * * ");
	   return;
  }
  // draw the permanent blocks
  for (j=0;j<GAME_HEIGHT;j++)
	for (i=0;i<GAME_WIDTH;i++)
	  if ( board[j][i+1]!=0 ){

		 ACanvas->Brush->Color = cpen[ board[j][i+1] ];
		 ACanvas->Pen->Color   = cbrush[ board[j][i+1] ];
		 ACanvas->Rectangle( i*blockSize,j*blockSize,
							 i*blockSize+blockSize,j*blockSize+blockSize );
	  }
  // display the game over message if the game has ended
  if (gameState == gsGameOver)
  {
	 ACanvas->Pen->Color   = TColor(RGB( 0, 255, 255 )) ;
	 ACanvas->Brush->Color = clFuchsia;
	 ACanvas->TextOut( (blockSize*3 / 2) , blockSize * 9,  "***** G A M E   O V E R *****");
	 ACanvas->TextOut( (blockSize*3 / 2) , blockSize * 10, "* F2 to start a new game... *");
	 ACanvas->TextOut( (blockSize*3 / 2) , blockSize * 11, "* F1 for HELP!!! *");
  }
  // if a block is dropping, draw it
  if (gameState == gsBlockDropping)
	DrawBlock( ACanvas, currentBlock, Point( x, y ) );
}

void __fastcall TBlockForm::StartnewgameF1Click(TObject *Sender)
{
NewGame();
}
//---------------------------------------------------------------------------

void __fastcall TBlockForm::Help2Click(TObject *Sender)
{
ShowMessage(sHelpString);
}
//---------------------------------------------------------------------------

void __fastcall TBlockForm::Pause1Click(TObject *Sender)
{
Pause();
}
//---------------------------------------------------------------------------
void __fastcall TBlockForm::IncreaseSpeed()
{

  gameSpeed--;
  if (gameSpeed < 2) gameSpeed    = 1;
  dropCount = 0;
  Invalidate();
}

void __fastcall TBlockForm::DecreaseSpeed()
{

  gameSpeed++;
  if(gameSpeed > 20) gameSpeed = 20;
  dropCount = 0;
  Invalidate();
}

void __fastcall TBlockForm::IncreaseBlockSize()
{
  int  TempBlockSize,TempWinHeight;

  TempBlockSize = blockSize;
  blockSize++;
  if (blockSize*GAME_HEIGHT >= (Screen->Height - blockSize))
	blockSize = TempBlockSize;
  ChangeWindowSize();
}

void __fastcall TBlockForm::DecreaseBlockSize()
{
  blockSize--;
 if (blockSize < MIN_BLOCKSIZE) blockSize = MIN_BLOCKSIZE;
 ChangeWindowSize();
}
