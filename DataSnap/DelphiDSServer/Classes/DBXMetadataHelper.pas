unit DBXMetadataHelper;

interface

uses Forms, SysUtils, SqlExpr, IBDatabase, DbxCommon, DbxMetaDataProvider,
  DBXDataExpressMetaDataProvider, DbxInterbase, DbxClient;

function DBXGetMetaProvider(const AConnection: TDBXConnection)
  : TDBXDataExpressMetaDataProvider;
procedure InitConnection(conn: TSQLConnection; dbname: string;
  CreateDB: Boolean);
function GetDatabaseDirectory: String;
procedure AddPrimaryKey(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName: string);
procedure AddUniqueIndex(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName: string);
procedure AddForeignKey(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName, PrimaryTableName, PrimaryColumn: string);
procedure CreateGenerator(Provider: TDBXDataExpressMetaDataProvider;
  GenName: string);
procedure CreateAutoIncTrigger(Provider: TDBXDataExpressMetaDataProvider;
  Name, Table, Field, GenName: string);

implementation

function DBXGetMetaProvider(const AConnection: TDBXConnection)
  : TDBXDataExpressMetaDataProvider;
var
  Provider: TDBXDataExpressMetaDataProvider;
begin
  Provider := TDBXDataExpressMetaDataProvider.Create;
  try
    Provider.Connection := AConnection;
    Provider.Open;
  except
    FreeAndNil(Provider);
    raise ;
  end;

  Result := Provider;
end;

procedure InitConnection(conn: TSQLConnection; dbname: string;
  CreateDB: Boolean);
var
  db: TIBDatabase;
begin
  conn.DriverName := 'InterBase';
  conn.Params.Clear;
  conn.Params.Add(TDBXPropertyNames.DriverName + '=InterBase');
  conn.Params.Add(TDBXPropertyNames.Database + '=localhost:' + GetDatabaseDirectory +
      dbname);
  conn.Params.Add(TDBXPropertyNames.UserName + '=sysdba');
  conn.Params.Add(TDBXPropertyNames.Password + '=masterkey');
  conn.LoginPrompt := false;
  if (CreateDB) then
  begin
    db := TIBDatabase.Create(nil);
    db.LoginPrompt := false;
    db.SQLDialect := 3;
    db.DatabaseName := GetDatabaseDirectory + dbname;
    db.Params.Text := 'USER "SYSDBA" PASSWORD "masterkey" ';
    // db.Params.Values['user_name'] := 'sysdba';
    // db.Params.Values['password']  := 'masterkey';
    db.CreateDatabase;
    db.Free;
    // conn.Params.Add('create=true');
  end;
  conn.Open;
end;

function GetDatabaseDirectory: String;
begin
  Result := GetCurrentDir;
  if Result[Length(Result)] <> '\' then
    Result := Result + '\';
  Result := Result + 'Database\';

end;

procedure AddPrimaryKey(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName: string);
var
  index: TDBXMetaDataIndex;
begin
  index := TDBXMetaDataIndex.Create;
  index.TableName := TableName;
  index.AddColumn(ColumnName);

  Provider.CreatePrimaryKey(index);
  index.Free;
end;

procedure AddUniqueIndex(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName: string);
var
  index: TDBXMetaDataIndex;
begin
  index := TDBXMetaDataIndex.Create;
  index.TableName := TableName;
  index.AddColumn(ColumnName);

  Provider.CreateUniqueIndex(index);
  index.Free;
end;

procedure AddForeignKey(Provider: TDBXDataExpressMetaDataProvider;
  TableName, ColumnName, PrimaryTableName, PrimaryColumn: string);
var
  key: TDBXMetaDataForeignKey;
begin
  key := TDBXMetaDataForeignKey.Create;
  key.PrimaryTableName := PrimaryTableName;
  key.TableName := TableName;
  key.AddReference(ColumnName, PrimaryColumn);

  Provider.CreateForeignKey(key);
  key.Free;
end;

procedure CreateGenerator(Provider: TDBXDataExpressMetaDataProvider;
  GenName: string);
var
  cmd: TDBXCommand;
begin

  cmd := Provider.Connection.CreateCommand;
  try
    cmd.CommandType := TDBXCommandTypes.DbxSQL;
    cmd.Text := 'Create Generator ' + GenName;
    cmd.ExecuteUpdate;
  finally
    cmd.Free;
  end;

end;

procedure CreateAutoIncTrigger(Provider: TDBXDataExpressMetaDataProvider;
  Name, Table, Field, GenName: string);
Const
  Trigger: String = 'Create Trigger %s for %s active BEFORE INSERT ' + #13#10 +
    'AS BEGIN ' + #13#10 + '   new.%s = gen_id( %s, 1); ' + #13#10 + ' end';
var
  cmd: TDBXCommand;
begin

  cmd := Provider.Connection.CreateCommand;
  try
    cmd.CommandType := TDBXCommandTypes.DbxSQL;
    cmd.Text := Format(Trigger, [Name, Table, Field, GenName]);
    cmd.ExecuteUpdate;
  finally
    cmd.Free
  end;
end;

end.
