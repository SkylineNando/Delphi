object FormMain: TFormMain
  Left = 200
  Top = 114
  BorderStyle = bsSingle
  Caption = 'Scroll Bar'
  ClientHeight = 174
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 14
    Top = 14
    Width = 87
    Height = 13
    Caption = 'Scroll Bar Example'
  end
  object ScrollBar1: TScrollBar
    Left = 0
    Top = 43
    Width = 416
    Height = 13
    Align = alBottom
    PageSize = 0
    TabOrder = 0
    OnScroll = ScrollBar1Scroll
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 56
    Width = 416
    Height = 118
    Align = alBottom
    Caption = 'Scroll Bar Properties'
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 19
      Width = 37
      Height = 13
      Caption = '&Position'
      FocusControl = PosEdit
    end
    object Label3: TLabel
      Left = 96
      Top = 19
      Width = 16
      Height = 13
      Caption = '&Min'
      FocusControl = MinEdit
    end
    object Label4: TLabel
      Left = 180
      Top = 19
      Width = 20
      Height = 13
      Caption = 'Ma&x'
      FocusControl = MaxEdit
    end
    object Label5: TLabel
      Left = 12
      Top = 67
      Width = 67
      Height = 13
      Caption = '&Large Change'
      FocusControl = LargeEdit
    end
    object Label6: TLabel
      Left = 96
      Top = 67
      Width = 64
      Height = 13
      Caption = '&Small Change'
      FocusControl = SmallEdit
    end
    object PosEdit: TEdit
      Left = 12
      Top = 36
      Width = 53
      Height = 21
      TabOrder = 0
      Text = '0'
      OnKeyPress = EnableButton
    end
    object Button1: TButton
      Left = 288
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Apply'
      Enabled = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object MinEdit: TEdit
      Left = 96
      Top = 36
      Width = 53
      Height = 21
      TabOrder = 1
      Text = '0'
      OnKeyPress = EnableButton
    end
    object MaxEdit: TEdit
      Left = 180
      Top = 36
      Width = 53
      Height = 21
      TabOrder = 2
      Text = '0'
      OnKeyPress = EnableButton
    end
    object LargeEdit: TEdit
      Left = 12
      Top = 83
      Width = 53
      Height = 21
      TabOrder = 3
      Text = '0'
      OnKeyPress = EnableButton
    end
    object SmallEdit: TEdit
      Left = 96
      Top = 83
      Width = 53
      Height = 21
      TabOrder = 4
      Text = '0'
      OnKeyPress = EnableButton
    end
  end
end
