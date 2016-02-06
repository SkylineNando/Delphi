object FormMain: TFormMain
  Left = 200
  Top = 114
  BorderStyle = bsSingle
  Caption = 'Multipage Dialog'
  ClientHeight = 234
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label3: TLabel
    Left = 207
    Top = 30
    Width = 159
    Height = 119
    AutoSize = False
    Caption = 'Each page contains an entirely different set of controls.'
    WordWrap = True
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 415
    Height = 215
    ActivePage = One
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object One: TTabSheet
      Caption = 'One'
      object Label1: TLabel
        Left = 20
        Top = 30
        Width = 322
        Height = 40
        AutoSize = False
        Caption = 
          'The PageControl is a quick and powerful way to create multipage ' +
          'dialogs in C++Builder applications.'
        WordWrap = True
      end
    end
    object Two: TTabSheet
      Caption = 'Two'
      object Label2: TLabel
        Left = 20
        Top = 30
        Width = 158
        Height = 80
        AutoSize = False
        Caption = 'Each page contains an entirely different set of controls.'
        WordWrap = True
      end
      object RadioGroup1: TRadioGroup
        Left = 207
        Top = 10
        Width = 159
        Height = 129
        Caption = 'PageControls are:'
        TabOrder = 0
      end
      object RadioButton1: TRadioButton
        Left = 226
        Top = 39
        Width = 130
        Height = 21
        Caption = 'Powerful'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 226
        Top = 69
        Width = 130
        Height = 21
        Caption = 'Easy to use'
        TabOrder = 2
      end
      object RadioButton3: TRadioButton
        Left = 226
        Top = 98
        Width = 130
        Height = 21
        Caption = 'Both'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
    end
    object Three: TTabSheet
      Caption = 'Three'
      object Label4: TLabel
        Left = 20
        Top = 20
        Width = 346
        Height = 60
        AutoSize = False
        Caption = 
          'The individual pages of a PageControl are called TabSheets.  You' +
          ' can add new pages at design time by right clicking on a PageCon' +
          'trol and selecting "New Page."'
        WordWrap = True
      end
      object CheckBox1: TCheckBox
        Left = 20
        Top = 89
        Width = 158
        Height = 21
        Caption = 'C++Builder'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 20
        Top = 118
        Width = 119
        Height = 21
        Caption = 'Delphi'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 207
        Top = 89
        Width = 129
        Height = 21
        Caption = 'JBuilder'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object Four: TTabSheet
      Caption = 'Four'
      object Memo1: TMemo
        Left = 20
        Top = 20
        Width = 346
        Height = 109
        Lines.Strings = (
          'The OnChange event is triggered whenever the user '
          'selects a new tab.  The ActivePage property specifies '
          'which page was selected.  Use the OnChanging property '
          'if you wish to test criteria before allowing the user to '
          'change tabs.')
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 215
    Width = 415
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Page index: 0'
  end
end
