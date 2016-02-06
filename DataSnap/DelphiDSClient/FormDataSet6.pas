unit FormDataSet6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXCDSReaders;

type
  TFormDM6 = class(TFormMaster)
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
  FormDM6: TFormDM6;

implementation

uses DMClient, RecError;

{$R *.dfm}

procedure TFormDM6.Button1Click(Sender: TObject);
var
  Reader: TDBXReader;
  DepClient: TDMDataSet6Client;
begin
  inherited;

  DepClient := TDMDataSet6Client.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);

  try
    Reader := DepClient.GetDepartments;

    try
      if Assigned(Reader) then
        TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSCopy);
    finally
      FreeAndNil(Reader);
    end;

  finally
    DepClient.Free;
  end;

end;

procedure TFormDM6.CDSCopyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM6.DoClose;
begin
end;

procedure TFormDM6.doInit;
begin
end;

end.
