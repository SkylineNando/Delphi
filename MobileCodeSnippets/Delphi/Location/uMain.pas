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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Sensors, System.Sensors, FMX.StdCtrls,
  FMX.Edit, FMX.WebBrowser, FMX.ListBox, FMX.Layouts, FMX.MobilePreview;

type
  TLocationForm = class(TForm)
    LocationSensor1: TLocationSensor;
    WebBrowser1: TWebBrowser;
    ListBox1: TListBox;
    lbLocationSensor: TListBoxItem;
    swLocationSensorActive: TSwitch;
    lbTriggerDistance: TListBoxItem;
    nbTriggerDistance: TNumberBox;
    Button1: TButton;
    Button2: TButton;
    lbAccuracy: TListBoxItem;
    Button3: TButton;
    Button4: TButton;
    nbAccuracy: TNumberBox;
    lbLatitude: TListBoxItem;
    lbLongitude: TListBoxItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure sbAccuracyChange(Sender: TObject);
    procedure sbTriggerDistanceChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure swLocationSensorActiveSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LocationForm: TLocationForm;

implementation

{$R *.fmx}

procedure TLocationForm.Button1Click(Sender: TObject);
begin
  nbTriggerDistance.Value := nbTriggerDistance.Value - 1;
end;

procedure TLocationForm.Button2Click(Sender: TObject);
begin
  nbTriggerDistance.Value := nbTriggerDistance.Value + 1;
end;

procedure TLocationForm.Button3Click(Sender: TObject);
begin
  nbAccuracy.Value := nbAccuracy.Value - 1;
end;

procedure TLocationForm.Button4Click(Sender: TObject);
begin
  nbAccuracy.Value := nbAccuracy.Value + 1;
end;

procedure TLocationForm.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
const
  LGoogleMapsURL: String = 'https://maps.google.com/maps?q=%s,%s&output=embed';

begin
  { convert the location to latitude and longitude }
  lbLatitude.Text := 'Latitude: ' + NewLocation.Latitude.ToString;
  lbLongitude.Text := 'Longitude: ' + NewLocation.Longitude.ToString;

  { and track the location via Google Maps }
  WebBrowser1.Navigate(Format(LGoogleMapsURL, [NewLocation.Latitude.ToString, NewLocation.Longitude.ToString]));
end;

procedure TLocationForm.sbAccuracyChange(Sender: TObject);
begin
  { set the precision }
  LocationSensor1.Accuracy := nbAccuracy.Value;
end;

procedure TLocationForm.sbTriggerDistanceChange(Sender: TObject);
begin
  { set the triggering distance }
  LocationSensor1.Distance := nbTriggerDistance.Value;
end;

procedure TLocationForm.swLocationSensorActiveSwitch(Sender: TObject);
begin
  { activate or deactivate the location sensor }
  LocationSensor1.Active := swLocationSensorActive.IsChecked;
end;

end.
