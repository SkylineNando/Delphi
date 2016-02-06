inherited FormDM5b: TFormDM5b
  Caption = 'FormDM5b'
  ClientHeight = 602
  ClientWidth = 774
  OldCreateOrder = False
  ExplicitWidth = 774
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 16
  object LCityTime: TLabel
    Left = 141
    Top = 459
    Width = 76
    Height = 16
    Alignment = taRightJustify
    Caption = 'Server Time:'
  end
  object LCDSCityTime: TLabel
    Left = 141
    Top = 491
    Width = 62
    Height = 16
    Alignment = taRightJustify
    Caption = 'CDS Time:'
  end
  object Label1: TLabel
    Left = 612
    Top = 8
    Width = 154
    Height = 33
    Caption = 'DBXReader'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BRegion: TButton
    Left = 8
    Top = 16
    Width = 59
    Height = 28
    Caption = 'Regions'
    TabOrder = 0
    OnClick = BRegionClick
  end
  object BCountry: TButton
    Left = 48
    Top = 126
    Width = 71
    Height = 27
    Caption = 'Countries'
    TabOrder = 1
    OnClick = BCountryClick
  end
  object BCity: TButton
    Left = 146
    Top = 409
    Width = 71
    Height = 28
    Caption = 'Cities'
    TabOrder = 2
    OnClick = BCityClick
  end
  object BState: TButton
    Left = 102
    Top = 262
    Width = 71
    Height = 28
    Caption = 'States'
    TabOrder = 3
    OnClick = BStateClick
  end
  object DBGrid2: TDBGrid
    Left = 85
    Top = 8
    Width = 431
    Height = 103
    DataSource = DSRegion
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 141
    Top = 117
    Width = 431
    Height = 120
    DataSource = DSCountry
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 187
    Top = 252
    Width = 431
    Height = 120
    DataSource = DSState
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid5: TDBGrid
    Left = 259
    Top = 378
    Width = 470
    Height = 186
    DataSource = DSCity
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 651
    Top = 194
    Width = 102
    Height = 29
    Caption = 'Link DataSets'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 651
    Top = 229
    Width = 102
    Height = 29
    Caption = 'Unlink DataSets'
    TabOrder = 9
    OnClick = Button2Click
  end
  object DSProvDM5b: TDSProviderConnection
    ServerClassName = 'TDMDataSet5'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 200
    Top = 64
  end
  object DSRegion: TDataSource
    Left = 440
    Top = 40
  end
  object DSCountry: TDataSource
    Left = 440
    Top = 152
  end
  object DSState: TDataSource
    Left = 448
    Top = 288
  end
  object DSCity: TDataSource
    Left = 464
    Top = 408
  end
  object CDSRegion: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 40
  end
  object CDSCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 152
  end
  object CDSState: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 288
  end
  object CDSCity: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 408
  end
end
