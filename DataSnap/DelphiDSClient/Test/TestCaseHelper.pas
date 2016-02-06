unit TestCaseHelper;

interface

uses TestFramework, DB, DBXJSON, Classes, Variants, SysUtils, XMLIntf,
  DBXCommon, SqlExpr, DBXDBReaders, DBXDynalink, XMLDoc, DBXDataSnap,
  IndyPeerImpl;

type

  TXMLDocumentHelper = class helper for TXMLDocument
  public
   function FindTestNode( ClassName, Method : String ) : IXMLNode;
  end;

  TTestCaseHelper = class helper for TTestCase
  public
   procedure GetConnection( out FConnection: TDBXConnection );
   procedure LoadXML(Xml: TXMLDocument);
  end;

implementation

{ TTestCaseHelper }

procedure TTestCaseHelper.GetConnection( out FConnection: TDBXConnection );
begin

  if not Assigned(FConnection) then
  begin
    FConnection := TDBXConnectionFactory.GetConnectionFactory.GetConnection
      (ParamStr(2), 'admin', 'admin');
  end;

end;

procedure TTestCaseHelper.LoadXML(Xml: TXMLDocument);
begin

  if FileExists(ParamStr(1)) then
  begin
    Xml.FileName := ParamStr(1);
    Xml.Active := True;
  end
  else
    StopTests('XML file not found');


end;


{ TXMLDocumentHelper }

function TXMLDocumentHelper.FindTestNode(ClassName, Method: String): IXMLNode;
var
  ItemNode : IXMLNode;
begin
  ItemNode := Self.DocumentElement.childNodes.FindNode(ClassName);

  if Assigned(ItemNode) then
     ItemNode := ItemNode.ChildNodes.FindNode(Method);

  Result := ItemNode;

end;

end.
