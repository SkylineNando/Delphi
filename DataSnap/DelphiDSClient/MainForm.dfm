object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'DataSnap Client'
  ClientHeight = 529
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 793
    Height = 529
    ActivePage = TabSheet3
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Using Server Methods'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        785
        477)
      object LBDateTime: TLabel
        Left = 224
        Top = 32
        Width = 401
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Server Date/Time'
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Button4: TButton
        Left = 11
        Top = 16
        Width = 182
        Height = 65
        Caption = 'Get Server Date Time'
        TabOrder = 0
        OnClick = Button4Click
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 184
        Width = 779
        Height = 290
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Jobs avaliable '
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 2
          Top = 18
          Width = 775
          Height = 270
          ActivePage = TabSheet4
          Align = alClient
          TabOrder = 0
          object TBJobList: TTabSheet
            Caption = 'Job List'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object DBGrid3: TDBGrid
              Left = 0
              Top = 0
              Width = 767
              Height = 239
              Align = alClient
              DataSource = DSJobs
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'JOBNAME'
                  Width = 232
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPTION'
                  Width = 355
                  Visible = True
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Job Detail'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            DesignSize = (
              767
              239)
            object Label1: TLabel
              Left = 11
              Top = 10
              Width = 12
              Height = 16
              Caption = 'ID'
              FocusControl = DBEJobId
            end
            object Label2: TLabel
              Left = 11
              Top = 64
              Width = 33
              Height = 16
              Caption = 'Name'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 11
              Top = 112
              Width = 63
              Height = 16
              Caption = 'Description'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 11
              Top = 160
              Width = 26
              Height = 16
              Caption = 'CMD'
              FocusControl = DBEdit4
              Visible = False
            end
            object DBEJobId: TDBEdit
              Left = 11
              Top = 32
              Width = 63
              Height = 24
              DataField = 'JOBID'
              DataSource = DSJobs
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 11
              Top = 80
              Width = 358
              Height = 24
              DataField = 'JOBNAME'
              DataSource = DSJobs
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 11
              Top = 128
              Width = 358
              Height = 24
              DataField = 'DESCRIPTION'
              DataSource = DSJobs
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 11
              Top = 176
              Width = 430
              Height = 24
              DataField = 'JOBCMD'
              DataSource = DSJobs
              TabOrder = 3
              Visible = False
            end
            object Button5: TButton
              Left = 614
              Top = 202
              Width = 150
              Height = 34
              Anchors = [akRight, akBottom]
              Caption = 'Execute Job on Server'
              TabOrder = 4
              OnClick = Button5Click
            end
            object DBNavigator3: TDBNavigator
              Left = 11
              Top = 206
              Width = 216
              Height = 25
              DataSource = DSJobs
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Kind = dbnHorizontal
              TabOrder = 5
            end
            object ApplyUpdates: TButton
              Left = 632
              Top = 163
              Width = 113
              Height = 33
              Caption = 'ApplyUpdates'
              TabOrder = 6
              OnClick = ApplyUpdatesClick
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Using ClientDataSet (Master-Detail)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 129
        Align = alTop
        DataSource = DSCountry
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 154
        Width = 785
        Height = 233
        Align = alClient
        DataSource = DSEmployee
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 412
        Width = 785
        Height = 65
        Align = alBottom
        TabOrder = 2
        object Button1: TButton
          Left = 423
          Top = 15
          Width = 121
          Height = 42
          Caption = 'ApplyUpdates'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button3: TButton
          Left = 275
          Top = 15
          Width = 121
          Height = 41
          Caption = 'Close'
          TabOrder = 1
          WordWrap = True
          OnClick = Button3Click
        end
        object Button2: TButton
          Left = 131
          Top = 15
          Width = 121
          Height = 42
          Caption = 'Open'
          TabOrder = 2
          WordWrap = True
          OnClick = Button2Click
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 387
        Width = 785
        Height = 25
        DataSource = DSEmployee
        Align = alBottom
        Kind = dbnHorizontal
        TabOrder = 3
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 129
        Width = 785
        Height = 25
        DataSource = DSCountry
        Align = alTop
        Kind = dbnHorizontal
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Reading data from DBXReader'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        785
        477)
      object Label5: TLabel
        Left = 21
        Top = 73
        Width = 586
        Height = 87
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        Caption = 
          'TDepartment is a Singleton object (LifeCycle=Server) - Open 2 cl' +
          'ient application to see the singleton objects working'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object BTGetDepartament: TButton
        Left = 3
        Top = 16
        Width = 254
        Height = 49
        Caption = 'Get Department'
        TabOrder = 0
        OnClick = BTGetDepartamentClick
      end
      object Button8: TButton
        Left = 288
        Top = 16
        Width = 209
        Height = 49
        Caption = 'Set Department Ordered by ID'
        TabOrder = 1
        WordWrap = True
        OnClick = Button8Click
      end
      object Memo1: TMemo
        Left = 3
        Top = 166
        Width = 779
        Height = 308
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Button6: TButton
        Left = 528
        Top = 16
        Width = 220
        Height = 49
        Caption = 'Set Department Ordered by Name'
        TabOrder = 3
        WordWrap = True
        OnClick = Button6Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Using DBX framework to send TParams'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button7: TButton
        Left = 27
        Top = 64
        Width = 238
        Height = 57
        Caption = 'Insert (sending TParams)'
        TabOrder = 0
        OnClick = Button7Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Callback'
      ImageIndex = 4
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button9: TButton
        Left = 624
        Top = 16
        Width = 147
        Height = 57
        Caption = 'Start Backup'
        TabOrder = 0
        OnClick = Button9Click
      end
      object MMBackupLog: TMemo
        Left = 3
        Top = 3
        Width = 615
        Height = 430
        TabOrder = 1
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Object Transfer'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button10: TButton
        Left = 64
        Top = 40
        Width = 179
        Height = 49
        Caption = 'Get TCustomer as JSON'
        TabOrder = 0
        OnClick = Button10Click
      end
      object MMLog: TMemo
        Left = 280
        Top = 16
        Width = 465
        Height = 425
        TabOrder = 3
      end
      object Button11: TButton
        Left = 64
        Top = 209
        Width = 179
        Height = 73
        Caption = 'Get List of TCustomer'
        TabOrder = 1
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 64
        Top = 288
        Width = 179
        Height = 73
        Caption = 'Get List of String, Number  and Boolean'
        TabOrder = 2
        WordWrap = True
        OnClick = Button12Click
      end
      object Button14: TButton
        Left = 64
        Top = 95
        Width = 179
        Height = 49
        Caption = 'Get TCustomer as TObject'
        TabOrder = 4
        OnClick = Button14Click
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Copying DataReader to DataSet'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid4: TDBGrid
        Left = 32
        Top = 48
        Width = 689
        Height = 305
        DataSource = DSCopy
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Button13: TButton
        Left = 560
        Top = 359
        Width = 161
        Height = 65
        Caption = 'Copy Department DBXReader to ClientDataSet'
        TabOrder = 1
        WordWrap = True
        OnClick = Button13Click
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Master-Detail 1 Transaction'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 129
        Align = alTop
        DataSource = DSDepMaster
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid6: TDBGrid
        Left = 0
        Top = 154
        Width = 785
        Height = 233
        Align = alClient
        DataSource = DSDetailEmployee
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator4: TDBNavigator
        Left = 0
        Top = 129
        Width = 785
        Height = 25
        DataSource = DSDepMaster
        Align = alTop
        Kind = dbnHorizontal
        TabOrder = 2
      end
      object DBNavigator5: TDBNavigator
        Left = 0
        Top = 452
        Width = 785
        Height = 25
        DataSource = DSDetailEmployee
        Align = alBottom
        Kind = dbnHorizontal
        TabOrder = 3
      end
      object Panel2: TPanel
        Left = 0
        Top = 387
        Width = 785
        Height = 65
        Align = alBottom
        TabOrder = 4
        object Button15: TButton
          Left = 423
          Top = 15
          Width = 121
          Height = 42
          Caption = 'ApplyUpdates'
          TabOrder = 0
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 275
          Top = 15
          Width = 121
          Height = 41
          Caption = 'Close'
          TabOrder = 1
          WordWrap = True
          OnClick = Button16Click
        end
        object Button17: TButton
          Left = 131
          Top = 15
          Width = 121
          Height = 42
          Caption = 'Open'
          TabOrder = 2
          WordWrap = True
          OnClick = Button17Click
        end
      end
    end
  end
  object DSCountry: TDataSource
    DataSet = DMClientContainer.CDSCountry
    Left = 216
    Top = 448
  end
  object DSEmployee: TDataSource
    DataSet = DMClientContainer.CDSEmployee
    Left = 368
    Top = 448
  end
  object DSJobs: TDataSource
    DataSet = DMClientContainer.CDSJobs
    Left = 144
    Top = 448
  end
  object DSDepartment: TDataSource
    DataSet = DMClientContainer.CDSDepartment
    Left = 664
    Top = 448
  end
  object DSCopy: TDataSource
    DataSet = DMClientContainer.CDSCopy
    Left = 544
    Top = 448
  end
  object DSDepMaster: TDataSource
    DataSet = DMClientContainer.CDSDepMaster
    Left = 104
    Top = 312
  end
  object DSDetailEmployee: TDataSource
    DataSet = DMClientContainer.CDSDepartment
    Left = 168
    Top = 368
  end
end
