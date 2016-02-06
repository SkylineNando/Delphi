program LSQLMega;

uses
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uADOLocalSQL in 'uADOLocalSQL.pas',
  uCDSLocalSQL in 'uCDSLocalSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
