object DMDataSet6: TDMDataSet6
  OldCreateOrder = False
  Height = 234
  Width = 281
  object DSPDepartment: TDataSetProvider
    DataSet = SQLDepartment
    Options = [poIncFieldProps, poUseQuoteChar]
    Left = 64
    Top = 96
  end
  object SQLDepartment: TSQLDataSet
    CommandText = 'select DEPT_NO, DEPARTMENT from DEPARTMENT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 64
    Top = 40
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
  object CDSDepartment: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 88
  end
end
