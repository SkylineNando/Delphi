//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------


#include <fmx.h>

#pragma hdrstop
#pragma argsused

#include <tchar.h>
#include <stdio.h>
//#include <System.SysUtils.hpp>
#include <Data.DBXDynalink.hpp>
#include <Data.DBXCommon.hpp>
#include <Data.DBXInterbase.hpp>
#include <memory>


int _tmain(int argc, _TCHAR* argv[]) {

	// Get database connection instance

	std::auto_ptr<TDBXConnection>conn
		(TDBXConnectionFactory::GetConnectionFactory()->GetConnection
		("EMPLOYEE", "sysdba", "masterkey"));

	if (conn.get() != NULL) {

		printf("================= Connection Properties ============\n");

		AnsiString s = conn->ConnectionProperties->Properties->Text + "\n";
		printf("%s", s.c_str());

		// create command and transaction objects to execute the query
		std::auto_ptr<TDBXCommand>command(conn->CreateCommand());

		// initiate a transaction
		TDBXTransaction *transaction =
			conn->BeginTransaction(TDBXIsolations::ReadCommitted);

		command->Text = "SELECT * FROM Country";
		command->Prepare();

		// execute the query and get the cursor (DBXReader)
		std::auto_ptr<TDBXReader>reader(command->ExecuteQuery());

		// print number of columns and each record
		printf("%s", AnsiString("Number of Columns:" + IntToStr(reader->ColumnCount) +
			"\n").c_str());

		// display the list of records
		while (reader->Next()) {
			printf("%s", (reader->Value[reader->GetOrdinal("COUNTRY")]->GetAnsiString
				() + "\n").c_str());
		}

		printf("====================================================\n");

		conn->CommitFreeAndNil(transaction);
	}

	Sleep(5000);
	return 0;
}
