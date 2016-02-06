unit TestDM;

interface

uses
  SysUtils, Classes, xmldom, XMLIntf, XMLDoc, Xml.Win.msxmldom;

type
  TDMTest = class(TDataModule)
    XMLDoc: TXMLDocument;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTest: TDMTest;

implementation

{$R *.dfm}

end.
