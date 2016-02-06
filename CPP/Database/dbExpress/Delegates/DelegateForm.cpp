
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

#include "DelegateForm.h"
#include <DBXTrace.hpp>
#include <Registry.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

const char
  TraceDelegateDemoFile[] = "TraceDelegateDemo.txt";

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ListBox1Click(TObject *Sender)
{
  String ConnectionName;
  int Index ;

  Index = ListBox1->ItemIndex;
  if (Index < 0)
	Index = 0;
  ConnectionName = ListBox1->Items->Strings[Index];
  RadioGroup2->Items->Clear();
  RadioGroup2->Items->Add(ConnectionName);
  RadioGroup2->Items->Add("Trace_DelegateDemo (DBXTrace->"+ConnectionName+")");
  RadioGroup2->Items->Add("Pool_DelegateDemo (DBXPool->"+ConnectionName+")");
  RadioGroup2->Items->Add("PoolTrace_DelegateDemo (DBXPool->DBXTrace->"+ConnectionName+")");
  RadioGroup2->ItemIndex = 0;
};
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  TDBXConnectionFactory::GetConnectionFactory()->GetConnectionItems(ListBox1->Items);
  FPoolConnections = new TStringList();
  FPoolTraceConnections = new TStringList();
  FConnectionsFileName = GetConnectionsIniFile();
  FDriversFileName = GetDriversIniFile();
  TraceFileLabel->Caption = TraceDelegateDemoFile;
  DbxConnectionsLabel->Caption = FConnectionsFileName;
  DbxDriverLabel->Caption = FDriversFileName;
  DeleteFile(TraceDelegateDemoFile);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
  ExecuteQuery();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
  String ConnectionName ;

  ConnectionName =  RadioGroup2->Items->Strings[0];
  AddDelegatesToIniFile(ConnectionName);
  switch ( RadioGroup2->ItemIndex)
  {
	case 1:   ConnectionName = FTraceConnectionName;
	case 2: ConnectionName = FPoolConnectionName;
	case 3: ConnectionName = FPoolTraceConnectionName;
  };
  SQLConnection1->ConnectionName = ConnectionName;
  SQLConnection1->Connected = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Memo1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
  if (Key == VK_F9)
	ExecuteQuery();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox1Enter(TObject *Sender)
{
  InitCommands();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
  Memo1->Clear();
  Memo1->Lines->Add(ComboBox1->Text);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button4Click(TObject *Sender)
{
  ClientDataSet1->ApplyUpdates(-1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button5Click(TObject *Sender)
{
  SQLConnection1->Connected = false;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DbxConnectionsButtonClick(TObject *Sender)
{
  EditFile(FConnectionsFileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DbxDriversButtonClick(TObject *Sender)
{
  EditFile(FDriversFileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NonPooledBenchButtonClick(TObject *Sender)
{
  ConnectDisConnect(false);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::PoolConnectButtonbClick(TObject *Sender)
{
  OpenConnections(false);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::PooledBenchButtonClick(TObject *Sender)
{
  ConnectDisConnect(true);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::PoolTraceConnectButtonClick(TObject *Sender)
{
  OpenConnections(true);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TraceFileButtonClick(TObject *Sender)
{
  EditFile(TraceDelegateDemoFile);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox2Enter(TObject *Sender)
{
  InitCommandTypes();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ConnectDisConnect(bool Pooled)
{
  String ConnectionName;
  TEdit *EditBox;
  TLabel *LabelOut;
  int Count;
  int i;
  TDBXConnection *Connection;
  unsigned long StartTicks;
  unsigned long Ticks;

  if (Pooled)
  {
	ConnectionName  = FPoolConnectionName;
	EditBox         = PooledBenchEdit;
	LabelOut        = PooledBenchLabel;
  } else
  {
	ConnectionName  = FConnectionName;
	EditBox         = NonPooledBenchEdit;
	LabelOut        = NonPooledBenchLabel;
  };

  Count = StrToInt(EditBox->Text);
  StartTicks = GetTickCount();
  for (i = 0; i <  Count; i++)
  {
	Connection = TDBXConnectionFactory::GetConnectionFactory()
				  ->GetConnection(ConnectionName, "", "");
	Connection->Free();
  };
  Ticks = GetTickCount() - StartTicks;
  LabelOut->Caption = IntToStr((int)Ticks) + " Ticks";
};
//---------------------------------------------------------------------------

void __fastcall TForm1::CopyConnection(TMemIniFile *IniFile, String SourceName,
  String DestName)
{
  TStringList *List;
  int i;
  String Value;

  IniFile->EraseSection(DestName);
  List = new TStringList();
  try {
	IniFile->ReadSection(SourceName, List);
	for (i = 0; i < List->Count; i++)
	{
	  Value = IniFile->ReadString(SourceName, List->Strings[i], "");
	  IniFile->WriteString(DestName, List->Strings[i], Value);
	};

  } __finally {
	List->Free();
  };

};
//---------------------------------------------------------------------------
void __fastcall TForm1::OpenConnections(bool PoolTrace)
{
  TEdit *EditBox;
  TStringList *ConnectionList;
  String ConnectionName;
  int Index;
  int Count;

  if (PoolTrace)
  {
	EditBox = PoolConnectEdit;
	ConnectionList = FPoolTraceConnections;
	ConnectionName = FPoolTraceConnectionName;
  }
  else
  {
	EditBox = PoolTraceConnectEdit;
	ConnectionList = FPoolConnections;
	ConnectionName = FPoolConnectionName;
  };
  Count = ConnectionList->Count;
  for (Index = 0; Index < Count; Index++)
	ConnectionList->Objects[Index]->Free();
  ConnectionList->Clear();
  Count = StrToInt(EditBox->Text);
  for (Index = 0; Index < Count; Index++)
	ConnectionList->AddObject("", TDBXConnectionFactory::GetConnectionFactory()
							->GetConnection(ConnectionName, "", ""));
};
//---------------------------------------------------------------------------
void __fastcall TForm1::InitCommands()
{
  String CommandType;

  if (ComboBox2->Items->Count < 1)
	InitCommandTypes();

  CommandType = ComboBox2->Items->Strings[ComboBox2->ItemIndex];

  ComboBox1->Items->Clear();
  if (SQLConnection1->DBXConnection )
	SQLConnection1->DBXConnection->GetCommands(CommandType, ComboBox1->Items);

  ComboBox1->ItemIndex = 0;
};

//---------------------------------------------------------------------------
void __fastcall TForm1::InitCommandTypes()
{
  if (FLastConnectionName != SQLConnection1->ConnectionName)
  {
	ComboBox2->Items->Clear();
	if (SQLConnection1->DBXConnection )
	  SQLConnection1->DBXConnection->GetCommandTypes(ComboBox2->Items);

	ComboBox2->ItemIndex = 0;
	FLastConnectionName = SQLConnection1->ConnectionName;
  };
};
//---------------------------------------------------------------------------
void __fastcall TForm1::ExecuteQuery()
{
  int ParamCount;
  int Index;
  String StringValue;

  ClientDataSet1->Active = false;
  InitCommandTypes();
  SQLDataSet1->DbxCommandType = ComboBox2->Items->Strings[ComboBox2->ItemIndex];
  SQLDataSet1->CommandText = Memo1->Lines->Text;
  if (SQLDataSet1->CommandType == ctServerMethod)
  {
	ParamCount = SQLDataSet1->Params->Count;
	if (ParamCount > 0 &&
		SQLDataSet1->Params[ParamCount-1][0]->DataType != ftCursor)
	{
	  SQLDataSet1->ExecSQL();
	  StringValue = "";
	  for (Index = 0; Index < ParamCount; Index++)
	  {
		switch (SQLDataSet1->Params[Index][0]->ParamType)
		{
		  case ptOutput:
		  case ptInputOutput:
		  case ptResult:
			StringValue = StringValue + SQLDataSet1->Params[Index][0]->Value;
		  default: ;
		};
		EditResult->Text = StringValue;
	  };
	  exit;
	};
  };
  ClientDataSet1->Active = true;
};
//---------------------------------------------------------------------------

void __fastcall TForm1::AddDelegatesToIniFile(String ConnectionName)
{
  TMemIniFile *IniFile;


  FConnectionName           = ConnectionName;
  FPoolConnectionName       = "Pool_DelegateDemo";
  FTraceConnectionName      = "Trace_DelegateDemo";
  FPoolTraceConnectionName  = "PoolTrace_DelegateDemo";

  IniFile = new TMemIniFile(FConnectionsFileName);

  // Clone the DBXTrace and send the trace output to a local file.
  //
  CopyConnection(IniFile, "DBXTraceConnection", "DBXTraceConnection_DelegateDemo");
  // Send trace to file instead of to console.
  //
  IniFile->WriteString("DBXTraceConnection_DelegateDemo", TDBXTracePropertyNames_TraceFile, TraceDelegateDemoFile);
  // Disable noisy driver tracing.
  //
  IniFile->WriteString("DBXTraceConnection_DelegateDemo", TDBXTracePropertyNames_TraceDriver, "False");
  // Create a Pool->Trace Delegate Driver connection that can be used
  // by other connections that need a delegate that performs pooling
  // and tracing.
  //
  CopyConnection(IniFile, "DBXPoolConnection", "DBXPoolTraceConnection_DelegateDemo");
  IniFile->WriteString("DBXPoolTraceConnection_DelegateDemo", TDBXPropertyNames_DelegateConnection, "DBXTraceConnection_DelegateDemo");
  IniFile->WriteString(FPoolTraceConnectionName, TDBXPropertyNames_DelegateConnection, "DBXPoolTraceConnection");

  // Add a connection that uses trace delegate.
  //
  CopyConnection(IniFile, ConnectionName, FTraceConnectionName);
  IniFile->WriteString(FTraceConnectionName, TDBXPropertyNames_DelegateConnection, "DBXTraceConnection_DelegateDemo");

  // Add a connection that uses pool delegate.
  //
  CopyConnection(IniFile, ConnectionName, FPoolConnectionName);
  IniFile->WriteString(FPoolConnectionName, TDBXPropertyNames_DelegateConnection, "DBXPoolConnection");

  // Add a connection that uses pool->trace delegate.
  //
  CopyConnection(IniFile, ConnectionName, FPoolTraceConnectionName);
  IniFile->WriteString(FPoolTraceConnectionName, TDBXPropertyNames_DelegateConnection, "DBXPoolTraceConnection_DelegateDemo");

  IniFile->UpdateFile();
  IniFile->Free();

  // Force the default factory to reload the ini file.
  //
  TDBXConnectionFactory::GetConnectionFactory()->Close();
  TDBXConnectionFactory::GetConnectionFactory()->Open();

};
//---------------------------------------------------------------------------
void __fastcall TForm1::EditFile(String FileName)
{
  TShellExecuteInfo *SEI ;
  memset(SEI, 0, sizeof(TShellExecuteInfo));
  SEI->cbSize = sizeof(TShellExecuteInfo);
  SEI->fMask = SEE_MASK_NOCLOSEPROCESS;
  SEI->hwnd = 0;
  SEI->lpFile = PChar("NotePad.exe");
  SEI->lpParameters = FileName.c_str() ;
  SEI->nShow = SW_SHOW;
  if (! ShellExecuteEx(SEI))
    throw Exception("Problem launching notepad.exe "+FileName);
};
//---------------------------------------------------------------------------


String __fastcall TForm1::GetConnectionsIniFile()
{
  TRegistry *Reg;
  String IniFileName = TDBXConnectionFile;
  Reg = new TRegistry();
  try
  {
	Reg->RootKey = HKEY_CURRENT_USER;
	if (Reg->OpenKeyReadOnly(TDBXRegistryKey))
	  IniFileName = Reg->ReadString(TDBXRegistryConnectionValue);
  }
  __finally
  {
	Reg->Free();
  };
  return IniFileName;
};
//---------------------------------------------------------------------------

String __fastcall TForm1::GetDriversIniFile()
{
  TRegistry *Reg;

  String DrvFileName = TDBXDriverFile;
  Reg = new TRegistry();
  try {
	Reg->RootKey = HKEY_CURRENT_USER;
	if (Reg->OpenKeyReadOnly(TDBXRegistryKey))
	  DrvFileName = Reg->ReadString(TDBXRegistryDriverValue);
  }
  __finally
  {
	Reg->Free();
  };
  return DrvFileName;
};
//---------------------------------------------------------------------------
/*
procedure TForm1.EmptyTraceFileClick(Sender: TObject);
{
  DeleteFile(TraceDelegateDemoFile);
end;

*/
//---------------------------------------------------------------------------


