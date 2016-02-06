unit MainForm;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXClient, WideStrings, DB, SqlExpr, ComCtrls, DBClient, DSConnect,
  DbxDatasnap, Grids, DBGrids, StdCtrls, FMTBcd, ExtCtrls, DBCtrls, Mask,
  DBXDBReaders, DBXCommon, DBXJSON, Customer, DataSnap.Midas;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TFrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DSCountry: TDataSource;
    DBGrid1: TDBGrid;
    DSEmployee: TDataSource;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Button4: TButton;
    LBDateTime: TLabel;
    GroupBox1: TGroupBox;
    PageControl2: TPageControl;
    TBJobList: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBEJobId: TDBEdit;
    DSJobs: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBGrid3: TDBGrid;
    Button5: TButton;
    DBNavigator3: TDBNavigator;
    ApplyUpdates: TButton;
    TabSheet3: TTabSheet;
    DSDepartment: TDataSource;
    BTGetDepartament: TButton;
    Button8: TButton;
    Memo1: TMemo;
    Button6: TButton;
    Label5: TLabel;
    TabSheet5: TTabSheet;
    Button7: TButton;
    TabSheet6: TTabSheet;
    Button9: TButton;
    MMBackupLog: TMemo;
    TabSheet7: TTabSheet;
    Button10: TButton;
    MMLog: TMemo;
    Button11: TButton;
    Button12: TButton;
    TabSheet8: TTabSheet;
    DSCopy: TDataSource;
    DBGrid4: TDBGrid;
    Button13: TButton;
    Button14: TButton;
    TabSheet9: TTabSheet;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBNavigator5: TDBNavigator;
    Panel2: TPanel;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    DSDepMaster: TDataSource;
    DSDetailEmployee: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ApplyUpdatesClick(Sender: TObject);
    procedure BTGetDepartamentClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);

  private
  { Private declarations }
    type

    TMessageCallback = class(TDBXCallback)
    private
      FCallBackMethod: TDSCallbackMethod;

    public
      constructor Create(CallBackMethod: TDSCallbackMethod);
      function Execute(const Arg: TJSONValue): TJSONValue; override;
    end;

  public
    { Public declarations }
    callback: TMessageCallback;

  end;

var
  FrmMain: TFrmMain;

implementation

uses Login, DSClientProxy, DMClient;
{$R *.dfm}

procedure TFrmMain.Button10Click(Sender: TObject);
var
  proxy: TDSServerMethodsClient;
  myMVPCustomer: TCustomer;
begin

  proxy := nil;
  try
    proxy := TDSServerMethodsClient.Create
      (DMClientContainer.MyDSServer.DBXConnection);
    myMVPCustomer := TCustomer.JSONToObject<TCustomer>(proxy.MVPCustomer, nil);

    MMLog.Lines.Text := myMVPCustomer.ToString;
    myMVPCustomer.Free;
  finally
    proxy.Free;
  end;

end;

procedure TFrmMain.Button11Click(Sender: TObject);
var
  proxy: TDSServerMethodsClient;
  mySingleCustomer: TCustomer;
  allCustomers: TJSONArray;
  i: Integer;
begin

  proxy := nil;
  try
    proxy := TDSServerMethodsClient.Create
      (DMClientContainer.MyDSServer.DBXConnection);
    allCustomers := proxy.ListofCustomer;

    for i := 0 to allCustomers.Size - 1 do
    begin
      mySingleCustomer := TCustomer.JSONToObject<TCustomer>
        (allCustomers.Get(i), nil);
      MMLog.Lines.Add(mySingleCustomer.ToString);
      mySingleCustomer.Free;
    end;

  finally
    proxy.Free;
  end;

end;

procedure TFrmMain.Button12Click(Sender: TObject);
var
  proxy: TDSServerMethodsClient;
  mySingleValue: TJSONValue;
  allValues: TJSONArray;
  i: Integer;
