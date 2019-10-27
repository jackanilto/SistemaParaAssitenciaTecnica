inherited formCadastroDeFuncionarios: TformCadastroDeFuncionarios
  Caption = 'Cadastro de funcion'#225'rios'
  ClientHeight = 591
  ClientWidth = 1081
  ExplicitTop = -4
  ExplicitWidth = 1081
  ExplicitHeight = 591
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1081
    inherited sbFechar: TSpeedButton
      Left = 1029
    end
    inherited lblCaption: TLabel
      Left = 365
      Top = 16
      Width = 179
      Caption = 'Cadastro de funcion'#225'rios'
      ExplicitTop = 16
      ExplicitWidth = 179
    end
  end
  inherited Panel2: TPanel
    Width = 1081
  end
  inherited Panel3: TPanel
    Top = 516
    Width = 1081
    inherited Label4: TLabel
      Left = 747
    end
    inherited Label5: TLabel
      Left = 882
    end
    inherited cbPesquisar: TComboBox
      Left = 747
    end
    inherited edtPesquisar: TEdit
      Left = 882
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 1081
    Height = 435
    inherited cardPanelCadatro: TCard
      Width = 1081
      Height = 435
    end
    inherited cardPanelConsulta: TCard
      Width = 1081
      Height = 435
      inherited Panel4: TPanel
        Top = 390
        Width = 1081
        inherited sbImprimir: TSpeedButton
          Left = 806
        end
        inherited sbExportar: TSpeedButton
          Left = 917
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 1081
        Height = 390
        DataSource = DataSource1
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 680
    Top = 49
  end
  object DataSource1: TDataSource
    Left = 624
    Top = 209
  end
end
