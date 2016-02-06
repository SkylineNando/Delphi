unit FormDataSet5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXDBReaders, DBXJSON;

type
  TFormDM5 = class(TFormMaster)
    DSProvDM5: TDSProviderConnection;
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
  FormDM5: TFormDM5;

implementation

uses DMClient, RecError, LocationMigration, PerfCounter;

{$R *.dfm}

procedure TFormDM5.BCityClick(Sender: TObject);
var
  cs: TDMDataSet5Client;
  ret: TJSONArray;
  counter: TPerfCounter;
begin
  inherited;

  cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try

    counter := TPerfCounter.Create;
    counter.Start;

    // Execute process that you want to time: ...
    ret := cs.ListOfClassCity;

    counter.Stop;

    LCityTime.Caption := 'Server Time:' + FloattoStr(counter.TimingSeconds);
    Application.ProcessMessages;

    counter.Start;
    CDSCity.DisableControls;
    TLocationMigration.CityToClientDataSet(ret, CDSCity);
    CDSCity.EnableControls;
    counter.Stop;
    DSCity.DataSet := CDSCity;

    LCDSCityTime.Caption := 'Client Time:' + FloattoStr(counter.TimingSeconds);

  finally
    cs.Free;
  end;

end;

procedure TFormDM5.BCountryClick(Sender: TObject);
var
  cs: TDMDataSet5Client;
  ret: TJSONArray;
begin
  inherited;

  cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    ret := cs.ListOfClassCountry;
    TLocationMigration.CountryToClientDataSet(ret, CDSCountry);
    DSCountry.DataSet := CDSCountry;
  finally
    cs.Free;
  end;


end;

procedure TFormDM5.BRegionClick(Sender: TObject);
var
  cs: TDMDataSet5Client;
  ret: TJSONArray;
begin
  inherited;

  cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    ret := cs.ListOfClassRegion;
    TLocationMigration.RegionToClientDataSet(ret, CDSRegion);
    DSRegion.DataSet := CDSRegion;
  finally
    cs.Free;
  end;
end;

procedure TFormDM5.BStateClick(Sender: TObject);
var
  cs: TDMDataSet5Client;
  ret: TJSONArray;
begin
  inherited;

  cs := TDMDataSet5Client.Create(DMClientContainer.MyDSServer.DBXConnection, false);
  try
    ret := cs.ListOfClassState;
    TLocationMigration.StateToClientDataSet(ret, CDSState);
    DSState.DataSet := CDSState;
  finally
    cs.Free;
  end;


end;

procedure TFormDM5.Button1Click(Sender: TObject);
begin
  inherited;
  LinkAllDataSets;

end;

procedure TFormDM5.Button2Click(Sender: TObject);
begin
  inherited;
  UnLinkAllDataSets;
end;

procedure TFormDM5.CDSCopyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TFormDM5.DoClose;
begin
end;

procedure TFormDM5.doInit;
begin
end;

procedure TFormDM5.LinkAllDataSets;
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

procedure TFormDM5.UnLinkAllDataSets;
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
