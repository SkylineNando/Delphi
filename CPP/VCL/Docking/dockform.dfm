object DockableForm: TDockableForm
  Left = 285
  Top = 409
  BorderStyle = bsSizeToolWin
  Caption = 'DockableForm'
  ClientHeight = 163
  ClientWidth = 269
  Color = clBtnFace
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDockOver = FormDockOver
  OnShow = FormShow
  OnStartDock = FormStartDock
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 269
    Height = 163
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitHeight = 155
  end
end
