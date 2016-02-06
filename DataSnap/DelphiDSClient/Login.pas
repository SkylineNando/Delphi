unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Forms,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Dialogs;

type
  TFrmLogin = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Button2: TButton;
    Label3: TLabel;
    edUserName: TButtonedEdit;
    edPassowrd: TButtonedEdit;
    edDSServer: TButtonedEdit;
    Label4: TLabel;
    edDSPort: TButtonedEdit;
    procedure Button1Click(Sender: TObject);
    procedure edUserNameRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DoLogin: Boolean;
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses DSClientProxy, DMClient;

{$R *.dfm}
{ TFrmLogin }

procedure TFrmLogin.Button1Click(Sender: TObject);
begin
  if Trim(edUserName.Text) = '' then
  begin
    edUserName.SetFocus;
    raise Exception.Create('User Name field is required');
  end;

  if Trim(edPassowrd.Text) = '' then
  begin
    edPassowrd.SetFocus;
    raise Exception.Create('Password field is required');
  end;

  if Trim(edDSServer.Text) = '' then
  begin
    edDSServer.SetFocus;
    raise Exception.Create('DataSnap Server - HostName field is required');
  end;

  Self.ModalResult := mrOk;

end;

function TFrmLogin.DoLogin: Boolean;
var
  User, Pass, Server, Port: String;
begin
  Result := false;

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
      Result := true;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;

end;

procedure TFrmLogin.edUserNameRightButtonClick(Sender: TObject);
begin
  (Sender as TButtonedEdit).Clear;
end;

end.
