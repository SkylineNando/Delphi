object BrCustOrdForm: TBrCustOrdForm
  Left = 268
  Top = 239
  HelpContext = 1
  ActiveControl = CustGrid
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Orders By Customer'
  ClientHeight = 393
  ClientWidth = 532
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
    Width = 532
    Height = 57
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object DefineBtn: TSpeedButton
      Left = 167
      Top = 5
      Width = 110
      Height = 43
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      AllowAllUp = True
      Caption = '&Define Query'
      OnClick = SetQuery
    end
    object ActivateBtn: TSpeedButton
      Left = 281
      Top = 4
      Width = 114
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Activate Query'
      OnClick = ActivateQuery
    end
    object Bevel1: TBevel
      Left = 3
      Top = 52
      Width = 526
      Height = 2
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      ExplicitLeft = 2
      ExplicitTop = 31
      ExplicitWidth = 428
    end
    object Navigator: TDBNavigator
      Left = 8
      Top = 4
      Width = 145
      Height = 44
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Kind = dbnHorizontal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object BtnPanel: TPanel
    Left = 0
    Top = 348
    Width = 532
    Height = 45
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 349
    DesignSize = (
      532
      45)
    object EditBtn: TButton
      Left = 341
      Top = 4
      Width = 84
      Height = 32
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      Caption = '&Edit'
      TabOrder = 0
      OnClick = EditBtnClick
    end
    object CloseBtn: TButton
      Left = 431
      Top = 4
      Width = 84
      Height = 32
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Close'
      Default = True
      TabOrder = 1
      OnClick = CloseBtnClick
    end
  end
  object CustPanel: TPanel
    Left = 0
    Top = 57
    Width = 532
    Height = 128
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object CustGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 532
      Height = 128
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      DataSource = MastData.CustMasterSrc
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = EditBtnClick
      OnEnter = CustGridEnter
      Columns = <
        item
          Expanded = False
          FieldName = 'CUSTNO'
          Title.Caption = 'Cust. No'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE'
          Title.Caption = 'Phone'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LASTINVOICEDATE'
          Title.Caption = 'Last Invoice'
          Width = 145
          Visible = True
        end>
    end
  end
  object OrdersPanel: TPanel
    Left = 0
    Top = 185
    Width = 532
    Height = 163
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 175
    ExplicitHeight = 183
    object OrdersGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 532
      Height = 163
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      DataSource = MastData.OrdByCustSrc
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = EditBtnClick
      OnEnter = OrdersGridEnter
    end
  end
end
