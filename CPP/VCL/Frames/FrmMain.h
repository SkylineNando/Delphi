//---------------------------------------------------------------------------
#ifndef FrmMainH
#define FrmMainH


//---------------------------------------------------------------------------

#include <Windows.hpp>
#include <Messages.hpp>
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <StdCtrls.hpp>
#include <ExtCtrls.hpp>
#include "FrmData.h"
#include "FrmMD.h"


//---------------------------------------------------------------------------

 class TForm1: public TForm
{
__published:	// IDE-managed Components
	TMasterDetailFrame *MDFrame;
	TDataFrame *SimpleFrame;
	TSplitter *Splitter1;
	void __fastcall FormCreate(TObject *Sender);
private: // User declarations
public:  // User declarations
	__fastcall TForm1(TComponent *AOwner);
};

//---------------------------------------------------------------------------
extern PACKAGE   TForm1 *Form1;
//---------------------------------------------------------------------------

#endif

