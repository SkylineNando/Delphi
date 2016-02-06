unit Department;

interface

uses BaseServerClass, Classes, DBXCommon, SysUtils, Dialogs, SqlExpr,
     MainServerModule, DB, DBXDBReaders, DBXJSon, DSSession;

type
  {$MethodInfo ON}
  TDepartment = class(TBaseServerClass)
  private
    FComm : TDBXCommand;
    FOrderByField : String;

    function GetNextID : Integer;
    procedure SetDepartamentOrderBy( s : String = '');
    procedure PrepareCommDepartaments;

  public
    constructor Create;
    destructor Destroy; override;

    procedure DepartmentDefault;
    procedure DepartmentOrderByID;
    procedure DepartmentOrderByName;

    function OrderByField : String;
    function GetDepartmentsOrderBy : TDBXReader;
    function GetDepartments : TDBXReader;
    function GetBioLife : TDBXReader;
    function Insert( sParams : TParams ) : Boolean;
    function InsertAsDBXReader( sDbxParams : TDBXReader ) : Boolean;

    procedure SendValue( i : string );
    function GetValue : String;


  Const
    TABLE_NAME = 'DEPARTMENT';
  end;

implementation

uses ServerContainer;


{ TDepartament }

constructor TDepartment.Create;
begin
//  FDbxConnection := DMServerContainer.DataSnap_Server_Log.DBXConnection;
  FDbxConnection := GetDbxConnection;

end;

procedure TDepartment.DepartmentDefault;
begin
  SetDepartamentOrderBy;
end;

procedure TDepartment.DepartmentOrderByID;
begin
  SetDepartamentOrderBy('DEPT_NO');
end;

procedure TDepartment.DepartmentOrderByName;
begin
  SetDepartamentOrderBy('DEPARTMENT');
end;

destructor TDepartment.Destroy;
begin
  FreeAndNil(FComm);
  inherited;
end;

function TDepartment.OrderByField: String;
begin
  Result := FOrderByField;
end;

function TDepartment.GetBioLife: TDBXReader;
begin
  if not Assigned(FComm) then
  begin
    DMServerContainer.Employee.Open;
    FComm := DMServerContainer.Employee.DBXConnection.CreateCommand;
    FComm.CommandType := TDBXCommandTypes.DbxSQL;
    FComm.Text := 'Select * from BIOLIFE';
    if not FComm.IsPrepared then
       FComm.Prepare;
  end
  else
  begin
    FComm.Close;
    FComm.Text := 'Select * from BIOLIFE';
  end;

  Result := FComm.ExecuteQuery;


end;

function TDepartment.GetDepartments: TDBXReader;
begin

  SetDepartamentOrderBy;

  PrepareCommDepartaments;

  DMServerContainer.Employee.Open;

  Result := FComm.ExecuteQuery;
end;

function TDepartment.GetDepartmentsOrderBy: TDBXReader;
begin

  DMServerContainer.Employee.Open;
  PrepareCommDepartaments;

  Result := FComm.ExecuteQuery;

end;

function TDepartment.GetNextID: Integer;
var
  reader : TDBXReader;
begin
  DMServerContainer.Employee.Open;

  if not Assigned(FComm) then
     FComm := DMServerContainer.Employee.DBXConnection.CreateCommand;

  FComm.CommandType := TDBXCommandTypes.DbxSQL;
  FComm.Text := 'Select Max(DEPT_NO) From ' + TABLE_NAME;
  reader := FComm.ExecuteQuery;

  if reader.Next then
     Result := StrToInt( String(reader.Value[0].GetAnsiString))  + 1
  else
     Result := 1;

  reader.Close;
  FreeAndNil(reader);
  FreeAndNil(FComm);

end;

function TDepartment.GetValue: String;
begin
  TDSSessionManager.GetThreadSession.GetData('Dep');
end;

function TDepartment.Insert(sParams: TParams ): Boolean;
Const
  SQL = 'insert into %s (%s) Values (%s)';
var
  i, newID : Integer;
  sFields, sFieldsParam : TStringBuilder;
  mysqlquery : TSQLQuery;

