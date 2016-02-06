unit DataSetDM5;

interface

uses
  SysUtils, Classes, DSServer, DBXInterBase, DB, SqlExpr, FMTBcd, Provider,
  ServerContainer, Generics.Collections, DBClient, DBXCommon, DBXJSON,
  Location, DBXJSONReflect, DBXCDSReaders;

type
  TDMDataSet5 = class(TDSServerModule)
    CDSRegion: TClientDataSet;
    CDSCountry: TClientDataSet;
    CDSState: TClientDataSet;
    CDSCity: TClientDataSet;
  private
    { Private declarations }
    FRegionList: TObjectDictionary<Integer, TRegion>;
    FCountryList: TObjectDictionary<String, TCountry>;
    FStateList: TObjectDictionary<String, TState>;
    FCityList: TObjectDictionary<Integer,TCity>;

    function GetRecords(Fields, Table: String): TDBXReader;

    function FromReadertoRegion(Reader: TDBXReader): TRegion;
    function FromReadertoCountry(Reader: TDBXReader): TCountry;
    function FromReadertoState(Reader: TDBXReader): TState;
    function FromReadertoCity(Reader: TDBXReader): TCity;

    function GetData(Cds : TClientDataSet; Fields, Table: String) : TDBXReader;
  public
    function GetRegion: TDBXReader;
    function GetCountry: TDBXReader;
    function GetState: TDBXReader;
    function GetCity: TDBXReader;

    function ListofClassRegion: TJSONArray;
    function ListofClassCountry: TJSONArray;
    function ListofClassState: TJSONArray;
    function ListofClassCity: TJSONArray;
  end;

implementation

{$R *.dfm}

function TDMDataSet5.FromReadertoCity(Reader: TDBXReader): TCity;
var
  stateId, countryId : String;
begin
  Result := TCity.Create;
  Result.Id := Reader.Value['ID_CITY'].GetInt32;
  Result.Name := String(Reader.Value['NAME'].GetAnsiString);

  stateId := String(Reader.Value['ID_STATE'].GetAnsiString);
  countryId := String(Reader.Value['ID_COUNTRY'].GetAnsiString);

  if FStateList.ContainsKey( countryId + ';' + stateId) then
     Result.State := FStateList.Items[countryId + ';' + stateId]
  else
     Result.State := nil;

end;

function TDMDataSet5.FromReadertoCountry(Reader: TDBXReader): TCountry;
var
  regionId : Integer;
begin
  Result := TCountry.Create;
  Result.Id := String(Reader.Value['ID_COUNTRY'].GetAnsiString);
  Result.Name := String(Reader.Value['NAME'].GetAnsiString);

  regionId := Reader.Value['ID_REGION'].GetInt32;

  if FRegionList.ContainsKey(regionId) then
     Result.Region := FRegionList.Items[regionId]
  else
     Result.Region := nil;
end;

function TDMDataSet5.FromReadertoRegion(Reader: TDBXReader): TRegion;
begin
  Result := TRegion.Create;
  Result.Id := Reader.Value['ID_REGION'].GetInt32;
  Result.Name := String(Reader.Value['NAME'].GetAnsiString);
end;

function TDMDataSet5.FromReadertoState(Reader: TDBXReader): TState;
var
  countryId : String;
begin
  Result := TState.Create;
  Result.Id := String(Reader.Value['ID_STATE'].GetAnsiString);
  Result.Name := String(Reader.Value['NAME'].GetAnsiString);

  countryId := String(Reader.Value['ID_COUNTRY'].GetAnsiString);

  if FCountryList.ContainsKey(countryId) then
     Result.Country := FCountryList.Items[countryId]
  else
     Result.Country := nil;

end;

function TDMDataSet5.GetRecords(Fields, Table: String): TDBXReader;
var
  cmd: TDBXCommand;
begin

  cmd := DMServerContainer.GetConnection.DBXConnection.CreateCommand;
  try
    cmd.Text := 'Select ' + Fields + ' from ' + Table;
    Result := cmd.ExecuteQuery;
  except
    raise;
  end;

end;

function TDMDataSet5.GetRegion: TDBXReader;
begin
  Result := GetData( CDSRegion, 'ID_REGION, NAME', 'Region' );
end;

function TDMDataSet5.GetCity: TDBXReader;
begin
  Result := GetData( CDSCity, 'ID_CITY, NAME, ID_COUNTRY, ID_STATE', 'City');
end;

function TDMDataSet5.GetCountry: TDBXReader;
begin
  Result := GetData( CDSCountry, 'ID_COUNTRY, NAME, ID_REGION', 'Country' );
end;

