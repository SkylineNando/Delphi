//----------------------------------------------------------------------------

#ifndef ServerContainerUnit1H
#define ServerContainerUnit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <DSCommonServer.hpp>
#include <DSServer.hpp>
#include <DSTCPServerTransport.hpp>
#include <DSAuth.hpp>
#include <IPPeerServer.hpp>
//----------------------------------------------------------------------------
class TServerContainer1 : public TDataModule
{
__published:	// IDE-managed Components
	TDSServer *DSServer1;
	TDSTCPServerTransport *DSTCPServerTransport1;
	TDSServerClass *DSServerClass1;
	void __fastcall DSServerClass1GetClass(TDSServerClass *DSServerClass, TPersistentClass &PersistentClass);
private:	// User declarations
public:		// User declarations
	__fastcall TServerContainer1(TComponent* Owner);
};
//----------------------------------------------------------------------------
extern PACKAGE TServerContainer1 *ServerContainer1;
//----------------------------------------------------------------------------
#endif

