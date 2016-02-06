unit BaseServerClass;

interface

uses Classes,DBXCommon, SysUtils, Dialogs, MainServerModule;

type
  {$MethodInfo ON}
  TBaseServerClass = class(TPersistent)
  protected
    function GetDbxConnection : TDBXConnection;
  public
    FDbxConnection : TDBXConnection;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses ServerContainer;

{ TBaseServerClass }


constructor TBaseServerClass.Create;
begin

end;

destructor TBaseServerClass.Destroy;
begin

  inherited;
end;

function TBaseServerClass.GetDbxConnection: TDBXConnection;
begin
  Result := DMServerContainer.DataSnap_Server_Log.DBXConnection;
end;

end.
