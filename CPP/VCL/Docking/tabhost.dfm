object TabDockHost: TTabDockHost
  Left = 280
  Top = 330
  Caption = 'TabDockHost'
  ClientHeight = 159
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 393
    Height = 159
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    DockSite = True
    TabOrder = 0
    OnDockOver = PageControl1DockOver
    OnGetSiteInfo = PageControl1GetSiteInfo
    OnUnDock = PageControl1UnDock
    ExplicitWidth = 326
    ExplicitHeight = 134
  end
end
