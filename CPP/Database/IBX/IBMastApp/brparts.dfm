object BrPartsForm: TBrPartsForm
  Left = 405
  Top = 300
  HelpContext = 4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Browse Parts'
  ClientHeight = 318
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 57
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    ExplicitWidth = 488
    object ActivateBtn: TSpeedButton
      Left = 463
      Top = 4
      Width = 92
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Backorders'
      OnClick = ActivateQuery
    end
    object Bevel1: TBevel
      Left = 3
      Top = 52
      Width = 565
      Height = 2
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitLeft = 2
      ExplicitTop = 33
      ExplicitWidth = 380
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 4
      Width = 135
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = MastData.PartsSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Kind = dbnHorizontal
      TabOrder = 0
    end
    object EditBtn: TButton
      Left = 359
      Top = 4
      Width = 90
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Edit'
      ModalResult = 1
      TabOrder = 1
      OnClick = EditBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 279
    Width = 571
    Height = 39
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 196
    ExplicitWidth = 384
    object CloseBtn: TButton
      Left = 481
      Top = 3
      Width = 74
      Height = 34
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Cancel = True
      Caption = '&Close'
      Default = True
      ModalResult = 2
      TabOrder = 0
      OnClick = CloseBtnClick
    end
  end
  object PartsGrid: TDBGrid
    Left = 0
    Top = 57
    Width = 571
    Height = 222
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    DataSource = MastData.PartsSource
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = EditBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PARTNO'
        Title.Caption = 'Part No'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Description'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ONHAND'
        Title.Caption = 'On Hand'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ONORDER'
        Title.Caption = 'On Order'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BACKORD'
        Title.Caption = 'Backordered'
        Visible = True
      end>
  end
end
