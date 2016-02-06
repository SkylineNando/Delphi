object LookupServerRDM: TLookupServerRDM
  OldCreateOrder = False
  Height = 489
  Width = 493
  object DSPCountry: TDataSetProvider
    DataSet = COUNTRY
    Left = 56
    Top = 176
  end
  object DSPProject: TDataSetProvider
    DataSet = PROJECT
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    Left = 160
    Top = 184
  end
  object COUNTRY: TSQLDataSet
    CommandText = 'select * from COUNTRY'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 56
    Top = 120
  end
  object PROJECT: TSQLDataSet
    CommandText = 'Select * from PROJECT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 152
    Top = 120
  end
  object DSPDepartament: TDataSetProvider
    DataSet = SQLDepartament
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    Left = 256
    Top = 184
  end
  object SQLDepartament: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select  * from DEPARTMENT')
    SQLConnection = DMServerContainer.Employee
    Left = 248
    Top = 120
  end
end
