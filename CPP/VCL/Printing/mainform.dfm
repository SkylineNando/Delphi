object FormMain: TFormMain
  Left = 198
  Top = 117
  Width = 457
  Height = 346
  Caption = 'Printing'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabSet1: TTabSet
    Left = 0
    Top = 298
    Width = 449
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    Tabs.Strings = (
      'Page 1'
      'Page 2'
      'Page 3'
      'Page 4'
      'Page 5')
    TabIndex = 0
    OnClick = TabSet1Click
    OnChange = TabSet1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 33
    Align = alTop
    TabOrder = 1
    object PrintBtn: TSpeedButton
      Left = 0
      Top = 0
      Width = 57
      Height = 33
      Caption = 'Print'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = PrintBtnClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 33
    Width = 449
    Height = 265
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object PrintDialog1: TPrintDialog
    FromPage = 1
    MinPage = 1
    MaxPage = 5
    Options = [poPageNums, poWarning]
    ToPage = 5
    Left = 248
  end
end
