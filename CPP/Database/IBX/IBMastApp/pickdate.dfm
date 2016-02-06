object BrDateForm: TBrDateForm
  Left = 303
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Select a Date'
  ClientHeight = 220
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OkBtn: TButton
    Left = 201
    Top = 174
    Width = 73
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 281
    Top = 174
    Width = 73
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object MonthCalendar1: TMonthCalendar
    Left = 48
    Top = 8
    Width = 273
    Height = 160
    Date = 38608.539192997680000000
    TabOrder = 2
  end
end
