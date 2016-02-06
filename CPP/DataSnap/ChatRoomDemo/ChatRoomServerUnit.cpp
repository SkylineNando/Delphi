
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
#include <DSProxyJavaScript.hpp>
#include <SysUtils.hpp>
#include <stdio.h>
#include <windows.h>
#include "ChatRoomServerUnit.h"
#include "ChatRoomServerContainer.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChatRoomForm *ChatRoomForm;

  TChatRoomUsers *ChatRoomUsers ;
  bool ChatRoomUsersDestroyed;


/* TUserNotifyThread */

TUserNotifyThread::TUserNotifyThread(TDSServer *Server, String UserName, bool WasAdded)
{
  FServer = Server;
  FUserName = UserName;
  FWasAdded = WasAdded;
};

void __fastcall TUserNotifyThread::Execute()
{
  TJSONObject *Msg;
  String EventType;

  FreeOnTerminate = True;

  if (FWasAdded)
    EventType = "user_login";
  else
    EventType = "user_logout";

  //create a JSON object with a message describing the user login/logout event
  Msg = new TJSONObject();
  Msg->AddPair(new TJSONPair("notificationType", EventType));
  Msg->AddPair(new TJSONPair("user", FUserName));

  //give time for the client's callback to be added or removed
  Sleep(1000);

  //send a message to all clients that a user either logged in, or logged out
  FServer->BroadcastMessage(CHAT_ROOM_ID, Msg);
};


/* TBootUserThread */

//---------------------------------------------------------------------------
TBootUserThread::TBootUserThread(TDSServer *Server, String UserName)
{
  FServer = Server;
  FUserName = UserName;
};

//---------------------------------------------------------------------------
void __fastcall TBootUserThread::Execute()
{
  TDSCallbackTunnel *Tunnel;
  String OldSecurityToken;
  String SecurityToken;

  FreeOnTerminate = True;

  if (!FServer || FUserName == EmptyStr)
    return;

  Tunnel = FServer->GetCallbackTunnel(FUserName);

  if (Tunnel)
  {
    SecurityToken = "ThisCanBeAnything";
    OldSecurityToken = Tunnel->SecurityToken;

    //change SecurityToken on the tunnel so the server can kill the callback
    //and nobody else can do anything with it in the meantime.
    Tunnel->SecurityToken = SecurityToken;

    //unregister the callback
    FServer->UnregisterChannelCallback(CHAT_ROOM_ID, FUserName, SecurityToken);

    //remvoe the user from the user list
    TChatRoomUsers::Instance()->RemoveUser(FUserName);
  }
}

//---------------------------------------------------------------------------
TChatRoomUsers::TChatRoomUsers()
{
  ChatRoomUsersDestroyed = False;
  FUsers = new TList();
}

//---------------------------------------------------------------------------
TChatRoomUsers::~TChatRoomUsers()

{
  TChatRoomUser User ;

  ChatRoomUsersDestroyed = True;
  if (FUsers )
  {
    for (int i=0; i < FUsers->Count; i++) {
      // Cast to the correct type
      TChatRoomUser* user = (TChatRoomUser*)FUsers->Items[i];
      // Delete the object and set its pointer to 0
      delete user;
      FUsers->Items[i] = 0;
    }
  }
  FUsers->Clear();
}

//---------------------------------------------------------------------------
TChatRoomUsers *TChatRoomUsers::Instance()
{
  //If the instance has been freed, return nil
  if (ChatRoomUsersDestroyed)
    return 0;

  if (!ChatRoomUsers)
    ChatRoomUsers = new TChatRoomUsers();

  return ChatRoomUsers;
}

//---------------------------------------------------------------------------
void TChatRoomUsers::NotifyUI()
{
  if (UIHook)
  {
    _di_TThreadProcedure methProc(static_cast<TThreadProcedure*>(new TChatQueueProc(UIHook)));
    TThread::Queue(0, methProc);
  }
}

