inherited FormUser: TFormUser
  Caption = 'FormUser'
  ClientHeight = 377
  ClientWidth = 558
  OldCreateOrder = False
  ExplicitWidth = 558
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 3
    Top = 13
    Width = 46
    Height = 13
    Caption = 'Login ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 40
    Width = 54
    Height = 13
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 3
    Top = 65
    Width = 90
    Height = 13
    Caption = 'First/Last Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 0
    Top = 344
    Width = 543
    Height = 18
    Alignment = taCenter
    Caption = 
      'Only ADMIN Role can Enable/Disable Users, USER Role is not autho' +
      'rized'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object edUserName: TEdit
    Left = 64
    Top = 13
    Width = 121
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object edPassword: TEdit
    Left = 64
    Top = 38
    Width = 121
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    PasswordChar = 'X'
    TabOrder = 2
  end
  object edFirstLastName: TEdit
    Left = 3
    Top = 84
    Width = 318
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
  end
  object btAddNewUser: TButton
    Left = 343
    Top = 77
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 4
    OnClick = btAddNewUserClick
  end
  object lvUsers: TListView
    Left = 0
    Top = 120
    Width = 483
    Height = 193
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Checkboxes = True
    Columns = <
      item
        Caption = 'Login'
        ImageIndex = 10
        Width = 130
      end
      item
        Caption = 'Name'
        ImageIndex = 4
        Width = 260
      end>
    Ctl3D = False
    Groups = <
      item
        Header = 'Users'
        GroupID = 0
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        Subtitle = 'Users autorized to access the DataSnap Server methods'
        TitleImage = 0
      end>
    Items.ItemData = {
      05760000000300000000000000FFFFFFFFFFFFFFFF0000000000000000000000
      000841006E0064007200650061006E006F0000000000FFFFFFFFFFFFFFFF0000
      00000000000000000000086400610073006400610073006400610000000000FF
      FFFFFFFFFFFFFF000000000000000000000000044A006F0073006500}
    LargeImages = DMClientContainer.ImageList1
    GroupHeaderImages = DMClientContainer.ILLarte
    GroupView = True
    ReadOnly = True
    SmallImages = DMClientContainer.ImageList1
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
  end
  object DSProvMainDM: TDSProviderConnection
    ServerClassName = 'TDMMainServerModule'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 352
    Top = 280
  end
  object CDSUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsers'
    RemoteServer = DSProvMainDM
    Left = 272
    Top = 280
    object CDSUsersLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 60
    end
    object CDSUsersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 150
    end
    object CDSUsersACTIVE: TBooleanField
      FieldName = 'ACTIVE'
    end
  end
end
