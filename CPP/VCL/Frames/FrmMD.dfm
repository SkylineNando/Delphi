object MasterDetailFrame: TMasterDetailFrame
  Left = 0
  Top = 0
  Width = 553
  Height = 367
  TabOrder = 0
  object Splitter2: TSplitter
    Left = 338
    Top = 0
    Height = 367
  end
  inline MasterFrame: TDataFrame
    Left = 0
    Top = 0
    Width = 338
    Height = 367
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 367
    inherited Splitter1: TSplitter
      Top = 263
      ExplicitTop = 263
    end
    inherited DBGrid1: TDBGrid
      Height = 238
    end
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
    inherited FancyFrame1: TFancyFrame
      Top = 266
      ExplicitTop = 266
    end
  end
  inline DetailFrame: TDataFrame
    Left = 341
    Top = 0
    Width = 212
    Height = 367
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 341
    ExplicitWidth = 212
    ExplicitHeight = 367
    inherited Splitter1: TSplitter
      Top = 263
      Width = 212
      ExplicitTop = 263
      ExplicitWidth = 212
    end
    inherited DBGrid1: TDBGrid
      Width = 212
      Height = 238
    end
    inherited DBNavigator1: TDBNavigator
      Width = 212
      Hints.Strings = ()
      ExplicitWidth = 212
    end
    inherited FancyFrame1: TFancyFrame
      Top = 266
      Width = 212
      ExplicitTop = 266
      ExplicitWidth = 212
      inherited DBImage1: TDBImage
        Width = 48
        ExplicitWidth = 48
      end
    end
    inherited ClientDataSet1: TClientDataSet
      IndexFieldNames = 'CustNo'
      MasterFields = 'CustNo'
      MasterSource = MasterFrame.DataSource1
      PacketRecords = 0
    end
  end
end
