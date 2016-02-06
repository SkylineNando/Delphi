unit DMImages;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TMyDMImages = class(TDataModule)
    ImageList1: TImageList;
    ILLarte: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyDMImages: TMyDMImages;

implementation

{$R *.dfm}

end.
