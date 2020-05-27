object tabela: Ttabela
  OldCreateOrder = False
  Height = 220
  Width = 461
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\noels\Desktop\Arquivos da area de trabalho\Exe' +
        'mplos de estudos de Praticas no delphi\Teste Onguard\banco\TESTE' +
        '.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 48
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Left = 144
    Top = 32
  end
  object FDPhysFBDriverLink2: TFDPhysFBDriverLink
    Left = 248
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from table_name')
    Left = 64
    Top = 128
    object FDQuery1ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1CC1: TStringField
      FieldName = 'CC1'
      Origin = 'CC1'
      Size = 255
    end
    object FDQuery1CC2: TStringField
      FieldName = 'CC2'
      Origin = 'CC2'
      Size = 50
    end
    object FDQuery1CC3: TStringField
      FieldName = 'CC3'
      Origin = 'CC3'
      Size = 50
    end
    object FDQuery1CC4: TStringField
      FieldName = 'CC4'
      Origin = 'CC4'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDQuery1
    Left = 144
    Top = 128
  end
end
