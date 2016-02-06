unit fMainLayers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Grids, DBGrids, DB, StdCtrls, FMTBcd, SqlExpr, ComCtrls, ExtCtrls, Buttons,
  fMainConnectionDefBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Phys.Intf;

type
  TfrmMainLayers = class(TfrmMainConnectionDefBase)
    Console: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    FConnIntf: IFDPhysConnection;
    FTxIntf: IFDPhysTransaction;
    FShowLoginDialog: Boolean;
  public
    procedure GetConnectionDefs(AList: TStrings); override;
    procedure SetConnDefName(AConnDefName: String); override;
    procedure ConnectionActive(AValue: Boolean); override;
    function GetFormatOptions: TFDFormatOptions; override;
    function GetRDBMSKind: TFDRDBMSKind; override;
    // service funcs
    function EncodeName(AName: String): String;
    function EncodeField(AField: String): String;
  end;

var
  frmMainLayers: TfrmMainLayers;

implementation

{$R *.dfm}

procedure TfrmMainLayers.FormCreate(Sender: TObject);
begin
  FDPhysManager.ConnectionDefs.Storage.FileName := '$(FDHOME)\DB\FDConnectionDefs.ini';
  FDPhysManager.Open;
  inherited FormCreate(Sender);
  FShowLoginDialog := True;
end;

procedure TfrmMainLayers.FormDestroy(Sender: TObject);
begin
  FTxIntf := nil;
  FConnIntf := nil;
end;

procedure TfrmMainLayers.GetConnectionDefs(AList: TStrings);
var
  i: Integer;
begin
  AList.BeginUpdate;
  AList.Clear;
  for i := 0 to FDPhysManager.ConnectionDefs.Count - 1 do
    AList.Add(FDPhysManager.ConnectionDefs[i].Name);
  AList.EndUpdate;
end;

procedure TfrmMainLayers.ConnectionActive(AValue: Boolean);
begin
  if AValue then begin
    if not FShowLoginDialog then
      FConnIntf.LoginPrompt := False;
    FConnIntf.Open
  end
  else begin
    FTxIntf := nil;
    FConnIntf := nil;
  end;
end;

function TfrmMainLayers.GetFormatOptions: TFDFormatOptions;
begin
  Result := FConnIntf.Options.FormatOptions;
end;

procedure TfrmMainLayers.SetConnDefName(AConnDefName: String);
begin
  FDPhysManager.CreateConnection(AConnDefName, FConnIntf);
  FConnIntf.CreateTransaction(FTxIntf);
end;

function TfrmMainLayers.GetRDBMSKind: TFDRDBMSKind;
var
  oConnMeta: IFDPhysConnectionMetadata;
begin
  FConnIntf.CreateMetadata(oConnMeta);
  Result := oConnMeta.Kind;
end;

function TfrmMainLayers.EncodeField(AField: String): String;
var
  oConnMeta: IFDPhysConnectionMetaData;
begin
  FConnIntf.CreateMetadata(oConnMeta);
  if oConnMeta.Kind = mkMySQL then
    Result := oConnMeta.QuoteObjName(AField)
  else
    Result := AField;
end;

function TfrmMainLayers.EncodeName(AName: String): String;
var
  oConnMeta: IFDPhysConnectionMetaData;
begin
  FConnIntf.CreateMetadata(oConnMeta);
  Result := oConnMeta.QuoteObjName(AName);
end;

end.
