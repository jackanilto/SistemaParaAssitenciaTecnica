inherited formRetiradaDeValores: TformRetiradaDeValores
  Caption = 'Retirada de valores'
  ClientHeight = 443
  ClientWidth = 957
  ExplicitWidth = 957
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 957
    inherited sbFechar: TSpeedButton
      Left = 905
    end
    inherited lblCaption: TLabel
      Left = 235
      Width = 137
      Caption = 'Retirada de valores'
      ExplicitLeft = 195
      ExplicitWidth = 137
    end
  end
  inherited Panel2: TPanel
    Width = 957
  end
  inherited Panel3: TPanel
    Top = 368
    Width = 957
    inherited sbNovo: TSpeedButton
      Width = 146
      Caption = 'Nova retirada'
      ExplicitWidth = 146
    end
    inherited sbSalvar: TSpeedButton
      Left = 159
      ExplicitLeft = 159
    end
    inherited sbEditar: TSpeedButton
      Left = 932
      Top = 6
      Visible = False
      ExplicitLeft = 932
      ExplicitTop = 6
    end
    inherited sbExcluir: TSpeedButton
      Left = 254
      ExplicitLeft = 254
    end
    inherited sbCancelar: TSpeedButton
      Left = 360
      ExplicitLeft = 360
    end
    inherited Label4: TLabel
      Left = 623
    end
    inherited Label5: TLabel
      Left = 758
    end
    inherited cbPesquisar: TComboBox
      Left = 623
    end
    inherited edtPesquisar: TEdit
      Left = 758
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 957
    Height = 287
    ActiveCard = cardPanelCadatro
    inherited cardPanelCadatro: TCard
      Width = 957
      Height = 287
      Font.Height = -13
      Font.Name = 'Segoe UI'
      ParentFont = False
      ExplicitTop = 1
      ExplicitWidth = 957
      ExplicitHeight = 414
      object Label1: TLabel
        Left = 14
        Top = 41
        Width = 43
        Height = 17
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 14
        Top = 115
        Width = 80
        Height = 17
        Caption = 'C'#243'd. Retirada'
      end
      object Label3: TLabel
        Left = 107
        Top = 115
        Width = 55
        Height = 17
        Caption = 'Retiradas'
      end
      object Label6: TLabel
        Left = 14
        Top = 185
        Width = 30
        Height = 17
        Caption = 'Valor'
      end
      object Label7: TLabel
        Left = 520
        Top = 41
        Width = 96
        Height = 17
        Caption = 'Data da retirada'
      end
      object Label8: TLabel
        Left = 716
        Top = 41
        Width = 114
        Height = 17
        Caption = 'Hor'#225'rio da retirada'
      end
      object Label9: TLabel
        Left = 520
        Top = 115
        Width = 132
        Height = 17
        Caption = 'C'#243'digo do funcion'#225'rio'
      end
      object Label10: TLabel
        Left = 520
        Top = 185
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
      end
      object edtCodigo: TEdit
        Left = 14
        Top = 64
        Width = 400
        Height = 25
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCodRetirada: TEdit
        Left = 14
        Top = 138
        Width = 87
        Height = 25
        TabOrder = 1
      end
      object cbMotivoRetirada: TComboBox
        Left = 107
        Top = 138
        Width = 307
        Height = 25
        TabOrder = 2
        OnChange = cbMotivoRetiradaChange
      end
      object edtValor: TEdit
        Left = 14
        Top = 208
        Width = 400
        Height = 25
        TabOrder = 3
      end
      object edtData: TMaskEdit
        Left = 520
        Top = 64
        Width = 188
        Height = 25
        EditMask = '00/00/0000'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
      object edtHorario: TMaskEdit
        Left = 716
        Top = 64
        Width = 186
        Height = 25
        EditMask = '00:00:00'
        MaxLength = 8
        TabOrder = 5
        Text = '  :  :  '
      end
      object edtCodigoFuncionario: TEdit
        Left = 520
        Top = 138
        Width = 382
        Height = 25
        TabOrder = 6
      end
      object edtObservacao: TEdit
        Left = 520
        Top = 208
        Width = 382
        Height = 25
        TabOrder = 7
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 957
      Height = 287
      inherited Panel4: TPanel
        Top = 242
        Width = 957
        inherited sbImprimir: TSpeedButton
          Left = 682
        end
        inherited sbExportar: TSpeedButton
          Left = 793
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 957
        Height = 242
        DataSource = DataSource1
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 696
    Top = 17
  end
  object DataSource1: TDataSource
    Left = 568
    Top = 17
  end
end
