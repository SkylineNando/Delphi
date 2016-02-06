object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 409
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 6
    Top = 8
    Width = 259
    Height = 217
    Hint = 'Scroll grid below to see other fish'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object DBLabel1: TDBText
      Left = 4
      Top = 183
      Width = 249
      Height = 24
      DataField = 'Common_Name'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object DBImage1: TDBImage
      Left = 5
      Top = 8
      Width = 248
      Height = 168
      Hint = 'Scroll grid below to see other fish'
      DataField = 'Graphic'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 269
    Top = 8
    Width = 255
    Height = 22
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 4
      Width = 56
      Height = 13
      Caption = 'About the'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLabel2: TDBText
      Left = 67
      Top = 4
      Width = 99
      Height = 13
      AutoSize = True
      DataField = 'Common_Name'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 270
    Top = 32
    Width = 254
    Height = 193
    BevelOuter = bvLowered
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 3
      Top = 2
      Width = 246
      Height = 183
      BorderStyle = bsNone
      Color = clSilver
      Ctl3D = False
      DataField = 'Notes'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 233
    Width = 621
    Height = 176
    Align = alBottom
    BevelInner = bvRaised
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ExplicitLeft = 6
    ExplicitTop = 231
    object DBGrid1: TDBGrid
      Left = 6
      Top = 8
      Width = 519
      Height = 153
      Hint = 'Scroll up/down to see other fish!'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CATEGORY'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SPECIES_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LENGTH__CM_'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LENGTH_IN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMMON_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'GRAPHIC'
          Visible = False
        end>
    end
    object ExitButton: TBitBtn
      Left = 531
      Top = 40
      Width = 74
      Height = 25
      Hint = 'Close Fish Facts'
      Caption = 'E&xit'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
    end
    object SaveButton: TBitBtn
      Left = 532
      Top = 8
      Width = 74
      Height = 26
      Hint = 'Save Fish Facts'
      Caption = '&Save'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = SaveButtonClick
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 115
    Top = 121
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SPECIES_NO'
        DataType = ftFloat
      end
      item
        Name = 'CATEGORY'
        DataType = ftWideString
        Size = 15
      end
      item
        Name = 'COMMON_NAME'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'SPECIES_NAME'
        DataType = ftWideString
        Size = 40
      end
      item
        Name = 'LENGTH__CM_'
        DataType = ftFloat
      end
      item
        Name = 'LENGTH_IN'
        DataType = ftFloat
      end
      item
        Name = 'NOTES'
        DataType = ftWideMemo
        Size = 8
      end
      item
        Name = 'GRAPHIC'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'BIOLIFE0'
        Fields = 'SPECIES_NO'
        Options = [ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'BIOLIFE'
    UniDirectional = False
    Left = 48
    Top = 120
    object IBTable1CATEGORY: TIBStringField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY'
      Size = 15
    end
    object IBTable1SPECIES_NAME: TIBStringField
      DisplayLabel = 'Species Name'
      FieldName = 'SPECIES_NAME'
      Size = 40
    end
    object IBTable1LENGTH__CM_: TFloatField
      DisplayLabel = 'Length (cm)'
      FieldName = 'LENGTH__CM_'
    end
    object IBTable1LENGTH_IN: TFloatField
      DisplayLabel = 'Length_In'
      FieldName = 'LENGTH_IN'
      DisplayFormat = '0.00'
    end
    object IBTable1COMMON_NAME: TIBStringField
      DisplayLabel = 'Common Name'
      FieldName = 'COMMON_NAME'
      Size = 30
    end
    object IBTable1NOTES: TMemoField
      DisplayLabel = 'Notes'
      FieldName = 'NOTES'
      BlobType = ftMemo
      Size = 8
    end
    object IBTable1GRAPHIC: TBlobField
      DisplayLabel = 'Graphic'
      FieldName = 'GRAPHIC'
      Size = 8
    end
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data\dbdemos.g' +
      'db'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 48
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 112
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Left = 456
    Top = 208
  end
end
