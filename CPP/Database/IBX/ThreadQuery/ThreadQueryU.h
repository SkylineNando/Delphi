//---------------------------------------------------------------------------

#ifndef ThreadQueryUH
#define ThreadQueryUH
//---------------------------------------------------------------------------

#include <Data.DB.hpp>
#include <Vcl.Grids.hpp>
#include <IBCustomDataset.hpp>

#include <System.Classes.hpp>
#include "dmThreadU.h"

class ThreadQuery : public TThread
{
	typedef TThread inherited;

private:
	TStringList *myFile;

	TDataSource* dtsResults;
	TdmThread* dmThread;
	UnicodeString FDatabaseName;
	UnicodeString FSql;
	TStringGrid* FGrid;
	UnicodeString FUserName;
	UnicodeString FPassword;
	void __fastcall DisplayResults(void);
	void __fastcall SetColumns(void);
	void __fastcall WriteGridRow(void);
	void __fastcall AddRow(void);

protected:
	virtual void __fastcall Execute(void);

public:
	__fastcall ThreadQuery(UnicodeString SQL, Data::Db::TDataSource* dts, UnicodeString DB_Name, UnicodeString username, UnicodeString password);
	__fastcall ThreadQuery(UnicodeString SQL, Vcl::Grids::TStringGrid* grid, UnicodeString DB_Name, UnicodeString username, UnicodeString password)/* overload */;
	__fastcall virtual ~ThreadQuery(void);
public:
	inline __fastcall ThreadQuery(void) : TThread() { }
	inline __fastcall ThreadQuery(bool CreateSuspended) : TThread(CreateSuspended) { }

};




#endif
