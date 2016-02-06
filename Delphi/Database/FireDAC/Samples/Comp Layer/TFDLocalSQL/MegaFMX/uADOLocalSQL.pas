unit uADOLocalSQL;

interface

uses
  System.SysUtils, Data.Win.ADODB,
  FireDAC.Phys.Intf;

type
  TFDADOLocalSQLAdapter = class (TInterfacedObject, IFDPhysLocalQueryAdapter)
  private
    FDataSet: TCustomADODataSet;
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
    constructor Create(ADataSet: TCustomADODataSet);
  end;

implementation

{ TFDADOLocalSQLAdapter }

constructor TFDADOLocalSQLAdapter.Create(ADataSet: TCustomADODataSet);
begin
  inherited Create;
  FDataSet := ADataSet;
end;

// -----------------------------------------------
// General
function TFDADOLocalSQLAdapter.GetFeatures: TFDPhysLocalQueryAdapterFeatures;
begin
  Result := [afCachedUpdates, afIndexFieldNames, afFilters];
end;

function TFDADOLocalSQLAdapter.GetDataSet: TObject;
begin
  Result := FDataSet;
end;

function TFDADOLocalSQLAdapter.GetConn: TObject;
begin
  Result := FDataSet.Connection;
end;

function TFDADOLocalSQLAdapter.IsPKViolation(AExc: Exception): Boolean;
begin
  Result := False;
end;

// -----------------------------------------------
// Cached Updates management
function TFDADOLocalSQLAdapter.GetCachedUpdates: Boolean;
begin
  Result := (FDataSet.CursorLocation = clUseClient) and
    (FDataSet.CursorType in [ctKeySet, ctStatic]) and
    (FDataSet.LockType = ltBatchOptimistic);
end;

procedure TFDADOLocalSQLAdapter.SetCachedUpdates(const AValue: Boolean);
begin
  if AValue then begin
    FDataSet.CursorLocation := clUseClient;
    FDataSet.CursorType := ctKeySet;
    FDataSet.LockType := ltBatchOptimistic;
  end
  else
    FDataSet.LockType := ltOptimistic;
end;

function TFDADOLocalSQLAdapter.ApplyUpdates(AMaxErrors: Integer): Integer;
begin
  try
    Result := 0;
    FDataSet.UpdateBatch(arAll);
  except
    Result := 1;
  end;
end;

procedure TFDADOLocalSQLAdapter.CommitUpdates;
begin
  // nothing
end;

procedure TFDADOLocalSQLAdapter.CancelUpdates;
begin
  FDataSet.CancelBatch(arAll);
end;

function TFDADOLocalSQLAdapter.GetSavePoint: Integer;
begin
  // nothing
  Result := -1;
end;

procedure TFDADOLocalSQLAdapter.SetSavePoint(const AValue: Integer);
begin
  // nothing
end;

// -----------------------------------------------
// Ranges
procedure TFDADOLocalSQLAdapter.SetRange(const AStartValues,
  AEndValues: array of const; AStartExclusive, AEndExclusive: Boolean);
begin

end;

procedure TFDADOLocalSQLAdapter.CancelRange;
begin
  // nothing
end;

// -----------------------------------------------
// Indexes
type
  __TCustomADODataSet = class(TCustomADODataSet);

function TFDADOLocalSQLAdapter.GetIndexFieldNames: String;
begin
  Result := __TCustomADODataSet(FDataSet).IndexFieldNames;
end;

procedure TFDADOLocalSQLAdapter.SetIndexFieldNames(const AValue: String);
begin
  __TCustomADODataSet(FDataSet).IndexFieldNames := AValue;
end;

end.
