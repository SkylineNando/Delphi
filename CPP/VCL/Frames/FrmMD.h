//---------------------------------------------------------------------------
#ifndef FrmMDH
#define FrmMDH


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
#include "FrmData.h"


//---------------------------------------------------------------------------
 class TMasterDetailFrame: public TFrame
{
__published:	// IDE-managed Components
	TDataFrame *MasterFrame;
	TDataFrame *DetailFrame;
	TSplitter *Splitter2;
private: // User declarations
public:  // User declarations
	__fastcall TMasterDetailFrame(TComponent* AOwner);
};

#endif

