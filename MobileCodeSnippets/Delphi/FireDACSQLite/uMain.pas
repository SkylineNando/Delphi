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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.FMTBcd,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.SQLite, FMX.MobilePreview,
  FMX.ListView.Types, FMX.ListView;

type
  TFireDAC_SQLiteForm = class(TForm)
    ToolBar1: TToolBar;
    btnAdd: TButton;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    FDTableTask: TFDTable;
    FireTaskList: TFDConnection;
    FDQueryDelete: TFDQuery;
    FDQueryInsert: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Title: TLabel;
    btnDelete: TButton;
    ListView1: TListView;
    procedure btnAddClick(Sender: TObject);
    procedure TaskListBeforeConnect(Sender: TObject);
    procedure TaskListAfterConnect(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure OnIdle(Sender: TObject; var FDone: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FireDAC_SQLiteForm: TFireDAC_SQLiteForm;

implementation

uses
  IOUtils;

{$R *.fmx}

procedure TFireDAC_SQLiteForm.btnAddClick(Sender: TObject);
var
  TaskName: String;
begin
  try
    if InputQuery('Enter New Task', 'Task', TaskName) and not (TaskName.Trim = '') then
    begin
      FDQueryInsert.ParamByName('TaskName').AsString := TaskName;
      FDQueryInsert.ExecSQL();
      FDTableTask.Refresh;
      LinkFillControlToField1.BindList.FillList;
    end;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TFireDAC_SQLiteForm.btnDeleteClick(Sender: TObject);
var
  TaskName: String;
  LIndex: Integer;
begin
  TaskName := ListView1.Selected.Text;
  try
    FDQueryDelete.ParamByName('TaskName').AsString := TaskName;
    FDQueryDelete.ExecSQL();
    FDTableTask.Refresh;
    LinkFillControlToField1.BindList.FillList;
    if (ListView1.Selected = nil) and (ListView1.ItemCount > 0) then
      // Select last item
      ListView1.ItemIndex := ListView1.ItemCount - 1;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TFireDAC_SQLiteForm.FormCreate(Sender: TObject);
begin
  try
    // For unidirectional dataset, don't refill automatically when dataset is activated
    // because dataset is reactivated everytime use DataSet.First.
    LinkFillControlToField1.AutoActivate := False;
    LinkFillControlToField1.AutoFill := False;
    Application.OnIdle := OnIdle;
    FireTaskList.Connected := True;
    FDTableTask.Active := True;
    LinkFillControlToField1.BindList.FillList;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TFireDAC_SQLiteForm.OnIdle(Sender: TObject; var FDone: Boolean);
begin
  btnDelete.Visible := ListView1.Selected <> nil;
end;

procedure TFireDAC_SQLiteForm.TaskListAfterConnect(Sender: TObject);
begin
  FireTaskList.ExecSQL ('CREATE TABLE IF NOT EXISTS Task (TaskName TEXT NOT NULL)');
end;

procedure TFireDAC_SQLiteForm.TaskListBeforeConnect(Sender: TObject);
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
  FireTaskList.Params.Values['Database'] :=
    TPath.GetDocumentsPath + PathDelim + 'tasks.s3db';
  // was: GetHomePath + PathDelim +
  //  'Documents' + PathDelim + 'tasks.s3db';
  {$ENDIF}
end;

  // better use:

end.
