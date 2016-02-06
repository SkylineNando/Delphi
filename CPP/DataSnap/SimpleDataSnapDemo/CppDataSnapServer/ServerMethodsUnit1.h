//----------------------------------------------------------------------------

#ifndef ServerMethodsUnit1H
#define ServerMethodsUnit1H
//----------------------------------------------------------------------------
#include <Classes.hpp>
#include <DSServer.hpp>
//----------------------------------------------------------------------------
class DECLSPEC_DRTTI TServerMethods1 : public TComponent
{
private:	// User declarations
public:		// User declarations
    System::UnicodeString EchoString(System::UnicodeString value);
    System::UnicodeString  ReverseString(System::UnicodeString value);
};
#endif

