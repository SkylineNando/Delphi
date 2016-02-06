
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
#include <DSService.hpp>
#pragma hdrstop

#include "ChatRoomServerMethodsUnit.h"
#include "ChatRoomServerUnit.h"
#include "ChatRoomServerContainer.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TChatRoomServerMethods::TChatRoomServerMethods(TComponent* Owner)
     : TDSServerModule(Owner)
{
}
//----------------------------------------------------------------------------
bool TChatRoomServerMethods::SendMessageToUser(const String Msg, const String UserName)

{
  String MesgTrimmed;
  TDSSession *Session ;
  TJSONObject *JSONMsg;
  TJSONValue *Resp;
  bool msgResult;

  MesgTrimmed = Trim(Msg);

  //no message to send, so just exit
  if (Msg == EmptyStr)
    return(false);

  //no user to send message to
  if (! TChatRoomUsers::Instance()->UserExists(UserName))
    return(false);

  //get the current session
  Session = TDSSessionManager::GetThreadSession();

  //if the session is invalid, don't send a message
  if (Session == NULL || !TChatRoomUsers::Instance()->UserExists(Session->UserName))
    return(false);

  //don't message yourself!
  if (AnsiCompareText(Session->UserName, UserName) == 0 )
    return(false);

  //wrap the message in a JSON object
  JSONMsg = new TJSONObject();
  JSONMsg->AddPair(new TJSONPair("notificationType", "privatemessage"));
  JSONMsg->AddPair(new TJSONPair("from", Session->UserName));
  JSONMsg->AddPair(new TJSONPair("message", GetHTMLEscapedString(MesgTrimmed)));

  //Send the message to all logged in users
  msgResult = ServerContainerForm->ChatRoomServer->NotifyCallback(CHAT_ROOM_ID, UserName, UserName, JSONMsg, Resp);

  //we don"t care about the response message from the other client, only if it was successfully sent
  Resp = NULL;
  return msgResult;
}
//----------------------------------------------------------------------------
String TChatRoomServerMethods::GetHTMLEscapedString(const String Value)
{
  String strResult = Value;

  strResult = StringReplace(strResult, "&", "&amp;", TReplaceFlags()<<rfReplaceAll);
  strResult = StringReplace(strResult, "\"", "&quot;", TReplaceFlags()<<rfReplaceAll);
  strResult = StringReplace(strResult, "<", "&lt;", TReplaceFlags()<<rfReplaceAll);
  strResult = StringReplace(strResult, ">", "&gt;", TReplaceFlags()<<rfReplaceAll);
  return strResult;
}

//----------------------------------------------------------------------------
TJSONArray *TChatRoomServerMethods::GetUserList()
{
  TStringList *UserNames;
  String User;

  TJSONArray *jsonResult = new TJSONArray();
  UserNames = TChatRoomUsers::Instance()->GetUserNames();

  //not required, but this way the admin looks like he is always watching you!
  jsonResult->Add((UnicodeString)"admin");

  for (int i = 0; i< UserNames->Count; i++)
    jsonResult->Add(UserNames->Strings[i]);

  UserNames->Clear();
  delete UserNames;
  return jsonResult;
}
//----------------------------------------------------------------------------
bool TChatRoomServerMethods::SendMessage(const String Msg)
{
  String MesgTrimmed;
  TDSSession *Session ;
  TJSONObject *JSONMsg ;

  MesgTrimmed = Trim(Msg);

  //no message to send, so just exit
  if (Msg == EmptyStr)
    return(false);

  //get the current session
  Session = TDSSessionManager::GetThreadSession();

  //if the session is invalid, don"t send a message
  if (Session == NULL || !TChatRoomUsers::Instance()->UserExists(Session->UserName))
    return(false);

  //wrap the message in a JSON object
  JSONMsg = new TJSONObject();
  JSONMsg->AddPair(new TJSONPair("notificationType", "message"));
  JSONMsg->AddPair(new TJSONPair("from", Session->UserName));
  JSONMsg->AddPair(new TJSONPair("message", GetHTMLEscapedString(MesgTrimmed)));

  //Send the message to all logged in users
  return ServerContainerForm->ChatRoomServer->BroadcastMessage(CHAT_ROOM_ID, JSONMsg);
}


