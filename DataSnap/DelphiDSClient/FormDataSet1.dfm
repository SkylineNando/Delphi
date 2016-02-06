inherited FormDM1: TFormDM1
  Caption = 'FormDM1'
  ClientHeight = 341
  ClientWidth = 506
  OldCreateOrder = False
  ExplicitWidth = 506
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 249
    Top = 16
    Width = 44
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Country'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 249
    Top = 64
    Width = 51
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Currency'
    FocusControl = DBEdit2
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 2
    Width = 226
    Height = 330
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataSource = DSCountry
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 249
    Top = 32
    Width = 153
    Height = 24
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataField = 'COUNTRY'
    DataSource = DSCountry
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 249
    Top = 80
    Width = 103
    Height = 24
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataField = 'CURRENCY'
    DataSource = DSCountry
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 247
    Top = 163
    Width = 252
    Height = 38
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataSource = DSCountry
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    Kind = dbnHorizontal
    TabOrder = 3
  end
  object DSProvDM1: TDSProviderConnection
    ServerClassName = 'TDMDataSet1'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 352
    Top = 280
  end
  object CDSCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCountry'
    RemoteServer = DSProvDM1
    OnReconcileError = CDSCountryReconcileError
    Left = 272
    Top = 280
    object CDSCountryCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Required = True
      Size = 15
    end
    object CDSCountryCURRENCY: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY'
      Required = True
      Size = 10
    end
  end
  object DSCountry: TDataSource
    DataSet = CDSCountry
    Left = 424
    Top = 280
  end
end
