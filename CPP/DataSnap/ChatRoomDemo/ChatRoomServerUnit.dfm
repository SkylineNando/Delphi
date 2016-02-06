object ChatRoomForm: TChatRoomForm
  Left = 0
  Top = 0
  Caption = 'Chat Room Server'
  ClientHeight = 270
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    410
    270)
  PixelsPerInch = 96
  TextHeight = 13
  object UsersLabel: TLabel
    Left = 8
    Top = 18
    Width = 45
    Height = 16
    Caption = 'USERS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AdminMessageLabel: TLabel
    Left = 8
    Top = 223
    Width = 151
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Send Message to All Users:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 230
  end
  object UserListBox: TListBox
    Left = 8
    Top = 40
    Width = 394
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object AdminMessageField: TEdit
    Left = 8
    Top = 242
    Width = 336
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
  end
  object AdminMessageButton: TButton
    Left = 347
    Top = 240
    Width = 58
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'SEND'
    TabOrder = 2
    OnClick = AdminMessageButtonClick
  end
  object OpenBrowserButton: TButton
    Left = 288
    Top = 9
    Width = 114
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Open In Browser'
    TabOrder = 3
    OnClick = OpenBrowserButtonClick
  end
  object ProxyButton: TButton
    Left = 175
    Top = 9
    Width = 107
    Height = 25
    Caption = 'Generate JS Proxy'
    TabOrder = 4
    OnClick = ProxyButtonClick
  end
  object ProxyConnection: TSQLConnection
    ConnectionName = 'DSHTTPCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DbxDataSnap'
      'HostName=localhost'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=a91a7c5705831a4f'
      '//DelegateConnection=DBXTraceConnection'
      'CommunicationProtocol=http'
      'DriverName=DataSnap'
      'Port=8087'
      'Filters={}'
      'DSAuthenticationUser=admin'
      'DSAuthenticationPassword=faster34567890')
    Left = 216
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 104
    object BootSelectedUser1: TMenuItem
      Caption = 'Boot Selected User'
      OnClick = BootSelectedUser1Click
    end
  end
end
