object DMDataSet1: TDMDataSet1
  OldCreateOrder = False
  Height = 366
  Width = 484
  object DSPCountry: TDataSetProvider
    DataSet = SQLCountry
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poUseQuoteChar]
    Left = 80
    Top = 120
  end
  object SQLCountry: TSQLDataSet
    CommandText = 'select * from COUNTRY'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.Employee
    Left = 80
    Top = 48
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
end
