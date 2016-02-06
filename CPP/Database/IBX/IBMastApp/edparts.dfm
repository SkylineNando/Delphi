object EdPartsForm: TEdPartsForm
  Left = 497
  Top = 177
  HelpContext = 6
  ActiveControl = DBEdit2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edit Parts'
  ClientHeight = 362
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 61
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 59
      Width = 400
      Height = 2
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      Shape = bsTopLine
      ExplicitTop = 34
      ExplicitWidth = 313
    end
    object PrintBtn: TSpeedButton
      Left = 318
      Top = 9
      Width = 51
      Height = 42
      Hint = 'Print form image'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Glyph.Data = {
        2A010000424D2A010000000000007600000028000000130000000F0000000100
        040000000000B400000000000000000000001000000010000000000000000000
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
    object Navigator: TDBNavigator
      Left = 8
      Top = 9
      Width = 240
      Height = 42
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = PartsSource1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 61
    Width = 400
    Height = 250
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 44
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PartNo'
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 70
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Description'
    end
    object Label3: TLabel
      Left = 8
      Top = 87
      Width = 46
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Vendor'
    end
    object Label4: TLabel
      Left = 8
      Top = 133
      Width = 58
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'On Hand'
    end
    object Label5: TLabel
      Left = 207
      Top = 133
      Width = 61
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'On Order'
    end
    object Label6: TLabel
      Left = 8
      Top = 170
      Width = 81
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Backordered'
    end
    object Label7: TLabel
      Left = 8
      Top = 208
      Width = 29
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Cost'
    end
    object Label8: TLabel
      Left = 194
      Top = 206
      Width = 56
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'List Price'
    end
    object DBEdPartNo: TDBEdit
      Left = 88
      Top = 8
      Width = 102
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'PartNo'
      DataSource = PartsSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 46
      Width = 254
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Description'
      DataSource = PartsSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 93
      Top = 167
      Width = 60
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'BackOrd'
      DataSource = PartsSource1
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 88
      Top = 130
      Width = 82
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'OnHand'
      DataSource = PartsSource1
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 272
      Top = 130
      Width = 82
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'OnOrder'
      DataSource = PartsSource1
      TabOrder = 3
    end
    object DataComboBox1: TDBLookupComboBox
      Left = 88
      Top = 84
      Width = 254
      Height = 26
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'VendorNo'
      DataSource = PartsSource1
      KeyField = 'VendorNo'
      ListField = 'VendorName'
      ListSource = MastData.VendorSource
      TabOrder = 2
    end
    object DBEdit8: TDBEdit
      Left = 260
      Top = 203
      Width = 102
      Height = 26
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'ListPrice'
      DataSource = PartsSource1
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 88
      Top = 205
      Width = 102
      Height = 26
      HelpContext = 6
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataField = 'Cost'
      DataSource = PartsSource1
      TabOrder = 6
    end
  end
  object OKButton: TButton
    Left = 226
    Top = 315
    Width = 75
    Height = 37
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 311
    Top = 315
    Width = 75
    Height = 37
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object PartsSource1: TDataSource
    DataSet = MastData.Parts
    Left = 328
    Top = 208
  end
end
