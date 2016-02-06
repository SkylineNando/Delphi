unit FormDBBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXDBReaders, DBXDataSnap,
  DSHTTPLayer, SqlExpr, ComCtrls, Buttons, DBXJSON, JPEG;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TFormBackup = class(TFormMaster)
    BTAbort: TButton;
    MMBackupLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BTAbortClick(Sender: TObject);
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
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormBackup: TFormBackup;

implementation

uses DMClient;

{$R *.dfm}


procedure TFormBackup.BTAbortClick(Sender: TObject);
var
  s: TDSServerBatchClient;
begin
  inherited;

  callback := TMessageCallback.Create( function(const Args: TJSONValue)
      : TJSONValue

      var
        LJSONObject: TJSONObject;
        i: Integer; LMessage: string;
      begin
        // Extract information about the transformation from Json
        LJSONObject := TJSONObject(Args);
        Result := nil;

        for i := 0 to LJSONObject.Size - 1 do
        begin
          with LJSONObject.Get(i) do
            LMessage := LMessage + Format('%s ==>> "%s"', [JSonString.Value,
          JsonValue.Value]);

          // Display information in a listbox
          MMBackupLog.Lines.Add(LMessage);
          MMBackupLog.Update;
          Result := TJSONTrue.Create;

        end;
    end);

  s := TDSServerBatchClient.Create(DMClientContainer.MyDSServer.DBXConnection);
  s.StartBackup(callback, 'mybackup.ibk');

end;

procedure TFormBackup.DoClose;
begin
end;

procedure TFormBackup.doInit;
begin
end;

procedure TFormBackup.FormCreate(Sender: TObject);
begin
  inherited;
end;



{ TFormBackup.TMessageCallback }

constructor TFormBackup.TMessageCallback.Create(
  CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TFormBackup.TMessageCallback.Execute(
  const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallBackMethod(Arg);

end;

end.
