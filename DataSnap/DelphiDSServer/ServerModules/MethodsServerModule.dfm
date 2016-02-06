object DSServerMethods: TDSServerMethods
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 185
  Width = 205
  object SQLJob: TSQLDataSet
    CommandText = 'Select * from JOBS Where JOBID = :JOBID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'JOBID'
        ParamType = ptInput
      end>
    SQLConnection = DMServerContainer.DataSnap_Server_Log
    Left = 16
    Top = 32
    object SQLJobJOBID: TIntegerField
      FieldName = 'JOBID'
      Required = True
    end
    object SQLJobJOBNAME: TStringField
      FieldName = 'JOBNAME'
      Required = True
      Size = 150
    end
    object SQLJobDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 300
    end
    object SQLJobJOBCMD: TStringField
      FieldName = 'JOBCMD'
      Size = 600
    end
  end
end
