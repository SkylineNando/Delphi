#ifndef DataSnapClientClassesH
#define DataSnapClientClassesH

#include "DBXCommon.hpp"
#include "Classes.hpp"
#include "SysUtils.hpp"
#include "DB.hpp"
#include "SqlExpr.hpp"
#include "DBXDBReaders.hpp"
#include "DBXCDSReaders.hpp"

  class TServerMethods1Client : public TObject
  {
  private:
    TDBXConnection *FDBXConnection;
    bool FInstanceOwner;
    TDBXCommand *FEchoStringCommand;
    TDBXCommand *FReverseStringCommand;
  public:
    __fastcall TServerMethods1Client(TDBXConnection *ADBXConnection);
    __fastcall TServerMethods1Client(TDBXConnection *ADBXConnection, bool AInstanceOwner);
    __fastcall ~TServerMethods1Client();
    System::UnicodeString __fastcall EchoString(System::UnicodeString value);
    System::UnicodeString __fastcall ReverseString(System::UnicodeString value);
  };

#endif
