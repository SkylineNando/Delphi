//---------------------------------------------------------------------------

#ifndef Event2H
#define Event2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBEvents.hpp>
#include <IBStoredProc.hpp>
//---------------------------------------------------------------------------
class TdmEvents : public TDataModule
{
__published:	// IDE-managed Components
	TIBDatabase *Database1;
	TIBTransaction *IBTransaction1;
	TIBStoredProc *StoredProc1;
	TIBEvents *IBEventAlerter1;
	void __fastcall IBEventAlerter1EventAlert(TObject *Sender, UnicodeString EventName,
          int EventCount, bool &CancelAlerts);
private:	// User declarations
public:		// User declarations
	__fastcall TdmEvents(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmEvents *dmEvents;
//---------------------------------------------------------------------------
#endif
