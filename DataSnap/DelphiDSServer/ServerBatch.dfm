object DSServerBatch: TDSServerBatch
  OldCreateOrder = False
  Height = 311
  Width = 499
  object srvBackup: TIBBackupService
    ServerName = 'localhost'
    Protocol = TCP
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    BlockingFactor = 0
    Options = [NoGarbageCollection]
    Left = 120
    Top = 56
  end
end
