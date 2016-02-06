//---------------------------------------------------------------------------

#ifndef DMClientH
#define DMClientH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ImgList.hpp>
#include <Data.DB.hpp>
#include <SqlExpr.hpp>
#include <DBClient.hpp>
#include <DSConnect.hpp>
#include <DBXCommon.hpp>
#include <DBXDataSnap.hpp>
#include <DSClientMetadata.hpp>
#include <DSProxyCpp.hpp>
#include <IndyPeerImpl.hpp>
//---------------------------------------------------------------------------
class TDMClientContainer : public TDataModule
{
__published:	// IDE-managed Components
	TImageList *ImageList1;
	TImageList *ILLarte;
	TBalloonHint *MyBalloonHint;
	TSQLConnection *MyDSServer;
	TClientDataSet *CDSEmployee;
	TClientDataSet *CDSCountry;
	TDSProviderConnection *DSPCEmployeeRDM;
	TDSProviderConnection *DSCMainServerModule;
	TClientDataSet *CDSJobs;
	TIntegerField *CDSJobsJOBID;
	TStringField *CDSJobsJOBNAME;
	TStringField *CDSJobsDESCRIPTION;
	TStringField *CDSJobsJOBCMD;
	TDSProviderConnection *DSPLookupRDM;
	TClientDataSet *CDSDepartment;
	TClientDataSet *CDSCopy;
private:	// User declarations
public:		// User declarations
	__fastcall TDMClientContainer(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDMClientContainer *DMClientContainer;
//---------------------------------------------------------------------------
#endif