function TDMDataSet5.GetData(Cds: TClientDataSet; Fields, Table: String): TDBXReader;
var
  Reader : TDBXReader;
begin
  if not Cds.Active then
    begin
    Reader := GetRecords(Fields, Table);
    TDBXClientDataSetReader.CopyReaderToClientDataSet( Reader, Cds );
    Reader.Free;
    Cds.Open;
  end;

  Result := TDBXClientDataSetReader.Create(Cds, False (* InstanceOwner *) );
end;

function TDMDataSet5.GetState: TDBXReader;
begin
  Result := GetData( CDSState, 'ID_STATE, NAME, ID_COUNTRY', 'State' );
end;

function TDMDataSet5.ListofClassCity: TJSONArray;
var
  city: TCity;
  reader: TDBXReader;
  Marshal : TJSONMarshal;
begin

  Result := TJSONArray.Create;
  Marshal := TJSONMarshal.Create(TJSONConverter.Create);

  if not Assigned(FCityList) then
  begin

    // Make sure state is already in cache, if not force
    if not Assigned(FStateList) then
       ListOfClassState;

    reader := GetCity;
    try

      FCityList := TObjectDictionary<Integer, TCity>.Create;

      while reader.Next do
      begin
        city := FromReadertoCity(reader);
        FCityList.Add(city.Id, city);
        Result.AddElement(city.ObjectToJSON<TCity>(city, Marshal));
      end;
      reader.Close;
    finally
      reader.Free;
    end;
  end
  else
  begin
    for city in FCityList.Values do
    begin
      Result.AddElement(city.ObjectToJSON<TCity>(city, Marshal));
    end;
  end;
  Marshal.Free;

end;

function TDMDataSet5.ListofClassCountry: TJSONArray;
var
  country: TCountry;
  reader: TDBXReader;
  Marshal : TJSONMarshal;
begin

  Result := TJSONArray.Create;
  Marshal := TJSONMarshal.Create(TJSONConverter.Create);

  if not Assigned(FCountryList) then
  begin

    // Make sure Region is already in cache, if not force
    if not Assigned(FRegionList) then
       ListofClassRegion;


    reader := GetCountry;
    try

      Result := TJSONArray.Create;
      FCountryList := TObjectDictionary<String, TCountry>.Create;

      while reader.Next do
      begin
        country := FromReadertoCountry(reader);
        FCountryList.Add(country.Id, country);
        Result.AddElement(country.ObjectToJSON<TCountry>(country, Marshal));
      end;
      reader.Close;
    finally
      reader.Free;
    end;
  end
  else
  begin

    for country in FCountryList.Values do
    begin
      Result.AddElement(country.ObjectToJSON<TCountry>(country, Marshal));
    end;
  end;
  Marshal.Free;

end;

function TDMDataSet5.ListofClassRegion: TJSONArray;
var
  region: TRegion;
  reader: TDBXReader;
  Marshal : TJSONMarshal;
begin

  Result := TJSONArray.Create;
  Marshal := TJSONMarshal.Create(TJSONConverter.Create);

  if not Assigned(FRegionList) then
  begin

    reader := GetRegion;
    try

      FRegionList := TObjectDictionary<Integer, TRegion>.Create;

      while reader.Next do
      begin
        region := FromReadertoRegion(reader);
        FRegionList.Add(region.Id, region);
        Result.AddElement(region.ObjectToJSON<TRegion>(region, Marshal));
      end;
      reader.Close;
    finally
      reader.Free;
    end;
  end
  else
  begin
    for region in FRegionList.Values do
    begin
      Result.AddElement(region.ObjectToJSON<TRegion>(region, Marshal));
    end;
  end;
  Marshal.Free;

end;

function TDMDataSet5.ListofClassState: TJSONArray;
var
  state: TState;
  reader: TDBXReader;
  Marshal : TJSONMarshal;
begin

  Result := TJSONArray.Create;
  Marshal := TJSONMarshal.Create(TJSONConverter.Create);

  if not Assigned(FStateList) then
  begin

    // Make sure state is already in cache, if not force
    if not Assigned(FCountryList) then
       ListOfClassCountry;

    reader := GetState;
    try

      FStateList := TObjectDictionary<String, TState>.Create;

      while reader.Next do
      begin
        state := FromReadertoState(reader);
        FStateList.Add(state.Country.Id + ';' + state.Id, state);
        Result.AddElement(state.ObjectToJSON<TState>(state, Marshal));
      end;
      reader.Close;
    finally
      reader.Free;
    end;
  end
  else
  begin

    for state in FStateList.Values do
    begin
      Result.AddElement(state.ObjectToJSON<TState>(state, Marshal));
    end;
  end;
  Marshal.Free;


end;


end.
