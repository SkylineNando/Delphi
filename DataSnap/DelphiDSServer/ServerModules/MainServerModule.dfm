object DMMainServerModule: TDMMainServerModule
  OldCreateOrder = False
  Height = 303
  Width = 548
  object SQLLOG: TSQLDataSet
    CommandText = 'Select * from LOG Order By CREATED DESC'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.DataSnap_Server_Log
    Left = 31
    Top = 15
  end
  object DSPLog: TDataSetProvider
    DataSet = SQLLOG
    Left = 32
    Top = 80
  end
  object CDSLog: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPLog'
    Left = 33
    Top = 168
    object CDSLogLOGID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'LOGID'
      Required = True
    end
    object CDSLogIP_ADDRESS: TStringField
      DisplayLabel = 'IP'
      FieldName = 'IP_ADDRESS'
      Required = True
      Size = 60
    end
    object CDSLogEVENT: TStringField
      DisplayLabel = 'Event'
      FieldName = 'EVENT'
      Required = True
      Size = 150
    end
    object CDSLogCREATED: TSQLTimeStampField
      DisplayLabel = 'Created'
      FieldName = 'CREATED'
    end
  end
  object SQLDSJob: TSQLDataSet
    SchemaName = 'DEFAULT_SCHEMA'
    CommandText = 'Select * from JOBS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.DataSnap_Server_Log
    Left = 151
    Top = 7
  end
  object DSPJob: TDataSetProvider
    DataSet = SQLDSJob
    Left = 152
    Top = 72
  end
  object SQLUsers: TSQLDataSet
    SchemaName = 'DEFAULT_SCHEMA'
    CommandText = 'Select LOGIN, NAME, "ACTIVE" from USERS Order By Login'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMServerContainer.DataSnap_Server_Log
    Left = 303
    Top = 15
  end
  object DSPUsers: TDataSetProvider
    DataSet = SQLUsers
    Left = 304
    Top = 80
  end
end
