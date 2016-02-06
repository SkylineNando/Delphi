unit XMLHelpers;

interface

uses Variants, SysUtils, XMLDoc, XMLIntf, TestConsts;

function GetNodeAsDouble(item: IXMLNode; node: String): Double;
function GetNodeAsString(item: IXMLNode; node: String): String;
function GetNodeAsBoolean(item: IXMLNode; node: String): Boolean;

function FormatDescription(item: IXMLNode): String;
function NodeNotFound(NodeName : String) : String;

implementation

function FormatDescription(item: IXMLNode): String;
var
  author, desc: String;
begin
  author := VarToStr(item.ChildValues[AuthorNode]);
  desc := VarToStr(item.ChildValues[DescriptionNode]);

  Result := '(' + author + ' - ' + desc + ')';
end;

function GetNodeAsDouble(item: IXMLNode;
  node: String): Double;
begin
  if not TryStrToFloat(VarToStr(item.ChildValues[node]), Result ) then
     raise Exception.Create('Convertion Error: ' + FormatDescription(Item));

end;

function GetNodeAsString(item: IXMLNode;
  node: String): String;
begin

  try
    Result := VarToStr(item.ChildValues[node]);
  except
    raise Exception.Create('Convertion Error: ' + FormatDescription(Item))
  end;

end;

function GetNodeAsBoolean(item: IXMLNode; node: String): Boolean;
begin

  try
    Result := StrToBool(VarToStr(item.ChildValues[node]));
  except
    raise Exception.Create('Convertion Error: ' + FormatDescription(Item))
  end;


end;

function NodeNotFound(NodeName : String) : String;
begin
  Result := Format(TestConsts.NodeNotFound, [NodeName]);
end;

end.