//---------------------------------------------------------------------------
void TChatRoomUsers::NotifyUserChange(String UserName, bool WasAdded)
{
  //start a thread to broadcast user event message to all users
  new TUserNotifyThread(ServerContainerForm->ChatRoomServer, UserName, WasAdded);
}

//---------------------------------------------------------------------------
TStringList *TChatRoomUsers::GetUserNames()

{
  TChatRoomUser User ;

  TStringList *UserList = new TStringList();
  if (ChatRoomUsersDestroyed)
    return 0;

  System::TMonitor::Enter(FUsers);
  try
  {
    for (int i = 0; i < FUsers->Count; i++)
    {
      UserList->Add(((TChatRoomUser *)FUsers->Items[i])->Name);
    }
  }
  __finally
  {
    System::TMonitor::Exit(FUsers);
  }
  return UserList;
}

//---------------------------------------------------------------------------
void TChatRoomUsers::AddUser(String UserName, String SessionId)
{
  TChatRoomUser User ;

  if (UserName == EmptyStr || ChatRoomUsersDestroyed)
    return;

  System::TMonitor::Enter(FUsers);
  try
  {
    for (int i = 0; i < FUsers->Count; i++)
    {
      //if you found a user with the specified name, update his session ID and exit
      if (CompareText(((TChatRoomUser *)FUsers->Items[i])->Name, UserName) == 0)
      {
        User.SessionId = SessionId;
        return;
      }
    }

    //if no user with the name was found, add a new one
    TChatRoomUser *User = new TChatRoomUser();
    User->Name = UserName;
    User->SessionId = SessionId;

    FUsers->Add(User);

    NotifyUserChange(UserName, True);
  }
  __finally
  {
    System::TMonitor::Exit(FUsers);
    NotifyUI();
  }
}

//---------------------------------------------------------------------------
bool TChatRoomUsers::UserExists(String UserName)
{
  int i;
  TChatRoomUser *User ;

  if (UserName == EmptyStr || ChatRoomUsersDestroyed)
    return false;

  System::TMonitor::Enter(FUsers);
  try
  {
    for (i = 0; i < FUsers->Count; i++)
    {
      User = (TChatRoomUser *)FUsers->Items[i];
      if (CompareText(User->Name, UserName) == 0)
        return true;
    }
  }
  __finally
  {
    System::TMonitor::Exit(FUsers);
  }
  return false;
}

//---------------------------------------------------------------------------
void TChatRoomUsers::RemoveUser(String UserName)
{
  int i;
  TChatRoomUser *User;

  if (UserName == EmptyStr || ChatRoomUsersDestroyed)
    return;

  System::TMonitor::Enter(FUsers);
  try
  {
    for (i = 0; i < FUsers->Count; i++)
    {
      User = (TChatRoomUser *)FUsers->Items[i];
      //remove user if the name matches and exit
      if (CompareText(User->Name, UserName) == 0)
      {
        FUsers->Remove(User);
        delete User;
        NotifyUserChange(UserName, False);
        return;
      }
    }
  }
  __finally
  {
    System::TMonitor::Exit(FUsers);
    NotifyUI();
  }
}

//---------------------------------------------------------------------------
__fastcall TChatRoomForm::TChatRoomForm(TComponent* Owner): TForm(Owner)
{
}

/* Method to pass as TDSEventProc ************* */
void __fastcall aDSProc(TObject *Sender,
          const TDSSessionEventType EventType,
          const TDSSession *Session )
{
  //Remove user when we detect a drop
  if (EventType == /*TDSSessionEventType() <<*/ SessionClose )
    TChatRoomUsers::Instance()->RemoveUser(Session->UserName);
}

