//---------------------------------------------------------------------------

#ifndef frmAddCertificateUH
#define frmAddCertificateUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <IBServices.hpp>
//---------------------------------------------------------------------------
class TfrmAddCertificate : public TForm
{
__published:	// IDE-managed Components
	TButton *CancelBtn;
	TEdit *edID;
	TEdit *edKey;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TButton *OKBtn;
	void __fastcall OKBtnClick(TObject *Sender);
private:	// User declarations
	Ibservices::TIBLicensingService* FIBLicensingService;
public:		// User declarations
	__fastcall TfrmAddCertificate(TComponent* Owner);
	__property Ibservices::TIBLicensingService* LicensingService = {read=FIBLicensingService, write=FIBLicensingService};
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmAddCertificate *frmAddCertificate;
//---------------------------------------------------------------------------
#endif
