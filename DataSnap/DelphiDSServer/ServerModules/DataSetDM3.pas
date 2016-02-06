unit DataSetDM3;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DSServer;

type
  TDMDataSet3 = class(TDSServerModule)
    DSPProject: TDataSetProvider;
    SQLProject: TSQLDataSet;
    DSProjectBudget: TDataSetProvider;
    SQLProjectBudget: TSQLDataSet;
    DSPDepartment: TDataSetProvider;
    SQLDepartment: TSQLDataSet;
    SQLDepartmentDEPT_NO: TStringField;
    SQLDepartmentDEPARTMENT: TStringField;
    SQLProjectPRODUCT: TStringField;
    SQLProjectPROJ_DESC: TMemoField;
    SQLProjectPROJ_ID: TStringField;
    SQLProjectPROJ_NAME: TStringField;
    SQLProjectTEAM_LEADER: TSmallintField;
    SQLProjectBudgetDEPT_NO: TStringField;
    SQLProjectBudgetFISCAL_YEAR: TIntegerField;
    SQLProjectBudgetPROJ_ID: TStringField;
    SQLProjectBudgetPROJECTED_BUDGET: TFMTBCDField;
    DSProject: TDataSource;
    SQLProjectEmployee: TSQLDataSet;
    DSProjectEmployee: TDataSetProvider;
    SQLProjectEmployeeEMP_NO: TSmallintField;
    SQLProjectEmployeePROJ_ID: TStringField;
    SQLEmployee: TSQLDataSet;
    DSPEmployee: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDataSet3: TDMDataSet3;

implementation

uses ServerContainer;

{$R *.dfm}

end.
