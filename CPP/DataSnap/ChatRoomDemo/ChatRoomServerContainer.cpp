
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

#include "ChatRoomServerContainer.h"
#include "ChatRoomServerMethodsUnit.h"
#include "ChatRoomServerUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TServerContainerForm *ServerContainerForm;
//---------------------------------------------------------------------------
__fastcall TServerContainerForm::TServerContainerForm(TComponent* Owner): TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TServerContainerForm::ChatRoomServerClassGetClass(TDSServerClass *DSServerClass,
          TPersistentClass &PersistentClass)
{
  PersistentClass = __classid(TChatRoomServerMethods);
}
//---------------------------------------------------------------------------
void __fastcall TServerContainerForm::ChatRoomAuthenticationManagerUserAuthorize(TObject *Sender,
          TDSAuthorizeEventObject *AuthorizeEventObject, bool &valid)
{
  if (!AuthorizeEventObject->AuthorizedRoles  && !AuthorizeEventObject->DeniedRoles)
  {
    valid = true;
    return;
  };

  //The UserName passed in here is always goign to be populated from the Session,
  //not from the individual request's user, which prevents hacking in that way and means
  //we don't need to verify the current session's ID matches the session ID corresponding
  //to the user name passed in here. (We can just trust it will.)

  //super user can do whatever he/she wants
  if (AuthorizeEventObject->UserName == SUPER_USER_NAME)
  {
    valid = true;
    return;
  };

  //don't allow a user who isn't logged in to do anything
  if (AuthorizeEventObject->UserName == EmptyStr)
  {
    valid = false;
    return;
  };

  if (!AuthorizeEventObject->AuthorizedRoles  || AuthorizeEventObject->AuthorizedRoles->IndexOf("LoggedInUser") < 0)
  {
    valid = false;
    return;
  };

  valid = TChatRoomUsers::Instance()->UserExists(AuthorizeEventObject->UserName);

}

//---------------------------------------------------------------------------

void __fastcall TServerContainerForm::DataModuleDestroy(TObject *Sender)
{
  ChatRoomServer->Stop();
}

//---------------------------------------------------------------------------

bool IsNumeric(char c)
{
  return (c >= '0' && c <= '9');
};

bool IsAlpha(char c)
{
  return ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'));
};

bool TServerContainerForm::IsAlphaNumeric(const String Value, bool CantStartWithNumber)
{
  int i;
  int Len;
  char c;

  Len = Value.Length();
  for (i = 1; i <= Len; i++)
  {
    c = Value[i];

    //can't start with number
    if (CantStartWithNumber && i == 1 && IsNumeric(c))
      return(False);

    if (!IsNumeric(c) && !IsAlpha(c) && c != '_' )
      return(False);
  };
  return true;
};

void __fastcall TServerContainerForm::ChatRoomAuthenticationManagerUserAuthenticate(TObject *Sender,
          const UnicodeString Protocol, const UnicodeString Context, const UnicodeString User,
          const UnicodeString Password, bool &valid, TStrings *UserRoles)
{
  bool IsSuperUser;
  TDSSession *Session ;
  const char *cLoggedInUser = "LoggedInUser";
  const char *cSuperUser = "SuperUser";

  IsSuperUser = (User == SUPER_USER_NAME && Password == SUPER_USER_PASSWORD);

  //allow a user with no credentials to connect, but don't assign them any roles.
  //this will drastically limit what they are capable of doing on the server.
  if (User == EmptyStr)
  {
    valid = true;
    return;
  };

  valid = False;
  //Note that we don't care about passwords here. Users don't need a password, they just need
  //to specify a name that isn't already in use.
  if (IsSuperUser ||
      (Trim(User) != EmptyStr &&
       Trim(User) != SUPER_USER_NAME &&
       IsAlphaNumeric(User) &&
       User.Length() <= MAX_NAME_LENGTH &&
       !TChatRoomUsers::Instance()->UserExists(User))
       )
  {
    //NOTE: We don't add user role entries for 'ChannelBroadcast' or 'ChannelNotify' here because
    //we want to force the clients to use this project's server methods for sending messages.

    //Add a role for logged in users which allows invocation of server methods in the
    //ChatRoomServerMethods unit
    UserRoles->Add(cLoggedInUser);

    if (IsSuperUser)
      UserRoles->Add(cSuperUser);

    Session = TDSSessionManager::GetThreadSession();

    //Invalid user session, so exit
    if (!Session )
    {
      valid = false;
      return;
    };

    //Add the user to the list of users
    TChatRoomUsers::Instance()->AddUser(User, Session->SessionName);

    valid = true;
  };
}
//---------------------------------------------------------------------------

