unit FormBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, DSConnect, ExtCtrls, DBCtrls, StdCtrls,
  Mask, MasterForm, DBXCommon, DSClientProxy, DBXDBReaders, DBXDataSnap,
  DSHTTPLayer, SqlExpr, ComCtrls, Buttons, DBXJSON, JPEG;

type
  TUpdateBar = reference to function(LabelName: String; PercentComplete: Integer): Boolean;

  TProgressBarCallback = class(TDBXCallback)
  private
    UpdateMethod: TUpdateBar;
  public
    constructor Create(LUpdateMethod: TUpdateBar);
    function Execute(const Args: TJSONValue): TJSONValue; override;
  end;

  TFormServerBatch = class(TFormMaster)
    LBStatus: TLabel;
    SBOpenDialog: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    LBMsg: TLabel;
    InvokeButton: TButton;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    UseProxy: TCheckBox;
    BTAbort: TButton;
    UseOutParam: TCheckBox;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure SBOpenDialogClick(Sender: TObject);
    procedure InvokeButtonClick(Sender: TObject);
    procedure BTAbortClick(Sender: TObject);
  private
    { Private declarations }
    IsProcessing, DoAbort: Boolean;
    function CopyLargeStream(Source: TStream): TStream;
  public
    { Public declarations }
    procedure DoInit; override;
    procedure DoClose; override;
  end;

var
  FormServerBatch: TFormServerBatch;

implementation

uses DMClient, RecError;

{$R *.dfm}

{ TProgressBarCallback }

constructor TProgressBarCallback.Create(LUpdateMethod: TUpdateBar);
begin
  UpdateMethod := LUpdateMethod;
end;

function TProgressBarCallback.Execute(const Args: TJSONValue): TJSONValue;
var
  DoAbort: Boolean;
begin
  //expects a jsonarray
  if not (Args is TJSONArray) then
    DoAbort := True
  else
  begin
    DoAbort := UpdateMethod(TJSONArray(Args).Get(0).Value, StrToInt(TJSONArray(Args).Get(1).Value));
  end;
  Result := TJSONObject.Create;
  if DoAbort then
    TJSONObject(Result).AddPair(TJSONPair.Create('Abort', TJSONTrue.Create))
  else
    TJSONObject(Result).AddPair(TJSONPair.Create('Abort', TJSONFalse.Create));
end;

procedure TFormServerBatch.BTAbortClick(Sender: TObject);
begin
  inherited;
  if IsProcessing then
  begin
    DoAbort := True;
    LBStatus.Caption := 'Aborting...';
    Application.ProcessMessages;
  end;
  InvokeButton.Enabled := True;

end;

function TFormServerBatch.CopyLargeStream(Source: TStream): TStream;
var
  BytesRead: Integer;
  Buffer: PByte;
const
  MaxBufSize = $F000;
begin
  try
    Result := TMemoryStream.Create;
    Source.Seek(0, TSeekOrigin.soBeginning);
    Source.Position := 0;
    GetMem(Buffer, MaxBufSize);
    repeat
      BytesRead := Source.Read(Buffer^, MaxBufSize);
      if BytesRead > 0 then
        Result.WriteBuffer(Buffer^, BytesRead);
    until BytesRead < MaxBufSize;
    Result.Seek(0, TSeekOrigin.soBeginning);
  finally
//    Source.Free;
  end;

end;

procedure TFormServerBatch.DoClose;
begin
end;

procedure TFormServerBatch.doInit;
begin
end;

procedure TFormServerBatch.FormCreate(Sender: TObject);
begin
  inherited;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 100;
end;

procedure TFormServerBatch.InvokeButtonClick(Sender: TObject);
var
  ProxyClient: TDSServerBatchClient;
  SQLServerMethod1: TSQLServerMethod;
  UpdateProc: TUpdateBar;
  ImageStream: TMemoryStream;
  JPGImage: TJPEGImage;
  ProcessedStream, TmpStream: TStream;
  BytesSent: Int64;
