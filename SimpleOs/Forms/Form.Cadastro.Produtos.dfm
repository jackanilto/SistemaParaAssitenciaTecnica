inherited formCadastroProdutos: TformCadastroProdutos
  Caption = 'Cadastro de produtos'
  ClientHeight = 590
  ClientWidth = 1084
  OnClose = FormClose
  ExplicitTop = -36
  ExplicitWidth = 1084
  ExplicitHeight = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1084
    ExplicitWidth = 1084
    inherited sbFechar: TSpeedButton
      Left = 1032
      ExplicitLeft = 1032
    end
    inherited lblCaption: TLabel
      Left = 362
      Width = 154
      Caption = 'Cadastro de produtos'
      ExplicitLeft = 195
      ExplicitWidth = 154
    end
  end
  inherited Panel2: TPanel
    Width = 1084
    ExplicitWidth = 1084
  end
  inherited Panel3: TPanel
    Top = 515
    Width = 1084
    ExplicitTop = 515
    ExplicitWidth = 1084
    inherited sbEditar: TSpeedButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited Label4: TLabel
      Left = 750
      ExplicitLeft = 750
    end
    inherited Label5: TLabel
      Left = 885
      ExplicitLeft = 885
    end
    inherited cbPesquisar: TComboBox
      Left = 750
      Items.Strings = (
        'C'#243'digo'
        'C'#243'digo de barra'
        'Produto'
        '')
      ExplicitLeft = 750
    end
    inherited edtPesquisar: TEdit
      Left = 885
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 885
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 1084
    Height = 434
    ActiveCard = cardPanelCadatro
    ExplicitWidth = 1084
    ExplicitHeight = 434
    inherited cardPanelCadatro: TCard
      Width = 1084
      Height = 434
      ExplicitWidth = 1084
      ExplicitHeight = 434
      object Label1: TLabel
        Left = 16
        Top = 12
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
      object Label3: TLabel
        Left = 16
        Top = 69
        Width = 112
        Height = 17
        Caption = 'Produto ou Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 135
        Width = 104
        Height = 17
        Caption = 'C'#243'digo de barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 196
        Width = 57
        Height = 17
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 267
        Width = 103
        Height = 17
        Caption = 'Valor de custo R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 134
        Top = 267
        Width = 121
        Height = 17
        Caption = 'Margem de lucro(%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 288
        Top = 267
        Width = 107
        Height = 17
        Caption = 'Valor de venda R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 333
        Width = 78
        Height = 17
        Caption = 'QTDE m'#237'nima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 106
        Top = 333
        Width = 64
        Height = 17
        Caption = 'QTDE atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 212
        Top = 333
        Width = 50
        Height = 17
        Caption = 'Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 311
        Top = 333
        Width = 55
        Height = 17
        Caption = 'Altera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 472
        Top = 12
        Width = 68
        Height = 17
        Caption = 'C'#243'd. Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 548
        Top = 9
        Width = 37
        Height = 17
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 472
        Top = 69
        Width = 46
        Height = 17
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 471
        Top = 196
        Width = 99
        Height = 17
        Caption = 'N'#250'mero de serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 471
        Top = 135
        Width = 68
        Height = 17
        Caption = 'C'#243'd. Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 548
        Top = 135
        Width = 37
        Height = 17
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 471
        Top = 267
        Width = 111
        Height = 17
        Caption = 'Data de fabrica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 598
        Top = 267
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
      object Label23: TLabel
        Left = 472
        Top = 333
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
      object Image1: TImage
        Left = 883
        Top = 31
        Width = 168
        Height = 152
        Proportional = True
      end
      object SpeedButton1: TSpeedButton
        Left = 883
        Top = 189
        Width = 168
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
      object sbPesquisarGrupo: TSpeedButton
        Left = 815
        Top = 28
        Width = 30
        Height = 29
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
        OnClick = sbPesquisarGrupoClick
      end
      object sbPesquisarMarca: TSpeedButton
        Left = 815
        Top = 153
        Width = 30
        Height = 29
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
        OnClick = sbPesquisarMarcaClick
      end
      object SpeedButton2: TSpeedButton
        Left = 258
        Top = 291
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFF9797
          FF0C0CFE0C0CFF0C0CFF0C0CFF0C0CFF0C0CFF0C0CFF0C0CFF0C0CFF0C0CFE0C
          0CFF0C0CFF0C0CFE0C0CFF0C0CFF0C0CFE0C0CFF0C0CFF0C0CFE0C0CFF9393FF
          FFFFFFFFFFFF8F8FFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF8D8DFFFFFFFFFFFFFF8F8FFE0000FE0000FF0404FE0A0AFE0A0AFE
          0404FE0000FE0000FE0404FE0A0AFE0A0AFF0404FE0000FE0000FF0404FE0A0A
          FE0A0AFF0404FE0000FE0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FE0000FF70
          70FFFFFFFFFFFFFF8D8DFF0000FF0000FE7474FFFFFFFFFFFFFF8787FF0000FE
          0000FF7676FFFFFFFFFFFFFF8383FF0000FE0000FF8B8BFFFFFFFFFFFFFF8F8F
          FF0000FF0000FE7070FFFFFFFFFFFFFF8D8DFF0000FF0000FE7474FFFFFFFFFF
          FFFF8787FF0000FF0000FF7676FFFFFFFFFFFFFF8383FF0000FF0000FF8D8DFF
          FFFFFFFFFFFF8F8FFE0000FE0000FF6A6AFFF3F3FFF3F3FF8585FE0000FE0000
          FE6E6EFFF3F3FFF3F3FE7E7EFE0000FE0000FE7676FFFFFFFFFFFFFF8383FE00
          00FE0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FE0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FE0000FF0000FF0000FE0000FF7676FFFFFF
          FFFFFFFF8383FF0000FE0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF7676FFFFFFFFFFFFFF8383FF0000FF0000FF8D8DFFFFFFFFFFFFFF8F8F
          FE0000FE0000FF0606FE0C0CFE0C0CFE0606FE0000FE0000FE0606FE0C0CFE0C
          0CFE0606FE0000FE0000FE7676FFFFFFFFFFFFFF8383FE0000FE0000FF8B8BFF
          FFFFFFFFFFFF8F8FFF0000FE0000FF7070FFFFFFFFFFFFFF8D8DFF0000FF0000
          FE7474FFFFFFFFFFFFFF8787FF0000FE0000FF7676FFFFFFFFFFFFFF8383FF00
          00FE0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FF0000FE7070FFFFFFFFFFFFFF
          8D8DFF0000FF0000FE7474FFFFFFFFFFFFFF8787FF0000FF0000FF7676FFFFFF
          FFFFFFFF8383FF0000FF0000FF8D8DFFFFFFFFFFFFFF8F8FFE0000FE0000FE68
          68FFEDEDFFEDEDFF8383FE0000FE0000FF6A6AFFEDEDFFEDEDFE7C7CFE0000FE
          0000FE6E6EFFEDEDFFEDEDFE7878FE0000FE0000FF8B8BFFFFFFFFFFFFFF8F8F
          FF0000FF0000FF0000FF0000FE0000FF0000FF0000FE0000FF0000FF0000FE00
          00FF0000FF0000FE0000FF0000FF0000FE0000FF0000FF0000FE0000FF8D8DFF
          FFFFFFFFFFFF8F8FFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF8B8BFFFFFFFFFFFFFF8F8FFE0000FE0000FF0606FF0E0EFE0E0EFE
          0E0EFE0E0EFE0E0EFE0E0EFE0E0EFE0E0EFF0E0EFF0E0EFE0E0EFF0E0EFF0E0E
          FE0E0EFF0808FE0000FE0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FF0000FF70
          70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8383FF0000FE0000FF8D8DFFFFFFFFFFFFFF8F8F
          FF0000FF0000FF7070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383FF0000FF0000FF8B8BFF
          FFFFFFFFFFFF8F8FFE0000FE0000FE7070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383FE00
          00FE0000FF8B8BFFFFFFFFFFFFFF8F8FFE0000FE0000FE7070FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF8383FE0000FE0000FF8D8DFFFFFFFFFFFFFF8F8FFF0000FF0000FF70
          70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8383FF0000FF0000FF8B8BFFFFFFFFFFFFFF8F8F
          FE0000FE0000FF6666FFE7E7FFE7E7FFE7E7FFE7E7FFE7E7FFE7E7FFE7E7FFE7
          E7FFE7E7FFE7E7FFE7E7FFE7E7FFE7E7FFE7E7FF7676FE0000FE0000FF8D8DFF
          FFFFFFFFFFFF8F8FFF0000FE0000FF0000FF0000FE0000FF0000FF0000FE0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF8B8BFFFFFFFFFFFFFF8F8FFF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF8D8DFFFFFFFFFFFFFF9D9DFF1616FF1616FF16
          16FF1616FE1616FE1616FE1616FE1616FE1616FE1616FF1616FF1616FF1616FF
          1616FF1616FF1616FF1616FF1616FF1616FF1616FF9797FFFFFF}
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 377
        Top = 158
        Width = 39
        Height = 25
        Caption = 'Gerar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12455979
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 32
        Width = 281
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
      object edtProduto: TEdit
        Left = 16
        Top = 92
        Width = 400
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
      object edtCodigoDeBarras: TEdit
        Left = 16
        Top = 158
        Width = 355
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
      object edtDescricao: TEdit
        Left = 16
        Top = 219
        Width = 400
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtQuantidadeMinima: TEdit
        Left = 16
        Top = 356
        Width = 84
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
      object edtQuantidadeAtual: TEdit
        Left = 106
        Top = 356
        Width = 100
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
      object edtCodigoGrupo: TEdit
        Left = 472
        Top = 32
        Width = 70
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
      object edtModelo: TEdit
        Left = 472
        Top = 92
        Width = 373
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
      object edtNumeroDeSerie: TEdit
        Left = 471
        Top = 219
        Width = 374
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object edtFuncionario: TEdit
        Left = 598
        Top = 290
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
        TabOrder = 18
      end
      object edtCodigoDaMarca: TEdit
        Left = 471
        Top = 158
        Width = 71
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object edtObservacao: TEdit
        Left = 471
        Top = 356
        Width = 401
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
      object edtDataDeValidade: TMaskEdit
        Left = 212
        Top = 356
        Width = 93
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 9
        Text = '  /  /    '
      end
      object edtDataDeAlteracao: TMaskEdit
        Left = 311
        Top = 356
        Width = 105
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 10
        Text = '  /  /    '
      end
      object edtDataDeFabricacao: TMaskEdit
        Left = 472
        Top = 290
        Width = 110
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 17
        Text = '  /  /    '
      end
      object edtGrupo: TEdit
        Left = 548
        Top = 32
        Width = 261
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
      object edtMarca: TEdit
        Left = 548
        Top = 158
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object edtValorDeCusto: TCurrencyEdit
        Left = 16
        Top = 290
        Width = 109
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ZeroEmpty = False
      end
      object edtValorDeVenda: TCurrencyEdit
        Left = 287
        Top = 290
        Width = 128
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ZeroEmpty = False
      end
      object edtMargemDeLucro: TEdit
        Left = 131
        Top = 290
        Width = 121
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '0'
        OnExit = edtMargemDeLucroExit
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 1084
      Height = 434
      ExplicitWidth = 1084
      ExplicitHeight = 434
      inherited Panel4: TPanel
        Top = 389
        Width = 1084
        ExplicitTop = 389
        ExplicitWidth = 1084
        inherited sbImprimir: TSpeedButton
          Left = 809
          OnClick = sbImprimirClick
          ExplicitLeft = 809
        end
        inherited sbExportar: TSpeedButton
          Left = 920
          OnClick = sbExportarClick
          ExplicitLeft = 920
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 1084
        Height = 389
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 656
    Top = 49
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 568
    Top = 49
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;' +
      '*.tif;*.tiff)|*.png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.e' +
      'mf;*.wmf;*.tif;*.tiff|Portable Network Graphics (*.png_old)|*.pn' +
      'g_old|GIF Image (*.gif)|*.gif|Portable Network Graphics (*.png)|' +
      '*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.j' +
      'peg|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles' +
      ' (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif' +
      '|TIFF Images (*.tiff)|*.tiff'
    Left = 784
    Top = 161
  end
  object frxDB_Produtos: TfrxDBDataset
    UserName = 'frxDB_Produtos'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 568
    Top = 273
  end
  object frx_Produtos: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43763.774152152800000000
    ReportOptions.LastChange = 43932.585250879630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 440
    Top = 273
    Datasets = <
      item
        DataSet = frxDB_Produtos
        DataSetName = 'frxDB_Produtos'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 351.496290000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_Produtos
        DataSetName = 'frxDB_Produtos'
        RowCount = 0
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 8.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo:')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 8.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."ID"]')
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 39.015770000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto:')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 38.795300000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."PRODUTO"]')
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 31.236240000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 408.968770000000000000
          Top = 38.795300000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo de barras:')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 521.913730000000000000
          Top = 38.795300000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."CODIGO_BARRAS"]')
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 71.252010000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o:')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 82.370130000000000000
          Top = 71.031540000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."DESCRICAO"]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor de custo:')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 104.606370000000000000
          Top = 102.047310000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."VALOR_CUSTO"]')
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 90.708720000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 102.047310000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Margem de lucro:')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 350.496290000000000000
          Top = 102.047310000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."MARGEM_LUCRO"]')
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 90.708720000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 102.047310000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor de venda:')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 102.047310000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."VALOR_VENDA"]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 132.283550000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade m'#237'nima:')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 135.063080000000000000
          Top = 131.504020000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."QUANTIDADE_MINIMA"]')
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 120.944960000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 120.944960000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 132.283550000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade maxima:')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 366.614410000000000000
          Top = 132.283550000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."QUANTIDADE_ATUAL"]')
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 120.944960000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 132.283550000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Validade:')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 551.811380000000000000
          Top = 132.283550000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."DATA_VALIDADE"]')
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Top = 151.181200000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 162.519790000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Altera'#231#227'o:')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 162.519790000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."DATA_ALTERACAO"]')
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 151.181200000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 185.976500000000000000
          Top = 161.740260000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo grupo:')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 162.519790000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."ID_GRUPO"]')
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 151.181200000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 366.834880000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Grupo:')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 415.968770000000000000
          Top = 162.519790000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."GRUPO"]')
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Top = 181.417440000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 192.756030000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo marca:')
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 192.756030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."ID_MARCA"]')
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 203.315090000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 192.756030000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Marca:')
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 257.228510000000000000
          Top = 192.756030000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."MARCA"]')
        end
        object Shape9: TfrxShapeView
          AllowVectorExport = True
          Top = 211.653680000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 222.992270000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Modelo:')
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 222.992270000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."MODELO"]')
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 211.653680000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 222.992270000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero de serie:')
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 222.992270000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."NUMERO_SERIE"]')
        end
        object Shape10: TfrxShapeView
          AllowVectorExport = True
          Top = 241.889920000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 253.228510000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de fabrica'#231#227'o:')
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 253.228510000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."DATA_FABRICACAO"]')
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 241.889920000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 257.008040000000000000
          Top = 253.228510000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Funcion'#225'rio:')
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 253.228510000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."FUNCIONARIO"]')
        end
        object Shape11: TfrxShapeView
          AllowVectorExport = True
          Top = 272.126160000000000000
          Width = 721.890230000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 283.464750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#227'o:')
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 88.708720000000000000
          Top = 283.464750000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Produtos."OBSERVACAO"]')
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 336.378170000000000000
          Width = 684.094930000000000000
          Color = clBlack
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 211.653680000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 26.236240000000000000
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
            'Relat'#243'rio de produtos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 60.472480000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 64.252010000000000000
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
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 702.992580000000000000
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
