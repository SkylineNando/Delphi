unit User;

interface

uses
  BaseServerClass,
  Classes,
  DBXCommon,
  SysUtils,
  Dialogs,
  MainServerModule;

type
{$METHODINFO ON}
  TUser = class(TBaseServerClass)
  private

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddUser(FirstLastName, Login, Password: String);

    function IsValidUser(Login, Password: String): Boolean;

    procedure DisableUser(Login: String);
    procedure EnableUser(Login: String);

  end;

implementation

uses
  ServerContainer;

{ TUser }

procedure TUser.AddUser(FirstLastName, Login, Password: String);
var
  Comm: TDBXCommand;
begin

  if (FirstLastName = '') then
    raise Exception.Create('First/Last name is required');

  if (Login = '') then
    raise Exception.Create('Login is required');

  if (Password = '') then
    raise Exception.Create('Password is required');

  Comm := FDbxConnection.CreateCommand;

  Comm.Text :=
    'Insert Into Users (NAME, LOGIN, "PASSWORD", "ACTIVE" ) Values (' + QuotedStr
    (FirstLastName) + ',' + QuotedStr(Login) + ',' + QuotedStr(Password)
    + ', true)';
  Comm.ExecuteQuery;

  FreeAndNil(Comm);

end;

constructor TUser.Create;
begin
//  FDbxConnection := DMServerContainer.DataSnap_Server_Log.DBXConnection;

  FDbxConnection := GetDbxConnection;

end;

destructor TUser.Destroy;
begin

  inherited;
end;

procedure TUser.DisableUser(Login: String);
var
  Comm: TDBXCommand;
begin

  if (Login = '') then
    raise Exception.Create('Login is required');

  Comm := FDbxConnection.CreateCommand;

  Comm.Text := 'Update Users Set "ACTIVE" = False Where LOGIN = ' + QuotedStr
    (Login);
  Comm.ExecuteQuery;

  FreeAndNil(Comm);

end;

procedure TUser.EnableUser(Login: String);
var
  Comm: TDBXCommand;
begin

  if (Login = '') then
    raise Exception.Create('Login is required');

  Comm := FDbxConnection.CreateCommand;

  Comm.Text := 'Update Users Set "ACTIVE" = True Where LOGIN = ' + QuotedStr
    (Login);
  Comm.ExecuteQuery;

  FreeAndNil(Comm);

end;

function TUser.IsValidUser(Login, Password: String): Boolean;
var
  Comm: TDBXCommand;
  Reader: TDBXReader;
begin
  if (Login = '') then
    raise Exception.Create('Login is required');

  if (Password = '') then
    raise Exception.Create('Password is required');

  Comm := FDbxConnection.CreateCommand;

  Comm.Text := 'Select "ACTIVE" From Users Where LOGIN = ' + QuotedStr(Login)
    + ' and "PASSWORD" = ' + QuotedStr(Password);

  Reader := Comm.ExecuteQuery;

  if Reader.Next then
  begin
    Result := Reader.Value[0].GetBoolean;
  end
  else
    Result := False;

  Reader.Close;
  FreeAndNil(Reader);
  FreeAndNil(Comm);

end;

end.
