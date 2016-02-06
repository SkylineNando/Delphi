// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "frmAddCertificateU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmAddCertificate *frmAddCertificate;

// ---------------------------------------------------------------------------
__fastcall TfrmAddCertificate::TfrmAddCertificate(TComponent* Owner)
	: TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAddCertificate::OKBtnClick(TObject *Sender) {

	LicensingService->ID = Trim(edID->Text);
	LicensingService->Key = Trim(edKey->Text);
	try {

		LicensingService->AddLicense();
		ModalResult = mbOK;
	}
	catch (Exception& E) {
		ShowMessage(
			"The certificate could not be validated based on the information given. Please recheck the id and key information.");
	}

}
// ---------------------------------------------------------------------------
