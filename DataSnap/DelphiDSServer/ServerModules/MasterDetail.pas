unit MasterDetail;

interface

uses
  SysUtils, Classes, DSServer, FMTBcd, DB, SqlExpr, Provider, Variants, DBClient;

type
  TDSMasterDetail = class(TDSServerModule)
    DSPDepartment: TDataSetProvider;
    QueryDepartment: TSQLDataSet;
    DSPEmployee: TDataSetProvider;
    QueryEmployee: TSQLDataSet;
    QueryEmployeeEMP_NO: TSmallintField;
    QueryEmployeeFIRST_NAME: TStringField;
    QueryEmployeeLAST_NAME: TStringField;
    QueryEmployeeDEPT_NO: TStringField;
    QueryEmployeeHIRE_DATE: TSQLTimeStampField;
    QueryEmployeeJOB_COUNTRY: TStringField;
    QueryEmployeeJOB_CODE: TStringField;
    QueryEmployeeJOB_GRADE: TSmallintField;
    QueryEmployeeSALARY: TFMTBCDField;
    DSDepartment: TDataSource;
    procedure DSPDepartmentBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DSMasterDetail : TDSMasterDetail;
implementation

uses ServerContainer;

{$R *.dfm}

procedure TDSMasterDetail.DSPDepartmentBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);

var
  EMP_NO: Variant;
Begin
  EMP_NO := OwnerData;
  if not VarIsNull(EMP_NO) and not VarIsEmpty(EMP_NO) then
    with Sender as TDataSetProvider do
    begin
      DataSet.Active := True; // just in case
      DataSet.Locate('EMP_NO', EMP_NO, []);
      DataSet.Next
    end;

End;
end.
