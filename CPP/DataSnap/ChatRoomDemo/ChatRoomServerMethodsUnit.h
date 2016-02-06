//---------------------------------------------------------------------------

#ifndef ChatRoomServerMethodsUnitH
#define ChatRoomServerMethodsUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <DSServer.hpp>
//---------------------------------------------------------------------------
class TChatRoomServerMethods : public TDSServerModule
{
__published:	// IDE-managed Components

private:	// User declarations

  /// <summary> Escapes the HTML special characters of the given string.
  /// </summary>
  String GetHTMLEscapedString(const String Value);

public:		// User declarations

  /// <summary> Returns the names of all the users currently logged in.
  /// </summary>
  TJSONArray *GetUserList() ;

  /// <summary> Send a message to all users of the chat room.
  /// </summary>
  bool SendMessage(const String Msg);

  /// <summary> Send a message to the specific chat room user
  /// </summary>
  bool SendMessageToUser(const String Msg, const String UserName);
  __fastcall TChatRoomServerMethods(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChatRoomServerMethods *ChatRoomServerMethods;
//---------------------------------------------------------------------------
#endif

