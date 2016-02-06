inherited FormBackup: TFormBackup
  Caption = 'FormBackup'
  ClientHeight = 363
  ClientWidth = 659
  OldCreateOrder = False
  OnCreate = FormCreate
  ExplicitWidth = 659
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  object BTAbort: TButton
    Left = 544
    Top = 8
    Width = 106
    Height = 44
    Caption = 'Start Backup'
    TabOrder = 0
    OnClick = BTAbortClick
  end
  object MMBackupLog: TMemo
    Left = 0
    Top = 0
    Width = 538
    Height = 355
    TabOrder = 1
  end
end
