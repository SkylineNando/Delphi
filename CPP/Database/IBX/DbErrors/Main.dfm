object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Database Errors Demo'
  ClientHeight = 518
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 74
    Height = 16
    Caption = 'Customers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 217
    Width = 48
    Height = 16
    Caption = 'Orders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 330
    Width = 38
    Height = 16
    Caption = 'Items'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 5
    Top = 4
    Width = 240
    Height = 25
    TabOrder = 0
  end
  object GridCustomers: TDBGrid
    Left = 5
    Top = 54
    Width = 748
    Height = 154
    DataSource = DM.CustomerSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEnter = GridCustomersEnter
    OnExit = GridCustomersExit
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPANY'
        Visible = True
      end>
  end
  object GridOrders: TDBGrid
    Left = 8
    Top = 239
    Width = 341
    Height = 75
    DataSource = DM.OrdersSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEnter = GridOrdersEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'ORDERNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALEDATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPDATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPNO'
        Width = 47
        Visible = True
      end>
  end
  object GridItems: TDBGrid
    Left = 8
    Top = 352
    Width = 341
    Height = 120
    DataSource = DM.ItemsSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEnter = GridItemsEnter
  end
  object MainMenu1: TMainMenu
    Left = 296
    object About1: TMenuItem
      Caption = '&About'
      OnClick = About1Click
    end
  end
end
