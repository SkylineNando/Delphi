object FrmQueryProc: TFrmQueryProc
  Left = 0
  Top = 0
  Caption = 'Employee Project Assignments'
  ClientHeight = 315
  ClientWidth = 478
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
    Width = 478
    Height = 41
    Align = alTop
    TabOrder = 0
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
      Left = 305
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
    Width = 478
    Height = 137
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 466
      Height = 125
      Hint = 'Select an employee to execute the query procedure'
      Align = alClient
      BorderStyle = bsNone
      DataSource = EmployeeSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 178
    Width = 478
    Height = 118
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 6
      Top = 6
      Width = 466
      Height = 106
      Hint = 'Use SQL Monitor to see the Get_Emp_Proj query procedure execute'
      Align = alClient
      BorderStyle = bsNone
      DataSource = EmployeeProjectsSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 296
    Width = 478
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object EmployeeProjectsSource: TDataSource
    DataSet = EmployeeProjectsQuery
    Left = 152
    Top = 248
  end
  object EmployeeSource: TDataSource
    DataSet = DmEmployee.EmployeeTable
    Enabled = False
    OnDataChange = EmployeeSourceDataChange
    Left = 168
    Top = 72
  end
  object EmployeeProjectsQuery: TIBQuery
    Database = DmEmployee.EmployeeDatabase
    Transaction = DmEmployee.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select * from Get_Emp_Proj( :EMP_NO )')
    Left = 152
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EMP_NO'
        ParamType = ptUnknown
      end>
  end
end
