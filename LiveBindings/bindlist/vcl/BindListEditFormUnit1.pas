
//---------------------------------------------------------------------------

// This software is Copyright (c) 2012 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit BindListEditFormUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, System.Rtti, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.AppEvnts, Vcl.Mask, Data.DB, System.Generics.Collections, Vcl.DBCGrids, Vcl.ComCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Bindings.Outputs, Vcl.Bind.Editors;

type
  TForm2 = class(TForm)
    BindingsList1: TBindingsList;
    ListBox1: TListBox;
    ButtonInsertListBoxItem: TButton;
    ButtonClearList: TButton;
    ListView1: TListView;
    ButtonClearListView: TButton;
    ButtonInsertListViewItem: TButton;
    ButtonAppendListViewItem: TButton;
    BindListBox: TBindList;
    Edit1: TEdit;
    ButtonAppendListBoxItem: TButton;
    ButtonUpdateListBoxItem: TButton;
    BindListView: TBindList;
    BindExprItemsListBox: TBindExprItems;
    ButtonUpdateListViewItem: TButton;
    Edit2: TEdit;
    BindExprItemsListView: TBindExprItems;
    ApplicationEvents1: TApplicationEvents;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonInsertListBoxItemClick(Sender: TObject);
    procedure ButtonClearListClick(Sender: TObject);
    procedure ButtonInsertListViewItemClick(Sender: TObject);
    procedure ButtonClearListViewClick(Sender: TObject);
    procedure ButtonAppendListViewItemClick(Sender: TObject);
    procedure ButtonAppendListBoxItemClick(Sender: TObject);
    procedure ButtonUpdateListBoxItemClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ButtonUpdateListViewItemClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonInsertListBoxItem.Enabled :=
    BindListBox.CanInsert;
  ButtonUpdateListBoxItem.Enabled :=
    BindListBox.CanUpdate;
  ButtonInsertListViewItem.Enabled :=
    BindListView.CanInsert;
  ButtonUpdateListViewItem.Enabled :=
    BindListView.CanUpdate;
end;

procedure TForm2.ButtonAppendListBoxItemClick(Sender: TObject);
begin
  BindListBox.AddItem;
end;

procedure TForm2.ButtonClearListClick(Sender: TObject);
begin
  BindListBox.ClearList;
  BindingsList1.Notify(BindListBox.ControlComponent, '');
end;

procedure TForm2.ButtonClearListViewClick(Sender: TObject);
begin
  BindListView.ClearList;
  BindingsList1.Notify(BindListView.ControlComponent, '');
end;

procedure TForm2.ButtonInsertListBoxItemClick(Sender: TObject);
begin
  Assert(BindListBox.CanInsert);
  BindListBox.InsertItem;
end;

procedure TForm2.ButtonInsertListViewItemClick(Sender: TObject);
begin
  Assert(BindListView.CanInsert);
  BindListView.InsertItem;
end;

procedure TForm2.ButtonAppendListViewItemClick(Sender: TObject);
begin
  BindListView.AddItem;
end;

procedure TForm2.ButtonUpdateListBoxItemClick(Sender: TObject);
begin
  Assert(BindListBox.CanUpdate);
  BindListBox.UpdateItem;
end;

procedure TForm2.ButtonUpdateListViewItemClick(Sender: TObject);
begin
  Assert(BindListView.CanUpdate);
  BindListView.UpdateItem;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  BindingsList1.Notify(Sender, '');
end;

procedure TForm2.ListView1Click(Sender: TObject);
begin
  BindingsList1.Notify(Sender, '');
end;

end.
