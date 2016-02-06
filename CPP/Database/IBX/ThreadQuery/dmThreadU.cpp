//---------------------------------------------------------------------------

#pragma hdrstop

#include "dmThreadU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)


__fastcall TdmThread::TdmThread(UnicodeString DB_Name, UnicodeString Username, UnicodeString Password):TDataModule(this->Owner, NULL)
{

	this->IBDatabase1 = new TIBDatabase(this);
	this->IBTransaction1 = new TIBTransaction(this);
	this->IBQuery1 = new TIBQuery(this);

	// inicialization:
	this->IBDatabase1->LoginPrompt = false;
	this->IBDatabase1->DefaultTransaction = this->IBTransaction1;
	this->IBTransaction1->DefaultDatabase = this->IBDatabase1;
	this->IBQuery1->Database = this->IBDatabase1;
	this->IBQuery1->Transaction = this->IBTransaction1;

	// params and connection
	this->IBDatabase1->DatabaseName = DB_Name;
	this->IBDatabase1->Params->Add("user_name=" + Username);
	this->IBDatabase1->Params->Add("password=" + Password);
	this->IBDatabase1->Connected = true;

}

