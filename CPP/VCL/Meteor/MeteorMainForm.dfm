object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'MainForm'
  ClientHeight = 489
  ClientWidth = 473
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 473
    Height = 489
    Align = alClient
    OnPaint = PaintBox1Paint
    ExplicitLeft = 16
    ExplicitTop = 376
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 72
    Top = 32
  end
end
