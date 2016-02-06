unit Location;

interface

uses DBXJSON, DBXJSONReflect, SysUtils, BaseObject;

type

  TRegion = class(TBaseObject)
  private
    FName: String;
    FId: Integer;
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: String);
  public

    property Id: Integer read FId write SetId;
    property Name: String read FName write SetName;
  end;

  TCountry = class(TBaseObject)
  private
    FName: String;
    FId: String;
    FRegion: TRegion;
    procedure SetId(const Value: String);
    procedure SetName(const Value: String);
    procedure SetRegion(const Value: TRegion);
  public

    property Id: String read FId write SetId;
    property Name: String read FName write SetName;
    property Region : TRegion read FRegion write SetRegion;
  end;

  TState = class(TBaseObject)
  private
    FName: String;
    FId: String;
    FCountry: TCountry;
    procedure SetCountry(const Value: TCountry);
    procedure SetId(const Value: String);
    procedure SetName(const Value: String);
  public

    property Id: String read FId write SetId;
    property Name: String read FName write SetName;
    property Country : TCountry read FCountry write SetCountry;
  end;

  TCity = class(TBaseObject)
  private
    FName: String;
    FState: TState;
    FId: Integer;
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetState(const Value: TState);
  public

    property Id: Integer read FId write SetId;
    property Name: String read FName write SetName;
    property State : TState read FState write SetState;
  end;

implementation

{ TCustomer }


{ TCity }

procedure TCity.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCity.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TCity.SetState(const Value: TState);
begin
  FState := Value;
end;

{ TRegion }

procedure TRegion.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRegion.SetName(const Value: String);
begin
  FName := Value;
end;

{ TCountry }

procedure TCountry.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TCountry.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TCountry.SetRegion(const Value: TRegion);
begin
  FRegion := Value;
end;

{ TState }

procedure TState.SetCountry(const Value: TCountry);
begin
  FCountry := Value;
end;

procedure TState.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TState.SetName(const Value: String);
begin
  FName := Value;
end;

end.
