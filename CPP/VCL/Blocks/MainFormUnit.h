//---------------------------------------------------------------------------

#ifndef MainFormUnitH
#define MainFormUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>

const int GAME_WIDTH = 10;
const int GAME_HEIGHT = 20;

//---------------------------------------------------------------------------
// TBlock is a structure which defines the geometric game piece
//
struct TBlock {
  int  size;          // 2x2, 3x3, or 4x4 (size of square which completely
					  // contains the piece)
  char elements[17];
  void rotate();
};

class TBlockForm : public TForm
{
__published:	// IDE-managed Components
	TPopupMenu *GamePopupMenu;
	TMenuItem *StartnewgameF1;
	TMenuItem *Pause1;
	TMenuItem *Help1;
	TMenuItem *Help2;
	TPaintBox *PaintBox1;
	TTimer *Timer1;
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall PaintBox1Paint(TObject *Sender);
	void __fastcall StartnewgameF1Click(TObject *Sender);
	void __fastcall Help2Click(TObject *Sender);
	void __fastcall Pause1Click(TObject *Sender);
private:	// User declarations
	  enum GameState { gsGameOver,         // game over, wait for newgame command
					   gsBlockDropping,    // normal mode, blocks are dropping
					   gsPaused };         // game is paused

	  GameState gameState;                       // current state of the game
	  TBlock    currentBlock;                    // currently falling block
	  int       x,y,                             // current block position
				BColor;                           // current block color
	  int       board[GAME_HEIGHT+1][GAME_WIDTH+2];  // the game grid
												 // edge to make for easier edge detection
	  int       dropCount;                       // countdown to next time piece falls one row

	  bool      dropping;                        // is the user holding the 'drop' key down?

	  int       gameSpeed, blockSize;


	bool __fastcall HitTest( TBlock& block, int x, int y );
	void __fastcall NewGame();
	void __fastcall ClearBoard();
	void __fastcall PlaceBlock();
	void __fastcall NewBlock( int blockType );
	void __fastcall Pause();
	void __fastcall RemoveLines();
	void __fastcall ChangeWindowSize();
	void __fastcall DrawGameWindow( TCanvas *ACanvas );
	void __fastcall DrawBlock( TCanvas *ACanvas, TBlock& block ,TPoint pos);
	void __fastcall IncreaseSpeed();
	void __fastcall DecreaseSpeed();
	void __fastcall IncreaseBlockSize();
	void __fastcall DecreaseBlockSize();

public:		// User declarations
	__fastcall TBlockForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBlockForm *BlockForm;
//---------------------------------------------------------------------------
#endif
