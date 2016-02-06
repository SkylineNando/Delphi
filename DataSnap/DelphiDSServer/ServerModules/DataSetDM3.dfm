object DMDataSet3: TDMDataSet3
  OldCreateOrder = False
  Height = 361
  Width = 555
  object DSPProject: TDataSetProvider
    DataSet = SQLProject
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 40
    Top = 80
  end
  object SQLProject: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select PRODUCT, PROJ_DESC, PROJ_ID, '#13#10'PROJ_NAME, TEAM_LEADER fro' +
      'm PROJECT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 40
    Top = 24
    object SQLProjectPRODUCT: TStringField
      DisplayLabel = 'Product'
      FieldName = 'PRODUCT'
      Required = True
      Size = 12
    end
    object SQLProjectPROJ_DESC: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'PROJ_DESC'
      BlobType = ftMemo
      Size = 1
    end
    object SQLProjectPROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object SQLProjectPROJ_NAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'PROJ_NAME'
      Required = True
    end
    object SQLProjectTEAM_LEADER: TSmallintField
      DisplayLabel = 'Team Leader'
      FieldName = 'TEAM_LEADER'
    end
  end
  object DSProjectBudget: TDataSetProvider
    DataSet = SQLProjectBudget
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 168
    Top = 304
  end
  object SQLProjectBudget: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select DEPT_NO, FISCAL_YEAR, PROJ_ID, '#13#10'PROJECTED_BUDGET from PR' +
      'OJ_DEPT_BUDGET'#13#10'where'#13#10'  PROJ_ID = :PROJ_ID'
    DbxCommandType = 'Dbx.SQL'
    DataSource = DSProject
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'PROJ_ID'
        ParamType = ptInput
      end>
    SQLConnection = DMServerContainer.Employee
    Left = 152
    Top = 24
    object SQLProjectBudgetDEPT_NO: TStringField
      DisplayLabel = 'Department'
      FieldName = 'DEPT_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object SQLProjectBudgetFISCAL_YEAR: TIntegerField
      DisplayLabel = 'Fiscal Year'
      FieldName = 'FISCAL_YEAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLProjectBudgetPROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object SQLProjectBudgetPROJECTED_BUDGET: TFMTBCDField
      DisplayLabel = 'Budget'
      FieldName = 'PROJECTED_BUDGET'
      Precision = 12
      Size = 2
    end
  end
  object DSPDepartment: TDataSetProvider
    DataSet = SQLDepartment
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 392
    Top = 80
  end
  object SQLDepartment: TSQLDataSet
    CommandText = 'select DEPT_NO, DEPARTMENT from DEPARTMENT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 392
    Top = 24
    object SQLDepartmentDEPT_NO: TStringField
      DisplayLabel = 'Department ID'
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object SQLDepartmentDEPARTMENT: TStringField
      DisplayLabel = 'Department Name'
      FieldName = 'DEPARTMENT'
      Required = True
      Size = 25
    end
  end
  object DSProject: TDataSource
    DataSet = SQLProject
    Left = 40
    Top = 144
  end
  object SQLProjectEmployee: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select EMP_NO, PROJ_ID from EMPLOYEE_PROJECT'#13#10'where PROJ_ID = :P' +
      'ROJ_ID'
    DbxCommandType = 'Dbx.SQL'
    DataSource = DSProject
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'PROJ_ID'
        ParamType = ptInput
      end>
    SQLConnection = DMServerContainer.Employee
    Left = 280
    Top = 24
    object SQLProjectEmployeeEMP_NO: TSmallintField
      DisplayLabel = 'Employee ID'
      FieldName = 'EMP_NO'
      Required = True
    end
    object SQLProjectEmployeePROJ_ID: TStringField
      DisplayLabel = 'Project ID'
      FieldName = 'PROJ_ID'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object DSProjectEmployee: TDataSetProvider
    DataSet = SQLProjectBudget
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 296
    Top = 304
  end
  object SQLEmployee: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select EMP_NO, FIRST_NAME, LAST_NAME,  FULL_NAME '#13#10'from EMPLOYEE' +
      #13#10'order by FIRST_NAME, LAST_NAME'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 240
    Top = 176
  end
  object DSPEmployee: TDataSetProvider
    DataSet = SQLEmployee
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 240
    Top = 232
  end
end
