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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.Layouts,
  FMX.StdCtrls, FMX.MobilePreview;

type
  THorizontalScrollForm = class(TForm)
    HorzScrollBox1: THorzScrollBox;
    Image2: TImage;
    Image1: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Image3: TImage;
    Image4: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HorizontalScrollForm: THorizontalScrollForm;

implementation

{$R *.fmx}

end.
