inherited FormServerBatch: TFormServerBatch
  Caption = 'FormServerBatch'
  ClientHeight = 363
  ClientWidth = 659
  OldCreateOrder = False
  OnCreate = FormCreate
  ExplicitWidth = 659
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  object LBStatus: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 45
    Caption = 'IDLE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SBOpenDialog: TSpeedButton
    Left = 612
    Top = 73
    Width = 23
    Height = 22
    OnClick = SBOpenDialogClick
  end
  object Image1: TImage
    Left = 8
    Top = 132
    Width = 305
    Height = 209
    Anchors = [akLeft, akTop, akBottom]
    Proportional = True
    ExplicitHeight = 317
  end
  object Image2: TImage
    Left = 330
    Top = 132
    Width = 305
    Height = 209
    Anchors = [akLeft, akTop, akBottom]
    Proportional = True
    ExplicitHeight = 317
  end
  object LBMsg: TLabel
    Left = 630
    Top = 48
    Width = 5
    Height = 19
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object InvokeButton: TButton
    Left = 8
    Top = 101
    Width = 75
    Height = 25
    Caption = '&Flip Image'
    TabOrder = 0
    OnClick = InvokeButtonClick
  end
  object ProgressBar1: TProgressBar
    Left = 89
    Top = 101
    Width = 472
    Height = 25
    Smooth = True
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 74
    Width = 598
    Height = 24
    ReadOnly = True
    TabOrder = 2
    TextHint = 'File to send to server'
  end
  object UseProxy: TCheckBox
    Left = 528
    Top = 16
    Width = 86
    Height = 17
    Caption = 'Use proxy?'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object BTAbort: TButton
    Left = 567
    Top = 101
    Width = 68
    Height = 25
    Caption = '&Abort'
    TabOrder = 4
    OnClick = BTAbortClick
  end
  object UseOutParam: TCheckBox
    Left = 528
    Top = 33
    Width = 107
    Height = 17
    Caption = 'Use out param'
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JPEG|*.jpg;*.jpg'
    Left = 296
    Top = 16
  end
end
