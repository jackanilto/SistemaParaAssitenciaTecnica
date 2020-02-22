inherited formRelatorioVendas: TformRelatorioVendas
  Caption = 'Relatorio de vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited sbImprimir: TSpeedButton
      Left = -1
      ExplicitLeft = -1
    end
    inherited sbExportar: TSpeedButton
      Left = 142
      ExplicitLeft = 142
    end
  end
  inherited DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Height = 226
    Align = alCustom
  end
  object GroupBox1: TGroupBox [3]
    Left = 0
    Top = 280
    Width = 1019
    Height = 208
    Align = alBottom
    Caption = 'Lista de produtos'
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 1015
      Height = 191
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  inherited frxReport1: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
