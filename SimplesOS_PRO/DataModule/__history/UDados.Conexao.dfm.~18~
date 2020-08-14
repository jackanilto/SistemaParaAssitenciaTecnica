object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 327
  Width = 768
  object conexao: TFDConnection
    Params.Strings = (
      'Port=3050'
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    BeforeConnect = conexaoBeforeConnect
    Left = 40
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = conexao
    Left = 120
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 224
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 336
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from configurar_parcela')
    Left = 352
    Top = 128
    object FDQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object FDQuery1JUROS: TBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Precision = 18
      Size = 2
    end
    object FDQuery1MULTA: TCurrencyField
      FieldName = 'MULTA'
      Origin = 'MULTA'
    end
  end
end
