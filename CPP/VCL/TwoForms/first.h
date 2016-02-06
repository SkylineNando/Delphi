//----------------------------------------------------------------------------
//C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
#ifndef FirstH
#define FirstH
//----------------------------------------------------------------------------
#include <StdCtrls.hpp>
#include <Dialogs.hpp>
#include <Forms.hpp>
#include <Controls.hpp>
#include <Graphics.hpp>
#include <Classes.hpp>
#include <SysUtils.hpp>
#include <Messages.hpp>
#include <Windows.hpp>
#include <System.hpp>
//----------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:
	TButton *Button1;
	void __fastcall Button1Click(TObject *Sender);
public:
    virtual __fastcall TFormMain(TComponent *Owner);
};
//----------------------------------------------------------------------------
extern TFormMain *FormMain;
//----------------------------------------------------------------------------
#endif	
