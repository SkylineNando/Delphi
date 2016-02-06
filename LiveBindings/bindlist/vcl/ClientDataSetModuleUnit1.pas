
//---------------------------------------------------------------------------

// This software is Copyright (c) 2012 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit ClientDataSetModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TClientDataSetModule1 = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    CategoryField: TStringField;
    SpeciesNameField: TStringField;
    LengthCmField: TFloatField;
    LengthInField: TFloatField;
    CommonNameField: TStringField;
    NotesField: TMemoField;
    GraphicField: TBlobField;
    procedure ClientDataSetDataSource1UpdateData(Sender: TObject);
    procedure ClientDataSetDataSource1DataChange(Sender: TObject;
      Field: TField);
    procedure CategoryFieldValidate(Sender: TField);
    procedure CategoryFieldSetText(Sender: TField; const Text: string);
    procedure CategoryFieldChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientDataSetModule1: TClientDataSetModule1;

implementation

{$R *.dfm}

procedure TClientDataSetModule1.CategoryFieldChange(Sender: TField);
begin
//
end;

procedure TClientDataSetModule1.CategoryFieldSetText(Sender: TField;
  const Text: string);
begin
//
end;

procedure TClientDataSetModule1.CategoryFieldValidate(Sender: TField);
begin
//
end;

procedure TClientDataSetModule1.ClientDataSetDataSource1DataChange(
  Sender: TObject; Field: TField);
begin
//
end;

procedure TClientDataSetModule1.ClientDataSetDataSource1UpdateData(
  Sender: TObject);
begin
//
end;

end.
