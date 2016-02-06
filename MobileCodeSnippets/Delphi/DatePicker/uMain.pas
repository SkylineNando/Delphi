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
  System.SysUtils, DateUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.ExtCtrls, FMX.ListBox, FMX.Layouts, FMX.DateTimeCtrls, FMX.MobilePreview;

type
  TDatePickerForm = class(TForm)
    CalendarEdit1: TCalendarEdit;
    ListBox1: TListBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure CalendarEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatePickerForm: TDatePickerForm;

implementation

{$R *.fmx}

procedure TDatePickerForm.CalendarEdit1Change(Sender: TObject);
begin
  { update the label with the date picked from the CalendarEdit component }
  ListBoxItem6.Text := Format('Picked %s', [FormatDateTime('dddd, mmmm d,yyyy', CalendarEdit1.Date)]);
end;

end.