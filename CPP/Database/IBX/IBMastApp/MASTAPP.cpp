// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include <WinHelpViewer.hpp>
#pragma link "vcl.WinHelpViewer"
#include "splash.cpp"

// ---------------------------------------------------------------------------
USEFORM("about.cpp", AboutBox);
USEFORM("brcstord.cpp", BrCustOrdForm);
USEFORM("brparts.cpp", BrPartsForm);
USEFORM("datamod.cpp", MastData); /* TDataModule: File Type */
USEFORM("edcust.cpp", EdCustForm);
USEFORM("edorders.cpp", EdOrderForm);
USEFORM("edparts.cpp", EdPartsForm);
USEFORM("main.cpp", MainForm);
USEFORM("pickdate.cpp", BrDateForm);
USEFORM("pickinvc.cpp", PickOrderNoDlg);
USEFORM("qrycust.cpp", QueryCustDlg);
USEFORM("srchdlg.cpp", SearchDlg);

// ---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int) {
	try {
		SplashForm = new TSplashForm(Application);
		SplashForm->Show();
		SplashForm->Update();

		Application->Initialize();
		Application->Title = "Marine Adventures Order Entry";
		Application->HelpFile = "MASTAPP.HLP";
		Application->CreateForm(__classid(TMainForm), &MainForm);
		Application->CreateForm(__classid(TMastData), &MastData);
		Application->CreateForm(__classid(TAboutBox), &AboutBox);
		Application->CreateForm(__classid(TQueryCustDlg), &QueryCustDlg);
		Application->CreateForm(__classid(TBrPartsForm), &BrPartsForm);
		Application->CreateForm(__classid(TBrCustOrdForm), &BrCustOrdForm);
		Application->CreateForm(__classid(TEdCustForm), &EdCustForm);
		Application->CreateForm(__classid(TBrDateForm), &BrDateForm);
		Application->CreateForm(__classid(TSearchDlg), &SearchDlg);
		Application->CreateForm(__classid(TEdPartsForm), &EdPartsForm);
		Application->CreateForm(__classid(TEdOrderForm), &EdOrderForm);
		Application->CreateForm(__classid(TPickOrderNoDlg), &PickOrderNoDlg);
		SplashForm->Hide();
		SplashForm->Close();
		Application->Run();
	}
	catch (Exception &exception) {
		Application->ShowException(&exception);
	}

	return 0;
}
// ---------------------------------------------------------------------------
