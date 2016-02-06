inherited GridViewForm: TGridViewForm
  Caption = 'Grid view'
  PixelsPerInch = 96
  TextHeight = 13
  inherited GDSStdPanel: TPanel
    ExplicitWidth = 576
  end
  inherited StdCtrlPanel: TPanel
    ExplicitLeft = 0
    ExplicitWidth = 576
  end
  object DBGrid1: TDBGrid [2]
    Left = 0
    Top = 161
    Width = 576
    Height = 245
    Align = alClient
    DataSource = OrdersSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
