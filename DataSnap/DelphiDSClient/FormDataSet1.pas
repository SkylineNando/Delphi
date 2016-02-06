unit FormDataSet1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm;

type
  TFormDM1 = class(TFormMaster)
    DBGrid1: TDBGrid;
    DSProvDM1: TDSProviderConnection;
    CDSCountry: TClientDataSet;
    DSCountry: TDataSource;
    CDSCountryCOUNTRY: TStringField;
    CDSCountryCURRENCY: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure CDSCountryReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormDM1: TFormDM1;

implementation

uses DMClient, RecError;

{$R *.dfm}

procedure TFormDM1.CDSCountryReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM1.DoClose;
begin
  CDSCountry.Close;
end;

procedure TFormDM1.doInit;
begin
  CDSCountry.Open;
end;

end.