begin

  proxy := nil;
  try
    proxy := TDSServerMethodsClient.Create
      (DMClientContainer.MyDSServer.DBXConnection);
    allValues := proxy.ListofDifferentTypes;
    for i := 0 to allValues.Size - 1 do
    begin
      mySingleValue := allValues.Get(i);

      if mySingleValue is TJSONString then
        MMLog.Lines.Add('TJSONString value ' + mySingleValue.Value)
      else if mySingleValue is TJSONNumber then
        MMLog.Lines.Add('TJSONNumber value ' + mySingleValue.Value)
      else if mySingleValue is TJSONTrue then
        MMLog.Lines.Add('TJSONTrue value ' + mySingleValue.ToString)
      else if mySingleValue is TJSONFalse then
        MMLog.Lines.Add('TJSONFalse value ' + mySingleValue.ToString)
      else if mySingleValue is TJSONObject then
        MMLog.Lines.Add('TJSONObject value ' + mySingleValue.ToString)
      else if mySingleValue is TObject then
        MMLog.Lines.Add('TCustomer value ' + mySingleValue.ToString);

    end;

  finally
    proxy.Free;
  end;

end;

procedure TFrmMain.Button13Click(Sender: TObject);
var
  Reader: TDBXReader;
  DepClient: TDepartmentClient;
begin
  DepClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);

  try
    Reader := DepClient.GetDepartmentsOrderBy;

    try
      if Assigned(Reader) then
      begin
        TDBXDataSetReader.CopyReaderToClientDataSet(Reader,
          DMClientContainer.CDSCopy);
      end;
    finally
      FreeAndNil(Reader);
    end;

  finally
    DepClient.Free;
  end;

end;

procedure TFrmMain.Button14Click(Sender: TObject);
var
  proxy: TDSServerMethodsClient;
  myMVPCustomer: TCustomer;
begin

  proxy := nil;
  try
    proxy := TDSServerMethodsClient.Create
      (DMClientContainer.MyDSServer.DBXConnection);
    myMVPCustomer := proxy.Customer;

    MMLog.Lines.Text := myMVPCustomer.ToString;
    myMVPCustomer.Free;
  finally
    proxy.Free;
  end;

end;

procedure TFrmMain.Button15Click(Sender: TObject);
begin
  DMClientContainer.CDSDepMaster.ApplyUpdates(-1);
end;

procedure TFrmMain.Button16Click(Sender: TObject);
begin
  DSDepMaster.DataSet.Close;

end;

procedure TFrmMain.Button17Click(Sender: TObject);
begin
  DSDepMaster.DataSet.Open;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  (DSCountry.DataSet as TClientDataSet).ApplyUpdates(-1);
  (DSEmployee.DataSet as TClientDataSet).ApplyUpdates(-1);
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  DSCountry.DataSet.Open;
  DSEmployee.DataSet.Open;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
  DSCountry.DataSet.Close;
  DSEmployee.DataSet.Close;
end;

procedure TFrmMain.Button4Click(Sender: TObject);
var
  Sm: TDSServerMethodsClient;
begin

  Sm := TDSServerMethodsClient.Create
    (DMClientContainer.MyDSServer.DBXConnection);
  LBDateTime.Caption := DateTimeToStr(Sm.GetServerDateTime);

end;

procedure TFrmMain.Button5Click(Sender: TObject);
var
  i: Integer;
begin

  i := DBEJobId.Field.AsInteger;

  with DMClientContainer.MyDSServer do
    TDSServerMethodsClient.Create(DBXConnection).ExecuteJob(i);
end;

procedure TFrmMain.Button6Click(Sender: TObject);
var
  DepClient: TDepartmentClient;
begin
  DepClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);
  try
    DepClient.DepartmentOrderByName;
  finally
    DepClient.Free;
  end;
end;

procedure TFrmMain.Button7Click(Sender: TObject);
// var
// FMyDbxConnection : TDBXConnection;
var
  Params: TParams;
  RDMClient: TDepartmentClient;
begin
  // FMyDbxConnection := TDBXConnectionFactory.GetConnectionFactory.GetConnection('employee','sysdba','masterkey');
  // if FMyDbxConnection <> nil then
  // FMyDbxConnection.Free;

  RDMClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);
  Params := TParams.Create();

  Params.CreateParam(ftString, 'DEPARTMENT', ptInput).Value := 'New Department';
  Params.CreateParam(ftString, 'HEAD_DEPT', ptInput).Value := '000';
  Params.CreateParam(ftString, 'MNGR_NO', ptInput).Value := '105';
  Params.CreateParam(ftString, 'BUDGET', ptInput).Value := 100000;
  Params.CreateParam(ftString, 'LOCATION', ptInput).Value := 'Scotts Valley';
  Params.CreateParam(ftString, 'PHONE_NO', ptInput).Value := 'N/A';

  RDMClient.Insert(Params);
  ShowMessage('Method executed on the server side');