begin

  if not Assigned(sParams) then
     raise Exception.Create('sParams can not be nil');

  // Can simulate a error
  if not Assigned(sParams.FindParam('DEPARTMENT')) then
     raise Exception.Create('Param DEPARTMENT not found');

  sFields := TStringBuilder.Create;
  sFieldsParam := TStringBuilder.Create;

  newID := GetNextID;
  sFields.Append('DEPT_NO,');
  sFieldsParam.Append(newID).Append(',');
  sParams.ParamByName('DEPARTMENT').AsString := sParams.ParamByName('DEPARTMENT').AsString + ' ' + IntToStr(newID);

  for I := 0 to sParams.Count - 1 do
  begin
    sFields.Append(sParams[i].Name);
    sFieldsParam.Append(':' + sParams[i].Name);

    if i < sParams.Count -1  then
    begin
      sFields.Append(',');
      sFieldsParam.Append(',');
    end

  end;

  mysqlquery := TSQLQuery.Create(nil);
  mysqlquery.SQLConnection := DMServerContainer.Employee;
  mysqlquery.CommandText := Format(SQL, [TABLE_NAME, sFields.ToString, sFieldsParam.ToString]);
  mysqlquery.Params := sParams;

  try
    mysqlquery.ExecSQL();
    Result := True;
  finally
    sFields.Free;
    sFieldsParam.Free;
    mysqlquery.Free;
  end;

end;

function TDepartment.InsertAsDBXReader(sDbxParams: TDBXReader): Boolean;
Const
  SQL = 'insert into %s (%s) Values (%s)';
var
  i, newID : Integer;
  sFields, sFieldsParam : TStringBuilder;
  mysqlquery : TSQLQuery;
  sParams : TParams;
begin

  if not Assigned(sDbxParams) then
     raise Exception.Create('sDbxParams can not be nil');

  sParams := TDBXParamsReader.ToParams(Self, sDbxParams, True);

  // Can simulate a error
  if not Assigned(sParams.FindParam('DEPARTMENT')) then
     raise Exception.Create('Param DEPARTMENT not found');

  sFields := TStringBuilder.Create;
  sFieldsParam := TStringBuilder.Create;

  newID := GetNextID;
  sFields.Append('DEPT_NO,');
  sFieldsParam.Append(newID).Append(',');
  sParams.ParamByName('DEPARTMENT').AsString := sParams.ParamByName('DEPARTMENT').AsString + ' ' + IntToStr(newID);

  for I := 0 to sParams.Count - 1 do
  begin
    sFields.Append(sParams[i].Name);
    sFieldsParam.Append(':' + sParams[i].Name);

    if i < sParams.Count -1  then
    begin
      sFields.Append(',');
      sFieldsParam.Append(',');
    end

  end;

  mysqlquery := TSQLQuery.Create(nil);
  mysqlquery.SQLConnection := DMServerContainer.Employee;
  mysqlquery.CommandText := Format(SQL, [TABLE_NAME, sFields.ToString, sFieldsParam.ToString]);
  mysqlquery.Params := sParams;

  try
    mysqlquery.ExecSQL();
    Result := True;
  finally
    sFields.Free;
    sFieldsParam.Free;
    mysqlquery.Free;
  end;

end;

procedure TDepartment.PrepareCommDepartaments;
begin
  if not Assigned(FComm) then
  begin
    DMServerContainer.Employee.Open;
    FComm := DMServerContainer.Employee.DBXConnection.CreateCommand;
    FComm.CommandType := TDBXCommandTypes.DbxSQL;
    SetDepartamentOrderBy;
    if not FComm.IsPrepared then
       FComm.Prepare;
  end;
end;

procedure TDepartment.SendValue(i: string);
begin
  TDSSessionManager.GetThreadSession.PutData('Dep', i);
end;

procedure TDepartment.SetDepartamentOrderBy(s: String);
begin
  PrepareCommDepartaments;

  FOrderByField := s;

  FComm.Close;
  if (s <> '') then
     FComm.Text := 'Select  * from DEPARTMENT order by ' + s
  else
     FComm.Text := 'Select  * from DEPARTMENT';

end;

end.
