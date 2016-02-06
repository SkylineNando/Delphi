object EdCustForm: TEdCustForm
  Left = 555
  Top = 205
  HelpContext = 1
  ActiveControl = DBEdName
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Edit Customers'
  ClientHeight = 444
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 19
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 61
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 1
    ExplicitWidth = 443
    object PrintBtn: TSpeedButton
      Left = 339
      Top = 5
      Width = 54
      Height = 46
      Hint = 'Print form image'
      Glyph.Data = {
        2A010000424D2A010000000000007600000028000000130000000F0000000100
        040000000000B400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333F0EFF3300000000000003333F00FF37877777777777703330000030F8
        8888888888870333003330F9988888888887703F11EE37FFFFFFFFFFFFF77039
        0910330888888888888F703865F03330870000000078F03765F03333000FFFFF
        F000033865F03333330F44448033333765F033333330FFFFFF03333865F03333
        3330F4444803333765F0333333330FFFFFF0333865F033333333000000003336
        66C0333333333333333333300000}
      OnClick = PrintBtnClick
    end
    object Bevel1: TBevel
      Left = 2
      Top = 57
      Width = 440
      Height = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 35
      ExplicitWidth = 372
    end
    object DBNavigator: TDBNavigator
      Left = 19
      Top = 5
      Width = 250
      Height = 46
      DataSource = MastData.CustSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 444
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 320
    ExplicitWidth = 443
    object OKButton: TButton
      Left = 248
      Top = 3
      Width = 91
      Height = 35
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object CancelButton: TButton
      Left = 345
      Top = 5
      Width = 85
      Height = 33
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 61
    Width = 444
    Height = 340
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 39
    ExplicitWidth = 376
    ExplicitHeight = 228
    object Bevel2: TBevel
      Left = 8
      Top = 247
      Width = 401
      Height = 5
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 290
      Top = 7
      Width = 51
      Height = 19
      Caption = 'CustNo'
    end
    object Label2: TLabel
      Left = 20
      Top = 4
      Width = 67
      Height = 19
      Caption = 'Company'
    end
    object Label3: TLabel
      Left = 20
      Top = 61
      Width = 38
      Height = 19
      Caption = 'Add1'
    end
    object Label4: TLabel
      Left = 19
      Top = 119
      Width = 38
      Height = 19
      Caption = 'Add2'
    end
    object Label5: TLabel
      Left = 20
      Top = 173
      Width = 27
      Height = 19
      Caption = 'City'
    end
    object Label6: TLabel
      Left = 124
      Top = 174
      Width = 35
      Height = 19
      Caption = 'State'
    end
    object Label7: TLabel
      Left = 192
      Top = 174
      Width = 63
      Height = 19
      Caption = 'Zip Code'
    end
    object Label8: TLabel
      Left = 289
      Top = 172
      Width = 56
      Height = 19
      Caption = 'Country'
    end
    object Label9: TLabel
      Left = 290
      Top = 62
      Width = 44
      Height = 19
      Caption = 'Phone'
    end
    object Label10: TLabel
      Left = 17
      Top = 266
      Width = 53
      Height = 19
      Caption = 'Contact'
    end
    object Label11: TLabel
      Left = 331
      Top = 264
      Width = 62
      Height = 19
      Caption = 'Tax Rate'
    end
    object Label13: TLabel
      Left = 191
      Top = 266
      Width = 84
      Height = 19
      Caption = 'Last Invoice'
    end
    object Label14: TLabel
      Left = 290
      Top = 120
      Width = 24
      Height = 19
      Caption = 'Fax'
    end
    object DBEdName: TDBEdit
      Left = 19
      Top = 28
      Width = 250
      Height = 27
      DataField = 'Company'
      DataSource = MastData.CustSource
      TabOrder = 0
    end
    object DBEdCustNo: TDBEdit
      Left = 289
      Top = 29
      Width = 107
      Height = 27
      Color = clSilver
      DataField = 'CustNo'
      DataSource = MastData.CustSource
      TabOrder = 12
    end
    object DBEdit3: TDBEdit
      Left = 19
      Top = 86
      Width = 248
      Height = 27
      DataField = 'Addr1'
      DataSource = MastData.CustSource
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 289
      Top = 87
      Width = 106
      Height = 27
      DataField = 'Phone'
      DataSource = MastData.CustSource
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 19
      Top = 140
      Width = 248
      Height = 27
      DataField = 'Addr2'
      DataSource = MastData.CustSource
      TabOrder = 2
    end
    object DBEdit14: TDBEdit
      Left = 289
      Top = 139
      Width = 106
      Height = 27
      DataField = 'FAX'
      DataSource = MastData.CustSource
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 19
      Top = 198
      Width = 98
      Height = 27
      DataField = 'City'
      DataSource = MastData.CustSource
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 123
      Top = 199
      Width = 62
      Height = 27
      DataField = 'State'
      DataSource = MastData.CustSource
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 191
      Top = 199
      Width = 90
      Height = 27
      DataField = 'Zip'
      DataSource = MastData.CustSource
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 287
      Top = 197
      Width = 106
      Height = 27
      DataField = 'Country'
      DataSource = MastData.CustSource
      TabOrder = 6
    end
    object DBEdInv: TDBEdit
      Left = 191
      Top = 291
      Width = 131
      Height = 27
      DataField = 'LastInvoiceDate'
      DataSource = MastData.CustSource
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 17
      Top = 291
      Width = 160
      Height = 27
      DataField = 'Contact'
      DataSource = MastData.CustSource
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 331
      Top = 291
      Width = 68
      Height = 27
      DataField = 'TaxRate'
      DataSource = MastData.CustSource
      TabOrder = 11
    end
  end
end