end;

procedure TFrmMain.ApplyUpdatesClick(Sender: TObject);
begin
  if DSJobs.DataSet.State in [dsInsert, dsEdit] then
    DSJobs.DataSet.Post;
  if DMClientContainer.CDSJobs.ChangeCount > 0 then
  begin
    DMClientContainer.CDSJobs.ApplyUpdates(-1);
  end;

end;

procedure TFrmMain.BTGetDepartamentClick(Sender: TObject);
var
  Reader: TDBXReader;
  DepClient: TDepartmentClient;
begin
  DepClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);

  BTGetDepartament.Caption := 'Get Department (' +
    DepClient.OrderByField + ')';

  try
    Reader := DepClient.GetDepartmentsOrderBy;

    try
      if Assigned(Reader) then
      begin
        Memo1.Lines.Clear;
        while Reader.Next do
        begin
          Memo1.Lines.Add(String(Reader.Value['DEPT_NO'].GetAnsiString) + ' -  '
            + String(Reader.Value['DEPARTMENT'].GetAnsiString));
        end;
      end;
    finally
      FreeAndNil(Reader);
    end;

  finally
    DepClient.Free;
  end;

end;

procedure TFrmMain.Button8Click(Sender: TObject);
var
  DepClient: TDepartmentClient;
begin
  DepClient := TDepartmentClient.Create
    (DMClientContainer.MyDSServer.DBXConnection, False);
  try
    DepClient.DepartmentOrderByID;
  finally
    DepClient.Free;
  end;
end;

procedure TFrmMain.Button9Click(Sender: TObject);
var
  s: TDSServerBatchClient;
  bn: String;
begin

  callback := TMessageCallback.Create( function(const Args: TJSONValue)
    : TJSONValue

    var
      LJSONObject: TJSONObject;
      i: Integer;
      LMessage: string;
    begin
      // Extract information about the transformation from Json
      LJSONObject := TJSONObject(Args); Result := nil;

      for i := 0 to LJSONObject.Size - 1 do
      begin
        with LJSONObject.Get(i) do
           LMessage := LMessage + Format('%s ==>> "%s"', [JSonString.Value, JsonValue.Value]);

       // Display information in a listbox
       MMBackupLog.Lines.Add(LMessage);
       MMBackupLog.Update;
       Application.ProcessMessages;
       Result := TJSONTrue.Create;

      end;
    end);

  bn := InputBox('InterBase backup', 'Backup file name', 'mybackup.ibk');

  if Trim(bn) <> '' then
  begin

    s := TDSServerBatchClient.Create
      (DMClientContainer.MyDSServer.DBXConnection);
    try
      s.StartBackup(callback, bn);
    except
      on e: exception do begin
        ShowMessage(e.Message);
        DMClientContainer.MyDSServer.Close;

        DMClientContainer.MyDSServer.Open;
      end;
    end;
    s.Free;

  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  User, Pass, Server, Port: String;
begin

  if FrmLogin.ShowModal = mrOk then
  begin

    With FrmLogin do
    begin
      Server := edDSServer.Text;
      User := edUserName.Text;
      Pass := edPassowrd.Text;
      Port := edDSPort.Text;
    end;

    DMClientContainer.MyDSServer.Params.Values['HostName'] := Server;
    DMClientContainer.MyDSServer.Params.Values['Port'] := Port;
    DMClientContainer.MyDSServer.Params.Values['DSAuthenticationUser'] := User;
    DMClientContainer.MyDSServer.Params.Values
      ['DSAuthenticationPassword'] := Pass;
    try
      DMClientContainer.MyDSServer.Open;
      DSJobs.DataSet.Open;
    except
      on e: exception do
      begin
        MessageDlg(e.Message, mtError, [mbOk], 0);
        Halt(1);
      end;
    end;
  end
  else
    Halt(1);

end;

{ TFrmMain.TMessageCallback }

constructor TFrmMain.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TFrmMain.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallBackMethod(Arg);
end;

end.
