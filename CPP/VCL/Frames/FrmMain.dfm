object Form1: TForm1
  Left = 209
  Top = 158
  Caption = 'Form1'
  ClientHeight = 560
  ClientWidth = 775
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 294
    Width = 775
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inline MDFrame: TMasterDetailFrame
    Left = 0
    Top = 297
    Width = 775
    Height = 263
    Align = alBottom
    TabOrder = 0
    TabStop = True
    ExplicitTop = 297
    ExplicitWidth = 775
    ExplicitHeight = 263
    inherited Splitter2: TSplitter
      Height = 263
      ExplicitHeight = 263
    end
    inherited MasterFrame: TDataFrame
      Height = 263
      ExplicitHeight = 263
      inherited Splitter1: TSplitter
        Top = 159
        ExplicitTop = 159
      end
      inherited DBGrid1: TDBGrid
        Height = 134
      end
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
      inherited FancyFrame1: TFancyFrame
        Top = 162
        ExplicitTop = 162
      end
    end
    inherited DetailFrame: TDataFrame
      Width = 434
      Height = 263
      ExplicitWidth = 434
      ExplicitHeight = 263
      inherited Splitter1: TSplitter
        Top = 159
        Width = 434
        ExplicitTop = 159
        ExplicitWidth = 434
      end
      inherited DBGrid1: TDBGrid
        Width = 434
        Height = 134
      end
      inherited DBNavigator1: TDBNavigator
        Width = 434
        Hints.Strings = ()
        ExplicitWidth = 434
      end
      inherited FancyFrame1: TFancyFrame
        Top = 162
        Width = 434
        ExplicitTop = 162
        ExplicitWidth = 434
        inherited DBImage1: TDBImage
          Width = 270
          ExplicitWidth = 270
        end
      end
      inherited ClientDataSet1: TClientDataSet
        MasterSource = MDFrame.MasterFrame.DataSource1
      end
    end
  end
  inline SimpleFrame: TDataFrame
    Left = 0
    Top = 0
    Width = 775
    Height = 294
    Align = alClient
    TabOrder = 1
    TabStop = True
    ExplicitWidth = 775
    ExplicitHeight = 294
    inherited Splitter1: TSplitter
      Top = 190
      Width = 775
      ExplicitTop = 190
      ExplicitWidth = 775
    end
    inherited DBGrid1: TDBGrid
      Width = 775
      Height = 165
    end
    inherited DBNavigator1: TDBNavigator
      Width = 775
      Hints.Strings = ()
      ExplicitWidth = 775
    end
    inherited FancyFrame1: TFancyFrame
      Top = 193
      Width = 775
      ExplicitTop = 193
      ExplicitWidth = 775
      inherited Splitter1: TSplitter
        Left = 489
        ExplicitLeft = 489
      end
      inherited DBMemo1: TDBMemo
        Width = 489
        ExplicitWidth = 489
      end
      inherited DBImage1: TDBImage
        Left = 492
        Width = 283
        ExplicitLeft = 492
        ExplicitWidth = 283
      end
    end
  end
end
