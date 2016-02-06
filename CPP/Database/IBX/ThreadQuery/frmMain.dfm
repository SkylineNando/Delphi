object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Threaded Queries'
  ClientHeight = 216
  ClientWidth = 536
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
    Left = 0
    Top = 0
    Width = 536
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label2: TLabel
      Left = 10
      Top = 38
      Width = 52
      Height = 13
      Caption = 'User Name'
    end
    object Label3: TLabel
      Left = 295
      Top = 38
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object edtPassword: TEdit
      Left = 368
      Top = 35
      Width = 153
      Height = 21
      TabOrder = 0
      Text = 'masterkey'
    end
    object edtUsername: TEdit
      Left = 80
      Top = 38
      Width = 169
      Height = 21
      TabOrder = 1
      Text = 'sysdba'
    end
    object edtDatabase: TEdit
      Left = 80
      Top = 8
      Width = 441
      Height = 21
      TabOrder = 2
      Text = 
        'localhost:C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data' +
        '\employee.gdb'
    end
  end
  object mmoSQL: TMemo
    Left = 0
    Top = 81
    Width = 536
    Height = 89
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'select * from employee')
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 80
    Top = 176
    Width = 137
    Height = 25
    Caption = 'Run Query in DBGrid'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 295
    Top = 176
    Width = 161
    Height = 25
    Caption = 'Run Query in String Grid'
    TabOrder = 3
    OnClick = Button2Click
  end
end
