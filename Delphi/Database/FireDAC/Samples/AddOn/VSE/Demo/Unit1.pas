unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  StdCtrls, Grids, DBGrids, FireDAC.Comp.UI, FireDAC.VCLUI.Wait, FireDAC.Phys.IB, FireDAC.Phys.FB,
  FireDAC.Comp.VSE, FireDAC.Comp.VSEXML;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FVS: TFDVSEXMLManager;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

(*
<Transaction>
  <Request>
     <OrderNumber>123456</OrderNumber>
     <ShippingMethod>123456</ShippingMethod>
  </Request>
  <Response>
     <StatusCode>200</StatusCode>
     <StatusMesg>Order accepted</StatusMesg>
     <RefNumber>S0123456</RefNumber>
  </Response>
</Transaction>
*)

procedure TForm1.FormCreate(Sender: TObject);
var
  oSch: TFDVSESchema;
begin
  FVS := TFDVSEXMLManager.Create(nil);
  FVS.AutoManage := True;

  oSch := FVS.Schemas.Add;
  oSch.Name := 'Request';
  with TFDVSEXMLFieldDef(oSch.FieldDefs.Add) do begin
    Name := 'OrderNumber';
    DataType := dtInt32;
    XPathExpression := '//Transaction/Request/OrderNumber';
  end;
  with TFDVSEXMLFieldDef(oSch.FieldDefs.Add) do begin
    Name := 'ShippingMethod';
    DataType := dtInt32;
    XPathExpression := '//Transaction/Request/ShippingMethod';
  end;

  oSch := FVS.Schemas.Add;
  oSch.Name := 'Response';
  with TFDVSEXMLFieldDef(oSch.FieldDefs.Add) do begin
    Name := 'StatusCode';
    DataType := dtInt32;
    XPathExpression := '//Transaction/Response/StatusCode';
  end;
  with TFDVSEXMLFieldDef(oSch.FieldDefs.Add) do begin
    Name := 'StatusMesg';
    DataType := dtAnsiString;
    Size := 50;
    XPathExpression := '//Transaction/Response/StatusMesg';
  end;
  with TFDVSEXMLFieldDef(oSch.FieldDefs.Add) do begin
    Name := 'RefNumber';
    DataType := dtAnsiString;
    Size := 20;
    XPathExpression := '//Transaction/Response/RefNumber';
  end;

  FVS.Sessions.AddSession(FDQuery1, 'VS');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FVS.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDQuery1.Active := not FDQuery1.Active;
end;

end.
