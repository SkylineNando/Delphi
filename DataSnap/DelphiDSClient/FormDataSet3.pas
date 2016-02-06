unit FormDataSet3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm;

type
  TFormDM3 = class(TFormMaster)
    DSProvDM3: TDSProviderConnection;
    CDSProject: TClientDataSet;
    DSProject: TDataSource;
    CDSProjectPRODUCT: TStringField;
    CDSProjectPROJ_DESC: TMemoField;
    CDSProjectPROJ_ID: TStringField;
    CDSProjectPROJ_NAME: TStringField;
    CDSProjectTEAM_LEADER: TSmallintField;
    CDSProjectSQLProjectEmployee: TDataSetField;
    CDSProjectSQLProjectBudget: TDataSetField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    CDSBudget: TClientDataSet;
    DSBudget: TDataSource;
    CDSDepartment: TClientDataSet;
    DSDepartment: TDataSource;
    CDSBudgetDEPT_NO: TStringField;
    CDSBudgetFISCAL_YEAR: TIntegerField;
    CDSBudgetPROJ_ID: TStringField;
    CDSBudgetPROJECTED_BUDGET: TFMTBCDField;
    CDSBudgetDepartment: TStringField;
    CDSProjectEmployee: TClientDataSet;
    DSProjectEmployee: TDataSource;
    CDSProjectEmployeeEMP_NO: TSmallintField;
    CDSProjectEmployeePROJ_ID: TStringField;
    GroupBox2: TGroupBox;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Panel1: TPanel;
    CDSBudgetTotalBudget: TAggregateField;
    DBText1: TDBText;
    CDSEmployee: TClientDataSet;
    DSEmployee: TDataSource;
    CDSProjectEmployeeEmployee: TStringField;
    Button15: TButton;
    Button1: TButton;
    CDSBudgetMinimo: TAggregateField;
    DBText2: TDBText;
    procedure CDSProjectReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormDM3: TFormDM3;

implementation

uses DMClient, RecError;

{$R *.dfm}

procedure TFormDM3.Button15Click(Sender: TObject);
begin
  inherited;
  if CDSProject.ApplyUpdates(-1) > 0 then
     MessageDlg('Error during the applyupdates!!!', mtError, [mbOk], 0)
  else
     MessageDlg('Record saved!!!', mtError, [mbOk], 0)

end;

procedure TFormDM3.Button1Click(Sender: TObject);
begin
  inherited;
  CDSProject.CancelUpdates;
end;

procedure TFormDM3.CDSProjectReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM3.DoClose;
begin
  CDSBudget.Close;
  CDSDepartment.Close;
  CDSEmployee.Close;
end;

procedure TFormDM3.doInit;
begin
  CDSBudget.Open;
  CDSDepartment.Open;
  CDSEmployee.Open;
end;

end.
