inherited FormDM3: TFormDM3
  Top = 281
  ClientHeight = 517
  ClientWidth = 789
  Position = poDesigned
  ExplicitWidth = 789
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 355
    Top = 56
    Width = 43
    Height = 16
    Caption = 'Product'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 187
    Top = 104
    Width = 63
    Height = 16
    Caption = 'Description'
    FocusControl = DBMemo1
  end
  object Label3: TLabel
    Left = 187
    Top = 8
    Width = 56
    Height = 16
    Caption = 'Project ID'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 355
    Top = 8
    Width = 33
    Height = 16
    Caption = 'Name'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 187
    Top = 56
    Width = 76
    Height = 16
    Caption = 'Team Leader'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 355
    Top = 72
    Width = 324
    Height = 24
    DataField = 'PRODUCT'
    DataSource = DSProject
    TabOrder = 4
  end
  object DBMemo1: TDBMemo
    Left = 187
    Top = 120
    Width = 302
    Height = 81
    DataField = 'PROJ_DESC'
    DataSource = DSProject
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 187
    Top = 24
    Width = 84
    Height = 24
    DataField = 'PROJ_ID'
    DataSource = DSProject
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 355
    Top = 24
    Width = 324
    Height = 24
    DataField = 'PROJ_NAME'
    DataSource = DSProject
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 187
    Top = 72
    Width = 84
    Height = 24
    DataField = 'TEAM_LEADER'
    DataSource = DSProject
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 169
    Height = 193
    DataSource = DSProject
    DrawingStyle = gdsGradient
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PROJ_NAME'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 232
    Width = 441
    Height = 270
    Caption = ' Project Budget by Department '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 19
      Width = 431
      Height = 179
      Align = alClient
      BorderStyle = bsNone
      DataSource = DSBudget
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PROJ_ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FISCAL_YEAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Department'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROJECTED_BUDGET'
          Visible = True
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 242
      Width = 437
      Height = 26
      DataSource = DSBudget
      Align = alBottom
      Kind = dbnHorizontal
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 2
      Top = 201
      Width = 437
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 2
      object DBText1: TDBText
        Left = 256
        Top = 9
        Width = 168
        Height = 24
        Alignment = taRightJustify
        DataField = 'TotalBudget'
        DataSource = DSBudget
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 40
        Top = 9
        Width = 168
        Height = 24
        Alignment = taRightJustify
        DataField = 'Minimo'
        DataSource = DSBudget
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 455
    Top = 232
    Width = 314
    Height = 217
    Caption = ' Employees '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object DBGrid3: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 19
      Width = 304
      Height = 167
      Align = alClient
      BorderStyle = bsNone
      DataSource = DSProjectEmployee
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Employee'
          Width = 272
          Visible = True
        end>
    end
    object DBNavigator3: TDBNavigator
      Left = 2
      Top = 189
      Width = 310
      Height = 26
      DataSource = DSProjectEmployee
      Align = alBottom
      Kind = dbnHorizontal
      TabOrder = 1
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 495
    Top = 120
    Width = 270
    Height = 82
    DataSource = DSProject
    Kind = dbnHorizontal
    TabOrder = 8
  end
  object Button15: TButton
    Left = 479
    Top = 455
    Width = 121
    Height = 42
    Caption = 'ApplyUpdates'
    TabOrder = 9
    OnClick = Button15Click
  end
  object Button1: TButton
    Left = 623
    Top = 455
    Width = 121
    Height = 42
    Caption = 'Undo Changes'
    TabOrder = 10
    OnClick = Button1Click
  end
  object DSProvDM3: TDSProviderConnection
    ServerClassName = 'TDMDataSet3'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 312
    Top = 40
  end
  object CDSProject: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProject'
    RemoteServer = DSProvDM3
    OnReconcileError = CDSProjectReconcileError
    Left = 32
    Top = 128
    object CDSProjectPRODUCT: TStringField
      DisplayLabel = 'Product'
      FieldName = 'PRODUCT'
      Required = True
      Size = 12
    end
    object CDSProjectPROJ_DESC: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'PROJ_DESC'
      BlobType = ftMemo
      Size = 1
    end
    object CDSProjectPROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CDSProjectPROJ_NAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'PROJ_NAME'
      Required = True
    end
    object CDSProjectTEAM_LEADER: TSmallintField
      DisplayLabel = 'Team Leader'
      FieldName = 'TEAM_LEADER'
    end
    object CDSProjectSQLProjectEmployee: TDataSetField
      FieldName = 'SQLProjectEmployee'
    end
    object CDSProjectSQLProjectBudget: TDataSetField
      FieldName = 'SQLProjectBudget'
    end
  end
  object DSProject: TDataSource
    DataSet = CDSProject
    Left = 32
    Top = 80
  end
  object CDSBudget: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = CDSProjectSQLProjectBudget
    Params = <>
    OnReconcileError = CDSProjectReconcileError
    Left = 232
    Top = 368
    object CDSBudgetDEPT_NO: TStringField
      DisplayLabel = 'Department'
      FieldName = 'DEPT_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDSBudgetFISCAL_YEAR: TIntegerField
      DisplayLabel = 'Fiscal Year'
      FieldName = 'FISCAL_YEAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSBudgetPROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object CDSBudgetPROJECTED_BUDGET: TFMTBCDField
      DisplayLabel = 'Budget'
      FieldName = 'PROJECTED_BUDGET'
      Precision = 12
      Size = 2
    end
    object CDSBudgetDepartment: TStringField
      FieldKind = fkLookup
      FieldName = 'Department'
      LookupDataSet = CDSDepartment
      LookupKeyFields = 'DEPT_NO'
      LookupResultField = 'DEPARTMENT'
      KeyFields = 'DEPT_NO'
      Size = 50
      Lookup = True
    end
    object CDSBudgetTotalBudget: TAggregateField
      FieldName = 'TotalBudget'
      Active = True
      DisplayFormat = 'Total U$ #,##0.00'
      Expression = 'SUM(PROJECTED_BUDGET)'
    end
    object CDSBudgetMinimo: TAggregateField
      FieldName = 'Minimo'
      Active = True
      DisplayFormat = 'Minimol U$ #,##0.00'
      Expression = 'MIN(PROJECTED_BUDGET)'
    end
  end
  object DSBudget: TDataSource
    DataSet = CDSBudget
    Left = 232
    Top = 320
  end
  object CDSDepartment: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPDepartment'
    RemoteServer = DSProvDM3
    Left = 160
    Top = 376
  end
  object DSDepartment: TDataSource
    DataSet = CDSDepartment
    Left = 160
    Top = 328
  end
  object CDSProjectEmployee: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = CDSProjectSQLProjectEmployee
    Params = <>
    Left = 560
    Top = 360
    object CDSProjectEmployeeEMP_NO: TSmallintField
      DisplayLabel = 'Employee ID'
      FieldName = 'EMP_NO'
      Required = True
    end
    object CDSProjectEmployeePROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CDSProjectEmployeeEmployee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = CDSEmployee
      LookupKeyFields = 'EMP_NO'
      LookupResultField = 'FULL_NAME'
      KeyFields = 'EMP_NO'
      Size = 50
      Lookup = True
    end
  end
  object DSProjectEmployee: TDataSource
    DataSet = CDSProjectEmployee
    Left = 560
    Top = 312
  end
  object CDSEmployee: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmployee'
    RemoteServer = DSProvDM3
    Left = 472
    Top = 360
  end
  object DSEmployee: TDataSource
    DataSet = CDSEmployee
    Left = 472
    Top = 312
  end
end
