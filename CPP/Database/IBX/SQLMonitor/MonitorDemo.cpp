//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("frmTraceFlagsU.cpp", frmTraceFlags);
USEFORM("frmConnectU.cpp", frmConnect);
USEFORM("frmMainU.cpp", frmMain);
USEFORM("frmMonitorU.cpp", frmMonitor);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmMain), &frmMain);
		Application->CreateForm(__classid(TfrmConnect), &frmConnect);
		Application->CreateForm(__classid(TfrmMonitor), &frmMonitor);
		Application->CreateForm(__classid(TfrmTraceFlags), &frmTraceFlags);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
