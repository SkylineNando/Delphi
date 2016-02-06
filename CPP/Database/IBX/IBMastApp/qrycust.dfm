object QueryCustDlg: TQueryCustDlg
  Left = 442
  Top = 243
  ActiveControl = FromEdit
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'QueryCustDlg'
  ClientHeight = 110
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 6
    Top = 6
    Width = 262
    Height = 99
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Shape = bsFrame
  end
  object Msglab: TLabel
    Left = 12
    Top = 11
    Width = 229
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Customers with LastInvoiceDate ranging'
  end
  object Label1: TLabel
    Left = 12
    Top = 42
    Width = 30
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&From'
  end
  object Label2: TLabel
    Left = 16
    Top = 75
    Width = 15
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&To'
  end
  object PopupCalBtnFrom: TSpeedButton
    Left = 197
    Top = 39
    Width = 27
    Height = 24
    Hint = 'Browse Calendar'
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333330000003333333333333333330000003338888888888888330000003304
      0404404040483300000033FFFFFFFFFFFF483300000033FFFFFFFFFFFF483300
      000033FF000F0007FF483300000033FFF0FF7F70FF483300000033FFF0FFFFF0
      FF483300000033FFF0FF0007FF483300000033FF00FF0FFFFF483300000033FF
      F0FF0000FF483300000033FFFFFFFFFFFF483300000033FFFFFFFFFFFF483300
      000033F7777777777F4833000000330000000000003333000000333333333333
      333333000000333333333333333333000000}
    Layout = blGlyphRight
    ParentShowHint = False
    ShowHint = True
    OnClick = PopupCalBtnFromClick
  end
  object PopupCalToBtn: TSpeedButton
    Left = 197
    Top = 72
    Width = 27
    Height = 25
    Hint = 'Browse Calendar'
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333330000003333333333333333330000003338888888888888330000003304
      0404404040483300000033FFFFFFFFFFFF483300000033FFFFFFFFFFFF483300
      000033FF000F0007FF483300000033FFF0FF7F70FF483300000033FFF0FFFFF0
      FF483300000033FFF0FF0007FF483300000033FF00FF0FFFFF483300000033FF
      F0FF0000FF483300000033FFFFFFFFFFFF483300000033FFFFFFFFFFFF483300
      000033F7777777777F4833000000330000000000003333000000333333333333
      333333000000333333333333333333000000}
    Layout = blGlyphRight
    ParentShowHint = False
    ShowHint = True
    OnClick = PopupCalToBtnClick
  end
  object OkBtn: TButton
    Left = 280
    Top = 8
    Width = 65
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 280
    Top = 40
    Width = 65
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object FromEdit: TEdit
    Left = 56
    Top = 40
    Width = 137
    Height = 24
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 0
  end
  object ToEdit: TEdit
    Left = 56
    Top = 72
    Width = 137
    Height = 24
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 1
  end
end
