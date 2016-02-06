unit FormDataSet5b;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXCDSReaders, DBXJSON;

type
  TFormDM5b = class(TFormMaster)
    DSProvDM5b: TDSProviderConnection;
    LCityTime: TLabel;
    LCDSCityTime: TLabel;
    BRegion: TButton;
    BCountry: TButton;
    BCity: TButton;
    BState: TButton;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DSRegion: TDataSource;
    DSCountry: TDataSource;
    DSState: TDataSource;
    DSCity: TDataSource;
    CDSRegion: TClientDataSet;
    CDSCountry: TClientDataSet;
    CDSState: TClientDataSet;
    CDSCity: TClientDataSet;
    Label1: TLabel;
    procedure CDSCopyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure BRegionClick(Sender: TObject);
    procedure BCountryClick(Sender: TObject);
    procedure BStateClick(Sender: TObject);
    procedure BCityClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
    procedure LinkAllDataSets;
    procedure UnLinkAllDataSets;
  end;

var
  FormDM5b: TFormDM5b;

implementation

uses DMClient, RecError, LocationMigration, PerfCounter;

{$R *.dfm}

procedure TFormDM5b.BCityClick(Sender: TObject);
var
  Cs: TDMDataSet5Client;
  Reader: TDBXReader;
  Counter: TPerfCounter;
begin
  inherited;

  Cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try

    Counter := TPerfCounter.Create;
    Counter.Start;

    // Execute process that you want to time: ...
    Reader := Cs.GetCity;

    Counter.Stop;

    LCityTime.Caption := 'Server Time:' + FloattoStr(Counter.TimingSeconds);
    Application.ProcessMessages;

    Counter.Start;
    CDSCity.DisableControls;
    if Assigned(Reader) then
      TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSCity);

    CDSCity.EnableControls;
    Counter.Stop;
    DSCity.DataSet := CDSCity;

    LCDSCityTime.Caption := 'Client Time:' + FloattoStr(Counter.TimingSeconds);

  finally
    Cs.Free;
  end;

end;

procedure TFormDM5b.BCountryClick(Sender: TObject);
var
  Cs: TDMDataSet5Client;
  Reader: TDBXReader;
begin
  inherited;

  Cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    Reader := Cs.GetCountry;
    if Assigned(Reader) then
       TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSCountry);
    DSCountry.DataSet := CDSCountry;
  finally
    Cs.Free;
  end;


end;

procedure TFormDM5b.BRegionClick(Sender: TObject);
var
  Cs: TDMDataSet5Client;
  Reader: TDBXReader;
begin
  inherited;

  Cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    Reader := Cs.GetRegion;
    if Assigned(Reader) then
       TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSRegion);
    DSRegion.DataSet := CDSRegion;
  finally
    Cs.Free;
  end;
end;

procedure TFormDM5b.BStateClick(Sender: TObject);
var
  Cs: TDMDataSet5Client;
  Reader: TDBXReader;
begin
  inherited;

  Cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    Reader := Cs.GetState;
    if Assigned(Reader) then
       TDBXClientDataSetReader.CopyReaderToClientDataSet(Reader, CDSState);
    DSState.DataSet := CDSState;
  finally
    Cs.Free;
  end;


end;

procedure TFormDM5b.Button1Click(Sender: TObject);
begin
  inherited;
  LinkAllDataSets;

end;

procedure TFormDM5b.Button2Click(Sender: TObject);
begin
  inherited;
  UnLinkAllDataSets;
end;

procedure TFormDM5b.CDSCopyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM5b.DoClose;
begin
end;

procedure TFormDM5b.doInit;
begin
end;

procedure TFormDM5b.LinkAllDataSets;
begin
  CDSCountry.IndexFieldNames := 'ID_REGION';
  CDSCountry.MasterSource := DSRegion;
  CDSCountry.MasterFields := 'ID_REGION';

  CDSState.IndexFieldNames := 'ID_COUNTRY';
  CDSState.MasterSource := DSCountry;
  CDSState.MasterFields := 'ID_COUNTRY';

  CDSCity.IndexFieldNames := 'ID_COUNTRY;ID_STATE';
  CDSCity.MasterSource := DSState;
  CDSCity.MasterFields := 'ID_COUNTRY;ID_STATE';

end;

procedure TFormDM5b.UnLinkAllDataSets;
begin
  CDSCountry.MasterSource := nil;
  CDSCountry.MasterFields := EmptyStr;
  CDSCountry.IndexFieldNames := EmptyStr;

  CDSState.MasterSource := nil;
  CDSState.MasterFields := EmptyStr;
  CDSState.IndexFieldNames := EmptyStr;

  CDSCity.MasterSource := nil;
  CDSCity.MasterFields := EmptyStr;
  CDSCity.IndexFieldNames := EmptyStr;

end;

end.
