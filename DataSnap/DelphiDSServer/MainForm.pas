unit MainForm;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, Dialogs,
  StdCtrls, DB, Grids, ExtCtrls, ComCtrls, DBXCommon, DSNames, DBXCommonTable,
  MainServerModule, DBClient, pngimage, DBGrids, Datasnap.Midas;

type
  TFrmMain = class(TForm)
    DSLog: TDataSource;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    DBGrid1: TDBGrid;
    LBServerName: TLabel;
    LBStartupTime: TLabel;
    CategoryPanel4: TCategoryPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lvUsers: TListView;
    Label2: TLabel;
    edUserName: TEdit;
    edPassword: TEdit;
    Label3: TLabel;
    edFirstLastName: TEdit;
    Label4: TLabel;
    btAddNewUser: TButton;
    CategoryPanel5: TCategoryPanel;
    Button1: TButton;
    Button3: TButton;
    lbDbLog: TLabel;
    lbIb: TLabel;
    IMDSServer: TImage;
    IMServerStatus: TImage;
    procedure btAddNewUserClick(Sender: TObject);
    procedure lvUsersItemChecked(Sender: TObject; Item: TListItem);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IMServerStatusClick(Sender: TObject);
    procedure LBStartupTimeClick(Sender: TObject);

  private
    { Private declarations }
    procedure GetServerInformation;
    procedure BuildTreeView;
    procedure BuildServerMethodsAvaliable;
    procedure LoadPNGImage(Res: String; Im: TImage);

  public
    { Public declarations }

    procedure StartServer;
    procedure ShutdownServer;

  end;

var
  FrmMain: TFrmMain;

implementation

uses DMImages, User, ServerContainer, DSServerLogDB, MasterDetail;

resourcestring
  StrStartup = 'Startup: ';
  StrDelphiTourNoBrasi = 'Delphi Tour no Brasil';
  StrUserAdded = 'User Added';
{$R *.dfm}

procedure TFrmMain.btAddNewUserClick(Sender: TObject);
var
  User: TUser;
begin

  User := TUser.Create;
  try
    User.AddUser(edFirstLastName.Text, edUserName.Text, edPassword.Text);
    ShowMessage(StrUserAdded);
  finally
    User.Free;
  end;

  edFirstLastName.Clear;
  edUserName.Clear;
  edPassword.Clear;

end;

procedure TFrmMain.BuildServerMethodsAvaliable;
// var
// Comm: TDBXCommand;
// Reader: TDBXReader;
begin
  // lbMethods.Items.Clear;
  //
  // DMServerContainer.SQLLocalDSServer.Open;
  // Comm := DMServerContainer.SQLLocalDSServer.DBXConnection.CreateCommand;
  // Comm.CommandType := TDBXCommandTypes.DSServerMethod;
  // Comm.Text := TDSAdminMethods.GetServerMethods;
  //
  // try
  // Reader := Comm.ExecuteQuery;
  // except on e: exception do
  // raise exception.Create(e.Message );
  // end;
  //
  // while Reader.Next do
  // begin
  // lbMethods.Items.Add(Reader.Value[0].AsString);
  // end;
  //
  // Reader.Close;
  //
  // FreeAndNil(Reader);
  // FreeAndNil(Comm);
  // DMServerContainer.SQLLocalDSServer.Close;

end;

procedure TFrmMain.BuildTreeView;
var
  Comm: TDBXCommand;
  Reader: TDBXReader;
  Item: TListItem;
begin
  Comm := DMServerContainer.DataSnap_Server_Log.DBXConnection.CreateCommand;
  Comm.Text := 'Select LOGIN, NAME, "ACTIVE" from USERS Order By Login';
  Reader := Comm.ExecuteQuery;

  lvUsers.OnItemChecked := nil;
  lvUsers.Items.Clear;
  while Reader.Next do
  begin
    Item := lvUsers.Items.Add;
    Item.Caption := String(Reader.Value[0].GetAnsiString);
    Item.Checked := Reader.Value[2].GetBoolean;
    Item.SubItems.Add(String(Reader.Value[1].GetAnsiString));
    Item.GroupID := 0;
  end;

  lvUsers.Repaint;
  lvUsers.OnItemChecked := lvUsersItemChecked;

  Reader.Close;
  FreeAndNil(Reader);
  FreeAndNil(Comm);
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  BuildTreeView;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  BuildServerMethodsAvaliable;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
  DMMainServerModule.CDSLog.Refresh;
end;

procedure TFrmMain.GetServerInformation;
begin

  LoadPNGImage('PngDSServer', IMDSServer);

  LBServerName.Caption := 'Server Name (Port)/: ' +
    DMMainServerModule.ServerComputerName + '(' + IntToStr
    (DMServerContainer.MyDSTCPServerTransport.Port)
    + ')/' + DMMainServerModule.IpAddress;
  LBStartupTime.Caption := StrStartup + DateTimeToStr(Now);

  lbDbLog.Caption := 'Log: ' + DMServerContainer.GetLogDBName;
  lbDbLog.Hint := lbDbLog.Caption;

  lbIb.Caption := 'Database: ' + DMServerContainer.GetEmployeeDBName;
  lbIb.Hint := lbIb.Caption;

  DMMainServerModule.CDSLog.Open;

end;

procedure TFrmMain.IMServerStatusClick(Sender: TObject);
begin
  if DMServerContainer.MyDSServer.Started then
    ShutdownServer
  else
    StartServer;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  CreateLogDB;

  StartServer;
  GetServerInformation;
  BuildTreeView;
  // BuildServerMethodsAvaliable;

end;

procedure TFrmMain.lvUsersItemChecked(Sender: TObject; Item: TListItem);
var
  User: TUser;
begin
  if Assigned(Item) then
  begin

    User := TUser.Create;

    try

      if Item.Checked then
      begin
        User.EnableUser(Item.Caption);
        ShowMessage('User enabled');
      end
      else
      begin
        User.DisableUser(Item.Caption);
        ShowMessage('User disabled');
      end;

    finally
      User.Free;
    end;
  end;

end;

procedure TFrmMain.ShutdownServer;
begin

  try
    DMServerContainer.Shutdown;
    LoadPNGImage('PngRed', IMServerStatus);
  except
    LoadPNGImage('PngGreen', IMServerStatus);
  end;

end;

procedure TFrmMain.StartServer;
var
  Port: integer;
begin
  if ParamCount > 0 then
    Port := StrToInt(ParamStr(1))
  else
    Port := 211;

  try
    DMServerContainer.StartServer(Port);
    LoadPNGImage('PngGreen', IMServerStatus);
  except
    LoadPNGImage('PngRed', IMServerStatus);
  end;

end;

procedure TFrmMain.LBStartupTimeClick(Sender: TObject);
begin
  ShowMessage(StrDelphiTourNoBrasi);
end;

procedure TFrmMain.LoadPNGImage(Res: String; Im: TImage);
var
  MyResourceStream: TResourceStream;
  MyPNGImage: TPNGImage;
begin
  MyResourceStream := TResourceStream.Create(hInstance, Res, RT_RCDATA);

  try
    MyPNGImage := TPNGImage.Create;
    try
      MyPNGImage.LoadFromStream(MyResourceStream);
      Im.Picture.Graphic := MyPNGImage;
    finally
      MyPNGImage.Free
    end;
  finally
    MyResourceStream.Free
  end;

end;

// initialization
//
// ReportMemoryLeaksOnShutdown := True;

end.
