//---------------------------------------------------------------------------
#ifndef FrmFancyH
#define FrmFancyH


//---------------------------------------------------------------------------
#include <Windows.hpp>
#include <Messages.hpp>
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <StdCtrls.hpp>


//---------------------------------------------------------------------------
 class TFancyFrame: public TFrame
{
__published:	// IDE-managed Components
	TDBMemo *DBMemo1;
	TDBImage *DBImage1;
	TSplitter *Splitter1;
private: // User declarations
public:  // User declarations
	__fastcall TFancyFrame(TComponent* AOwner);
};

#endif

