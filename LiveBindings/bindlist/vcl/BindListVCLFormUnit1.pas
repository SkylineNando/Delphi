
//---------------------------------------------------------------------------

// This software is Copyright (c) 2012 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit BindListVCLFormUnit1;

interface

// Example demonstrating TBindList components.
// Double click BindCompList1 to view TBindList components, then
// double a TBindList component to view and edit expressions.
// AutoFill property causes lists to populate when app is loaded.
// The BindCompVCLEditors unit must be used by this project in order to
// register listbox and listview editors.
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, System.Rtti, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.AppEvnts, Vcl.Mask, Data.DB, System.Generics.Collections, Vcl.DBCGrids, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Editors, System.Bindings.Outputs;

type
  TForm1 = class(TForm)
    BindSourceDB1: TBindSourceDB;
    BindCompList1: TBindingsList;
    ListBoxCategories: TListBox;
    ButtonFillList: TButton;
    ButtonClearList: TButton;
    ListView1: TListView;
    ButtonClearListView: TButton;
    ButtonFillListView: TButton;
    BindListView: TBindList;
    ButtonFillListViewColumns: TButton;
    BindListViewColumns: TBindList;
    BindListBox: TBindList;
    procedure ButtonFillListClick(Sender: TObject);
    procedure ButtonClearListClick(Sender: TObject);
    procedure ButtonFillListViewClick(Sender: TObject);
    procedure ButtonClearListViewClick(Sender: TObject);
    procedure ButtonFillListViewColumnsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ClientDataSetModuleUnit1;

{$R *.dfm}

procedure TForm1.ButtonClearListClick(Sender: TObject);
begin
  BindListBox.ClearList;
end;

procedure TForm1.ButtonClearListViewClick(Sender: TObject);
begin
  BindListView.ClearList;
end;

procedure TForm1.ButtonFillListClick(Sender: TObject);
begin
  BindListBox.FillList;
end;

procedure TForm1.ButtonFillListViewClick(Sender: TObject);
begin
  BindListView.FillList;
end;

procedure TForm1.ButtonFillListViewColumnsClick(Sender: TObject);
begin
  BindListViewColumns.FillList;
end;



end.
