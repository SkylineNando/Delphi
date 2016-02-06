object DSMasterDetail: TDSMasterDetail
  OldCreateOrder = False
  Height = 382
  Width = 533
  object DSPDepartment: TDataSetProvider
    DataSet = QueryDepartment
    BeforeGetRecords = DSPDepartmentBeforeGetRecords
    Left = 56
    Top = 200
  end
  object QueryDepartment: TSQLDataSet
    CommandText = 'select * from DEPARTMENT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 48
    Top = 120
  end
  object DSPEmployee: TDataSetProvider
    DataSet = QueryEmployee
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    Left = 152
    Top = 192
  end
  object QueryEmployee: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT EMP_NO, FIRST_NAME, LAST_NAME, DEPT_NO,'#13#10'HIRE_DATE, JOB_C' +
      'OUNTRY, JOB_CODE, JOB_GRADE, SALARY'#13#10' FROM EMPLOYEE'#13#10'WHERE DEPT_' +
      'NO = :DEPT_NO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = DSDepartment
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'DEPT_NO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = DMServerContainer.Employee
    Left = 152
    Top = 120
    object QueryEmployeeEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object QueryEmployeeFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object QueryEmployeeLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object QueryEmployeeDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QueryEmployeeHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object QueryEmployeeJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object QueryEmployeeJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object QueryEmployeeJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object QueryEmployeeSALARY: TFMTBCDField
      FieldName = 'SALARY'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object DSDepartment: TDataSource
    DataSet = QueryDepartment
    Left = 56
    Top = 288
  end
end
