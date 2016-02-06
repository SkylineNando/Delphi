
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>
#include "ffactwin.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "IBCustomDataSet"
#pragma link "IBDatabase"
#pragma link "IBTable"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SaveButtonClick(TObject *Sender)
{
    FILE *outfile;
	WCHAR buff[100];

	wsprintf(buff, L"Save Info For: %s", DBLabel1->Field->AsString.c_str());
	SaveDialog1->Title = buff;

	if (SaveDialog1->Execute())
	{
		outfile = _wfopen(SaveDialog1->FileName.c_str(), L"wt");
		if (outfile)
		{
			fwprintf(outfile, L"Facts on the %s\n\n", DBLabel1->Field->AsString.c_str());
			for (int i=0; i < DBGrid1->FieldCount; i++)
				fwprintf(outfile, L"%s: %s\n",
					(LPSTR)DBGrid1->Fields[i]->FieldName.c_str(),
					(LPSTR)DBGrid1->Fields[i]->AsString.c_str());
			fprintf(outfile, "\n%s\n", (LPSTR)DBMemo1->Text.c_str());
		}
		fclose(outfile);
	}
}
//---------------------------------------------------------------------------


