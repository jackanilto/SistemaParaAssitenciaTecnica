inherited formCadastroContasAPagar: TformCadastroContasAPagar
  Caption = 'Cadastro de contas a pagar'
  ClientHeight = 595
  ClientWidth = 1043
  ExplicitWidth = 1043
  ExplicitHeight = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1043
    inherited sbFechar: TSpeedButton
      Left = 991
    end
    inherited lblCaption: TLabel
      Left = 311
      Width = 197
      Caption = 'Cadastro de contas a pagar'
      ExplicitLeft = 185
      ExplicitWidth = 197
    end
  end
  inherited Panel2: TPanel
    Width = 1043
  end
  inherited Panel3: TPanel
    Top = 520
    Width = 1043
    inherited Label4: TLabel
      Left = 709
    end
    inherited Label5: TLabel
      Left = 844
    end
    inherited cbPesquisar: TComboBox
      Left = 709
    end
    inherited edtPesquisar: TEdit
      Left = 844
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 1043
    Height = 439
    inherited cardPanelCadatro: TCard
      Width = 1043
      Height = 439
    end
    inherited cardPanelConsulta: TCard
      Width = 1043
      Height = 439
      inherited Panel4: TPanel
        Top = 394
        Width = 1043
        inherited sbImprimir: TSpeedButton
          Left = 768
        end
        inherited sbExportar: TSpeedButton
          Left = 879
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 1043
        Height = 394
        DataSource = DataSource1
      end
    end
  end
  object DataSource1: TDataSource
    Left = 376
    Top = 249
  end
end
