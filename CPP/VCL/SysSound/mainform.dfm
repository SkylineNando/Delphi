object FormMain: TFormMain
  Left = 200
  Top = 114
  BorderStyle = bsSingle
  Caption = 'System Sounds'
  ClientHeight = 279
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 27
    Top = 15
    Width = 239
    Height = 48
    Alignment = taCenter
    Caption = 
      'Select any of the standard system sounds below and press the Pla' +
      'y button to hear it.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 263
    Width = 329
    Height = 16
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
  end
  object ListBox1: TListBox
    Left = 50
    Top = 63
    Width = 228
    Height = 119
    ItemHeight = 16
    TabOrder = 0
    OnDblClick = Button1Click
  end
  object Button1: TButton
    Left = 118
    Top = 198
    Width = 92
    Height = 31
    Caption = '&Play'
    TabOrder = 1
    OnClick = Button1Click
  end
end
