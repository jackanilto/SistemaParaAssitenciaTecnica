inherited formCadastroContasAPagar: TformCadastroContasAPagar
  Caption = 'Cadastro de contas a pagar'
  ClientHeight = 456
  ClientWidth = 907
  ExplicitWidth = 907
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 907
    ExplicitWidth = 1043
    inherited sbFechar: TSpeedButton
      Left = 855
      ExplicitLeft = 991
    end
    inherited lblCaption: TLabel
      Left = 175
      Width = 197
      Caption = 'Cadastro de contas a pagar'
      ExplicitLeft = 185
      ExplicitWidth = 197
    end
  end
  inherited Panel2: TPanel
    Width = 907
    ExplicitWidth = 1043
  end
  inherited Panel3: TPanel
    Top = 381
    Width = 907
    ExplicitTop = 520
    ExplicitWidth = 1043
    inherited Label4: TLabel
      Left = 573
      ExplicitLeft = 709
    end
    inherited Label5: TLabel
      Left = 708
      ExplicitLeft = 844
    end
    inherited cbPesquisar: TComboBox
      Left = 573
      ExplicitLeft = 709
    end
    inherited edtPesquisar: TEdit
      Left = 708
      ExplicitLeft = 844
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 907
    Height = 300
    ExplicitWidth = 1043
    ExplicitHeight = 439
    inherited cardPanelCadatro: TCard
      Width = 907
      Height = 300
      ExplicitTop = 1
      ExplicitWidth = 1043
      ExplicitHeight = 439
      object Label1: TLabel
        Left = 32
        Top = 24
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
        Left = 32
        Top = 77
        Width = 34
        Height = 17
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 132
        Width = 67
        Height = 17
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 119
        Top = 132
        Width = 30
        Height = 17
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 32
        Top = 189
        Width = 31
        Height = 17
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 119
        Top = 189
        Width = 33
        Height = 17
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 212
        Top = 189
        Width = 55
        Height = 17
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 391
        Top = 23
        Width = 60
        Height = 17
        Caption = 'Valor total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 599
        Top = 23
        Width = 66
        Height = 17
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 391
        Top = 76
        Width = 27
        Height = 17
        Caption = 'Pgto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 478
        Top = 76
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
      object Label14: TLabel
        Left = 391
        Top = 132
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
        Left = 32
        Top = 43
        Width = 289
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtConta: TEdit
        Left = 32
        Top = 96
        Width = 289
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtValorConta: TEdit
        Left = 119
        Top = 152
        Width = 202
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtDataVencimento: TMaskEdit
        Left = 32
        Top = 152
        Width = 81
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        Text = '  /  /    '
      end
      object edtJuros: TEdit
        Left = 32
        Top = 209
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtMulta: TEdit
        Left = 119
        Top = 209
        Width = 87
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtDesconto: TEdit
        Left = 212
        Top = 209
        Width = 109
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edtValorTotal: TEdit
        Left = 391
        Top = 43
        Width = 202
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object edtDataPagamento: TMaskEdit
        Left = 599
        Top = 43
        Width = 81
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 8
        Text = '  /  /    '
      end
      object edtFuncionario: TEdit
        Left = 478
        Top = 96
        Width = 202
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edtObservacao: TEdit
        Left = 391
        Top = 152
        Width = 289
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object edtPgto: TComboBox
        Left = 391
        Top = 96
        Width = 75
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 1
        ParentFont = False
        TabOrder = 11
        Text = 'N'#227'o'
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 907
      Height = 300
      ExplicitWidth = 1043
      ExplicitHeight = 439
      inherited Panel4: TPanel
        Top = 255
        Width = 907
        ExplicitTop = 394
        ExplicitWidth = 1043
        inherited sbImprimir: TSpeedButton
          Left = 632
          ExplicitLeft = 768
        end
        inherited sbExportar: TSpeedButton
          Left = 743
          ExplicitLeft = 879
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 907
        Height = 255
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 640
    Top = 17
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 536
    Top = 25
  end
end
