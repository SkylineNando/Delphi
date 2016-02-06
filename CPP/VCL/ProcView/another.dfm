object Form2: TForm2
  Left = 250
  Top = 261
  BorderStyle = bsDialog
  Caption = 'About ProcView...'
  ClientHeight = 179
  ClientWidth = 237
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Title: TLabel
    Left = 59
    Top = 24
    Width = 119
    Height = 19
    Caption = 'Process Viewer'
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Comments: TLabel
    Left = 48
    Top = 64
    Width = 141
    Height = 17
    Alignment = taCenter
    Caption = 'C++Builder Example'
    WordWrap = True
    IsControl = True
  end
  object Copyright: TLabel
    Left = 77
    Top = 80
    Width = 83
    Height = 13
    Alignment = taCenter
    Caption = 'Copyright © 2000'
    IsControl = True
  end
  object Borland: TLabel
    Left = 70
    Top = 96
    Width = 97
    Height = 13
    Alignment = taCenter
    Caption = 'Embarcadero Technologies Inc.'
    IsControl = True
  end
  object Button1: TButton
    Left = 70
    Top = 136
    Width = 97
    Height = 25
    Caption = 'O&K'
    ModalResult = 1
    TabOrder = 0
  end
end
