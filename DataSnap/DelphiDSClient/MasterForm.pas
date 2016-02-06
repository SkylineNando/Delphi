unit MasterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs;

type
  TFormMaster = class(TForm)
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoInit; virtual; abstract;
    procedure DoClose;  virtual; abstract;
  end;

implementation

{$R *.dfm}

{ TFrameMaster }

procedure TFormMaster.FormDestroy(Sender: TObject);
begin
  DoClose;
end;

end.
