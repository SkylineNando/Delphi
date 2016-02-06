object FrmTransDemo: TFrmTransDemo
  Left = 0
  Top = 0
  Caption = 'Employee Browser'
  ClientHeight = 318
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnUndoEdits: TSpeedButton
      Left = 345
      Top = 8
      Width = 76
      Height = 25
      Hint = 'Rolls Back the current transaction and starts a new one'
      Caption = '&Undo Edits'
      OnClick = BtnUndoEditsClick
    end
    object BtnCommitEdits: TSpeedButton
      Left = 261
      Top = 8
      Width = 76
      Height = 25
      Hint = 'Commits the current transaction and starts a new one'
      Caption = '&Commit Edits'
      OnClick = BtnCommitEditsClick
    end
    object DBNavigator: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = DmEmployee.EmployeeSource
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 431
      Top = 8
      Width = 60
      Height = 25
      Hint = 'Exit and close this form'
      Caption = 'E&xit'
      Kind = bkClose
      NumGlyphs = 2
      Style = bsNew
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 553
    Height = 277
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 541
      Height = 265
      Align = alClient
      BorderStyle = bsNone
      DataSource = DmEmployee.EmployeeSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
