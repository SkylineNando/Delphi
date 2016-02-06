unit ServerBatch;

interface

uses
  SysUtils, Classes, DSServer, DBXJSON, IBServices;

type
  TDSServerBatch = class(TDSServerModule)
    srvBackup: TIBBackupService;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartBackup(sMessage: TDBXCallback);
  end;

var
  DSServerBatch: TDSServerBatch;

implementation

uses ServerContainer;
{$R *.dfm}
{ TDSServerBatch }

procedure TDSServerBatch.StartBackup(sMessage: TDBXCallback);
var
  LCallbackValue: TJSONObject;
  db: String;

begin

  db := DMServerContainer.GetEmployeeDBName;

  srvBackup.DatabaseName := Copy(db, Pos(':', db) + 1, Length(db));

  // ExtractFilePath
  // (DMServerContainer.GetEmployeeDBName) + ExtractFileName
  // (DMServerContainer.GetEmployeeDBName);

  srvBackup.Attach;
  srvBackup.BackupFile.Add(
    'C:\Embarcadero\InterBase2009\examples\database\employee.ib3.ibk');

  srvBackup.ServiceStart;
  if srvBackup.Verbose then
    while not srvBackup.Eof do
    begin

      // if srvBackup.IsServiceRunning then
      begin
        LCallbackValue := TJSONObject.Create;
        LCallbackValue.AddPair(TJSONPair.Create('Server return',
            srvBackup.GetNextLine));

        sMessage.Execute(LCallbackValue);

      end;

    end;

  if srvBackup.Active then
    srvBackup.Detach();

end;

end.
