unit FormMaintUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, ComCtrls;

type
  TFormUser = class(TFormMaster)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edUserName: TEdit;
    edPassword: TEdit;
    edFirstLastName: TEdit;
    btAddNewUser: TButton;
    lvUsers: TListView;
    DSProvMainDM: TDSProviderConnection;
    CDSUsers: TClientDataSet;
    CDSUsersLOGIN: TStringField;
    CDSUsersNAME: TStringField;
    CDSUsersACTIVE: TBooleanField;
    Label1: TLabel;
    procedure btAddNewUserClick(Sender: TObject);
  private
    { Private declarations }
    procedure lvUsersItemChecked(Sender: TObject; Item: TListItem);
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormUser: TFormUser;

implementation

uses DMClient, RecError, DSClientProxy;

{$R *.dfm}

procedure TFormUser.btAddNewUserClick(Sender: TObject);
var
  User: TUserClient;
begin
  inherited;

  User := TUserClient.Create(DMClientContainer.MyDSServer.DBXConnection);
  try
    User.AddUser(edFirstLastName.Text, edUserName.Text, edPassword.Text);
    ShowMessage('User Added');
  except
     on E : Exception do begin
       ShowMessage('Error creating user' + #13#13 + E.Message);
     end;
  end;
  User.Free;

  edFirstLastName.Clear;
  edUserName.Clear;
  edPassword.Clear;

end;

procedure TFormUser.DoClose;
begin
  CDSUsers.Close;
end;

procedure TFormUser.doInit;
var
  Item: TListItem;
begin
  inherited;
  CDSUsers.Open;

  lvUsers.OnItemChecked := nil;
  lvUsers.Items.Clear;
  while not CDSUsers.Eof do
  begin
    Item := lvUsers.Items.Add;
    Item.Caption := CDSUsersLOGIN.AsString;
    Item.Checked := CDSUsersACTIVE.Value;
    Item.SubItems.Add(CDSUsersNAME.AsString);
    Item.GroupID := 0;
    CDSUsers.Next;
  end;

  CDSUsers.Close;

  lvUsers.Repaint;
  lvUsers.OnItemChecked := lvUsersItemChecked;

end;

procedure TFormUser.lvUsersItemChecked(Sender: TObject; Item: TListItem);
var
  User: TUserClient;
begin
  if Assigned(Item) then
  begin

    User := TUserClient.Create(DMClientContainer.MyDSServer.DBXConnection);

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

    except
      on E : Exception do begin
        ShowMessage('Error ' + #13#13 + E.Message);
      end;
    end;
    User.Free;
  end;

end;

end.
