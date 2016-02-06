unit LookupRDM;

interface

uses
  SysUtils, Classes, DSServer, WideStrings, FMTBcd, Provider,
  Dialogs, DB, SqlExpr, DbxDataSnap, DBXInterbase, DBXCommon, DBXDBReaders;

type
  TLookupServerRDM = class(TDSServerModule)
    DSPCountry: TDataSetProvider;
    DSPProject: TDataSetProvider;
    COUNTRY: TSQLDataSet;
    PROJECT: TSQLDataSet;
    DSPDepartament: TDataSetProvider;
    SQLDepartament: TSQLQuery;
  private
    { Private declarations }
    FComm : TDBXCommand;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;

  end;

var
  LookupServerRDM: TLookupServerRDM;

implementation

uses ServerContainer;

{$R *.dfm}

{ TLookupServerRDM }

constructor TLookupServerRDM.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TLookupServerRDM.Destroy;
begin
  FreeAndNil(FComm);
  inherited;
end;

end.