//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::FormCreate(TObject *Sender)
{

  //Add a procedure to call for updating the UI when the user list changes
  TChatRoomUsers::Instance()->UIHook = &UpdateUserList;

  //NOTE: Users are added in the authentication manager OnUserAuthenticate function for this example,
  //so we only need to listen to SessionClose events
   TDSChatProc dse = &aDSProc;
   if (dse)
   {
     _di_TDSSessionEvent methProc(static_cast<TDSSessionEvent*>(new TDSEventProc(dse)));
     TDSSessionManager::Instance->AddSessionEvent(methProc);
   }
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::FormDestroy(TObject *Sender)
{
  TChatRoomUsers::Instance()->UIHook = 0;
  delete(TChatRoomUsers::Instance());
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::AdminMessageButtonClick(TObject *Sender)
{
  String Msg;
  TJSONObject *JSONMsg;

  Msg = Trim(AdminMessageField->Text);

  //no message to send, so just exit
  if (Msg == EmptyStr)
    return;

  //wrap the message in a JSON object
  JSONMsg = new TJSONObject();
  JSONMsg->AddPair(new TJSONPair("notificationType", "message"));
  JSONMsg->AddPair(new TJSONPair("from", SUPER_USER_NAME));
  JSONMsg->AddPair(new TJSONPair("message", Msg));

  //Send the typed message to all logged in users
  //NOTE: the call to broadcast should really be done in its own thread to avoid locking the UI
  if (ServerContainerForm->ChatRoomServer->BroadcastMessage(CHAT_ROOM_ID, JSONMsg))
    AdminMessageField->Text = EmptyStr;
  else
    ShowMessage("Failed to broadcast message. Sorry!");
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::ProxyButtonClick(TObject *Sender)
{

  TDSJavaScriptProxyWriter *JSProxy;
  String OutputFile;

  OutputFile = ExpandFileName(ServerContainerForm->ChatRoomFileDispatcher->RootDirectory);

  JSProxy = new TDSJavaScriptProxyWriter();

  try
  {
    if (!DirectoryExists(OutputFile))
      ForceDirectories(OutputFile);

    if ( !AnsiEndsStr("\\", OutputFile) &&
      !AnsiEndsStr("/", OutputFile))
      OutputFile = OutputFile + Sysutils::PathDelim;

    //put the proxy file in a subdirectory of the root folder
    OutputFile = OutputFile + Sysutils::PathDelim + "webfiles" + Sysutils::PathDelim;

    //name the proxy file
    OutputFile = OutputFile + "JSProxy.js";

    ProxyConnection->Connected = true;
    JSProxy->UpdateJSProxyFile(ProxyConnection->DBXConnection, OutputFile);
    ProxyConnection->Close();
  }
  __finally
  {
    JSProxy->Free();
  }
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::OpenBrowserButtonClick(TObject *Sender)
{
  wchar_t LURL[512];
  memset(LURL, 0, sizeof(LURL));

  wsprintf(LURL, L"http://localhost:%d/ChatRoom.html",ServerContainerForm->ChatRoomHTTPService->HttpPort);
  ShellExecute(0, NULL, LURL, NULL, NULL, SW_SHOWNOACTIVATE);
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::BootSelectedUser1Click(TObject *Sender)
{
  int i;
  String UserName;

  UserName = EmptyStr;
  for (i = 0; i < UserListBox->Count; i++)
    if (UserListBox->Selected[i])
    {
      UserName = UserListBox->Items->Strings[i];
      break;
    }

  if (UserName != EmptyStr)
  {
    new TBootUserThread(ServerContainerForm->ChatRoomServer, UserName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TChatRoomForm::UpdateUserList()
{
  TStringList *UserNames;
  String UserName;

  UserNames = NULL;

  if (ChatRoomUsersDestroyed || !this || !UserListBox)
    return;

  UserListBox->Items->BeginUpdate();
  try
  {
    UserListBox->Clear();
    UserNames = TChatRoomUsers::Instance()->GetUserNames();

    for (int i = 0; i < UserNames->Count; i++)
      UserListBox->Items->Add(UserNames->Strings[i]);
  }
  __finally
  {
    UserListBox->Items->EndUpdate();
    UserNames->Clear();
    delete UserNames;
  }
};


