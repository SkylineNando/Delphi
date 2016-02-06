unit RotateImage;

interface

uses SysUtils, Classes, Graphics, DBXJSON, JPEG, Windows;

{$REGION 'Rotate bitmap code from http://delphi.about.com/cs/adptips2001/a/bltip1201_4.htm'}

const
  PixelMax = 32768;

type
  pPixelArray = ^TPixelArray;
  TPixelArray = Array [0 .. PixelMax - 1] Of TRGBTriple;

procedure RotateBitmap(SourceBitmap: Graphics.TBitmap;
  out DestBitmap: Graphics.TBitmap; Center: TPoint; Angle: Double);
function ProcessImage(Args: TDBXCallback; InputStream: TStream): TStream;

{$ENDREGION}

implementation

{$REGION 'Rotate bitmap code from http://delphi.about.com/cs/adptips2001/a/bltip1201_4.htm'}

procedure RotateBitmap(SourceBitmap: Graphics.TBitmap;
  out DestBitmap: Graphics.TBitmap; Center: TPoint; Angle: Double);
var
  cosRadians: Double;
  inX: Integer;
  inXOriginal: Integer;
  inXPrime: Integer;
  inXPrimeRotated: Integer;
  inY: Integer;
  inYOriginal: Integer;
  inYPrime: Integer;
  inYPrimeRotated: Integer;
  OriginalRow: pPixelArray;
  Radians: Double;
  RotatedRow: pPixelArray;
  sinRadians: Double;
begin
  DestBitmap.Width := SourceBitmap.Width;
  DestBitmap.Height := SourceBitmap.Height;
  DestBitmap.PixelFormat := pf24bit;
  Radians := -(Angle) * PI / 180;
  sinRadians := Sin(Radians);
  cosRadians := Cos(Radians);
  for inX := DestBitmap.Height - 1 downto 0 do
  begin
    RotatedRow := DestBitmap.Scanline[inX];
    inXPrime := 2 * (inX - Center.y) + 1;
    for inY := DestBitmap.Width - 1 downto 0 do
    begin
      inYPrime := 2 * (inY - Center.x) + 1;
      inYPrimeRotated := Round(inYPrime * cosRadians - inXPrime * sinRadians);
      inXPrimeRotated := Round(inYPrime * sinRadians + inXPrime * cosRadians);
      inYOriginal := (inYPrimeRotated - 1) div 2 + Center.x;
      inXOriginal := (inXPrimeRotated - 1) div 2 + Center.y;
      if (inYOriginal >= 0) and (inYOriginal <= SourceBitmap.Width - 1) and
        (inXOriginal >= 0) and (inXOriginal <= SourceBitmap.Height - 1) then
      begin
        OriginalRow := SourceBitmap.Scanline[inXOriginal];
        RotatedRow[inY] := OriginalRow[inYOriginal]
      end
      else
      begin
        RotatedRow[inY].rgbtBlue := 255;
        RotatedRow[inY].rgbtGreen := 0;
        RotatedRow[inY].rgbtRed := 0
      end;
    end;
  end;
end;
{$ENDREGION}

function ProcessImage(Args: TDBXCallback; InputStream: TStream): TStream;
const
  // MaxBufSize = $F000;
  MaxBufSize = 50; // slow it down to fake processing for callbacks
var
  Progress: TJSONArray;
  ClientInstruction: TJSONObject;
  DoAbort: Boolean;
  Buffer: PByte;
  NewStream: TMemoryStream;
  BytesRead: Integer;
  Bitmap, ProcessedBitmap: Graphics.TBitmap;
  CenterPoint: TPoint;
  JPGImage: TJPEGImage;
begin
  DoAbort := False;
  JPGImage := nil;
  Bitmap := nil;
  ProcessedBitmap := nil;

  Result := TMemoryStream.Create;
  NewStream := TMemoryStream.Create; // for copying from incoming stream
  InputStream.Seek(0, TSeekOrigin.soBeginning);
  InputStream.Position := 0;
  GetMem(Buffer, MaxBufSize);

  repeat
    BytesRead := InputStream.Read(Buffer^, MaxBufSize);

    // callback to report back progress receiving
    Progress := TJSONArray.Create;
    Progress.AddElement(TJSONString.Create('Sending...'));
    Progress.AddElement(TJSONNumber.Create(BytesRead));
    ClientInstruction := Args.Execute(Progress) as TJSONObject;
    try
      if ClientInstruction.Get(0).JsonString.Value = 'Abort' then
      begin
        if ClientInstruction.Get(0).JsonValue.ToString = 'true' then
        begin
          DoAbort := True;
          break;
        end;
      end;
    finally
      ClientInstruction.Free;
    end;

    if BytesRead > 0 then
      NewStream.WriteBuffer(Buffer^, BytesRead);
  until BytesRead < MaxBufSize;

  if not DoAbort then
  begin
    Progress := TJSONArray.Create;
    Progress.AddElement(TJSONString.Create('Processing...'));
    Progress.AddElement(TJSONNumber.Create(0));
    Args.Execute(Progress).Free;
    // frees the returning json value which we don't care for

    // image was completely received, now process it
    JPGImage := TJPEGImage.Create;
    NewStream.Position := 0;
    JPGImage.LoadFromStream(NewStream);

    // convert into bitmap to rotate
    Bitmap := Graphics.TBitmap.Create;
    Bitmap.Assign(JPGImage);
    CenterPoint.x := Bitmap.Width div 2;
    CenterPoint.y := Bitmap.Height div 2;
    ProcessedBitmap := Graphics.TBitmap.Create;

    // do rotate
    RotateBitmap(Bitmap, ProcessedBitmap, CenterPoint, 180);

    // convert back to jpg
    JPGImage.Assign(ProcessedBitmap);
    Result.Seek(0, TSeekOrigin.soBeginning);
    Result.Position := 0;
    JPGImage.SaveToStream(Result);
    Result.Seek(0, TSeekOrigin.soBeginning);
    Result.Position := 0;
  end;
  if Assigned(NewStream) then
    FreeAndNil(NewStream);
  if Assigned(JPGImage) then
    FreeAndNil(JPGImage);
  if Assigned(Bitmap) then
    FreeAndNil(Bitmap);
  if Assigned(ProcessedBitmap) then
    FreeAndNil(ProcessedBitmap);
end;

end.
