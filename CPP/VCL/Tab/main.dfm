object FormMain: TFormMain
  Left = 220
  Top = 120
  BorderStyle = bsSingle
  Caption = 'Tab Control'
  ClientHeight = 201
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 379
    Height = 182
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      'One'
      'Two'
      'Three'
      'Four'
      'Five')
    TabIndex = 0
    OnChange = TabControl1Change
    object Label1: TLabel
      Left = 30
      Top = 59
      Width = 296
      Height = 80
      AutoSize = False
      Caption = 'This is an example of using a tab control.'
      WordWrap = True
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 182
    Width = 379
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Tab index: 0'
  end
end
