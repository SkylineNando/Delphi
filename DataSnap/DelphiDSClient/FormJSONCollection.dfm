inherited FormCollectionJSON: TFormCollectionJSON
  Caption = 'FormJSONCustomer'
  ClientHeight = 461
  ClientWidth = 821
  OldCreateOrder = False
  ExplicitWidth = 821
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 324
    Top = 8
    Width = 109
    Height = 16
    Caption = 'JSON Represantion'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 20
    Height = 16
    Caption = 'Log'
  end
  object MMLog: TMemo
    Left = 8
    Top = 30
    Width = 310
    Height = 423
    Anchors = [akLeft, akTop, akBottom]
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object MMJson: TMemo
    Left = 324
    Top = 30
    Width = 471
    Height = 423
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitWidth = 391
  end
  object Button11: TButton
    Left = 642
    Top = -1
    Width = 153
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Get List of TCustomer'
    TabOrder = 0
    OnClick = Button11Click
  end
end
