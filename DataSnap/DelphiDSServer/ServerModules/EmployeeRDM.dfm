object EmployeeServerRDM: TEmployeeServerRDM
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 489
  Width = 493
  object DSPCountry: TDataSetProvider
    DataSet = COUNTRY
    Left = 56
    Top = 176
  end
  object DSPEmployee: TDataSetProvider
    DataSet = EMPLOYEE1
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    Left = 160
    Top = 184
  end
  object COUNTRY: TSQLDataSet
    CommandText = 'select * from COUNTRY'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 56
    Top = 120
  end
  object EMPLOYEE1: TSQLDataSet
    CommandText = 'select * from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 152
    Top = 120
  end
end
