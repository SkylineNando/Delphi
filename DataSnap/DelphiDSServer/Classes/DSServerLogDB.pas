{
Unit to boot-strap and create a new database, if it's not already present
}
unit DSServerLogDB;

interface

const
  DB_NAME = 'DSSERVERLOG.IB';
  DBEMPLOYEE_NAME = 'Employee.ib';
procedure CreateLogDB;

implementation

uses
  Forms, SysUtils, SqlExpr, DbxMetaDataHelper,
  DbxCommon, DbxMetaDataProvider, DBXDataExpressMetaDataProvider,
  DbxInterbase, DbxClient, Dialogs;


procedure CreateSchema(conn: TSQLConnection);
var
  Provider: TDBXDataExpressMetaDataProvider;
  Jobs, Log, Users: TDBXMetaDataTable;
  LogIdField: TDBXInt32Column;
  JobIdField: TDBXInt32Column;
  StrField : TDBXUnicodeVarCharColumn;
  UserIdField: TDBXInt32Column;
begin
  Provider := DBXGetMetaProvider(conn.DBXConnection);

  // Jobs
  Jobs := TDBXMetaDataTable.Create;
  Jobs.TableName := 'JOBS';

  JobIdField := TDBXInt32Column.Create('JOBID');
  JobIdField.Nullable := false;
  JobIdField.AutoIncrement := false;
  Jobs.AddColumn(JobIdField);

  StrField := TDBXUnicodeVarCharColumn.Create('JOBNAME', 50);
  StrField.Nullable := False;
  Jobs.AddColumn(StrField);
  StrField := TDBXUnicodeVarCharColumn.Create('DESCRIPTION', 100);
  StrField.Nullable := False;
  Jobs.AddColumn(StrField);
  Jobs.AddColumn(TDBXUnicodeVarCharColumn.Create('JOBCMD', 200));
  Provider.CreateTable(Jobs);
  AddPrimaryKey(Provider, 'JOBS', 'JOBID');
  AddUniqueIndex(Provider, 'JOBS', 'JOBNAME');

  // Log
  Log := TDBXMetaDataTable.Create;

  Log.TableName := 'LOG';
  LogIdField := TDBXInt32Column.Create('LOGID');
  LogIdField.Nullable := false;

  Log.AddColumn(LogIdField);

  StrField := TDBXUnicodeVarCharColumn.Create('IP_ADDRESS', 20);
  StrField.Nullable := False;
  Log.AddColumn(StrField);

  StrField := TDBXUnicodeVarCharColumn.Create('EVENT', 50);
  StrField.Nullable := False;
  Log.AddColumn(StrField);
  Log.AddColumn(TDBXTimestampColumn.Create('CREATED'));

  Provider.CreateTable(Log);

  AddPrimaryKey(Provider, 'LOG', 'LOGID');

  // Users
  Users := TDBXMetaDataTable.Create;
  Users.TableName := 'USERS';
  UserIdField := TDBXInt32Column.Create('USERID');
  UserIdField.Nullable := false;
//  UserIdField.AutoIncrement := true;
  Users.AddColumn(UserIdField);

  StrField := TDBXUnicodeVarCharColumn.Create('LOGIN', 20);
  StrField.Nullable := False;
  Users.AddColumn(StrField);

  StrField := TDBXUnicodeVarCharColumn.Create('PASSWORD', 20);
  StrField.Nullable := False;
  Users.AddColumn(StrField);

  StrField := TDBXUnicodeVarCharColumn.Create('NAME', 50);
  StrField.Nullable := False;
  Users.AddColumn(StrField);

  Users.AddColumn(TDBXBooleanColumn.Create('ACTIVE'));

  Provider.CreateTable(Users);


  AddPrimaryKey(Provider, 'USERS', 'USERID');
  AddUniqueIndex(Provider, 'USERS', 'NAME');

  CreateGenerator(Provider, 'GEN_JOB_ID');
  CreateGenerator(Provider, 'GEN_LOG_ID');
  CreateGenerator(Provider, 'GEN_USER_ID');

  CreateAutoIncTrigger(Provider, 'BI_JOBID', 'JOBS', 'JOBID', 'GEN_JOB_ID' );
  CreateAutoIncTrigger(Provider, 'BI_LOGID', 'LOG' , 'LOGID', 'GEN_LOG_ID' );
  CreateAutoIncTrigger(Provider, 'BI_USERID', 'USERs', 'USERID', 'GEN_USER_ID' );


  FreeAndNil(Provider);
  FreeAndNil(Users);
  FreeAndNil(Log);
  FreeAndNil(Jobs);

end;

procedure PopulateData(conn: TSQLConnection);
Const
  SqlInsertUser : String = 'Insert Into Users (Login, "PASSWORD", Name, "ACTIVE") ' +
               'Values ( ''%s'', ''%s'', ''%s'', %s )';
  SqlInsertJob : String = 'Insert Into Jobs (JobName, Description, JobCmd) ' +
               'Values ( ''%s'', ''%s'', ''%s'')';
var
  Comm : TDBXCommand;
begin

  Comm := conn.DBXConnection.CreateCommand;

  try
    // Populate Users
    Comm.Text := Format(SqlInsertUser, ['admin', 'admin', 'Administrator', 'true']);
    Comm.ExecuteQuery;

    Comm.Text := Format(SqlInsertUser, ['peter', 'p134', 'Peter Kaster', 'false']);
    Comm.ExecuteQuery;

    Comm.Text := Format(SqlInsertUser, ['john', 'noguera', 'John Lala', 'true']);
    Comm.ExecuteQuery;

    Comm.Text := Format(SqlInsertUser, ['paul', 'ddsn', 'Paul Mark', 'true']);
    Comm.ExecuteQuery;

    // Populate Jobs
    Comm.Text := Format(SqlInsertJob, ['Notepad', 'Execute notepad', 'notepad.exe']);
    Comm.ExecuteQuery;

    Comm.Text := Format(SqlInsertJob, ['InterBase', 'Start InterBase Server', 'ibserver']);
    Comm.ExecuteQuery;

    Comm.Text := Format(SqlInsertJob, ['Calc', 'Execute windows Calc', 'calc.exe']);
    Comm.ExecuteQuery;
  finally
    Comm.Free;
  end;

end;

procedure CreateLogDB;
var
  conn: TSQLConnection;
  Exists: Boolean;
begin
  conn := TSQLConnection.Create(nil);
  try
    try
      InitConnection(conn, DB_NAME, False);
      Exists := True;
      conn.Close;
    Except
      Exists := False;
    end;
    if not Exists then
    begin
      try
      InitConnection(conn, DB_NAME, True);
      CreateSchema(conn);
      PopulateData(conn);
      conn.Close;
      except on E: Exception do
         showmessage(e.Message);

      end;
    end;
  finally
    conn.Free;
  end;
end;

end.
