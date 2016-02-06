// 
// Created by the DataSnap proxy generator.
// 1/31/2013 2:39:56 PM
// 

#include "DataSnapClientClasses.h"

System::UnicodeString __fastcall TServerMethods1Client::EchoString(System::UnicodeString value)
{
  if (FEchoStringCommand == NULL)
  {
    FEchoStringCommand = FDBXConnection->CreateCommand();
    FEchoStringCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FEchoStringCommand->Text = "TServerMethods1.EchoString";
    FEchoStringCommand->Prepare();
  }
  FEchoStringCommand->Parameters->Parameter[0]->Value->SetWideString(value);
  FEchoStringCommand->ExecuteUpdate();
  System::UnicodeString result = FEchoStringCommand->Parameters->Parameter[1]->Value->GetWideString();
  return result;
}

System::UnicodeString __fastcall TServerMethods1Client::ReverseString(System::UnicodeString value)
{
  if (FReverseStringCommand == NULL)
  {
    FReverseStringCommand = FDBXConnection->CreateCommand();
    FReverseStringCommand->CommandType = TDBXCommandTypes_DSServerMethod;
    FReverseStringCommand->Text = "TServerMethods1.ReverseString";
    FReverseStringCommand->Prepare();
  }
  FReverseStringCommand->Parameters->Parameter[0]->Value->SetWideString(value);
  FReverseStringCommand->ExecuteUpdate();
  System::UnicodeString result = FReverseStringCommand->Parameters->Parameter[1]->Value->GetWideString();
  return result;
}


__fastcall  TServerMethods1Client::TServerMethods1Client(TDBXConnection *ADBXConnection)
{
  if (ADBXConnection == NULL)
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
  FDBXConnection = ADBXConnection;
  FInstanceOwner = True;
}


__fastcall  TServerMethods1Client::TServerMethods1Client(TDBXConnection *ADBXConnection, bool AInstanceOwner)
{
  if (ADBXConnection == NULL) 
    throw EInvalidOperation("Connection cannot be nil.  Make sure the connection has been opened.");
  FDBXConnection = ADBXConnection;
  FInstanceOwner = AInstanceOwner;
}


__fastcall  TServerMethods1Client::~TServerMethods1Client()
{
  delete FEchoStringCommand;
  delete FReverseStringCommand;
}

