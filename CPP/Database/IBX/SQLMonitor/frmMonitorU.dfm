object frmMonitor: TfrmMonitor
  Left = 0
  Top = 0
  Caption = 'Extra Monitor'
  ClientHeight = 280
  ClientWidth = 635
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
  object Splitter1: TSplitter
    Left = 250
    Top = 0
    Height = 261
    Beveled = True
    ExplicitHeight = 250
  end
  object Memo1: TMemo
    Left = 253
    Top = 0
    Width = 382
    Height = 261
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 250
    Height = 261
    Align = alLeft
    Columns = <
      item
        Caption = 'Time'
        Width = 75
      end
      item
        AutoSize = True
        Caption = 'Type'
      end>
    MultiSelect = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 261
    Width = 635
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 284
    Top = 20
    object SQLMonitor1: TMenuItem
      Caption = 'SQL Monitor'
      object Clear2: TMenuItem
        Caption = 'Clear'
        OnClick = Clear1Click
      end
      object Flags1: TMenuItem
        Caption = 'Flags'
        OnClick = Flags1Click
      end
      object Monitoring1: TMenuItem
        Caption = 'Monitoring'
        Checked = True
      end
    end
  end
end
