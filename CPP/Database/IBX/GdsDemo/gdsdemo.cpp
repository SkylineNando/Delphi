//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("GdsStd.cpp", GDSStdForm);
USEFORM("GdsData.cpp", StdDataForm);
USEFORM("GridForm.cpp", GridViewForm);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TGridViewForm), &GridViewForm);
		Application->CreateForm(__classid(TGDSStdForm), &GDSStdForm);
		Application->CreateForm(__classid(TStdDataForm), &StdDataForm);
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
