unit Customer;

interface

uses DBXJSON, DBXJSONReflect, SysUtils, BaseObject;

type
  TMaritalStatus = (msMarried, msEngaged, msEligible);

  TCustomer = class(TBaseObject)
  private
    FName: string;
    FAge: integer;
    FMaritalStatus: TMaritalStatus;

  public

    property Name: string read FName write FName;
    property Age: integer read FAge write FAge;
    property MaritalStatus
      : TMaritalStatus read FMaritalStatus write FMaritalStatus;

    function ToString: string; override;

    procedure doFoo;
  end;

implementation

{ TCustomer }

procedure TCustomer.doFoo;
begin

end;

function TCustomer.ToString: string;
begin
  Result := Self.Name + ' - Age: ' + IntToStr(Self.Age);
end;

end.
