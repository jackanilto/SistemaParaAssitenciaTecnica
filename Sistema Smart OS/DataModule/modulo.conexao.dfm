object modulo_conexao: Tmodulo_conexao
  OldCreateOrder = False
  Height = 338
  Width = 659
  object conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Nelson\Documents\GitHub\CoreApplicationDelphi_' +
        'FMX\Banco\BD_SMART_ESTOQUE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = conexaoBeforeConnect
    Left = 40
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = conexao
    Left = 144
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = conexao
    Left = 32
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 368
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 248
    Top = 24
  end
end
