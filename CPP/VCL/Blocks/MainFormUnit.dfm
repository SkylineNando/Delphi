object BlockForm: TBlockForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'C++ Blocks'
  ClientHeight = 442
  ClientWidth = 340
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = GamePopupMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 340
    Height = 442
    Align = alClient
    OnPaint = PaintBox1Paint
    ExplicitLeft = -84
    ExplicitTop = -107
    ExplicitWidth = 460
    ExplicitHeight = 535
  end
  object GamePopupMenu: TPopupMenu
    Left = 96
    Top = 16
    object StartnewgameF1: TMenuItem
      Caption = 'Start new game'
      ShortCut = 113
      OnClick = StartnewgameF1Click
    end
    object Pause1: TMenuItem
      Caption = 'Pause'
      ShortCut = 114
      OnClick = Pause1Click
    end
    object Help1: TMenuItem
      Caption = '-'
    end
    object Help2: TMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help2Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 32
    Top = 16
  end
end
