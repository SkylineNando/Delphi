object FormMain: TFormMain
  Left = 196
  Top = 118
  ActiveControl = RichEdit1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Words Per Minute'
  ClientHeight = 344
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 280
    Width = 248
    Height = 24
    Caption = 'Start typing to begin test'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 56
    Width = 441
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyDown = StartTimer
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 312
    Width = 441
    Height = 13
    Max = 60
    Step = 1
    TabOrder = 3
  end
  object Button1: TButton
    Left = 304
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Reset'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 384
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Exit'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = IncrementBar
    Left = 272
    Top = 16
  end
end
