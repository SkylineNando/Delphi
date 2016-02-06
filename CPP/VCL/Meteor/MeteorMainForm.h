//---------------------------------------------------------------------------

#ifndef MeteorMainFormH
#define MeteorMainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include "sprite.h"
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TPaintBox *PaintBox1;
	TTimer *Timer1;
	void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall PaintBox1Paint(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
  unsigned int gwidth, gheight;

  SpriteList sprites;       // list of all the sprites on the screen

  Ship       *ship;         // a seperate pointer to the ship, so we can adjust
							// it's speed, etc.  the ship is also inserted into
							// the sprite list

  SprMessage    *scoreDisplay; // pointer to the score object, so we can update it


  bool       rotateLeft,    // flags set when the player presses keys
			 rotateRight,
			 thrust,
			 fire;

  long       score;
  int        shipsLeft;
  int        newShipCountdown;    // countdown to new player ship appearing
  bool       gameOver;
  TRect      SpeedyClientRect;

  unsigned int shotDelay,shotDelayReset;  // used to limit how many shots can be fired

  void __fastcall InitGameSettings();
  void __fastcall InitGameGraphics();
  void __fastcall DrawGameObjects();

public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
