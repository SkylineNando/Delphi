unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.ExprFuncs, FMX.TabControl, FireDAC.Phys.SQLite, System.Rtti,
  FMX.Layouts, Fmx.Bind.Navigator, FMX.Grid, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Memo,
  FireDAC.Comp.DataMove, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,
  Data.Win.ADODB, Datasnap.DBClient;

type
  TfrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDLocalSQL1: TFDLocalSQL;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Grid1: TGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Memo1: TMemo;
    Button1: TButton;
    FDConnection2: TFDConnection;
    FDLocalSQL2: TFDLocalSQL;
    FDQuery2: TFDQuery;
    Memo2: TMemo;
    Button2: TButton;
    Grid2: TGrid;
    BindNavigator2: TBindNavigator;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    FDLocalSQL3: TFDLocalSQL;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDConnection3: TFDConnection;
    FDLocalSQL4: TFDLocalSQL;
    FDQuery3: TFDQuery;
    Memo3: TMemo;
    Button3: TButton;
    Grid3: TGrid;
    BindNavigator3: TBindNavigator;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ClientDataSet1: TClientDataSet;
    FDMemTable1: TFDMemTable;
    procedure Button1Click(Sender: TObject);
    procedure FDLocalSQL1GetDataSet(ASender: TObject; const AName: string;
      var ADataSet: TDataSet; var AAdapter: IFDPhysLocalQueryAdapter);
    procedure FDLocalSQL2GetDataSet(ASender: TObject; const AName: string;
      var ADataSet: TDataSet; var AAdapter: IFDPhysLocalQueryAdapter);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  uADOLocalSQL, uCDSLocalSQL;

// ----------------------------------------------------------------------------
// CSV DB

function GetPathToCSV: String;
begin
  // Path to FireDAC demo DB CSV files
  Result := ExtractFilePath(
    FDManager.ConnectionDefs.FindConnectionDef('Access_Demo').ExpandedDatabase) +
    '..\Delphi\Database\FireDAC\DB\Data\';
end;

procedure TfrmMain.FDLocalSQL1GetDataSet(ASender: TObject; const AName: string;
  var ADataSet: TDataSet; var AAdapter: IFDPhysLocalQueryAdapter);
var
  oComp: TComponent;
  oTab: TFDMemTable;
  oDM: TFDDataMove;
begin
  oComp := FDLocalSQL1.FindComponent(AName);
  if (oComp <> nil) and (oComp is TFDMemTable) then
    ADataSet := TFDMemTable(oComp)
  else begin
    oTab := TFDMemTable.Create(FDLocalSQL1);
    oDM := TFDDataMove.Create(nil);
    try
      try
        oDM.Destination := oTab;
        oDM.SourceKind := skText;
        oDM.TextFileName := GetPathToCSV + AName + '.csv';
        oDM.TextAnalyze := [taDelimSep, taHeader, taFields];
        oDM.Execute;
      except
        oTab.Free;
        raise;
      end;
    finally
      oDM.Free;
    end;
    oTab.Name := AName;
    ADataSet := oTab;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL := Memo1.Lines;
  FDQuery1.Open;
end;

// ----------------------------------------------------------------------------
// Heterogeneous Query

procedure TfrmMain.FDLocalSQL2GetDataSet(ASender: TObject; const AName: string;
  var ADataSet: TDataSet; var AAdapter: IFDPhysLocalQueryAdapter);
var
  oComp: TComponent;
  oLS: TFDLocalSQL;
  oQry: TFDQuery;
  sSchema, sTmp, sName: String;
begin
  oLS := ASender as TFDLocalSQL;
  oLS.Connection.DecodeObjectName(AName, sSchema, sTmp, sTmp, sName);
  if CompareText(sSchema, oLS.SchemaName) = 0 then begin
    oComp := oLS.FindComponent(sName);
    if (oComp <> nil) and (oComp is TFDQuery) then
      ADataSet := TFDQuery(oComp)
    else begin
      oQry := TFDQuery.Create(oLS);
      try
        oQry.Name := sName;
        oQry.ConnectionName := sSchema;
        oQry.SQL.Text := 'select * from ' + sName;
        oQry.Open;
      except
        oQry.Free;
        raise;
      end;
      ADataSet := oQry;
    end;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  FDQuery2.Close;
  FDQuery2.SQL := Memo2.Lines;
  FDQuery2.Open;
end;

// ----------------------------------------------------------------------------
// Different DAC's (FireDAC & CDS & ADO)

var
  lADOAdded: Boolean = False;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  if not lADOAdded then begin
    lADOAdded := True;

    ClientDataSet1.FieldDefs.Add('EmployeeID', ftInteger);
    ClientDataSet1.FieldDefs.Add('EmployeeName', ftString, 50);
    ClientDataSet1.CreateDataSet;
    ClientDataSet1.AppendRecord([1, 'John Smith']);
    ClientDataSet1.AppendRecord([2, 'Vince Voe']);
    ClientDataSet1.AppendRecord([3, 'Ralph Roe']);

    FDMemTable1.FieldDefs.Add('EmployeeID', ftInteger);
    FDMemTable1.FieldDefs.Add('RegionID', ftInteger);
    FDMemTable1.FieldDefs.Add('ProductName', ftString, 50);
    FDMemTable1.FieldDefs.Add('Price', ftFloat);
    FDMemTable1.CreateDataSet;
    FDMemTable1.AppendRecord([1, 2, 'Car', 20000]);
    FDMemTable1.AppendRecord([3, 4, 'Computer', 1000]);
    FDMemTable1.AppendRecord([2, 3, 'Apartments', 150000]);

    ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
      // Path to FireDAC MS Access demo DB
      FDManager.ConnectionDefs.FindConnectionDef('Access_Demo').ExpandedDatabase;

    FDLocalSQL4.DataSets.Add(ADOQuery1, 'region', TFDADOLocalSQLAdapter.Create(ADOQuery1));
    FDLocalSQL4.DataSets.Add(ClientDataSet1, 'employees', TFDCDSLocalSQLAdapter.Create(ClientDataSet1));
    FDLocalSQL4.DataSets.Add(FDMemTable1, 'orders');
  end;
  FDQuery3.Close;
  FDQuery3.SQL := Memo3.Lines;
  FDQuery3.Open;
end;

end.
