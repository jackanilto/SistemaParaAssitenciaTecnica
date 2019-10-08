inherited formFormaPagamento: TformFormaPagamento
  Caption = 'Formas de pagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblCaption: TLabel
      Width = 161
      Caption = 'Formas de pagamento'
      ExplicitLeft = 195
      ExplicitWidth = 161
    end
  end
  inherited CardPanel1: TCardPanel
    inherited cardPanelConsulta: TCard
      inherited DBGrid1: TDBGrid
        DataSource = DataSource1
      end
    end
  end
  object DataSource1: TDataSource
    Left = 368
    Top = 257
  end
end
