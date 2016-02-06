//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("FrmMain.cpp", FrmLauncher);
USEFORM("FrmTrigg.cpp", FrmTriggerDemo);
USEFORM("FrmViews.cpp", FrmViewDemo);
USEFORM("DMCSDemo.cpp", DmEmployee); /* TDataModule: File Type */
USEFORM("FrmQrySP.cpp", FrmQueryProc);
USEFORM("FrmExeSP.cpp", FrmExecProc);
USEFORM("FrmTrans.cpp", FrmTransDemo);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFrmLauncher), &FrmLauncher);
		Application->CreateForm(__classid(TDmEmployee), &DmEmployee);
		Application->CreateForm(__classid(TFrmViewDemo), &FrmViewDemo);
		Application->CreateForm(__classid(TFrmTriggerDemo), &FrmTriggerDemo);
		Application->CreateForm(__classid(TFrmQueryProc), &FrmQueryProc);
		Application->CreateForm(__classid(TFrmExecProc), &FrmExecProc);
		Application->CreateForm(__classid(TFrmTransDemo), &FrmTransDemo);
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
