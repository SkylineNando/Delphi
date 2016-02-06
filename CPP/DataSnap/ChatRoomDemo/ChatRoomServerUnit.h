//---------------------------------------------------------------------------

#ifndef ChatRoomServerUnitH
#define ChatRoomServerUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBXCommon.hpp>
#include <DbxDataSnap.hpp>
#include <DSSession.hpp>
#include <DSServer.hpp>
#include <DSHTTPLayer.hpp>
#include <Menus.hpp>
#include <SqlExpr.hpp>
#include <IPPeerClient.hpp>
#include <Data.DbxHTTPLayer.hpp>
//---------------------------------------------------------------------------
const char
  CHAT_ROOM_ID[] = "ChatRoom";

  /// <summary>
  ///    Thread for broadcasting a message to all users, notifying them that
  ///    a user has logged in or out.
  /// </summary>
  class TUserNotifyThread : public TThread
  {
  protected:
	TDSServer *FServer ;
	String FUserName;
	bool FWasAdded;
  public:
	virtual TUserNotifyThread(TDSServer *Server, String UserName, bool WasAdded );
	void __fastcall Execute();
  };

  /// <summary>
  ///   Boots the user with the given name.
  /// </summary>
  class TBootUserThread : public TThread
  {
  protected:
	TDSServer *FServer ;
	String FUserName;
  public:
	virtual TBootUserThread(TDSServer *Server, String UserName);
	void __fastcall Execute();
  };

  /// <summary> A no-arg procedure which will tell the UI to update its user list. </summary>
  typedef void __fastcall (__closure *TUIHookCallback)(void);

  typedef void __fastcall (*TDSChatProc)(TObject *Sender, const TDSSessionEventType EventType, const TDSSession *Session);

  /// <summary> Represents a single logged in user of the chat room. The ID of his session is
  ///    held here as logging in and out of the chat room is done by active sessions with the server.
  /// </summary>
  class TChatRoomUser
  {
  private:
	String FName;
	String FSessionId;
  public:
	__property String Name = {read=FName, write=FName};
	__property String SessionId = {read=FSessionId, write=FSessionId};
  };

  // Interface for thread callback
  class TChatQueueProc : public TCppInterfacedObject<TThreadProcedure>
  {
  private:
	TUIHookCallback FUIHook ;
  public:
	TChatQueueProc(TUIHookCallback& AUIHook) :FUIHook(AUIHook) {}
	__fastcall ~TChatQueueProc() {}
	virtual void __fastcall Invoke()
	{
	  FUIHook();
	}
  };

  // Interface for DSSessionEvent
  class TDSEventProc : public TCppInterfacedObject<TDSSessionEvent>
  {
  private:
	TDSChatProc FUIProc ;
  public:
	TDSEventProc(TDSChatProc& AUIProc) : FUIProc(AUIProc) {}
	 __fastcall ~TDSEventProc() {};
	 void __fastcall Invoke(System::TObject* Sender, const TDSSessionEventType EventType, TDSSession* const Session)
	 {
	   FUIProc(Sender , EventType, Session);
	 }
  };

  /// <summary> A singleton class for managing a list of logged in users.
  /// </summary>
  /// <remarks> The user authenticate function of the server container unit chooses which logging in
  ///   users are allowed and which are denied. If a login is allowed than a session is created and
  ///   when that happens a new user record will be created.
  /// </remarks>
  class TChatRoomUsers
  {
  private:
	TList *FUsers;
	TUIHookCallback FQueueHook ;

	void NotifyUI();
	void NotifyUserChange(String UserName, bool WasAdded);
  public:
	TChatRoomUsers();
	~TChatRoomUsers();

	/// <summary> Returns the single instance of this class. If none exists yet, it will be created.
	/// </summary>
	static TChatRoomUsers *Instance();
	/// <summary> Returns true if a user with the given name (ignore case) is in the user list.
	/// </summary>
	bool UserExists(String UserName);
	/// <summary> Removes the given user, if the name was found
	/// </summary>
	void RemoveUser(String UserName);
	/// <summary> Adds the user to the list. If the user is found,
	///    replaces the previous session ID with the one specified here.
	/// </summary>
	void AddUser(String UserName, String SessionId);
	/// <summary> Returns a list of the user names
	/// </summary>
	TStringList *GetUserNames();
	/// <summary> Set a no-args procedure to be notified when the user list changes
	/// </summary>
	__property TUIHookCallback UIHook = {read=FQueueHook, write=FQueueHook};
  };

  class TChatRoomForm : public TForm
  {
  __published:	// IDE-managed Components
	TButton *ProxyButton;
	TPopupMenu *PopupMenu1;
	TMenuItem *BootSelectedUser1;
	TSQLConnection *ProxyConnection;
	TButton *OpenBrowserButton;
	TButton *AdminMessageButton;
	TEdit *AdminMessageField;
	TListBox *UserListBox;
	TLabel *AdminMessageLabel;
	TLabel *UsersLabel;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall AdminMessageButtonClick(TObject *Sender);
	void __fastcall ProxyButtonClick(TObject *Sender);
	void __fastcall OpenBrowserButtonClick(TObject *Sender);
	void __fastcall BootSelectedUser1Click(TObject *Sender);
  private:	// User declarations
	TDSChatProc FDSProc;
  public:	// User declarations
	__fastcall TChatRoomForm(TComponent* Owner);
	void __fastcall UpdateUserList();
	__property TDSChatProc UIProc = {read=FDSProc, write=FDSProc};
  };
//---------------------------------------------------------------------------
extern PACKAGE TChatRoomForm *ChatRoomForm;
//---------------------------------------------------------------------------
#endif
