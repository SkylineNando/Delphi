//---------------------------------------------------------------------------

#ifndef ChatRoomServerContainerH
#define ChatRoomServerContainerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBXCommon.hpp>
#include <DSCommonServer.hpp>
#include <DSHTTP.hpp>
#include <DSHTTPCommon.hpp>
#include <DSServer.hpp>
#include <DSTCPServerTransport.hpp>
#include <DSAuth.hpp>
#include <IPPeerServer.hpp>

const char
  SUPER_USER_NAME[] = "admin";
const char
  SUPER_USER_PASSWORD[] = "faster34567890";
const int MAX_NAME_LENGTH = 20;


//---------------------------------------------------------------------------
class TServerContainerForm : public TDataModule
{
__published:	// IDE-managed Components
  TDSServer *ChatRoomServer;
  TDSTCPServerTransport *ChatRoomTransport;
  TDSServerClass *ChatRoomServerClass;
  TDSAuthenticationManager *ChatRoomAuthenticationManager;
  TDSHTTPService *ChatRoomHTTPService;
  TDSHTTPServiceFileDispatcher *ChatRoomFileDispatcher;

  void __fastcall ChatRoomServerClassGetClass(TDSServerClass *DSServerClass,
	  TPersistentClass &PersistentClass);
  void __fastcall ChatRoomAuthenticationManagerUserAuthorize(TObject *Sender,
	  TDSAuthorizeEventObject *AuthorizeEventObject, bool &valid);
  void __fastcall ChatRoomAuthenticationManagerUserAuthenticate(TObject *Sender,
		  const UnicodeString Protocol, const UnicodeString Context,
		  const UnicodeString User, const UnicodeString Password,
		  bool &valid, TStrings *UserRoles);
  void __fastcall DataModuleDestroy(TObject *Sender);

private:	// User declarations
  bool TServerContainerForm::IsAlphaNumeric(const String Value, bool CantStartWithNumber = false);
public:		// User declarations
  __fastcall TServerContainerForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TServerContainerForm *ServerContainerForm;
//---------------------------------------------------------------------------
#endif
