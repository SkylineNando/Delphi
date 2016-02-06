unit DataSetDM6;

interface

uses
  SysUtils, Classes, DSServer, FMTBcd, DB, SqlExpr, Provider, DBXCDSReaders,
  DBXCommon, DBClient;

type
  TDMDataSet6 = class(TDSServerModule)
    DSPDepartment: TDataSetProvider;
    SQLDepartment: TSQLDataSet;
    SQLDepartmentDEPT_NO: TStringField;
    SQLDepartmentDEPARTMENT: TStringField;
    CDSDepartment: TClientDataSet;
  private
    { Private declarations }
 //   CDSDepartment: TClientDataSet;
  public
    { Public declarations }
    function GetDepartments: TDBXReader;
  end;

implementation

uses ServerContainer;

{$R *.dfm}
{ TDMDataSet6 }

function TDMDataSet6.GetDepartments: TDBXReader;
  function CopyDBXReader(AReader: TDBXReader): TDBXReader;
  var
    LDataSet: TClientDataSet;
  begin
    AReader.Reset;
    LDataSet := TDBXClientDataSetReader.ToClientDataSet(nil, AReader,
      False (* OwnsInstance *) );
    Result := TDBXClientDataSetReader.Create(LDataSet, True (* InstanceOwner *) );
  end;

var
  FComm: TDBXCommand;
  AReader : TDBXReader;
begin

  if not CDSDepartment.Active then
  begin
    DMServerContainer.Employee.open;
    FComm := DMServerContainer.Employee.DBXConnection.CreateCommand;
    FComm.CommandType := TDBXCommandTypes.DbxSQL;
    FComm.Text := 'Select  * from DEPARTMENT';
    if not FComm.IsPrepared then
      FComm.Prepare;
    AReader := FComm.ExecuteQuery;

    TDBXClientDataSetReader.CopyReaderToClientDataSet( AReader, CDSDepartment );
    CDSDepartment.Open;

  end;

  Result := TDBXClientDataSetReader.Create(CDSDepartment, False (* InstanceOwner *) );

end;


end.
