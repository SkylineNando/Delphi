//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Sensors, FMX.Media,
  FMX.Objects, FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.Graphics,
  FMX.StdActns, FMX.MobilePreview;

type
  TCameraRollForm = class(TForm)
    btnPhotoLibrary: TButton;
    imgPhotoLibraryImage: TImage;
    alGetCameraRoll: TActionList;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CameraRollForm: TCameraRollForm;

implementation

{$R *.fmx}

procedure TCameraRollForm.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  { Assign the image retrieved from the Photo Library to the TImage component. }
  imgPhotoLibraryImage.Bitmap.Assign(Image);
end;

end.
