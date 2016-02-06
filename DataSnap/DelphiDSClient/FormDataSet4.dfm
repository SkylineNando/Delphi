inherited FormDM4: TFormDM4
  Caption = 'FormDM4'
  ClientHeight = 412
  ClientWidth = 435
  OldCreateOrder = False
  ExplicitWidth = 435
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 2
    Top = 2
    Width = 415
    Height = 330
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight]
    DataSource = DSCopy
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 7
    Top = 347
    Width = 240
    Height = 38
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    DataSource = DSCopy
    TabOrder = 1
  end
  object Button1: TButton
    Left = 264
    Top = 341
    Width = 153
    Height = 64
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Copy Department DBXReader to ClientDataSet'
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object CDSCopy: TClientDataSet
    Aggregates = <>
    Params = <>
    OnReconcileError = CDSCopyReconcileError
    Left = 272
    Top = 280
  end
  object DSCopy: TDataSource
    DataSet = CDSCopy
    Left = 344
    Top = 280
  end
end
