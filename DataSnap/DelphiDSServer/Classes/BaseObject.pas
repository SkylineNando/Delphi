unit BaseObject;

interface

uses DBXJSON, DBXJSONReflect;

type
  TBaseObject = class
  public
    { public declarations }
    class function ObjectToJSON<T : class>(MyObject: T; AMarshal : TJSONMarshal): TJSONValue;
    class function JSONToObject<T : class>(Json: TJSONValue; AUnMarshal: TJSONUnMarshal): T;

    class procedure RegisterConverter(m : TJSONMarshal);virtual;
    class procedure RegisterReverter(unm : TJSONUnMarshal);virtual;
  end;

implementation

{ TBaseObject }

class function TBaseObject.JSONToObject<T>(Json: TJSONValue; AUnMarshal: TJSONUnMarshal): T;
var
  UnMarshal: TJSONUnMarshal;
begin
  if Json is TJSONNull then
    exit(nil);

  if Assigned(AUnMarshal) then
     UnMarshal := AUnMarshal
  else
     UnMarshal := TJSONUnMarshal.Create;

  RegisterReverter(UnMarshal);
  try
    exit(T(UnMarshal.Unmarshal(Json)))
  finally
    if not Assigned(AUnMarshal) then
       UnMarshal.Free;
  end;

end;

class function TBaseObject.ObjectToJSON<T>(MyObject: T; AMarshal : TJSONMarshal): TJSONValue;
var
  Marshal: TJSONMarshal;
begin

  if Assigned(MyObject) then
  begin

    if Assigned(AMarshal) then
       Marshal := AMarshal
    else
       Marshal := TJSONMarshal.Create(TJSONConverter.Create);


    RegisterConverter(Marshal);
    try
      exit(Marshal.Marshal(MyObject));
    finally
      if not Assigned(AMarshal) then
         Marshal.Free;
    end;
  end
  else
    exit(TJSONNull.Create);

end;


class procedure TBaseObject.RegisterConverter(m: TJSONMarshal);
begin

end;

class procedure TBaseObject.RegisterReverter(unm: TJSONUnMarshal);
begin

end;

end.
