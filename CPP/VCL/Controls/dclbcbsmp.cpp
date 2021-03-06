
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// C++Builder Sample Components
// Copyright(c) 1998-2011 Embarcadero Technologies, Inc.
//---------------------------------------------------------------------------
#ifdef _WIN64
  #error "This sample can only target WIN32 and is not available for the WIN64 Platform"
#endif
#include <System.hpp>
#pragma hdrstop

USEFORM("piereg.cpp", AngleEditorDlg);
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
extern "C" int _libmain(unsigned long reason)
{
	return 1;
}
//---------------------------------------------------------------------------
