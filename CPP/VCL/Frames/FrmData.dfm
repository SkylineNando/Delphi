object DataFrame: TDataFrame
  Left = 0
  Top = 0
  Width = 338
  Height = 361
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 257
    Width = 338
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 338
    Height = 232
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 338
    Height = 25
    DataSource = DataSource1
    Align = alTop
    TabOrder = 1
  end
  inline FancyFrame1: TFancyFrame
    Left = 0
    Top = 260
    Width = 338
    Height = 101
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 260
    ExplicitWidth = 338
    inherited DBImage1: TDBImage
      Width = 174
      ExplicitWidth = 174
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 40
    Top = 200
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 200
  end
end
