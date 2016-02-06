object PickOrderNoDlg: TPickOrderNoDlg
  Left = 285
  Top = 114
  Caption = 'Order No.'
  ClientHeight = 241
  ClientWidth = 204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 7
    Top = 6
    Width = 109
    Height = 14
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&Select an Order No.'
    FocusControl = DBLookupListBox1
  end
  object CancelBtn: TButton
    Left = 102
    Top = 209
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 18
    Top = 209
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 5
    Top = 25
    Width = 192
    Height = 172
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    KeyField = 'OrderNo'
    ListField = 'OrderNo'
    ListSource = MastData.OrdersSource
    TabOrder = 2
  end
end
