unit ServerBatch;

interface

uses SysUtils, Classes, DSServer, DBXJSON, IBServices, IOUtils, Windows,
  RotateImage;

type
  TDSServerBatch = class(TDSServerModule)
    srvBackup: TIBBackupService;

  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartBackup(sMessage: TDBXCallback; sBackupFileName: String);

    procedure OutProcessImage(Args: TDBXCallback; LStream: TStream;
      out OutStream: TStream);
    function RetProcessImage(Args: TDBXCallback; LStream: TStream): TStream;

  end;

var
  DSServerBatch: TDSServerBatch;

implementation

uses ServerContainer;

{$R *.dfm}
{ TDSServerBatch }

procedure TDSServerBatch.StartBackup(sMessage: TDBXCallback;
  sBackupFileName: String);
var
  LCallbackValue: TJSONObject;
  db: String;

begin

  db := DMServerContainer.GetEmployeeDBName;

  srvBackup.DatabaseName := Copy(db, Pos(':', db) + 1, Length(db));

  srvBackup.Attach;
  srvBackup.BackupFile.Add('c:\temp\' + sBackupFileName);

  srvBackup.ServiceStart;
  if srvBackup.Verbose then
    while not srvBackup.Eof do
    begin

      LCallbackValue := TJSONObject.Create;
      LCallbackValue.AddPair(TJSONPair.Create('Server return',
        srvBackup.GetNextLine));

      sMessage.Execute(LCallbackValue);

    end;

  LCallbackValue := TJSONObject.Create;
  LCallbackValue.AddPair(TJSONPair.Create('Status', 'Done'));
  sMessage.Execute(LCallbackValue);

  if srvBackup.Active then
    srvBackup.Detach();

end;

procedure TDSServerBatch.OutProcessImage(Args: TDBXCallback; LStream: TStream;
  out OutStream: TStream);
begin
  OutStream := ProcessImage(Args, LStream);
end;

function TDSServerBatch.RetProcessImage(Args: TDBXCallback;
  LStream: TStream): TStream;
begin
  Result := ProcessImage(Args, LStream)
end;

end.
