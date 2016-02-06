object DMDataSet2: TDMDataSet2
  OldCreateOrder = False
  Height = 366
  Width = 484
  object DSPCountry: TDataSetProvider
    DataSet = SQLCountry
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 56
    Top = 176
  end
  object SQLCountry: TSQLDataSet
    CommandText = 'select * from COUNTRY'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 56
    Top = 120
    object SQLCountryCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Required = True
      Size = 15
    end
    object SQLCountryCURRENCY: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY'
      Required = True
      Size = 10
    end
  end
  object DSPEmployee: TDataSetProvider
    DataSet = SQLEmployee
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 168
    Top = 176
  end
  object SQLEmployee: TSQLDataSet
    CommandText = 'select * from EMPLOYEE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 168
    Top = 120
    object SQLEmployeeEMP_NO: TSmallintField
      DisplayLabel = 'Employee ID'
      FieldName = 'EMP_NO'
      Required = True
    end
    object SQLEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object SQLEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Required = True
    end
    object SQLEmployeePHONE_EXT: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object SQLEmployeeHIRE_DATE: TSQLTimeStampField
      DisplayLabel = 'Hire Date'
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object SQLEmployeeDEPT_NO: TStringField
      DisplayLabel = 'Department'
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object SQLEmployeeJOB_CODE: TStringField
      DisplayLabel = 'Job Code'
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object SQLEmployeeJOB_GRADE: TSmallintField
      DisplayLabel = 'Job Grade'
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object SQLEmployeeJOB_COUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object SQLEmployeeSALARY: TFMTBCDField
      DisplayLabel = 'Salary'
      FieldName = 'SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object SQLEmployeeFULL_NAME: TStringField
      DisplayLabel = 'Full Name'
      FieldName = 'FULL_NAME'
      ReadOnly = True
      Size = 37
    end
  end
  object DSPJob: TDataSetProvider
    DataSet = SQLJob
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 272
    Top = 176
  end
  object SQLJob: TSQLDataSet
    CommandText = 'select * from JOB'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 272
    Top = 120
    object SQLJobJOB_CODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object SQLJobJOB_GRADE: TSmallintField
      DisplayLabel = 'Grade'
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object SQLJobJOB_COUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object SQLJobJOB_TITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'JOB_TITLE'
      Required = True
      Size = 25
    end
    object SQLJobMIN_SALARY: TFMTBCDField
      DisplayLabel = 'Salary (Min)'
      FieldName = 'MIN_SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object SQLJobMAX_SALARY: TFMTBCDField
      DisplayLabel = 'Salary (Max)'
      FieldName = 'MAX_SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
    object SQLJobJOB_REQUIREMENT: TMemoField
      DisplayLabel = 'Requirement'
      FieldName = 'JOB_REQUIREMENT'
      BlobType = ftMemo
      Size = 1
    end
    object SQLJobLANGUAGE_REQ: TBytesField
      DisplayLabel = 'Language req'
      FieldName = 'LANGUAGE_REQ'
      Size = 8
    end
  end
  object DSPDepartment: TDataSetProvider
    DataSet = SQLDepartment
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 352
    Top = 176
  end
  object SQLDepartment: TSQLDataSet
    CommandText = 'select DEPT_NO, DEPARTMENT from DEPARTMENT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 352
    Top = 120
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
end
