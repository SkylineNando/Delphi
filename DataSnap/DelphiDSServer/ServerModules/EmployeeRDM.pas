unit EmployeeRDM;

interface

uses
  SysUtils, Classes, DSServer, WideStrings, FMTBcd, Provider,
  DB, SqlExpr, DBXInterbase, DSSession;

type
  {$MethodInfo ON}
  TEmployeeServerRDM = class(TDSServerModule)
    DSPCountry: TDataSetProvider;
    DSPEmployee: TDataSetProvider;
    COUNTRY: TSQLDataSet;
    EMPLOYEE1: TSQLDataSet;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeServerRDM: TEmployeeServerRDM;

implementation

uses ServerContainer;

{$R *.dfm}

procedure TEmployeeServerRDM.DSServerModuleCreate(Sender: TObject);
begin
  if TDSSessionManager.GetThreadSession <> nil then

//  CodeSite.Send('Employee Thread ID', TDSSessionManager.GetThreadSession.Id);

end;

end.
