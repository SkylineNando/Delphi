object FrmMain: TFrmMain
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'C++Builder DataSnap Client'
  ClientHeight = 679
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 45
    Width = 876
    Height = 634
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Using Server Methods'
      DesignSize = (
        868
        582)
      object LBDateTime: TLabel
        Left = 224
        Top = 32
        Width = 401
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Server Date/Time'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Button4: TButton
        Left = 11
        Top = 16
        Width = 182
        Height = 65
        Caption = 'Get Server Date Time'
        TabOrder = 0
        OnClick = Button4Click
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 184
        Width = 862
        Height = 389
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Jobs avaliable '
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 2
          Top = 18
          Width = 858
          Height = 369
          ActivePage = TBJobList
          Align = alClient
          TabOrder = 0
          object TBJobList: TTabSheet
            Caption = 'Job List'
            object DBGrid3: TDBGrid
              Left = 0
              Top = 0
              Width = 850
              Height = 338
              Align = alClient
              DataSource = DSJobs
              DrawingStyle = gdsGradient
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'JOBNAME'
                  Width = 232
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPTION'
                  Width = 355
                  Visible = True
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Job Detail'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            DesignSize = (
              850
              338)
            object Label1: TLabel
              Left = 11
              Top = 10
              Width = 12
              Height = 16
              Caption = 'ID'
              FocusControl = DBEJobId
            end
            object Label2: TLabel
              Left = 11
              Top = 64
              Width = 33
              Height = 16
              Caption = 'Name'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 11
              Top = 112
              Width = 63
              Height = 16
              Caption = 'Description'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 11
              Top = 160
              Width = 26
              Height = 16
              Caption = 'CMD'
              FocusControl = DBEdit4
            end
            object DBEJobId: TDBEdit
              Left = 11
              Top = 32
              Width = 63
              Height = 24
              DataField = 'JOBID'
              DataSource = DSJobs
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 11
              Top = 80
              Width = 358
              Height = 24
              DataField = 'JOBNAME'
              DataSource = DSJobs
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 11
              Top = 128
              Width = 358
              Height = 24
              DataField = 'DESCRIPTION'
              DataSource = DSJobs
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 11
              Top = 176
              Width = 430
              Height = 24
              DataField = 'JOBCMD'
              DataSource = DSJobs
              TabOrder = 3
            end
            object Button5: TButton
              Left = 697
              Top = 295
              Width = 150
              Height = 34
              Anchors = [akRight, akBottom]
              Caption = 'Execute Job on Server'
              TabOrder = 4
              OnClick = Button5Click
            end
            object DBNavigator3: TDBNavigator
              Left = 11
              Top = 206
              Width = 432
              Height = 25
              DataSource = DSJobs
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              TabOrder = 5
            end
            object ApplyUpdates: TButton
              Left = 528
              Top = 159
              Width = 113
              Height = 33
              Caption = 'ApplyUpdates'
              TabOrder = 6
            end
            object Button10: TButton
              Left = 647
              Top = 159
              Width = 121
              Height = 34
              Caption = 'Undo Changes'
              TabOrder = 7
            end
          end
        end
      end
      object Button12: TButton
        Left = 16
        Top = 120
        Width = 177
        Height = 49
        Caption = 'Open Job DataSet'
        TabOrder = 2
        OnClick = Button12Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Using ClientDataSet (Master-Detail)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 355
        Top = 56
        Width = 43
        Height = 14
        Caption = 'Product'
        FocusControl = DBEdit1
      end
      object Label7: TLabel
        Left = 187
        Top = 104
        Width = 60
        Height = 14
        Caption = 'Description'
        FocusControl = DBMemo1
      end
      object Label8: TLabel
        Left = 187
        Top = 8
        Width = 55
        Height = 14
        Caption = 'Project ID'
        FocusControl = DBEdit5
      end
      object Label9: TLabel
        Left = 355
        Top = 8
        Width = 31
        Height = 14
        Caption = 'Name'
        FocusControl = DBEdit6
      end
      object Label10: TLabel
        Left = 187
        Top = 56
        Width = 72
        Height = 14
        Caption = 'Team Leader'
        FocusControl = DBEdit7
      end
      object Panel1: TPanel
        Left = 0
        Top = 517
        Width = 868
        Height = 65
        Align = alBottom
        TabOrder = 0
        object Button1: TButton
          Left = 423
          Top = 15
          Width = 121
          Height = 42
          Caption = 'ApplyUpdates'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button3: TButton
          Left = 275
          Top = 15
          Width = 121
          Height = 41
          Caption = 'Close'
          TabOrder = 1
          WordWrap = True
          OnClick = Button3Click
        end
        object Button2: TButton
          Left = 131
          Top = 15
          Width = 121
          Height = 42
          Caption = 'Open'
          TabOrder = 2
          WordWrap = True
          OnClick = Button2Click
        end
        object Button9: TButton
          Left = 558
          Top = 15
          Width = 121
          Height = 42
          Caption = 'Undo Changes'
          TabOrder = 3
          OnClick = Button9Click
        end
      end
      object DBEdit1: TDBEdit
        Left = 355
        Top = 72
        Width = 324
        Height = 22
        DataField = 'PRODUCT'
        DataSource = DSProject
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 187
        Top = 120
        Width = 302
        Height = 81
        DataField = 'PROJ_DESC'
        DataSource = DSProject
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 187
        Top = 24
        Width = 84
        Height = 22
        DataField = 'PROJ_ID'
        DataSource = DSProject
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 355
        Top = 24
        Width = 324
        Height = 22
        DataField = 'PROJ_NAME'
        DataSource = DSProject
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 187
        Top = 72
        Width = 84
        Height = 22
        DataField = 'TEAM_LEADER'
        DataSource = DSProject
        TabOrder = 5
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 8
        Width = 169
        Height = 193
        DataSource = DSProject
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PROJ_NAME'
            Visible = True
          end>
      end
      object GroupBox2: TGroupBox
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
        TabOrder = 7
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
          TabOrder = 1
        end
        object Panel2: TPanel
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
        end
      end
      object GroupBox3: TGroupBox
        Left = 455
        Top = 232
        Width = 330
        Height = 267
        Caption = ' Employees '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object DBGrid5: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 320
          Height = 217
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
        object DBNavigator4: TDBNavigator
          Left = 2
          Top = 239
          Width = 326
          Height = 26
          DataSource = DSProjectEmployee
          Align = alBottom
          TabOrder = 1
        end
      end
      object DBNavigator5: TDBNavigator
        Left = 495
        Top = 120
        Width = 270
        Height = 82
        DataSource = DSProject
        TabOrder = 9
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Reading data from DBXReader'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        868
        582)
      object Label5: TLabel
        Left = 21
        Top = 73
        Width = 642
        Height = 87
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        Caption = 
          'TDepartment is a Singleton object (LifeCycle=Server) - Open 2 cl' +
          'ient application to see the singleton objects working'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object BTGetDepartament: TButton
        Left = 3
        Top = 16
        Width = 254
        Height = 49
        Caption = 'Get Department'
        TabOrder = 0
        OnClick = BTGetDepartamentClick
      end
      object Button8: TButton
        Left = 288
        Top = 16
        Width = 209
        Height = 49
        Caption = 'Set Department Ordered by ID'
        TabOrder = 1
        WordWrap = True
        OnClick = Button8Click
      end
      object Memo1: TMemo
        Left = 3
        Top = 166
        Width = 862
        Height = 407
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Button6: TButton
        Left = 528
        Top = 16
        Width = 220
        Height = 49
        Caption = 'Set Department Ordered by Name'
        TabOrder = 3
        WordWrap = True
        OnClick = Button6Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Using DBX framework to send TParams'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button7: TButton
        Left = 27
        Top = 64
        Width = 238
        Height = 57
        Caption = 'Insert (sending TParams)'
        TabOrder = 0
        OnClick = Button7Click
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Copying DataReader to DataSet'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid4: TDBGrid
        Left = 32
        Top = 48
        Width = 689
        Height = 305
        DataSource = DSCopy
        DrawingStyle = gdsGradient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Button13: TButton
        Left = 424
        Top = 359
        Width = 297
        Height = 42
        Caption = 'Copy Department DBXReader to ClientDataSet'
        TabOrder = 1
        WordWrap = True
        OnClick = Button13Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button11: TButton
      Left = 8
      Top = 5
      Width = 228
      Height = 38
      Caption = 'VCL Styles'
      DropDownMenu = PMStyles
      Style = bsSplitButton
      TabOrder = 0
    end
  end
  object DSDepartment: TDataSource
    DataSet = DMClientContainer.CDSDepartment
    Left = 736
    Top = 616
  end
  object DSJobs: TDataSource
    DataSet = DMClientContainer.CDSJobs
    Left = 816
    Top = 616
  end
  object DSCopy: TDataSource
    DataSet = DMClientContainer.CDSCopy
    Left = 880
    Top = 616
  end
  object DSProvDM3: TDSProviderConnection
    ServerClassName = 'TDMDataSet3'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 168
    Top = 464
  end
  object CDSProject: TClientDataSet
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
      DisplayName = ''
      DisplayFormat = 'Total U$ #,##0.00'
      Expression = 'SUM(PROJECTED_BUDGET)'
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
  object DataSource1: TDataSource
    DataSet = CDSDepartment
    Left = 160
    Top = 328
  end
  object CDSProjectEmployee: TClientDataSet
    Aggregates = <>
    DataSetField = CDSProjectSQLProjectEmployee
    Params = <>
    Left = 808
    Top = 288
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
    Left = 808
    Top = 240
  end
  object CDSEmployee: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmployee'
    RemoteServer = DSProvDM3
    Left = 720
    Top = 288
  end
  object DSEmployee: TDataSource
    DataSet = CDSEmployee
    Left = 720
    Top = 240
  end
  object PMStyles: TPopupMenu
    Left = 472
    Top = 8
    object Style11: TMenuItem
      Caption = 'Style 1'
    end
    object Style21: TMenuItem
      Caption = 'Style 2'
    end
    object Style31: TMenuItem
      Caption = 'Style 3'
    end
  end
end
