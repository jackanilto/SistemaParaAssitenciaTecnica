object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 338
  Width = 748
  object conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Nelson\Documents\GitHub\SistemaParaAssitenciaT' +
        'ecnica\SimpleOs\Banco\BD_SIMPLE_OS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
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
end
