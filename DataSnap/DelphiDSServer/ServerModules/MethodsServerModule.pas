unit MethodsServerModule;

interface

uses SysUtils, Dialogs, Classes, DSServer, FMTBcd, DB, SqlExpr, Forms, Windows,
  Customer, DBXJSON, DBXJSONReflect, DSSession;

type
  // {$MethodInfo ON}
  TDSServerMethods = class(TDSServerModule)
    SQLJob: TSQLDataSet;
    SQLJobJOBID: TIntegerField;
    SQLJobJOBNAME: TStringField;
    SQLJobDESCRIPTION: TStringField;
    SQLJobJOBCMD: TStringField;
    procedure DSServerModuleCreate(Sender: TObject);

  private
    { Private declarations }
  protected
    function GetCustomer: TCustomer;

  public
    { Public declarations }
    function GetServerDateTime: TDateTime;
    procedure ExecuteJob(JobId: Integer);
    function MVPCustomer(): TJSONValue;
    function Customer(): TCustomer;
    procedure SendCustomer(C : TJSONObject);
    function ListofCustomer(): TJSONArray;
    function ListofDifferentTypes(): TJSONArray;

  end;

var
  DSServerMethods: TDSServerMethods;

implementation

uses ServerContainer, ShellAPI;
{$R *.dfm}
{ TDSServerMethods }

function TDSServerMethods.Customer: TCustomer;
begin
  Result := GetCustomer;

end;

procedure TDSServerMethods.DSServerModuleCreate(Sender: TObject);
begin
  if TDSSessionManager.GetThreadSession <> nil then

//  CodeSite.Send('Thread ID', TDSSessionManager.GetThreadSession.Id);
end;

procedure TDSServerMethods.ExecuteJob(JobId: Integer);
var
  cmd: array [0 .. 300] of Char;
begin

  SQLJob.ParamByName('JOBID').AsInteger := JobId;
  SQLJob.Open;

  if not SQLJob.Eof then
  begin
    StrPCopy(cmd, SQLJobJOBCMD.AsString);
    if ShellExecute(Application.Handle, nil, cmd, nil, nil, SW_SHOW) <> 42 then
    begin
      SQLJob.Close;
      Raise Exception.Create('Job cmd error trying to execute');
    end;
  end;

  SQLJob.Close;

end;

function TDSServerMethods.GetCustomer: TCustomer;
begin
  Result := TCustomer.Create;
  Result.Name := 'Andreano Lanusse';
  Result.Age := 32;
  Result.MaritalStatus := msMarried;
end;

function TDSServerMethods.GetServerDateTime: TDateTime;
begin
  Result := Now;
end;

function TDSServerMethods.ListofCustomer: TJSONArray;
var
  i: Integer;
  myCustomer: TCustomer;
begin
  Result := TJSONArray.Create;

  for i := 0 to 19 do
  begin
    myCustomer := GetCustomer;
    myCustomer.Name := 'Customer ' + IntToStr(i);
    myCustomer.Age := i;
    Result.AddElement(myCustomer.ObjectToJSON<TCustomer>(myCustomer, nil));
  end;
end;

function TDSServerMethods.ListofDifferentTypes: TJSONArray;
var
  strval: TJSONString;
  trueval : TJSONTrue;
  falseval : TJSONFalse;
  numval: TJSONNumber;
begin
  Result := TJSONArray.Create;

  strval := TJSONString.Create('Return String value from DataSnap Server');
  Result.AddElement(strval);

  numval := TJSONNumber.Create(100);
  Result.AddElement(numval);

  numval := TJSONNumber.Create(99.99);
  Result.AddElement(numval);

  trueval := TJSONTrue.Create;
  Result.AddElement(trueval);

  falseval := TJSONFalse.Create;
  Result.AddElement(falseval);

  Result.AddElement(TCustomer.ObjectToJSON<TCustomer>(GetCustomer, nil));

end;

function TDSServerMethods.MVPCustomer: TJSONValue;
var
  myCustomer: TCustomer;
begin
  myCustomer := GetCustomer;
  Result := TCustomer.ObjectToJSON<TCustomer>(myCustomer, nil);
  myCustomer.Free;

end;

procedure TDSServerMethods.SendCustomer(C: TJSONObject);
var
  FUnMarshal : TJSONUnMarshal;
  cust : TCustomer;
begin
  if Assigned(C) then
  begin

    FUnMarshal := TJSONUnMarshal.Create;
    try
      cust := TCustomer.JSONToObject<TCustomer>(TJSONObject(C), FUnMarshal);
    finally
      FreeAndNil(FUnMarshal)
    end

  end;

end;

end.
