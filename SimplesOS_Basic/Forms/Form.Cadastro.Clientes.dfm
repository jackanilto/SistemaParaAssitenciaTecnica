inherited formCadastroDeClientes: TformCadastroDeClientes
  Caption = 'Cadastro de clientes'
  ClientHeight = 607
  ClientWidth = 1031
  OnClose = FormClose
  ExplicitWidth = 1031
  ExplicitHeight = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1031
    ExplicitWidth = 1031
    inherited sbFechar: TSpeedButton
      Left = 979
      ExplicitLeft = 1066
    end
    inherited lblCaption: TLabel
      Left = 309
      Width = 144
      Caption = 'Cadastro de clientes'
      ExplicitLeft = 195
      ExplicitWidth = 144
    end
  end
  inherited Panel2: TPanel
    Width = 1031
    ExplicitWidth = 1031
  end
  inherited Panel3: TPanel
    Top = 532
    Width = 1031
    ExplicitTop = 532
    ExplicitWidth = 1031
    inherited Label4: TLabel
      Left = 697
      ExplicitLeft = 784
    end
    inherited Label5: TLabel
      Left = 832
      ExplicitLeft = 919
    end
    inherited cbPesquisar: TComboBox
      Left = 697
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'CPF ou CNPJ'
        'Tipo cadastro')
      ExplicitLeft = 697
    end
    inherited edtPesquisar: TEdit
      Left = 832
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 832
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 1031
    Height = 451
    ExplicitWidth = 1031
    ExplicitHeight = 451
    inherited cardPanelCadatro: TCard
      Width = 1031
      Height = 451
      ExplicitWidth = 1031
      ExplicitHeight = 451
      object Label1: TLabel
        Left = 10
        Top = 9
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
        Left = 10
        Top = 70
        Width = 36
        Height = 17
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 338
        Top = 104
        Width = 38
        Height = 17
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 225
        Top = 9
        Width = 100
        Height = 17
        Caption = 'Tipo de cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 135
        Width = 97
        Height = 17
        Caption = 'Data nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCPF: TLabel
        Left = 225
        Top = 135
        Width = 73
        Height = 17
        Caption = 'CPF ou CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 113
        Top = 135
        Width = 101
        Height = 17
        Caption = 'Data de cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 198
        Width = 67
        Height = 17
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 10
        Top = 381
        Width = 35
        Height = 17
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 736
        Top = 9
        Width = 48
        Height = 17
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 10
        Top = 260
        Width = 22
        Height = 17
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 457
        Top = 70
        Width = 41
        Height = 17
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 763
        Top = 70
        Width = 40
        Height = 17
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 457
        Top = 135
        Width = 49
        Height = 17
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 648
        Top = 135
        Width = 40
        Height = 17
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 457
        Top = 197
        Width = 37
        Height = 17
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 457
        Top = 260
        Width = 67
        Height = 17
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 584
        Top = 260
        Width = 110
        Height = 17
        Caption = 'Situa'#231#227'o do cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 457
        Top = 9
        Width = 82
        Height = 17
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 457
        Top = 322
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
      object sbPesquisarCep: TSpeedButton
        Left = 382
        Top = 283
        Width = 25
        Height = 25
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C30E0000C30E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E5AA5454881010A14242EB
          D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E59C38388000
          00800000800000A14242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EDED
          9A3434800000800000800000800000881010FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF6EDEDD7AFAFBA7474A95252A44848AC5858C18383E1C3C3FBF7F7FF
          FFFFF2E5E59A3434800000800000800000800000800000AA5454FFFFFFFFFFFF
          FFFFFFFFFFFFF6EDEDC183838D1A1A8102028000008000008000008000008000
          00830606983030CF9F9F9C38388000008000008000008000008000009C3838F2
          E5E5FFFFFFFFFFFFFFFFFFE9D3D3983030800000800000800000800000800000
          8000008000008000008000008000008000008000008000008000008000008000
          009A3434F2E5E5FFFFFFFFFFFFFFFFFFE6CDCD89121280000080000080000087
          0E0EA34646BC7878C28585B76E6E9C3838830606800000800000800000800000
          8000008000009A3434F6EDEDFFFFFFFFFFFFFFFFFFF2E5E59326268000008000
          00820404B16262EDDBDBFEFDFDFFFFFFFFFFFFFFFFFFFCF9F9E3C7C7A0404080
          00008000008000008000009C3838F2E5E5FFFFFFFFFFFFFFFFFFFFFFFFB46868
          800000800000820404C68D8DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBF7F7AE5C5C800000800000800000CF9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFEBD7D7860C0C800000800000BA7474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F7A04040800000800000983030FBF7
          F7FFFFFFFFFFFFFFFFFFC38787800000800000902020F4E9E9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3C7C7830606
          800000830606E1C3C3FFFFFFFFFFFFFFFFFFA24444800000800000B76E6EFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCF9F99C3838800000800000C18383FFFFFFFFFFFFFFFFFF8D1A1A800000
          800000D6ADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB76E6E800000800000AC5858FFFFFFFFFFFFFF
          FFFF860C0C800000800000E0C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC28585800000800000A448
          48FFFFFFFFFFFFFFFFFF8A1414800000800000DAB5B5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC7878
          800000800000A95252FFFFFFFFFFFFFFFFFF9C3838800000800000C08181FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFDA34646800000800000BA7474FFFFFFFFFFFFFFFFFFBA7474800000
          800000983030FAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEDDBDB870E0E800000810202D7AFAFFFFFFFFFFFFFFF
          FFFFE1C3C3830606800000810202CE9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDB162628000008000008D1A1AF6ED
          EDFFFFFFFFFFFFFFFFFFFEFDFDA44848800000800000881010DFBFBFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC68D8D820404800000
          800000C18383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCF8912128000008000
          00881010CE9D9DFAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9E9BA747482
          0404800000800000983030F6EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D3A7A7810202800000800000810202983030C08181DAB5B5E0C1C1D6ADADB76E
          6E902020800000800000800000891212E9D3D3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD3A7A7891212800000800000800000800000800000
          800000800000800000800000800000800000932626E6CDCDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCFA4484883060680
          0000800000800000800000800000800000800000860C0CB46868F2E5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFDFDE1C3C3B972729C38388A1414860C0C8D1A1AA24444C38787EBD7D7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbPesquisarCepClick
      end
      object Image1: TImage
        Left = 858
        Top = 32
        Width = 153
        Height = 151
        Stretch = True
      end
      object Label23: TLabel
        Left = 874
        Top = 13
        Width = 22
        Height = 13
        Caption = 'Foto'
      end
      object SpeedButton1: TSpeedButton
        Left = 858
        Top = 198
        Width = 153
        Height = 29
        Caption = 'Localizar imagem'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C30E0000C30E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E5AA5454881010A14242EB
          D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E59C38388000
          00800000800000A14242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EDED
          9A3434800000800000800000800000881010FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF6EDEDD7AFAFBA7474A95252A44848AC5858C18383E1C3C3FBF7F7FF
          FFFFF2E5E59A3434800000800000800000800000800000AA5454FFFFFFFFFFFF
          FFFFFFFFFFFFF6EDEDC183838D1A1A8102028000008000008000008000008000
          00830606983030CF9F9F9C38388000008000008000008000008000009C3838F2
          E5E5FFFFFFFFFFFFFFFFFFE9D3D3983030800000800000800000800000800000
          8000008000008000008000008000008000008000008000008000008000008000
          009A3434F2E5E5FFFFFFFFFFFFFFFFFFE6CDCD89121280000080000080000087
          0E0EA34646BC7878C28585B76E6E9C3838830606800000800000800000800000
          8000008000009A3434F6EDEDFFFFFFFFFFFFFFFFFFF2E5E59326268000008000
          00820404B16262EDDBDBFEFDFDFFFFFFFFFFFFFFFFFFFCF9F9E3C7C7A0404080
          00008000008000008000009C3838F2E5E5FFFFFFFFFFFFFFFFFFFFFFFFB46868
          800000800000820404C68D8DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBF7F7AE5C5C800000800000800000CF9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFEBD7D7860C0C800000800000BA7474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F7A04040800000800000983030FBF7
          F7FFFFFFFFFFFFFFFFFFC38787800000800000902020F4E9E9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3C7C7830606
          800000830606E1C3C3FFFFFFFFFFFFFFFFFFA24444800000800000B76E6EFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCF9F99C3838800000800000C18383FFFFFFFFFFFFFFFFFF8D1A1A800000
          800000D6ADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB76E6E800000800000AC5858FFFFFFFFFFFFFF
          FFFF860C0C800000800000E0C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC28585800000800000A448
          48FFFFFFFFFFFFFFFFFF8A1414800000800000DAB5B5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC7878
          800000800000A95252FFFFFFFFFFFFFFFFFF9C3838800000800000C08181FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFDA34646800000800000BA7474FFFFFFFFFFFFFFFFFFBA7474800000
          800000983030FAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEDDBDB870E0E800000810202D7AFAFFFFFFFFFFFFFFF
          FFFFE1C3C3830606800000810202CE9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDB162628000008000008D1A1AF6ED
          EDFFFFFFFFFFFFFFFFFFFEFDFDA44848800000800000881010DFBFBFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC68D8D820404800000
          800000C18383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCF8912128000008000
          00881010CE9D9DFAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9E9BA747482
          0404800000800000983030F6EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D3A7A7810202800000800000810202983030C08181DAB5B5E0C1C1D6ADADB76E
          6E902020800000800000800000891212E9D3D3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD3A7A7891212800000800000800000800000800000
          800000800000800000800000800000800000932626E6CDCDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCFA4484883060680
          0000800000800000800000800000800000800000860C0CB46868F2E5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFDFDE1C3C3B972729C38388A1414860C0C8D1A1AA24444C38787EBD7D7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Label24: TLabel
        Left = 10
        Top = 322
        Width = 55
        Height = 17
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 10
        Top = 32
        Width = 209
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 10
        Top = 93
        Width = 400
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
      object edtCPFCNPJ: TEdit
        Left = 220
        Top = 158
        Width = 185
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnExit = edtCPFCNPJExit
      end
      object edtDocumento: TEdit
        Left = 10
        Top = 221
        Width = 400
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
      object edtBairro: TEdit
        Left = 10
        Top = 404
        Width = 400
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
      object edtComplemento: TEdit
        Left = 457
        Top = 32
        Width = 273
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
      object edtNumero: TEdit
        Left = 736
        Top = 32
        Width = 105
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object edtCidade: TEdit
        Left = 457
        Top = 93
        Width = 300
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object edtEmail: TEdit
        Left = 457
        Top = 221
        Width = 383
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object edtFuncionario: TEdit
        Left = 457
        Top = 283
        Width = 121
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object edtObservacao: TEdit
        Left = 457
        Top = 345
        Width = 406
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
      end
      object edtTipoCadastro: TComboBox
        Left = 225
        Top = 32
        Width = 185
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'PF'
        Items.Strings = (
          'PF'
          'PJ')
      end
      object edtEstado: TComboBox
        Left = 763
        Top = 94
        Width = 77
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object edtDataNascimento: TMaskEdit
        Left = 10
        Top = 158
        Width = 96
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
        OnExit = edtDataNascimentoExit
      end
      object edtDataCadastro: TMaskEdit
        Left = 112
        Top = 158
        Width = 102
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnExit = edtDataCadastroExit
      end
      object edtTelefone: TMaskEdit
        Left = 459
        Top = 158
        Width = 183
        Height = 25
        EditMask = '(00)0000-0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 14
        Text = '(  )    -    '
      end
      object edtCelular: TMaskEdit
        Left = 646
        Top = 158
        Width = 194
        Height = 25
        EditMask = '(00)0000-0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 15
        Text = '(  )    -    '
      end
      object edtCEP: TEdit
        Left = 10
        Top = 283
        Width = 366
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
      object edtEndereco: TEdit
        Left = 10
        Top = 345
        Width = 400
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edtSituacaoCliente: TComboBox
        Left = 584
        Top = 283
        Width = 256
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 18
        Text = 'ATIVO'
        Items.Strings = (
          'ATIVO'
          'INATIVO')
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 1031
      Height = 451
      ExplicitWidth = 1031
      ExplicitHeight = 451
      inherited Panel4: TPanel
        Top = 406
        Width = 1031
        ExplicitTop = 406
        ExplicitWidth = 1031
        inherited sbImprimir: TSpeedButton
          Left = 756
          OnClick = sbImprimirClick
          ExplicitLeft = 843
        end
        inherited sbExportar: TSpeedButton
          Left = 867
          OnClick = sbExportarClick
          ExplicitLeft = 954
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 1031
        Height = 406
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 728
    Top = 9
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 648
    Top = 9
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsRepublicaVirtual
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 824
    Top = 9
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.cur;*.pcx;*.ani;*.png_old;*.gif;*.png;*.jpg;*.jpeg;' +
      '*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff)|*.jpg; *.jpeg|CompuServe G' +
      'IF Image (*.gif)||Cursor files (*.cur)||PCX Image (*.pcx)||ANI I' +
      'mage (*.ani)||Portable Network Graphics (*.png_old)||GIF Image (' +
      '*.gif)||Portable Network Graphics (*.png)||JPEG Image File (*.jp' +
      'g)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)||Icons ' +
      '(*.ico)||Enhanced Metafiles (*.emf)||Metafiles (*.wmf)||TIFF Ima' +
      'ges (*.tif)||TIFF Images (*.tiff)'
    Left = 928
    Top = 425
  end
  object frxDB_Clientes: TfrxDBDataset
    UserName = 'frxDB_Clientes'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 792
    Top = 105
  end
  object frx_Clientes: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43775.497262662040000000
    ReportOptions.LastChange = 43924.632340069450000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 680
    Top = 105
    Datasets = <
      item
        DataSet = frxDB_Clientes
        DataSetName = 'frxDB_Clientes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 166.299320000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'roboto'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de clientes')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 56.913420000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 60.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 419.527830000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_Clientes
        DataSetName = 'frxDB_Clientes'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo:')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 11.338590000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."ID"]')
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 162.519790000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo de cadastro:')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."TIPO_CADASTRO"]')
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome:')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 41.574830000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."NOME"]')
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 120.944960000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data nascimento:')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."DATA_NASCIMENTO"]')
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 60.472480000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de cadastro:')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."DATA_CADASTRO"]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 102.047310000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF ou CNPJ:')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Documento:')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 102.047310000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."DOCUMENTO"]')
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 90.708720000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 362.834880000000000000
          Top = 102.047310000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."CPF_CNPJ"]')
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 151.181200000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Top = 181.417440000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 132.283550000000000000
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."ENDERECO"]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 162.519790000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro:')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 162.519790000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."BAIRRO"]')
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 151.181200000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 162.519790000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero:')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 162.519790000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."NUMERO"]')
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape9: TfrxShapeView
          AllowVectorExport = True
          Top = 241.889920000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape10: TfrxShapeView
          AllowVectorExport = True
          Top = 272.126160000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape11: TfrxShapeView
          AllowVectorExport = True
          Top = 302.362400000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 192.756030000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Complemento:')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 192.756030000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."COMPLEMENTO"]')
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 306.141930000000000000
          Top = 192.756030000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 192.756030000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."CEP"]')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 222.992270000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 222.992270000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."CIDADE"]')
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 366.614410000000000000
          Top = 211.653680000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 222.992270000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Estado:')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 222.992270000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."ESTADO"]')
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 253.228510000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone:')
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 253.228510000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."TELEFONE"]')
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 245.669450000000000000
          Top = 241.889920000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 253.228510000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Celular:')
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 253.228510000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."CELULAR"]')
        end
        object Shape12: TfrxShapeView
          AllowVectorExport = True
          Top = 332.598640000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 283.464750000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'E-Mail:')
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 283.464750000000000000
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."EMAIL"]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 313.700990000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Funcion'#225'rio:')
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 313.700990000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."FUNCIONARIO_CADASTRO"]')
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Top = 302.362400000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 313.700990000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o do cliente:')
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Top = 313.700990000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."SITUACAO_CLIENTE"]')
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 343.937230000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#227'o:')
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 343.937230000000000000
          Width = 612.283860000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Clientes."OBSERVACAO"]')
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 26.236240000000000000
          Top = 392.291590000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 725.669760000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
end
