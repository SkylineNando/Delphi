//---------------------------------------------------------------------------

#ifndef dmThreadUH
#define dmThreadUH

#include <Data.DB.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>

//---------------------------------------------------------------------------
class TdmThread : public TDataModule
{
	typedef TDataModule inherited;

__published:
	TIBDatabase* IBDatabase1;
	TIBTransaction* IBTransaction1;
	TIBQuery* IBQuery1;

public:
	__fastcall TdmThread(UnicodeString DB_Name, UnicodeString Username, UnicodeString Password);
public:
	inline __fastcall virtual TdmThread(TComponent* AOwner, int Dummy) : TDataModule(AOwner, Dummy) { }
	inline __fastcall virtual ~TdmThread(void) { }

};

#endif
