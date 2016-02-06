unit uCDSLocalSQL;

interface

uses
  System.SysUtils, Datasnap.DBClient,
  FireDAC.Phys.Intf;

type
  TFDCDSLocalSQLAdapter = class (TInterfacedObject, IFDPhysLocalQueryAdapter)
  private
    FDataSet: TClientDataSet;
  protected
    // private
    function GetFeatures: TFDPhysLocalQueryAdapterFeatures;
    function GetCachedUpdates: Boolean;
    procedure SetCachedUpdates(const AValue: Boolean);
    function GetSavePoint: Integer;
    procedure SetSavePoint(const AValue: Integer);
    function GetIndexFieldNames: String;
    procedure SetIndexFieldNames(const AValue: String);
    function GetDataSet: TObject;
    function GetConn: TObject;
    // public
    function ApplyUpdates(AMaxErrors: Integer = -1): Integer;
    procedure CommitUpdates;
    procedure CancelUpdates;
    procedure SetRange(const AStartValues, AEndValues: array of const;
      AStartExclusive: Boolean = False; AEndExclusive: Boolean = False);
    procedure CancelRange;
    function IsPKViolation(AExc: Exception): Boolean;
  public
    constructor Create(ADataSet: TClientDataSet);
  end;

implementation

{ TFDCDSLocalSQLAdapter }

constructor TFDCDSLocalSQLAdapter.Create(ADataSet: TClientDataSet);
begin
  inherited Create;
  FDataSet := ADataSet;
end;

// -----------------------------------------------
// General
function TFDCDSLocalSQLAdapter.GetFeatures: TFDPhysLocalQueryAdapterFeatures;
begin
  Result := [afCachedUpdates, afSavePoints, afIndexFieldNames, afRanges, afFilters];
end;

function TFDCDSLocalSQLAdapter.GetDataSet: TObject;
begin
  Result := FDataSet;
end;

function TFDCDSLocalSQLAdapter.GetConn: TObject;
begin
  Result := TObject(Pointer(FDataSet.AppServer));
end;

function TFDCDSLocalSQLAdapter.IsPKViolation(AExc: Exception): Boolean;
begin
  Result := False;
end;

// -----------------------------------------------
// Cached Updates management
function TFDCDSLocalSQLAdapter.GetCachedUpdates: Boolean;
begin
  Result := FDataSet.LogChanges;
end;

procedure TFDCDSLocalSQLAdapter.SetCachedUpdates(const AValue: Boolean);
begin
  FDataSet.LogChanges := AValue;
end;

function TFDCDSLocalSQLAdapter.ApplyUpdates(AMaxErrors: Integer): Integer;
begin
  Result := FDataSet.ApplyUpdates(AMaxErrors);
end;

procedure TFDCDSLocalSQLAdapter.CommitUpdates;
begin
  FDataSet.MergeChangeLog;
end;

procedure TFDCDSLocalSQLAdapter.CancelUpdates;
begin
  FDataSet.CancelUpdates;
end;

function TFDCDSLocalSQLAdapter.GetSavePoint: Integer;
begin
  Result := FDataSet.SavePoint;
end;

procedure TFDCDSLocalSQLAdapter.SetSavePoint(const AValue: Integer);
begin
  FDataSet.SavePoint := AValue;
end;

// -----------------------------------------------
// Ranges
procedure TFDCDSLocalSQLAdapter.SetRange(const AStartValues,
  AEndValues: array of const; AStartExclusive, AEndExclusive: Boolean);
begin
  FDataSet.SetRangeStart;
  FDataSet.KeyExclusive := AStartExclusive;
  FDataSet.SetRangeEnd;
  FDataSet.KeyExclusive := AEndExclusive;
  FDataSet.ApplyRange;
end;

procedure TFDCDSLocalSQLAdapter.CancelRange;
begin
  FDataSet.CancelRange;
end;

// -----------------------------------------------
// Indexes
function TFDCDSLocalSQLAdapter.GetIndexFieldNames: String;
begin
  Result := FDataSet.IndexFieldNames;
end;

procedure TFDCDSLocalSQLAdapter.SetIndexFieldNames(const AValue: String);
begin
  FDataSet.IndexFieldNames := AValue;
end;

end.

