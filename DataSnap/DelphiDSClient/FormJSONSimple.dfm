inherited FormSimpleJSON: TFormSimpleJSON
  Caption = 'FormJSONCustomer'
  ClientHeight = 388
  ClientWidth = 580
  OldCreateOrder = False
  ExplicitWidth = 580
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 189
    Width = 109
    Height = 16
    Caption = 'JSON Represantion'
  end
  object Label2: TLabel
    Left = 16
    Top = 53
    Width = 20
    Height = 16
    Caption = 'Log'
  end
  object Button10: TButton
    Left = 8
    Top = 6
    Width = 169
    Height = 33
    Caption = 'Get TCustomer as JSON'
    TabOrder = 2
    OnClick = Button10Click
  end
  object Button14: TButton
    Left = 183
    Top = 6
    Width = 169
    Height = 33
    Caption = 'Get TCustomer as TObject'
    TabOrder = 1
    OnClick = Button14Click
  end
  object MMLog: TMemo
    Left = 16
    Top = 75
    Width = 538
    Height = 108
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object MMJson: TMemo
    Left = 16
    Top = 211
    Width = 538
    Height = 150
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Button12: TButton
    Left = 358
    Top = 6
    Width = 196
    Height = 33
    Caption = 'Get List of JSON Types'
    TabOrder = 0
    WordWrap = True
    OnClick = Button12Click
  end
end
