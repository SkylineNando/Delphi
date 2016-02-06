// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
// ---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
#include "Login.h"
USEFORM("DMClient.cpp", DMClientContainer); /* TDataModule: File Type */
USEFORM("Login.cpp", FrmLogin);
USEFORM("Main.cpp", FrmMain);
USEFORM("RecError.cpp", ReconcileErrorForm);

// ---------------------------------------------------------------------------
WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int) {
	try {
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFrmMain), &FrmMain);
		Application->CreateForm(__classid(TDMClientContainer),
			&DMClientContainer);
		Application->CreateForm(__classid(TFrmLogin), &FrmLogin);

		if (FrmLogin->DoLogin()) {
			Application->Run();
		}
		else {
			Application->Terminate();
		}
	}
	catch (Exception &exception) {
		Application->ShowException(&exception);
	}
	catch (...) {
		try {
			throw Exception("");
		}
		catch (Exception &exception) {
			Application->ShowException(&exception);
		}
	}
	return 0;
}
// ---------------------------------------------------------------------------
