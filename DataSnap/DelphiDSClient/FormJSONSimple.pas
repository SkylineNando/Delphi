unit FormJSONSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXDBReaders, DBXJSON;

type
  TFormSimpleJSON = class(TFormMaster)
    Button10: TButton;
    Button14: TButton;
    MMLog: TMemo;
    MMJson: TMemo;
    Label1: TLabel;
    Button12: TButton;
    Label2: TLabel;
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    function GetProxy : TDSServerMethodsClient;
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormSimpleJSON: TFormSimpleJSON;

implementation

uses DMClient, RecError, Customer;

{$R *.dfm}

procedure TFormSimpleJSON.Button10Click(Sender: TObject);
var
  Proxy: TDSServerMethodsClient;
  ObjCustomer: TCustomer;
  ObjJSON: TJSONValue;
begin
  inherited;

  Proxy := TDSServerMethodsClient.Create
    (DMClientContainer.MyDSServer.DBXConnection);
  try

    ObjJSON := Proxy.MVPCustomer;

    ObjCustomer := TCustomer.JSONToObject<TCustomer>(ObjJSON, nil);

    MMJson.Lines.Text := ObjJSON.ToString;
    MMLog.Lines.Text := ObjCustomer.ToString;
    ObjCustomer.Free;
  finally
    Proxy.Free;
  end;

end;

procedure TFormSimpleJSON.Button12Click(Sender: TObject);
var
  Proxy: TDSServerMethodsClient;
  ObjJSON: TJSONValue;
  ListofObjects: TJSONArray;
  I: Integer;
begin
  inherited;

  MMJson.Clear;
  MMLog.Clear;
  Proxy := GetProxy;
  try
    ListofObjects := Proxy.ListofDifferentTypes;
    for I := 0 to ListofObjects.Size - 1 do
    begin
      ObjJSON := ListofObjects.Get(I);

      if ObjJSON is TJSONString then
        MMLog.Lines.Add('TJSONString value ' + ObjJSON.Value)
      else if ObjJSON is TJSONNumber then
        MMLog.Lines.Add('TJSONNumber value ' + ObjJSON.Value)
      else if ObjJSON is TJSONTrue then
        MMLog.Lines.Add('TJSONTrue value ' + ObjJSON.ToString)
      else if ObjJSON is TJSONFalse then
        MMLog.Lines.Add('TJSONFalse value ' + ObjJSON.ToString)
      else if ObjJSON is TJSONObject then
        MMLog.Lines.Add('TJSONObject value ' + ObjJSON.ToString)
      else if ObjJSON is TObject then
        MMLog.Lines.Add('TCustomer value ' + ObjJSON.ToString);

      MMJson.Lines.Add(ObjJSON.ToString)
    end;

  finally
    Proxy.Free;
  end;

end;

procedure TFormSimpleJSON.Button14Click(Sender: TObject);
var
  Proxy: TDSServerMethodsClient;
  ObjCustomer: TCustomer;
begin
  inherited;

  Proxy := TDSServerMethodsClient.Create
    (DMClientContainer.MyDSServer.DBXConnection);
  try
    ObjCustomer := Proxy.Customer;

    MMJson.Lines.Clear;
    MMLog.Lines.Text := ObjCustomer.ToString;
  finally
    Proxy.Free;
  end;

end;

procedure TFormSimpleJSON.DoClose;
begin
end;

function TFormSimpleJSON.GetProxy : TDSServerMethodsClient;
begin
  Result := TDSServerMethodsClient.Create(DMClientContainer.MyDSServer.DBXConnection);
end;

procedure TFormSimpleJSON.DoInit;
begin
end;

end.
