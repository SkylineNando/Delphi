//----------------------------------------------------------------------------
//C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//----------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
HINSTANCE g_hinst;
//---------------------------------------------------------------------------
USEFORM("traymain.cpp", FormMain);
//---------------------------------------------------------------------------
int WINAPI WinMain(HINSTANCE, HINSTANCE hInstance, LPSTR, int)
{
	Application->Initialize();
    g_hinst = hInstance;
    Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->Run();

    return 0;
}
//---------------------------------------------------------------------------

