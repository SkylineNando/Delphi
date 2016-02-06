unit MainServerModule;

interface

uses
  SysUtils, Classes, DSServer, DSCommonServer, DSTCPServerTransport,
  WideStrings, FMTBcd, DB, SqlExpr, DBXCommon, DBClient,
  Dialogs, Provider, Windows, WinSock;

type
  TDMMainServerModule = class(TDSServerModule)
    SQLLOG: TSQLDataSet;
    DSPLog: TDataSetProvider;
    CDSLog: TClientDataSet;
    SQLDSJob: TSQLDataSet;
    DSPJob: TDataSetProvider;
    CDSLogLOGID: TIntegerField;
    CDSLogIP_ADDRESS: TStringField;
    CDSLogEVENT: TStringField;
    CDSLogCREATED: TSQLTimeStampField;
    SQLUsers: TSQLDataSet;
    DSPUsers: TDataSetProvider;
  private
    { Private declarations }
    function ReadIPs: TStrings;
  public
    { Public declarations }
    function IpAddress : String;
    function ServerComputerName : String;
  end;

var
  DMMainServerModule: TDMMainServerModule;

implementation

uses User, EmployeeRDM, MethodsServerModule, ServerContainer;

{$R *.dfm}

{ TDSMainServerModule }

function TDMMainServerModule.ServerComputerName: String;
var
  Buffer : array[0..255] of char;
  Size : DWORD;
begin

  if GetComputerName(Buffer, Size) then
     Result := Buffer
  else
     Result := '';

end;

function TDMMainServerModule.IpAddress: String;
var
  iplist : TStrings;
begin
  iplist := ReadIPs;

  if iplist.Count > 0 then
     Result := iplist[0];

  iplist.Free;
end;

function TDMMainServerModule.ReadIPs: TStrings;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  Buffer: PAnsiChar;
  iI: Integer;
  PPtr: PaPInAddr;
  pHE: PHostEnt;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);

  Result := TStringList.Create;

  try
    Result.Clear;
    Buffer := '';
    GetHostName(Buffer, SizeOf(Buffer));
    pHE := GetHostByName(buffer);

    if pHE = nil then
       Exit;

     PPtr := PaPInAddr(pHE^.H_Addr_List);
     iI := 0;
     while pPtr^[iI] <> nil do
     begin
       Result.Add(String(Inet_NToA(PPtr^[iI]^)));
       Inc(iI);
     end;
  finally
     WSACleanup;
  end;

end;

end.
