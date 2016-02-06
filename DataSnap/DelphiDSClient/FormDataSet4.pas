unit FormDataSet4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXCDSReaders;

type
  TFormDM4 = class(TFormMaster)
    DBGrid1: TDBGrid;
    CDSCopy: TClientDataSet;
    DSCopy: TDataSource;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    procedure CDSCopyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormDM4: TFormDM4;

implementation

uses DMClient, RecError;

{$R *.dfm}

procedure TFormDM4.Button1Click(Sender: TObject);
var
  Reader: TDBXReader;
  DepClient: TDepartmentClient;
begin
  inherited;

  DepClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);

  try
    Reader := DepClient.GetDepartmentsOrderBy;

    try
      DSCopy.Enabled := False;
      if Assigned(Reader) then
        TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSCopy);
    finally
      FreeAndNil(Reader);
      DSCopy.Enabled := True;
    end;

  finally
    DepClient.Free;
  end;

end;

procedure TFormDM4.CDSCopyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM4.DoClose;
begin
end;

procedure TFormDM4.doInit;
begin
end;

end.
