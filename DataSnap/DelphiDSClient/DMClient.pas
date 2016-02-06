unit DMClient;

interface

uses
  SysUtils,
  Classes,
  WideStrings,
  DB,
  SqlExpr,
  DBClient,
  DSConnect, Vcl.Dialogs,
  FMTBcd, DBXCommon, IndyPeerImpl, Vcl.ImgList, Vcl.Controls, DBXDataSnap;

type
  TDMClientContainer = class(TDataModule)
    ImageList1: TImageList;
    ILLarte: TImageList;
    MyBalloonHint: TBalloonHint;
    CDSEmployee: TClientDataSet;
    CDSCountry: TClientDataSet;
    DSPCEmployeeRDM: TDSProviderConnection;
    DSCMainServerModule: TDSProviderConnection;
    CDSJobs: TClientDataSet;
    CDSJobsJOBID: TIntegerField;
    DSPLookupRDM: TDSProviderConnection;
    CDSDepartment: TClientDataSet;
    MyDSServer: TSQLConnection;
    CDSCopy: TClientDataSet;
    CDSJobsJOBNAME: TStringField;
    CDSJobsDESCRIPTION: TStringField;
    CDSJobsJOBCMD: TStringField;
    DSPMasterDetail: TDSProviderConnection;
    CDSDepMaster: TClientDataSet;
    CDSDetailEmployee: TClientDataSet;
    CDSDepMasterDEPT_NO: TStringField;
    CDSDepMasterDEPARTMENT: TStringField;
    CDSDepMasterHEAD_DEPT: TStringField;
    CDSDepMasterMNGR_NO: TSmallintField;
    CDSDepMasterBUDGET: TFMTBCDField;
    CDSDepMasterLOCATION: TStringField;
    CDSDepMasterPHONE_NO: TStringField;
    CDSDepMasterQueryEmployee: TDataSetField;
    procedure CDSJobsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSDepMasterReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSDepMasterBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClientContainer: TDMClientContainer;

implementation

uses
  RecError,
  Login;
{$R *.dfm}

procedure TDMClientContainer.CDSDepMasterBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
var
  CurRec: TBookmark;
  OldFetchOnDemand: Boolean;
begin
  with Sender as TClientDataSet do
    if Active then // Client already active?
    begin
      OldFetchOnDemand := FetchOnDemand; // save
      CurRec := GetBookmark;
      try
        FetchOnDemand := False;
        Last;
        OwnerData := FieldbyName('EMP_NO').AsString;
        GotoBookmark(CurRec)
      finally
        FetchOnDemand := OldFetchOnDemand; // restore
        FreeBookmark(CurRec)
      end
    end
end;

procedure TDMClientContainer.CDSDepMasterReconcileError
  (DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(E.Message);
end;

procedure TDMClientContainer.CDSJobsReconcileError
  (DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

end.
