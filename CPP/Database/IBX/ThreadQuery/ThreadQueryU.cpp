// ---------------------------------------------------------------------------

#pragma hdrstop

#include <iostream>
#include <Vcl.Dialogs.hpp>
#include "ThreadQueryU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)

__fastcall ThreadQuery::ThreadQuery(UnicodeString SQL, TDataSource* dts,
	UnicodeString DB_Name, UnicodeString username, UnicodeString password) {

	this->FDatabaseName = DB_Name;
	this->FSql = SQL;
	this->FUserName = username;
	this->FPassword = password;
	this->dtsResults = dts;
}

// -------------------
__fastcall ThreadQuery::ThreadQuery(UnicodeString SQL,
	TStringGrid* grid, UnicodeString DB_Name,
	UnicodeString username, UnicodeString password) {

	this->FDatabaseName = DB_Name;
	this->FSql = SQL;
	this->FGrid = grid;
	this->FUserName = username;
	this->FPassword = password;
}

// -------------------
__fastcall ThreadQuery::~ThreadQuery(void) {
	free(this->dtsResults);
	free(this->FGrid);
}

// -------------------
void __fastcall ThreadQuery::Execute(void) {

	dmThread = new TdmThread(this->FDatabaseName, this->FUserName, this->FPassword);
	// Place thread code here
	for (int i = 1; i <= 10; i++) {
		try {
			dmThread->IBQuery1->Active = false;
			dmThread->IBQuery1->SQL->Clear();
			dmThread->IBQuery1->SQL->Add(FSql);
			dmThread->IBQuery1->Active = true;

			if (FGrid == NULL) {
				Synchronize(DisplayResults);
			}
			else {
				Synchronize(SetColumns);
				while (!dmThread->IBQuery1->Eof) {
					Synchronize(WriteGridRow);
					dmThread->IBQuery1->Next();
					if (!dmThread->IBQuery1->Eof) {
						Synchronize(AddRow);
					}
				}
			}
		}
		catch (Exception &E) {
			ShowMessage(AnsiString(E.ClassName()) + E.Message);
		}
	}
}

// -------------------
void _fastcall ThreadQuery::WriteGridRow(void) {
	int i, row;
	row = this->FGrid->RowCount-1;
	for(i=0;i<=(dmThread->IBQuery1->FieldDefs->Count-1  );i++)
		FGrid->Cells[i][row] = dmThread->IBQuery1->Fields->FieldByNumber(i+1)->AsString;
}

// -------------------
void _fastcall ThreadQuery::AddRow(void) {
	FGrid->RowCount=FGrid->RowCount + 1;
}

// -------------------
void _fastcall ThreadQuery::SetColumns(void) {
	int i;
	FGrid->ColCount = dmThread->IBQuery1->FieldDefs->Count;
	for(i=0;i<dmThread->IBQuery1->FieldDefs->Count;i++)
		FGrid->Cells[i][0] = dmThread->IBQuery1->FieldDefs->Items[i]->Name;
}

// -------------------
void _fastcall ThreadQuery::DisplayResults(void) {
	dtsResults->DataSet = dmThread->IBQuery1;
}

