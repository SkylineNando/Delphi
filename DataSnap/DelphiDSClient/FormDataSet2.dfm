inherited FormDM2: TFormDM2
  ClientHeight = 479
  ClientWidth = 718
  ExplicitWidth = 718
  ExplicitHeight = 479
  DesignSize = (
    718
    479)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 288
    Top = 8
    Width = 71
    Height = 16
    Caption = 'Employee ID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 288
    Top = 56
    Width = 62
    Height = 16
    Caption = 'First Name'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 456
    Top = 56
    Width = 60
    Height = 16
    Caption = 'Last Name'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 288
    Top = 112
    Width = 93
    Height = 16
    Caption = 'Phone Extension'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 456
    Top = 112
    Width = 53
    Height = 16
    Caption = 'Hire Date'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 288
    Top = 160
    Width = 67
    Height = 16
    Caption = 'Department'
  end
  object Label9: TLabel
    Left = 288
    Top = 208
    Width = 44
    Height = 16
    Caption = 'Country'
  end
  object Label10: TLabel
    Left = 288
    Top = 264
    Width = 36
    Height = 16
    Caption = 'Salary'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 456
    Top = 208
    Width = 25
    Height = 16
    Caption = 'Title'
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 3
    Width = 262
    Height = 511
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DSEmployee
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FULL_NAME'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 288
    Top = 326
    Width = 408
    Height = 35
    DataSource = DSEmployee
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    Kind = dbnHorizontal
    TabOrder = 10
  end
  object DBEdit1: TDBEdit
    Left = 288
    Top = 24
    Width = 104
    Height = 24
    DataField = 'EMP_NO'
    DataSource = DSEmployee
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 288
    Top = 72
    Width = 154
    Height = 24
    DataField = 'FIRST_NAME'
    DataSource = DSEmployee
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 456
    Top = 72
    Width = 204
    Height = 24
    DataField = 'LAST_NAME'
    DataSource = DSEmployee
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 288
    Top = 128
    Width = 71
    Height = 24
    DataField = 'PHONE_EXT'
    DataSource = DSEmployee
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 456
    Top = 128
    Width = 97
    Height = 24
    DataField = 'HIRE_DATE'
    DataSource = DSEmployee
    TabOrder = 5
  end
  object DBEdit10: TDBEdit
    Left = 288
    Top = 280
    Width = 114
    Height = 24
    DataField = 'SALARY'
    DataSource = DSEmployee
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 456
    Top = 224
    Width = 252
    Height = 24
    DataField = 'JOB_CODE'
    DataSource = DSEmployee
    KeyField = 'JOB_CODE'
    ListField = 'TitleGrade'
    ListSource = DSJob
    TabOrder = 8
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 288
    Top = 224
    Width = 145
    Height = 24
    DataField = 'JOB_COUNTRY'
    DataSource = DSEmployee
    KeyField = 'COUNTRY'
    ListField = 'COUNTRY'
    ListSource = DSCountry
    TabOrder = 7
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 288
    Top = 178
    Width = 252
    Height = 24
    DataField = 'DEPT_NO'
    DataSource = DSEmployee
    KeyField = 'DEPT_NO'
    ListField = 'DEPARTMENT'
    ListSource = DSDepartment
    TabOrder = 6
  end
  object DSProvDM2: TDSProviderConnection
    ServerClassName = 'TDMDataSet2'
    SQLConnection = DMClientContainer.MyDSServer
    Left = 56
    Top = 128
  end
  object CDSCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCountry'
    RemoteServer = DSProvDM2
    OnReconcileError = CDSCountryReconcileError
    Left = 56
    Top = 216
    object CDSCountryCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Required = True
      Size = 15
    end
    object CDSCountryCURRENCY: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY'
      Required = True
      Size = 10
    end
  end
  object DSCountry: TDataSource
    DataSet = CDSCountry
    Left = 56
    Top = 264
  end
  object CDSEmployee: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmployee'
    RemoteServer = DSProvDM2
    AfterPost = CDSEmployeeAfterPost
    OnReconcileError = CDSCountryReconcileError
    Left = 144
    Top = 216
    object CDSEmployeeEMP_NO: TSmallintField
      DisplayLabel = 'Employee ID'
      FieldName = 'EMP_NO'
      Required = True
    end
    object CDSEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object CDSEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Required = True
    end
    object CDSEmployeePHONE_EXT: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object CDSEmployeeHIRE_DATE: TSQLTimeStampField
      DisplayLabel = 'Hire Date'
      FieldName = 'HIRE_DATE'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CDSEmployeeDEPT_NO: TStringField
      DisplayLabel = 'Department'
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDSEmployeeJOB_CODE: TStringField
      DisplayLabel = 'Job Code'
      FieldName = 'JOB_CODE'
      Required = True
      OnChange = CDSEmployeeJOB_CODEChange
      Size = 5
    end
    object CDSEmployeeJOB_GRADE: TSmallintField
      DisplayLabel = 'Job Grade'
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object CDSEmployeeJOB_COUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'JOB_COUNTRY'
      Required = True
      OnChange = CDSEmployeeJOB_COUNTRYChange
      Size = 15
    end
    object CDSEmployeeSALARY: TFMTBCDField
      DisplayLabel = 'Salary'
      FieldName = 'SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object CDSEmployeeFULL_NAME: TStringField
      DisplayLabel = 'Full Name'
      FieldName = 'FULL_NAME'
      ReadOnly = True
      Size = 37
    end
  end
  object CDSJob: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'JOB_COUNTRY'
    MasterFields = 'COUNTRY'
    MasterSource = DSCountry
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSPJob'
    RemoteServer = DSProvDM2
    OnCalcFields = CDSJobCalcFields
    Left = 64
    Top = 328
    object CDSJobJOB_CODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object CDSJobJOB_GRADE: TSmallintField
      DisplayLabel = 'Grade'
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object CDSJobJOB_COUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object CDSJobJOB_TITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'JOB_TITLE'
      Required = True
      Size = 25
    end
    object CDSJobMIN_SALARY: TFMTBCDField
      DisplayLabel = 'Salary (Min)'
      FieldName = 'MIN_SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object CDSJobMAX_SALARY: TFMTBCDField
      DisplayLabel = 'Salary (Max)'
      FieldName = 'MAX_SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object CDSJobJOB_REQUIREMENT: TMemoField
      DisplayLabel = 'Requirement'
      FieldName = 'JOB_REQUIREMENT'
      BlobType = ftMemo
      Size = 1
    end
    object CDSJobLANGUAGE_REQ: TBytesField
      DisplayLabel = 'Language req'
      FieldName = 'LANGUAGE_REQ'
      Size = 8
    end
    object CDSJobTitleGrade: TStringField
      FieldKind = fkCalculated
      FieldName = 'TitleGrade'
      Size = 50
      Calculated = True
    end
  end
  object DSEmployee: TDataSource
    DataSet = CDSEmployee
    Left = 144
    Top = 264
  end
  object DSJob: TDataSource
    DataSet = CDSJob
    Left = 64
    Top = 376
  end
  object CDSDepartment: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPDepartment'
    RemoteServer = DSProvDM2
    Left = 128
    Top = 328
  end
  object DSDepartment: TDataSource
    DataSet = CDSDepartment
    Left = 128
    Top = 376
  end
end
