object FormMain: TFormMain
  Left = 217
  Top = 113
  BorderStyle = bsSingle
  Caption = 'Find/Replace'
  ClientHeight = 199
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 10
    Top = 8
    Width = 255
    Height = 129
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      'This example demonstrates the use of Find and '
      'Replace dialogs.  Choose Find or Replace from the '
      'Edit menu to find and replace text in this RichEdit '
      'control.')
    ParentFont = False
    TabOrder = 0
  end
  object FindDialog1: TFindDialog
    Options = [frDown, frHideUpDown]
    OnFind = Find
    Left = 32
    Top = 144
  end
  object ReplaceDialog1: TReplaceDialog
    Options = [frDown, frHideUpDown]
    OnFind = Find
    OnReplace = Replace
    Left = 64
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 144
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Find1: TMenuItem
        Caption = '&Find'
        ShortCut = 16454
        OnClick = Find1Click
      end
      object Replace1: TMenuItem
        Caption = '&Replace'
        ShortCut = 16466
        OnClick = Replace1Click
      end
    end
  end
end
