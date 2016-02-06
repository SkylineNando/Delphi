unit LocationMigration;

interface

uses DBXJSON, DBClient, DBXDBReaders, DB, DBXjsonreflect;

type
  TLocationMigration = class
  public
    class procedure RegionToClientDataSet(regions: TJSONArray;
      Cds: TClientDataSet);
    class procedure CountryToClientDataSet(countries: TJSONArray;
      Cds: TClientDataSet);
    class procedure StateToClientDataSet(states: TJSONArray;
      Cds: TClientDataSet);
    class procedure CityToClientDataSet(cities: TJSONArray;
      Cds: TClientDataSet);
  end;

implementation

uses Location, SysUtils;

{ TLocationMigration }

class procedure TLocationMigration.CityToClientDataSet(cities: TJSONArray;
  Cds: TClientDataSet);
var
  myCity: TCity;
  i: Integer;
  unm: TJSONUnMarshal;
begin
  Cds.Close;
  Cds.FieldDefs.Clear;
  Cds.FieldDefs.Add('ID_CITY', ftInteger, 0, False);
  Cds.FieldDefs.Add('ID_COUNTRY', ftString, 2, False);
  Cds.FieldDefs.Add('NAME', ftString, 50, False);
  Cds.FieldDefs.Add('ID_STATE', ftString, 4, False);
  Cds.CreateDataSet;
  Cds.Open;

  unm := TJSONUnMarshal.Create;

  for i := 0 to cities.Size - 1 do
  begin
    myCity := TCity.JSONToObject<TCity>(cities.Get(i), unm);

    Cds.Insert;
    Cds.FieldByName('ID_CITY').AsInteger:= myCity.Id;
    Cds.FieldByName('ID_COUNTRY').AsString:= myCity.State.Country.Id;
    Cds.FieldByName('ID_STATE').AsString:= myCity.State.Id;
    Cds.FieldByName('NAME').AsString := myCity.Name;
    Cds.Post;
  end;
  unm.Free;

end;

class procedure TLocationMigration.CountryToClientDataSet(countries: TJSONArray;
  Cds: TClientDataSet);
var
  myCountry: TCountry;
  i: Integer;
  unm : TJSONUnMarshal;
begin
  Cds.Close;
  Cds.FieldDefs.Clear;
  Cds.FieldDefs.Add('ID_COUNTRY', ftString, 2, False);
  Cds.FieldDefs.Add('NAME', ftString, 50, False);
  Cds.FieldDefs.Add('ID_REGION', ftInteger, 0, False);
//  Cds.IndexDefs.Add('PK', 'ID_COUNTRY', [ixPrimary]);

  Cds.CreateDataSet;
  Cds.Open;

  unm := TJSONUnMarshal.Create;

  for i := 0 to countries.Size - 1 do
  begin
    myCountry := TState.JSONToObject<TCountry>(countries.Get(i), unm);
    Cds.Insert;
    Cds.FieldByName('ID_COUNTRY').AsString:= myCountry.Id;
    Cds.FieldByName('NAME').AsString := myCountry.Name;
    Cds.FieldByName('ID_REGION').AsInteger:= myCountry.Region.Id;
    Cds.Post;
  end;
  unm.Free;


end;

class procedure TLocationMigration.RegionToClientDataSet(regions: TJSONArray;
  Cds: TClientDataSet);
var
  myRegion: TRegion;
  i: Integer;
  unm : TJSONUnMarshal;
begin
  Cds.Close;
  Cds.FieldDefs.Clear;
  Cds.FieldDefs.Add('ID_REGION', ftInteger, 0, False);
  Cds.FieldDefs.Add('NAME', ftString, 50, False);

  Cds.CreateDataSet;
  Cds.Open;

  unm := TJSONUnMarshal.Create;

  for i := 0 to regions.Size - 1 do
  begin
    myRegion := TState.JSONToObject<TRegion>(regions.Get(i), unm);
    Cds.Insert;
    Cds.FieldByName('ID_REGION').AsInteger:= myRegion.Id;
    Cds.FieldByName('NAME').AsString := myRegion.Name;
    Cds.Post;
  end;
  unm.Free;


end;

class procedure TLocationMigration.StateToClientDataSet(states: TJSONArray;
  Cds: TClientDataSet);
var
  myState: TState;
  i: Integer;
  unm : TJSONUnMarshal;
begin
  Cds.Close;
  Cds.FieldDefs.Clear;
  Cds.FieldDefs.Add('ID_COUNTRY', ftString, 2, False);
  Cds.FieldDefs.Add('NAME', ftString, 50, False);
  Cds.FieldDefs.Add('ID_STATE', ftString, 4, False);
  Cds.CreateDataSet;
  Cds.Open;


  unm := TJSONUnMarshal.Create;

  for i := 0 to states.Size - 1 do
  begin
    myState := TState.JSONToObject<TState>(states.Get(i), unm);
    Cds.Insert;
    Cds.FieldByName('ID_COUNTRY').AsString:= myState.Country.Id;
    Cds.FieldByName('NAME').AsString := myState.Name;
    Cds.FieldByName('ID_STATE').AsString:= myState.Id;
    Cds.Post;
  end;
  unm.Free;

end;

initialization
  TCity.Create.Free;
end.
