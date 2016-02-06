unit DataSetDM1;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DSServer;

type
  TDMDataSet1 = class(TDSServerModule)
    DSPCountry: TDataSetProvider;
    SQLCountry: TSQLDataSet;
    SQLCountryCOUNTRY: TStringField;
    SQLCountryCURRENCY: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDataSet1: TDMDataSet1;

implementation

uses ServerContainer;

{$R *.dfm}

end.
