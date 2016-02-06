unit FormJSONCollection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXDBReaders, DBXJSON;

type
  TFormCollectionJSON = class(TFormMaster)
    MMLog: TMemo;
    MMJson: TMemo;
    Label1: TLabel;
    Button11: TButton;
    Label2: TLabel;
    procedure Button11Click(Sender: TObject);
  private
    function GetProxy : TDSServerMethodsClient;
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormCollectionJSON: TFormCollectionJSON;

implementation

uses DMClient, RecError, Customer;

{$R *.dfm}

procedure TFormCollectionJSON.Button11Click(Sender: TObject);
var
  Proxy: TDSServerMethodsClient;
  ObjCustomer: TCustomer;
  CustomerList: TJSONArray;
  I: Integer;
begin
  inherited;
  Proxy := GetProxy;
  MMJson.Clear;
  MMLog.Clear;

  try
    CustomerList := Proxy.ListofCustomer;

    for I := 0 to CustomerList.Size - 1 do
    begin
      ObjCustomer := TCustomer.JSONToObject<TCustomer>
        (CustomerList.Get(I), nil);
      MMJson.Lines.Add(CustomerList.Get(I).ToString);
      MMLog.Lines.Add(ObjCustomer.ToString);
      ObjCustomer.Free;
    end;

  finally
    Proxy.Free;
  end;

end;

procedure TFormCollectionJSON.DoClose;
begin
end;

function TFormCollectionJSON.GetProxy : TDSServerMethodsClient;
begin
  Result := TDSServerMethodsClient.Create(DMClientContainer.MyDSServer.DBXConnection);
end;

procedure TFormCollectionJSON.DoInit;
begin
end;

end.
