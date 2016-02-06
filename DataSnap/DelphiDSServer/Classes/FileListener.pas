unit FileListener;

interface

uses
  Classes, Generics.Collections, SysUtils, DBXCommon, DBXJSON;

type
  TFileListenerControl = (FILE_LISTENER_CONTINUE = 1, FILE_LISTENER_STOP,
    FILE_LISTENER_DISCARD);

  TFileListener = class
  public
    function BytesCopied(Parent: string; Dir: string; Name: string;
      CopiedSize: Int64; FileSize: Int64; Stream: TStream)
      : TFileListenerControl; virtual; abstract;
  end;

implementation

uses Windows, IOUtils, StrUtils, WinSock;


resourcestring
  sFileDoesNotExist = 'File does not exist: %s';

type
  TFileListenerCallBack = class(TDBXCallback)
  private
    FDir: string;
    FName: string;
    FSize: Int64;
    FHostName: string;
    FListener: TFileListener;
  public
    constructor Create(Listener: TFileListener);
    function Execute(const Args: TJSONValue): TJSONValue; override;
    property HostName: string read FHostName write FHostName;
    property Size: Int64 read FSize write FSize;
    property Name: string read FName write FName;
    property Dir: string read FDir write FDir;
    property Listener: TFileListener read FListener;
  end;

  { TFileListenerCallBack }
constructor TFileListenerCallBack.Create(Listener: TFileListener);
begin
  inherited Create();
  FListener := Listener;
end;

function TFileListenerCallBack.Execute(const Args: TJSONValue): TJSONValue;
var
  Copied: Int64;
  Response: TFileListenerControl;
begin
  Copied := StrToInt64(Args.Value());
  Response := Listener.BytesCopied(HostName, Dir, Name, Copied, Size, nil);
  Result := TJSONString.Create(IntToStr(Integer(Response)));
end;

end.
