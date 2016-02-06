// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Login.h"
#include "DMClient.h"
#include <except.h>

// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmLogin *FrmLogin;

// ---------------------------------------------------------------------------
__fastcall TFrmLogin::TFrmLogin(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TFrmLogin::edUserNameRightButtonClick(TObject *Sender) {
	((TButtonedEdit *)Sender)->Clear();
}
// ---------------------------------------------------------------------------

bool __fastcall TFrmLogin::DoLogin() {
	// FrmLogin = new TFrmLogin(this);
	if (FrmLogin->ShowModal() == mrOk) {
		String Server = edDSServer->Text;
		String User = edUserName->Text;
		String Pass = edPassowrd->Text;
		String Port = edDSPort->Text;

		DMClientContainer->MyDSServer->Params->Values["HostName"] = Server;
		DMClientContainer->MyDSServer->Params->Values["Port"] = Port;
		DMClientContainer->MyDSServer->Params->Values
			["DSAuthenticationUser"] = User;
		DMClientContainer->MyDSServer->Params->Values
			["DSAuthenticationPassword"] = Pass;

		try {
			DMClientContainer->MyDSServer->Open();
			// DSJobs->DataSet->Open();
			return true;
		}
		catch (Exception &E) {
			MessageDlg(__ThrowExceptionName(), mtError,
				TMsgDlgButtons() << mbOK, 0);
			return false;
		}
	} else {
        return false;
    }

}

void __fastcall TFrmLogin::Button1Click(TObject *Sender) {
	if (Trim(edUserName->Text) == "") {
		edUserName->SetFocus();
		throw Exception("User Name field is required");
	}

	if (Trim(edPassowrd->Text) == "") {
		edPassowrd->SetFocus();
		throw Exception("Password field is required");
	}

	if (Trim(edDSServer->Text) == "") {
		edDSServer->SetFocus();
		throw Exception
			("Password field is requiredDataSnap Server - HostName field is required"
			);
	}

	this->ModalResult = mrOk;

}
// ---------------------------------------------------------------------------
