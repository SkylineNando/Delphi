object CheckoutDialog: TCheckoutDialog
  Left = 0
  Top = 0
  HelpContext = 15201
  BorderStyle = bsDialog
  Caption = 'Checkout'
  ClientHeight = 261
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 521
    Height = 114
    Caption = 'Location'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 91
      Height = 13
      Caption = '&URL of Repository:'
      FocusControl = URL
    end
    object Label2: TLabel
      Left = 8
      Top = 63
      Width = 58
      Height = 13
      Caption = '&Destination:'
      FocusControl = Destination
    end
    object URL: TComboBox
      Left = 8
      Top = 36
      Width = 476
      Height = 21
      TabOrder = 0
      OnExit = URLExit
      OnKeyUp = URLKeyUp
    end
    object BrowseURL: TButton
      Left = 492
      Top = 36
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = BrowseURLClick
    end
    object Destination: TEdit
      Left = 8
      Top = 82
      Width = 476
      Height = 21
      TabOrder = 2
      OnKeyUp = DestinationKeyUp
    end
    object BrowseDestination: TButton
      Left = 492
      Top = 82
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 3
      OnClick = BrowseDestinationClick
    end
  end
  object Options: TGroupBox
    Left = 8
    Top = 128
    Width = 253
    Height = 96
    Caption = 'Options'
    TabOrder = 1
    object Recursive: TCheckBox
      Left = 8
      Top = 19
      Width = 97
      Height = 17
      Caption = '&Recursive'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object IncludeExternals: TCheckBox
      Left = 8
      Top = 42
      Width = 129
      Height = 17
      Caption = '&Include Externals'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 267
    Top = 128
    Width = 262
    Height = 96
    Caption = 'Revision'
    TabOrder = 2
    object RevisionLabel: TLabel
      Left = 8
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Re&vision:'
      Enabled = False
      FocusControl = SelectRevision
    end
    object CurrentRevision: TCheckBox
      Left = 8
      Top = 20
      Width = 137
      Height = 17
      Caption = '&Current Revision'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CurrentRevisionClick
    end
    object SelectRevision: TEdit
      Left = 8
      Top = 62
      Width = 139
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object Ok: TButton
    Left = 292
    Top = 230
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
  object Cancel: TButton
    Left = 373
    Top = 230
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object Help: TButton
    Left = 454
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 5
    OnClick = HelpClick
  end
end
