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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts, FMX.MobilePreview;

type
  TDeviceInfoForm = class(TForm)
    btnGetDeviceInfo: TButton;
    ListBox1: TListBox;
    lbOSName: TListBoxItem;
    lbOSVersion: TListBoxItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    lbDeviceType: TListBoxItem;
    procedure btnGetDeviceInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeviceInfoForm: TDeviceInfoForm;

implementation
{$IFDEF IOS}
uses
  iOSapi.UIKit;
{$ENDIF}
{$IFDEF ANDROID}
uses
  androidapi.JNI.JavaTypes,
  androidapi.JNI.Os;
{$ENDIF}

{$R *.fmx}
{$IFDEF IOS}
procedure TDeviceInfoForm.btnGetDeviceInfoClick(Sender: TObject);
var
  Device : UIDevice;
begin
  Device := TUIDevice.Wrap(TUIDevice.OCClass.currentDevice);

  lbOSName.Text := Format('OS Name: %s', [Device.systemName.UTF8String]);
  lbOSVersion.Text := Format('OS Version: %s', [Device.systemVersion.UTF8String]);
  lbDeviceType.Text := Format('Device Type: %s', [Device.model.UTF8String]);
end;
{$ENDIF}

{$IFDEF ANDROID}
type TAndroidVersion = (
  UNKNOWN,
  BASE,
  BASE_1_1,
  CUPCAKE,
  CUR_DEVELOPMENT,
  DONUT,
  ECLAIR,
  ECLAIR_0_1,
  ECLAIR_MR1,
  FROYO,
  GINGERBREAD,
  GINGERBREAD_MR1,
  HONEYCOMB,
  HONEYCOMB_MR1,
  HONEYCOMB_MR2,
  ICE_CREAM_SANDWICH,
  ICE_CREAM_SANDWICH_MR1,
  JELLY_BEAN,
  JELLY_BEAN_MR1,
  JELLY_BEAN_MR2,
  KIT_KAT,
  KITKAT
);
procedure TDeviceInfoForm.btnGetDeviceInfoClick(Sender: TObject);
var
  codename: string;
  version: TAndroidVersion;
begin
  codename := 'Unknown';
  version := TAndroidVersion(TJBuild_VERSION.JavaClass.SDK_INT);
  lbDeviceType.Text := Format('Device Type: %s', [JStringToString(TJBuild.JavaClass.MODEL)]);


  case version of
    UNKNOWN: codename := 'Unknown';
    BASE,
    BASE_1_1: codename := 'Base';
    CUPCAKE: codename := 'Cupcake';
    CUR_DEVELOPMENT: codename := 'Curent Development';
    DONUT: codename := 'Donut';
    ECLAIR,
    ECLAIR_0_1,
    ECLAIR_MR1: codename := 'Eclair';
    FROYO: codename := 'Froyo';
    GINGERBREAD,
    GINGERBREAD_MR1: codename := 'Gingerbread';
    HONEYCOMB,
    HONEYCOMB_MR1,
    HONEYCOMB_MR2: codename := 'Honeycomb';
    ICE_CREAM_SANDWICH,
    ICE_CREAM_SANDWICH_MR1: codename := 'Ice Cream Sandwich';
    JELLY_BEAN,
    JELLY_BEAN_MR1,
    JELLY_BEAN_MR2: codename := 'Jelly Bean';
    KIT_KAT: codename := 'KitKat';
    KITKAT: codename := 'KitKat';
  end;

  lbOSName.Text := Format('OS Name: %s', [codename]);
  lbOSVersion.Text := Format('OS Version: %s', [JStringToString(TJBuild_VERSION.JavaClass.RELEASE)]);
end;
{$ENDIF}


end.
