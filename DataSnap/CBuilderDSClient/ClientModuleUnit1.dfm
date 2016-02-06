object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DSAuthenticationPassword=admin'
      'DSAuthenticationUser=admin'
      'DatasnapContext=datasnap/')
    Left = 48
    Top = 40
    UniqueId = '{19F6F4EE-5636-43FE-8E73-6706E8F026B3}'
  end
end
