inherited formComissoesFuncionarios: TformComissoesFuncionarios
  Caption = 'Cadastro Comiss'#245'es dos Funcion'#225'rios'
  ClientHeight = 368
  ExplicitHeight = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblCaption: TLabel
      Width = 274
      Caption = 'Cadastro Comiss'#245'es dos Funcion'#225'rios'
      ExplicitLeft = 195
      ExplicitWidth = 274
    end
  end
  inherited Panel3: TPanel
    Top = 293
    ExplicitTop = 293
    inherited sbNovo: TSpeedButton
      Width = 177
      Caption = 'Incluir comiss'#227'o'
      ExplicitWidth = 177
    end
    inherited sbSalvar: TSpeedButton
      Left = 190
      ExplicitLeft = 190
    end
    inherited sbEditar: TSpeedButton
      Left = 297
      ExplicitLeft = 297
    end
    inherited sbExcluir: TSpeedButton
      Left = 383
      ExplicitLeft = 383
    end
    inherited sbCancelar: TSpeedButton
      Left = 489
      ExplicitLeft = 489
    end
    inherited Label4: TLabel
      Left = 687
      Top = 35
      Visible = False
      ExplicitLeft = 687
      ExplicitTop = 35
    end
    inherited Label5: TLabel
      Left = 822
      Top = 35
      Visible = False
      ExplicitLeft = 822
      ExplicitTop = 35
    end
    inherited cbPesquisar: TComboBox
      Left = 687
      Top = 56
      Visible = False
      ExplicitLeft = 687
      ExplicitTop = 56
    end
    inherited edtPesquisar: TEdit
      Left = 822
      Top = 56
      Visible = False
      ExplicitLeft = 822
      ExplicitTop = 56
    end
  end
  inherited CardPanel1: TCardPanel
    Height = 212
    ExplicitHeight = 212
    inherited cardPanelCadatro: TCard
      Height = 212
      ExplicitHeight = 212
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 43
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 14
        Top = 64
        Width = 132
        Height = 17
        Caption = 'C'#243'digo do funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 122
        Width = 99
        Height = 17
        Caption = 'Aplicar comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 295
        Top = 8
        Width = 135
        Height = 17
        Caption = 'Valor da comiss'#227'o (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 295
        Top = 64
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 14
        Top = 31
        Width = 227
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCodigoFuncionario: TEdit
        Left = 14
        Top = 87
        Width = 227
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtValorComissao: TEdit
        Left = 295
        Top = 31
        Width = 227
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtObservacao: TEdit
        Left = 295
        Top = 87
        Width = 227
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtAplicarComissao: TComboBox
        Left = 14
        Top = 145
        Width = 227
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 4
        Text = 'Sim'
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
    end
    inherited cardPanelConsulta: TCard
      Height = 212
      ExplicitHeight = 212
      inherited Panel4: TPanel
        Top = 167
        ExplicitTop = 167
        inherited sbImprimir: TSpeedButton
          Visible = False
        end
        inherited sbExportar: TSpeedButton
          Visible = False
        end
      end
      inherited DBGrid1: TDBGrid
        Height = 167
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 552
    Top = 41
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 472
    Top = 41
  end
end
