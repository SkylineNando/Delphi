// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "About.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TAboutDialog *AboutDialog;

// ---------------------------------------------------------------------------
__fastcall TAboutDialog::TAboutDialog(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
extern DELPHI_PACKAGE void __fastcall ShowAboutDialog(void) {
	TAboutDialog *dialog;
	try {
		dialog = new TAboutDialog(Application);
		dialog->AboutMemo->Lines->LoadFromFile
			(ExtractFilePath(ParamStr(0)) + "about.txt");
		dialog->ShowModal();
	}
	catch (Exception &E) {
		ShowMessage(E.Message);
	}
}