begin
  inherited;
  UpdateProc := function(l: String; a: Integer): Boolean
  begin
    LBStatus.Caption := l;
    if l = 'Processing...' then
    begin
     BTAbort.Enabled := False;
    end
    else
    begin
      BTAbort.Enabled := True;
      BytesSent := BytesSent + a;
      ProgressBar1.Position := (Trunc(100*(BytesSent/ImageStream.Size)));
    end;
    Application.ProcessMessages;
    Result := DoAbort;
  end;
  Assert(Edit1.Text <> '', 'No file specified');

  ProxyClient := nil;
  ImageStream := TMemoryStream.Create;
  JPGImage := TJPEGImage.Create;
  ProcessedStream := nil;
  try
    IsProcessing := True;
    InvokeButton.Enabled := False;
    DoAbort := False;
    BytesSent := 0;
    ProgressBar1.Position := 0;
    Application.ProcessMessages;
    ImageStream.LoadFromFile(Edit1.Text);
    Assert(ImageStream.Size > 0, 'Image size error');
    Image2.Picture := nil;
    LBMsg.Caption := '';
    LBStatus.Caption := 'Sending...';


    //SQLConnection1.Open;
    if UseProxy.Checked then
    begin
      ProxyClient := TDSServerBatchClient.Create(DMClientContainer.MyDSServer.DBXConnection, False);
      if not DoAbort then
      begin
        if UseOutParam.Checked then
        begin
          ProxyClient.OutProcessImage(TProgressBarCallback.Create(UpdateProc), ImageStream, TmpStream);
          ProcessedStream := CopyLargeStream(TmpStream);
        end
        else
          ProcessedStream := CopyLargeStream(ProxyClient.RetProcessImage(TProgressBarCallback.Create(UpdateProc), ImageStream));
      end;
      LBStatus.Caption := 'Loading image...';
      Application.ProcessMessages;
    end
    else
    begin
      SQLServerMethod1 := TSQLServerMethod.Create(nil);
      SQLServerMethod1.SQLConnection:= DMClientContainer.MyDSServer;
      if UseOutParam.Checked then
        SQLServerMethod1.ServerMethodName := 'TCallbacksServerModule.OutProcessImage'
      else
        SQLServerMethod1.ServerMethodName:= 'TCallbacksServerModule.RetProcessImage';
      SQLServerMethod1.Params[0].AsObject := TProgressBarCallback.Create(UpdateProc);
      SQLServerMethod1.Params[1].AsStream := ImageStream;
      SQLServerMethod1.Prepared := True;
      SQLServerMethod1.ExecuteMethod;
      if not DoAbort then
      begin
        LBStatus.Caption := 'Loading image...';
        Application.ProcessMessages;
        ProcessedStream := CopyLargeStream(sqlservermethod1.Params[2].AsStream);
      end;
    end;
    if not DoAbort then
    begin
      JPGImage.LoadFromStream(ProcessedStream);
      Image2.Picture.Assign(JPGImage);
    end;
  finally
    LBStatus.Caption := 'IDLE';
    IsProcessing := False;
    InvokeButton.Enabled := True;
    if DoAbort then
    begin
      LBMsg.Caption := 'Process aborted';
      LBMsg.Font.Color := clFuchsia
    end
    else
    begin
      if Image2.Picture.Graphic = nil then
      begin
        LBMsg.Caption := 'Process failed';
        LBMsg.Font.Color := clRed;
      end
      else
      begin
        LBMsg.Caption := 'Complete success';
        LBMsg.Font.Color := clGreen;
      end;
    end;
    if Assigned(ProcessedStream) then
      FreeAndNil(ProcessedStream);
    if Assigned(JPGImage) then
      FreeAndNil(JPGImage);
    if Assigned(ImageStream) then
      FreeAndNil(ImageStream);
    if UseProxy.Checked then
    begin
      if Assigned(ProxyClient) then
        ProxyClient.Free;
    end
    else
      if Assigned(SQLServerMethod1) then
        FreeAndNil(SQLServerMethod1);
  end;

end;

procedure TFormServerBatch.SBOpenDialogClick(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    LBStatus.Caption := 'Loading image...';
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
    if Image1.Picture.Graphic <> nil then
      Edit1.Text := OpenDialog1.FileName
    else
      LBMsg.Caption := 'Loading failed';
    Application.ProcessMessages;
  end;
  LBStatus.Caption := 'IDLE';
  Application.ProcessMessages;

end;

end.
