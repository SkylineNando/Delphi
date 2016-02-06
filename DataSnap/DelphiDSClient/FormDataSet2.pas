unit FormDataSet2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm;

type
  TFormDM2 = class(TFormMaster)
    DBGrid1: TDBGrid;
    DSProvDM2: TDSProviderConnection;
    CDSCountry: TClientDataSet;
    DSCountry: TDataSource;
    CDSCountryCOUNTRY: TStringField;
    CDSCountryCURRENCY: TStringField;
    DBNavigator1: TDBNavigator;
    CDSEmployee: TClientDataSet;
    CDSJob: TClientDataSet;
    CDSJobJOB_CODE: TStringField;
    CDSJobJOB_GRADE: TSmallintField;
    CDSJobJOB_COUNTRY: TStringField;
    CDSJobJOB_TITLE: TStringField;
    CDSJobMIN_SALARY: TFMTBCDField;
    CDSJobMAX_SALARY: TFMTBCDField;
    CDSJobJOB_REQUIREMENT: TMemoField;
    CDSJobLANGUAGE_REQ: TBytesField;
    CDSEmployeeEMP_NO: TSmallintField;
    CDSEmployeeFIRST_NAME: TStringField;
    CDSEmployeeLAST_NAME: TStringField;
    CDSEmployeePHONE_EXT: TStringField;
    CDSEmployeeHIRE_DATE: TSQLTimeStampField;
    CDSEmployeeDEPT_NO: TStringField;
    CDSEmployeeJOB_CODE: TStringField;
    CDSEmployeeJOB_GRADE: TSmallintField;
    CDSEmployeeJOB_COUNTRY: TStringField;
    CDSEmployeeSALARY: TFMTBCDField;
    CDSEmployeeFULL_NAME: TStringField;
    DSEmployee: TDataSource;
    DSJob: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label11: TLabel;
    CDSJobTitleGrade: TStringField;
    CDSDepartment: TClientDataSet;
    DSDepartment: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure CDSCountryReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSJobCalcFields(DataSet: TDataSet);
    procedure CDSEmployeeJOB_COUNTRYChange(Sender: TField);
    procedure CDSEmployeeJOB_CODEChange(Sender: TField);
    procedure CDSEmployeeAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormDM2: TFormDM2;

implementation

uses DMClient, RecError;

{$R *.dfm}

procedure TFormDM2.CDSCountryReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM2.CDSEmployeeAfterPost(DataSet: TDataSet);
begin
  if CDSEmployee.ApplyUpdates(-1) > 0 then
     MessageDlg('Error during the applyupdates!!!', mtError, [mbOk], 0)
  else
     MessageDlg('Record saved!!!', mtError, [mbOk], 0)

end;

procedure TFormDM2.CDSEmployeeJOB_CODEChange(Sender: TField);
begin
  CDSEmployeeJOB_GRADE.Value := CDSJobJOB_GRADE.Value;

end;

procedure TFormDM2.CDSEmployeeJOB_COUNTRYChange(Sender: TField);
begin
  CDSEmployeeJOB_CODE.Clear;
  CDSEmployeeJOB_GRADE.Clear;
end;

procedure TFormDM2.CDSJobCalcFields(DataSet: TDataSet);
begin
  CDSJobTitleGrade.AsString := CDSJobJOB_TITLE.AsString + ' | (' +
                            CDSJobJOB_GRADE.AsString + ')';
end;

procedure TFormDM2.DoClose;
begin
  inherited;
  CDSCountry.Close;
  CDSJob.Close;
  CDSDepartment.Close;
  CDSEmployee.Close;
end;

procedure TFormDM2.doInit;
begin
  CDSCountry.Open;
  CDSJob.Open;
  CDSDepartment.Open;
  CDSEmployee.Open;
end;

end.
