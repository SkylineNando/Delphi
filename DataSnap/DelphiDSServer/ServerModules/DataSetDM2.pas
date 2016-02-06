unit DataSetDM2;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DSServer;

type
  TDMDataSet2 = class(TDSServerModule)
    DSPCountry: TDataSetProvider;
    SQLCountry: TSQLDataSet;
    SQLCountryCOUNTRY: TStringField;
    SQLCountryCURRENCY: TStringField;
    DSPEmployee: TDataSetProvider;
    SQLEmployee: TSQLDataSet;
    SQLEmployeeEMP_NO: TSmallintField;
    SQLEmployeeFIRST_NAME: TStringField;
    SQLEmployeeLAST_NAME: TStringField;
    SQLEmployeePHONE_EXT: TStringField;
    SQLEmployeeHIRE_DATE: TSQLTimeStampField;
    SQLEmployeeDEPT_NO: TStringField;
    SQLEmployeeJOB_CODE: TStringField;
    SQLEmployeeJOB_GRADE: TSmallintField;
    SQLEmployeeJOB_COUNTRY: TStringField;
    SQLEmployeeSALARY: TFMTBCDField;
    SQLEmployeeFULL_NAME: TStringField;
    DSPJob: TDataSetProvider;
    SQLJob: TSQLDataSet;
    SQLJobJOB_CODE: TStringField;
    SQLJobJOB_GRADE: TSmallintField;
    SQLJobJOB_COUNTRY: TStringField;
    SQLJobJOB_TITLE: TStringField;
    SQLJobMIN_SALARY: TFMTBCDField;
    SQLJobMAX_SALARY: TFMTBCDField;
    SQLJobJOB_REQUIREMENT: TMemoField;
    SQLJobLANGUAGE_REQ: TBytesField;
    DSPDepartment: TDataSetProvider;
    SQLDepartment: TSQLDataSet;
    SQLDepartmentDEPT_NO: TStringField;
    SQLDepartmentDEPARTMENT: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDataSet2: TDMDataSet2;

implementation

uses ServerContainer;

{$R *.dfm}

end.
