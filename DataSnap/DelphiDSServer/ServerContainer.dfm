object DMServerContainer: TDMServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 415
  Width = 626
  object MyDSServer: TDSServer
    OnConnect = MyDSServerConnect
    OnDisconnect = MyDSServerDisconnect
    OnError = MyDSServerError
    AutoStart = False
    Left = 40
    Top = 24
  end
  object MyDSTCPServerTransport: TDSTCPServerTransport
    PoolSize = 0
    Server = MyDSServer
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    Left = 152
    Top = 24
  end
  object DSSCUser: TDSServerClass
    OnGetClass = DSSCUserGetClass
    OnCreateInstance = DSSCUserCreatereInstance
    OnDestroyInstance = DSSCUserDestroyInstance
    Server = MyDSServer
    LifeCycle = 'Invocation'
    Left = 40
    Top = 224
  end
  object DSEmployeeRDM: TDSServerClass
    OnGetClass = DSEmployeeRDMGetClass
    OnCreateInstance = DSEmployeeRDMCreateInstance
    Server = MyDSServer
    Left = 40
    Top = 304
  end
  object DSServerMethods: TDSServerClass
    OnGetClass = DSServerMethodsGetClass
    Server = MyDSServer
    Left = 256
    Top = 224
  end
  object DataSnap_Server_Log: TSQLConnection
    DriverName = 'InterBase'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      
        'Database=C:\Documents and Settings\All Users\Documents\RAD Studi' +
        'o\12.0\Samples\DataSnap\Output\Database\DSSERVERLOG.IB')
    TableScope = [tsSynonym, tsSysTable, tsTable, tsView]
    Left = 256
    Top = 128
  end
  object SqlLOG: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'Insert Into LOG ( IP_ADDRESS, EVENT, CREATED ) '#13#10'Values ( :IP_AD' +
      'DRESS, :EVENT, CURRENT_TIMESTAMP)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'IP_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'EVENT'
        ParamType = ptInput
      end>
    SQLConnection = DataSnap_Server_Log
    Left = 43
    Top = 131
    object SqlLOGIP_ADDRESS: TWideStringField
      FieldName = 'IP_ADDRESS'
      Required = True
    end
    object SqlLOGEVENT: TWideStringField
      FieldName = 'EVENT'
      Required = True
      Size = 50
    end
    object SqlLOGCREATED: TSQLTimeStampField
      DisplayLabel = 'Date Time'
      FieldName = 'CREATED'
      Required = True
    end
  end
  object SQLLocalDSServer: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'Port=213'
      'Filters={}'
      'DSAuthenticationPassword=a'
      'DSAuthenticationUser=a')
    Left = 424
    Top = 128
  end
  object DSMainServerModule: TDSServerClass
    OnGetClass = DSMainServerModuleGetClass
    Server = MyDSServer
    Left = 136
    Top = 304
  end
  object Employee: TSQLConnection
    DriverName = 'INTERBASE'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'drivername=INTERBASE'
      
        'database=localhost/gds_db:C:\Embarcadero\InterBase\examples\data' +
        'base\employee.ib')
    Left = 138
    Top = 130
  end
  object DSLookupRDM: TDSServerClass
    OnGetClass = DSLookupRDMGetClass
    Server = MyDSServer
    LifeCycle = 'Server'
    Left = 256
    Top = 304
  end
  object DSSDepartament: TDSServerClass
    OnGetClass = DSSDepartamentGetClass
    Server = MyDSServer
    LifeCycle = 'Server'
    Left = 136
    Top = 224
  end
  object DSServerBatch: TDSServerClass
    OnGetClass = DSServerBatchGetClass
    Server = MyDSServer
    Left = 360
    Top = 304
  end
  object DSHTTPService1: TDSHTTPService
    HttpPort = 8010
    Server = MyDSServer
    DSPort = 220
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    Left = 296
    Top = 24
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    Roles = <
      item
        AuthorizedRoles.Strings = (
          'admin')
        DeniedRoles.Strings = (
          'user')
        ApplyTo.Strings = (
          'TUser.EnableUser'
          'TUser.DisableUser')
      end>
    Left = 480
    Top = 32
  end
  object DSServerMasterDetail: TDSServerClass
    OnGetClass = DSServerMasterDetailGetClass
    Server = MyDSServer
    Left = 376
    Top = 216
  end
  object DSDMDataSet1: TDSServerClass
    OnGetClass = DSDMDataSet1GetClass
    Server = MyDSServer
    Left = 496
    Top = 208
  end
  object DSDMDataSet2: TDSServerClass
    OnGetClass = DSDMDataSet2GetClass
    Server = MyDSServer
    Left = 496
    Top = 272
  end
  object DSDMDataSet3: TDSServerClass
    OnGetClass = DSDMDataSet3GetClass
    Server = MyDSServer
    Left = 496
    Top = 328
  end
  object DSDMDataSet5: TDSServerClass
    OnGetClass = DSDMDataSet5GetClass
    Server = MyDSServer
    LifeCycle = 'Server'
    Left = 352
    Top = 360
  end
  object DSDMDataSet6: TDSServerClass
    OnGetClass = DSDMDataSet6GetClass
    Server = MyDSServer
    LifeCycle = 'Server'
    Left = 256
    Top = 360
  end
  object DSProxyGenerator1: TDSProxyGenerator
    Left = 496
    Top = 128
  end
end
