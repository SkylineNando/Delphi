object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 230
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    253
    230)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 63
    Height = 16
    Caption = 'User Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 55
    Height = 16
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 97
    Height = 16
    Caption = 'DataSnap Server'
  end
  object Label4: TLabel
    Left = 16
    Top = 135
    Width = 82
    Height = 16
    Caption = 'DataSnap Port'
  end
  object Button1: TButton
    Left = 16
    Top = 182
    Width = 98
    Height = 33
    Hint = 
      'Autentication Process|Confirm you username, password and Server ' +
      'Address |0'
    CustomHint = DMClientContainer.MyBalloonHint
    BiDiMode = bdLeftToRight
    Caption = 'Ok'
    Default = True
    ElevationRequired = True
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 171
    Width = 256
    Height = 3
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object Button2: TButton
    Left = 128
    Top = 182
    Width = 98
    Height = 33
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object edUserName: TButtonedEdit
    Left = 96
    Top = 13
    Width = 130
    Height = 24
    Images = DMClientContainer.ImageList1
    LeftButton.Enabled = False
    RightButton.ImageIndex = 6
    RightButton.Visible = True
    TabOrder = 0
    Text = 'admin'
    OnRightButtonClick = edUserNameRightButtonClick
  end
  object edPassowrd: TButtonedEdit
    Left = 96
    Top = 53
    Width = 130
    Height = 24
    Images = DMClientContainer.ImageList1
    LeftButton.Enabled = False
    PasswordChar = 'x'
    RightButton.ImageIndex = 6
    RightButton.Visible = True
    TabOrder = 1
    Text = 'admin'
    OnRightButtonClick = edUserNameRightButtonClick
  end
  object edDSServer: TButtonedEdit
    Left = 119
    Top = 93
    Width = 107
    Height = 24
    Alignment = taCenter
    Images = DMClientContainer.ImageList1
    LeftButton.Enabled = False
    RightButton.ImageIndex = 6
    RightButton.Visible = True
    TabOrder = 2
    Text = 'localhost'
    OnRightButtonClick = edUserNameRightButtonClick
  end
  object edDSPort: TButtonedEdit
    Left = 119
    Top = 131
    Width = 107
    Height = 24
    Alignment = taCenter
    Images = DMClientContainer.ImageList1
    LeftButton.Enabled = False
    RightButton.ImageIndex = 6
    RightButton.Visible = True
    TabOrder = 3
    Text = '211'
    OnRightButtonClick = edUserNameRightButtonClick
  end
end
