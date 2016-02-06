object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TBindList VCL Example'
  ClientHeight = 408
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    463
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'ListBox:'
  end
  object Label2: TLabel
    Left = 8
    Top = 200
    Width = 42
    Height = 13
    Caption = 'ListView:'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 27
    Width = 447
    Height = 98
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ButtonInsertListBoxItem: TButton
    Left = 88
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Insert'
    TabOrder = 3
    OnClick = ButtonInsertListBoxItemClick
  end
  object ButtonClearList: TButton
    Left = 377
    Top = 131
    Width = 75
    Height = 25
    Anchors = [akTop, akBottom]
    Caption = 'Clear List'
    TabOrder = 5
    OnClick = ButtonClearListClick
  end
  object ListView1: TListView
    Left = 8
    Top = 219
    Width = 447
    Height = 117
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Text'
      end
      item
        Caption = 'UpperCase'
      end
      item
        Caption = 'LowerCase'
      end>
    HideSelection = False
    TabOrder = 6
    ViewStyle = vsReport
    OnClick = ListView1Click
  end
  object ButtonClearListView: TButton
    Left = 377
    Top = 343
    Width = 75
    Height = 25
    Anchors = [akTop, akBottom]
    Caption = 'Clear List'
    TabOrder = 11
    OnClick = ButtonClearListViewClick
  end
  object ButtonInsertListViewItem: TButton
    Left = 89
    Top = 370
    Width = 74
    Height = 25
    Caption = 'Insert'
    TabOrder = 9
    OnClick = ButtonInsertListViewItemClick
  end
  object ButtonAppendListViewItem: TButton
    Left = 169
    Top = 370
    Width = 75
    Height = 25
    Caption = 'Append'
    TabOrder = 10
    OnClick = ButtonAppendListViewItemClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 131
    Width = 266
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object ButtonAppendListBoxItem: TButton
    Left = 169
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Append'
    TabOrder = 4
    OnClick = ButtonAppendListBoxItemClick
  end
  object ButtonUpdateListBoxItem: TButton
    Left = 7
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 2
    OnClick = ButtonUpdateListBoxItemClick
  end
  object ButtonUpdateListViewItem: TButton
    Left = 8
    Top = 370
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 8
    OnClick = ButtonUpdateListViewItemClick
  end
  object Edit2: TEdit
    Left = 8
    Top = 343
    Width = 266
    Height = 21
    TabOrder = 7
    Text = 'Edit2'
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 296
    Top = 32
    object BindListBox: TBindList
      Category = 'Property Bindings'
      ControlComponent = ListBox1
      SourceComponent = Edit1
      FormatExpressions = <
        item
          ControlExpression = 'Text'
          SourceExpression = 'Text'
        end>
      FormatControlExpressions = <>
      ClearControlExpressions = <>
      AutoFill = False
    end
    object BindExprItemsListBox: TBindExprItems
      Category = 'Binding Expressions'
      ControlComponent = Edit1
      SourceComponent = ListBox1
      FormatExpressions = <
        item
          ControlExpression = 'Text'
          SourceExpression = 'SelectedText(Self)'
        end>
      ClearExpressions = <>
    end
    object BindListView: TBindList
      Category = 'Lists'
      ControlComponent = ListView1
      SourceComponent = Edit2
      FormatExpressions = <
        item
          ControlExpression = 'Caption'
          SourceExpression = 'Text'
        end
        item
          ControlExpression = 'Self.SubItems.Strings[0]'
          SourceExpression = 'UpperCase(Text)'
        end
        item
          ControlExpression = 'Self.SubItems.Strings[1]'
          SourceExpression = 'LowerCase(Text)'
        end>
      FormatControlExpressions = <
        item
          ControlExpression = 'Column[0].Caption'
          SourceExpression = '"Text"'
        end
        item
          ControlExpression = 'Column[1].Caption'
          SourceExpression = '"UpperCase"'
        end
        item
          ControlExpression = 'Column[2].Caption'
          SourceExpression = '"LowerCase"'
        end>
      ClearControlExpressions = <>
      AutoFill = True
    end
    object BindExprItemsListView: TBindExprItems
      Category = 'Binding Expressions'
      ControlComponent = Edit2
      SourceComponent = ListView1
      FormatExpressions = <
        item
          ControlExpression = 'Text'
          SourceExpression = 'SelectedText(Self)'
        end>
      ClearExpressions = <>
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 128
    Top = 32
  end
end
