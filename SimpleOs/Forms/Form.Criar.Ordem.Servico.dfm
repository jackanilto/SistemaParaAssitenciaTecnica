﻿object formCriarConsultarOrdemServico: TformCriarConsultarOrdemServico
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Criar / Consultar ordem de servi'#231'o'
  ClientHeight = 585
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 973
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    DesignSize = (
      973
      41)
    object sbFechar: TSpeedButton
      Left = 921
      Top = 2
      Width = 52
      Height = 33
      Hint = 'Fechar esta janela'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000804604875012
        BD9F7CEDE5DCF9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F8F5
        F2F9F6F3F9F6F3F8F5F2F9F6F3F9F6F3F8F5F2F8F5F2EDE5DCBD9F7C87501280
        4604875012DBCBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFDBCBB8875012BA9A76FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEBB9C78E8DED2FFFFFFFFFFFFFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFE
        FEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFE9DFD4F4EFE9FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
        F0EBF6F2EDFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEFEFEFEFFFFFFF7F3EFF7F3EFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFF2
        ECE5CBB499FBFAF8FFFFFFFFFFFFFEFEFEFFFFFFFBFAF8CBB499F2ECE5FFFFFF
        FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF8F5F1F8F5F1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF3EEE79B6D39804604AF8B62F9F6F3FFFFFFFFFFFFF9F6F3AF8B6280
        46049A6C37F2ECE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F3F9F6F3FFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFED2BDA6814706804604804604AF8A61FAF8F6FAF8
        F6AF8B62804604804604814706D2BDA6FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF8
        F5F2F9F6F3FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFDFCFBB99974814706804604
        804604AB8459AC865B804604804604814706B99974FDFCFBFEFEFEFFFFFFFFFF
        FFFEFEFEFFFFFFF9F6F3F9F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FAF8B89874814706804604804604804604804604814706B79772FBF9F7FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F3F9F6F3FFFFFFFEFEFEFEFEFEFFFF
        FFFEFEFEFEFEFEFFFFFFFDFCFBB4926C814706804604804604814706B4916AFC
        FBFAFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF8F5F2F9F6F3FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFBF9F7AC865B8046048046048046
        04804604AB8459FAF8F6FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF9
        F6F3F9F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F3B08C62804604
        804604814706814706804604804604AE8A60F9F6F3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF9F6F3F8F5F2FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFBFAF8B0
        8C62804604804604814706B3916AB4926C814706804604804604AF8A61FCFBF9
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F6F3F9F6F3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD1BCA4804604804604814706B79772FDFCFBFDFCFBB9997481470680
        4604804604D0BBA2FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF9F6F3F8F5F1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF5F1ECA27747814706B99974FBF9F7FFFFFFFFFF
        FFFCFBF9B99974814706A27747F6F2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        F6F3F6F2EEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEF6F2EDD5C3AEFCFBFA
        FFFFFFFEFEFEFEFEFEFEFEFEFCFBFAD6C4AEF6F2EDFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEF7F4F0F6F2EDFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF6F2EEF4EFE9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EFE9E6DBCEFFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFE
        FEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFE5
        DACDB4916AFEFEFDFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFDB5936C844C0CD2BEA6FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFDD3BFA8854D0E804604844C0CB18D64E1D3C4EEE6
        DEF0E9E1F0EAE3F1EBE5F2ECE5F1EBE5F2ECE5F3EEE7F3EEE7F3EEE7F3EEE7F3
        EEE7F3EEE7F2ECE5F1EBE3EFE8E0E2D5C6B28F66844C0C804604}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFecharClick
      ExplicitLeft = 871
    end
    object lblCaption: TLabel
      Left = 251
      Top = 10
      Width = 132
      Height = 19
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Ordem de servi'#231'os'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitLeft = 327
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 973
    Height = 469
    ActivePage = tbParcelas
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object tbOrdemServiço: TTabSheet
      Caption = 'Ordem de servi'#231'o'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 965
        Height = 437
        Align = alClient
        BevelOuter = bvNone
        Color = 15527148
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 17
          Width = 83
          Height = 17
          Caption = 'C'#243'digo da OS'
        end
        object Label2: TLabel
          Left = 16
          Top = 73
          Width = 70
          Height = 17
          Caption = 'C'#243'd. Cliente'
        end
        object Label3: TLabel
          Left = 106
          Top = 73
          Width = 39
          Height = 17
          Caption = 'Cliente'
        end
        object sbPesquisarCep: TSpeedButton
          Left = 396
          Top = 96
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
        object Label4: TLabel
          Left = 16
          Top = 203
          Width = 37
          Height = 17
          Caption = 'Marca'
        end
        object Label5: TLabel
          Left = 222
          Top = 203
          Width = 46
          Height = 17
          Caption = 'Modelo'
        end
        object Label6: TLabel
          Left = 16
          Top = 264
          Width = 99
          Height = 17
          Caption = 'N'#250'mero de serie'
        end
        object Label7: TLabel
          Left = 314
          Top = 264
          Width = 63
          Height = 17
          Caption = 'Fabrica'#231#227'o'
        end
        object Label8: TLabel
          Left = 16
          Top = 135
          Width = 77
          Height = 17
          Caption = 'Equipamento'
        end
        object Label9: TLabel
          Left = 16
          Top = 328
          Width = 95
          Height = 17
          Caption = 'Defeito relatado'
        end
        object Label10: TLabel
          Left = 464
          Top = 17
          Width = 81
          Height = 17
          Caption = 'Laudo tecnico'
        end
        object Label11: TLabel
          Left = 464
          Top = 104
          Width = 127
          Height = 17
          Caption = 'Solu'#231#227'o do problema'
        end
        object Label12: TLabel
          Left = 464
          Top = 203
          Width = 111
          Height = 17
          Caption = 'Situa'#231#227'o da ordem'
        end
        object Label13: TLabel
          Left = 615
          Top = 203
          Width = 61
          Height = 17
          Caption = 'Prioridade'
        end
        object Label14: TLabel
          Left = 724
          Top = 203
          Width = 95
          Height = 17
          Caption = 'Data de entrada'
        end
        object Label15: TLabel
          Left = 464
          Top = 259
          Width = 81
          Height = 17
          Caption = 'Data de saida'
        end
        object Label16: TLabel
          Left = 565
          Top = 259
          Width = 83
          Height = 17
          Caption = 'Hora de sa'#237'da'
        end
        object Label17: TLabel
          Left = 660
          Top = 259
          Width = 117
          Height = 17
          Caption = 'Tecnico respons'#225'vel'
        end
        object Label18: TLabel
          Left = 464
          Top = 319
          Width = 47
          Height = 17
          Caption = 'Retorno'
        end
        object Label19: TLabel
          Left = 774
          Top = 319
          Width = 94
          Height = 17
          Caption = 'Data de retorno'
        end
        object Label20: TLabel
          Left = 464
          Top = 377
          Width = 70
          Height = 17
          Caption = 'Observa'#231#227'o'
        end
        object SpeedButton3: TSpeedButton
          Left = 855
          Top = 282
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
          OnClick = SpeedButton3Click
        end
        object edtCodigoOS: TEdit
          Left = 16
          Top = 40
          Width = 257
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edtCodigoCliente: TEdit
          Left = 16
          Top = 96
          Width = 89
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtNomeCliente: TEdit
          Left = 106
          Top = 96
          Width = 284
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edtMarca: TEdit
          Left = 16
          Top = 226
          Width = 200
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object edtModelo: TEdit
          Left = 222
          Top = 226
          Width = 200
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object edtNumeroDeSerie: TEdit
          Left = 16
          Top = 287
          Width = 292
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object edtDataFabricacao: TMaskEdit
          Left = 314
          Top = 287
          Width = 107
          Height = 25
          EditMask = '00/00/0000'
          MaxLength = 10
          TabOrder = 6
          Text = '  /  /    '
        end
        object edtEquipamento: TEdit
          Left = 16
          Top = 160
          Width = 406
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object edtDefeitoRelatado: TMemo
          Left = 16
          Top = 351
          Width = 405
          Height = 74
          Lines.Strings = (
            '')
          TabOrder = 8
        end
        object edtLaudoTecnico: TMemo
          Left = 464
          Top = 40
          Width = 405
          Height = 49
          Lines.Strings = (
            '')
          TabOrder = 9
        end
        object edtSolucaoDoProblema: TMemo
          Left = 464
          Top = 127
          Width = 405
          Height = 49
          Lines.Strings = (
            '')
          TabOrder = 10
        end
        object edtSituacaoOrdem: TComboBox
          Left = 464
          Top = 226
          Width = 145
          Height = 25
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 11
        end
        object edtPrioridade: TComboBox
          Left = 615
          Top = 226
          Width = 103
          Height = 25
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 12
          Items.Strings = (
            'N'#195'O'
            'SIM')
        end
        object edtDataEntrada: TMaskEdit
          Left = 724
          Top = 226
          Width = 144
          Height = 25
          EditMask = '00/00/0000'
          MaxLength = 10
          TabOrder = 13
          Text = '  /  /    '
        end
        object edtDataDeSaida: TMaskEdit
          Left = 464
          Top = 282
          Width = 94
          Height = 25
          EditMask = '00/00/0000'
          MaxLength = 10
          TabOrder = 14
          Text = '  /  /    '
        end
        object edtHoraSaida: TMaskEdit
          Left = 565
          Top = 282
          Width = 82
          Height = 25
          EditMask = '00:00:00'
          MaxLength = 8
          TabOrder = 15
          Text = '  :  :  '
        end
        object edtTecnicoResponsavel: TEdit
          Left = 660
          Top = 282
          Width = 191
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 16
        end
        object edtRetorno: TEdit
          Left = 464
          Top = 342
          Width = 304
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 17
        end
        object edtDataRetorno: TMaskEdit
          Left = 774
          Top = 342
          Width = 94
          Height = 25
          EditMask = '00/00/0000'
          MaxLength = 10
          TabOrder = 18
          Text = '  /  /    '
        end
        object edtObservacao: TEdit
          Left = 464
          Top = 400
          Width = 405
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 19
        end
      end
    end
    object tbServicosEFaturamento: TTabSheet
      Caption = 'Servi'#231'oes e faturamento'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 965
        Height = 437
        Align = alClient
        BevelOuter = bvNone
        Color = 15527148
        ParentBackground = False
        TabOrder = 0
        object SpeedButton4: TSpeedButton
          Left = 442
          Top = 256
          Width = 85
          Height = 33
          Caption = 'Adicionar >>'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8406532
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton4Click
        end
        object SpeedButton5: TSpeedButton
          Left = 444
          Top = 295
          Width = 83
          Height = 33
          Caption = '>> Remover'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3939791
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton5Click
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 965
          Height = 201
          Align = alTop
          Caption = 'Faturamento'
          TabOrder = 0
          object Label21: TLabel
            Left = 16
            Top = 25
            Width = 89
            Height = 17
            Caption = 'Valor da OS R$'
          end
          object Label22: TLabel
            Left = 16
            Top = 84
            Width = 74
            Height = 17
            Caption = 'Desconto R$'
          end
          object Label23: TLabel
            Left = 143
            Top = 84
            Width = 79
            Height = 17
            Caption = 'Acr'#233'scimo RS'
          end
          object Label26: TLabel
            Left = 369
            Top = 25
            Width = 100
            Height = 17
            Caption = 'Total de parcelas'
          end
          object Label28: TLabel
            Left = 369
            Top = 84
            Width = 148
            Height = 17
            Caption = 'Data base de vencimento'
          end
          object Label29: TLabel
            Left = 16
            Top = 141
            Width = 87
            Height = 17
            Caption = 'Total da OS R$'
          end
          object Label24: TLabel
            Left = 484
            Top = 25
            Width = 112
            Height = 17
            Caption = 'Valor parcelado R$'
          end
          object edtValorOrdem: TEdit
            Left = 16
            Top = 48
            Width = 249
            Height = 25
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object edtDesconto: TEdit
            Left = 16
            Top = 107
            Width = 121
            Height = 25
            CharCase = ecUpperCase
            TabOrder = 1
            OnExit = edtDescontoExit
          end
          object edtAcrescimo: TEdit
            Left = 143
            Top = 107
            Width = 122
            Height = 25
            CharCase = ecUpperCase
            TabOrder = 2
            OnExit = edtAcrescimoExit
          end
          object edtTotalDeParcelas: TEdit
            Left = 369
            Top = 48
            Width = 109
            Height = 25
            CharCase = ecUpperCase
            TabOrder = 3
            OnExit = edtTotalDeParcelasExit
          end
          object edtDataBaseVencimento: TMaskEdit
            Left = 369
            Top = 107
            Width = 288
            Height = 25
            EditMask = '00/00/0000'
            MaxLength = 10
            TabOrder = 4
            Text = '  /  /    '
          end
          object edtTotalDaOS: TEdit
            Left = 16
            Top = 162
            Width = 249
            Height = 25
            CharCase = ecUpperCase
            TabOrder = 5
            OnExit = edtTotalDaOSExit
          end
          object edtValorOrdemParcelado: TEdit
            Left = 484
            Top = 48
            Width = 173
            Height = 25
            TabOrder = 6
          end
        end
        object GroupBox2: TGroupBox
          Left = 7
          Top = 200
          Width = 431
          Height = 225
          Caption = 'Servi'#231'os inclusos'
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 2
            Top = 19
            Width = 427
            Height = 204
            Align = alClient
            DataSource = s_tem_servicos_adicionados
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'id'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'servico'
                Width = 282
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Width = 200
                Visible = True
              end>
          end
        end
        object GroupBox3: TGroupBox
          Left = 531
          Top = 219
          Width = 417
          Height = 206
          Caption = 'Servi'#231'os'
          TabOrder = 2
          object DBGrid2: TDBGrid
            Left = 2
            Top = 19
            Width = 413
            Height = 185
            Align = alClient
            DataSource = s_Servicos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = DBGrid2DblClick
          end
        end
      end
    end
    object tbParcelas: TTabSheet
      Caption = 'Parcelas'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 965
        Height = 437
        Align = alClient
        BevelOuter = bvNone
        Color = 15527148
        ParentBackground = False
        TabOrder = 0
        object Label30: TLabel
          Left = 15
          Top = 9
          Width = 42
          Height = 17
          Caption = 'Parcela'
        end
        object Label31: TLabel
          Left = 111
          Top = 9
          Width = 96
          Height = 17
          Caption = 'Valor da parcela'
        end
        object Label32: TLabel
          Left = 238
          Top = 9
          Width = 67
          Height = 17
          Caption = 'Vencimento'
        end
        object Label33: TLabel
          Left = 336
          Top = 9
          Width = 55
          Height = 17
          Caption = 'Desconto'
        end
        object Label34: TLabel
          Left = 442
          Top = 9
          Width = 36
          Height = 17
          Caption = 'Jurros'
        end
        object Label35: TLabel
          Left = 548
          Top = 9
          Width = 33
          Height = 17
          Caption = 'Multa'
        end
        object Label36: TLabel
          Left = 654
          Top = 9
          Width = 60
          Height = 17
          Caption = 'Valor total'
        end
        object Label37: TLabel
          Left = 15
          Top = 68
          Width = 66
          Height = 17
          Caption = 'Pagamento'
        end
        object Label38: TLabel
          Left = 135
          Top = 68
          Width = 29
          Height = 17
          Caption = 'Hora'
        end
        object Label39: TLabel
          Left = 272
          Top = 68
          Width = 127
          Height = 17
          Caption = 'Forma de pagamento'
        end
        object Label40: TLabel
          Left = 442
          Top = 68
          Width = 32
          Height = 17
          Caption = 'PGTO'
        end
        object Label41: TLabel
          Left = 15
          Top = 130
          Width = 70
          Height = 17
          Caption = 'Observa'#231#227'o'
        end
        object Panel6: TPanel
          Left = 0
          Top = 376
          Width = 965
          Height = 61
          Align = alBottom
          BevelOuter = bvNone
          Color = 8406532
          ParentBackground = False
          TabOrder = 0
          object SpeedButton6: TSpeedButton
            Left = 15
            Top = 10
            Width = 98
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Quitar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000C30E0000C30E0000000000000000000099361A99361A
              99361A99361A99361A99361A99361AA64F37C38877DEBFB6EFE0DCF9F2F1F9F4
              F2F1E4E0E1C3BBC58E7EA8543C99361A99361A99361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361AA44C33D5ADA2F8F1EFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1F0DAB6ACA7513999361A9936
              1A99361A99361A99361A99361A99361A99361A99361AB7725EF2E6E3FEFEFEFF
              FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
              F6EEEBBD7D6A99361A99361A99361A99361A99361A99361A99361AC18675FDFA
              FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFEFEFEFDFCFBC9958699361A99361A99361A99361A99361A
              B7705CFDFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBBD7D6B99361A99
              361A99361AA34A31F2E6E3FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
              F9F2F1F4EAE7FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
              FEF5EDEAA7523A99361A99361AD4AA9EFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFECD9D4A64F379F4127F0E2DEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF
              FEFEFEFFFFFFFFFFFFFEFEFEDCBAB099361AA54E35F7EFEDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFEDDBD6A44C3399361A99361AB46B57FBF7F6FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F3F1AA5740C18574FEFEFE
              FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEECDAD5A54E3599361A99361A99361A9936
              1AD2A69AFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFC8
              9384DDBBB2FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFECDAD5A44C3399361A99361A
              B97562A2472E99361A9F4127EBD8D2FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFF
              FFFEFEFEFFFFFFE4C9C2EEDED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC68F8099
              361A99361AC38877FBF7F6D8B2A799361A99361AAF624CFDFAFAFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EBE8F4E9E6FFFFFFFEFEFEFEFEFEFFFF
              FFFEFEFEF4EBE9B46C57C38877FCFBFAFFFFFFFEFDFDB7705C99361A99361ACF
              A194FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF9F5F3F5EBE8FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFF3E7
              E4A34A3199361A9E3F25E9D4CFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFA
              F6F4EEDED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFDAB6AC9B391E99361AAF624CFAF6F4FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EBE8DDBDB4FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFF
              FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCF9F9BB7A6799361A9A381CCD9C8E
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE3C9C1C18473FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF6EEECA4
              4C3399361A9B3B1FEBD8D3FFFFFFFFFFFFFEFEFEFFFFFFC89384A54E35F7EFED
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFDFC0B79C3C21A1462CE8D2CCFFFFFFFFFFFFFFFFFFF9F4F2AA
              574099361AD5ABA0FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
              FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFCFCDEBEB5F0E1DDFEFEFEFEFEFEFEFE
              FEFEFEFEDCBAB099361A99361AA34A31F3E7E4FEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFFEFEFEF5EDEAA7523A99361A99361A99361AB7725EFDFAFAFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBBE7F6D99361A99361A99361A99361A
              99361AC38877FCF9F9FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFE
              FEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCFBFAC9948599361A99361A99
              361A99361A99361A99361A99361AB87360F4E9E6FEFEFEFFFFFFFFFFFFFEFEFE
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDEABD7D6B9936
              1A99361A99361A99361A99361A99361A99361A99361A99361AA44C33D6AFA3F8
              F1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4F2DAB6AC
              A7513999361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361AA75139C48B7BE1C3BBF2E6E2F9F4F2F8F1EFF2E6E2E2C6BEC6
              8E7FA8543C99361A99361A99361A99361A99361A99361A99361A}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton6Click
          end
          object SpeedButton7: TSpeedButton
            Left = 119
            Top = 10
            Width = 94
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Estornar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              A2070000424DA207000000000000360000002800000019000000190000000100
              1800000000006C070000120B0000120B0000000000000000000099361A99361A
              99361A99361A99361A99361A99361A99361AC08372FEFDFDFFFFFFFFFFFFECDA
              D599361A99361A99361AA8543CF9F2F1FFFFFFFFFFFFF9F4F2AA574099361A99
              361A99361A4E99361A99361A99361A99361A99361A99361A99361A99361ACFA1
              94FEFEFEFEFEFEFFFFFFFCF9F99A381C99361A99361AB36A55FEFDFDFEFEFEFE
              FEFEFFFFFFB56D5999361A99361A99361A3099361A99361A99361A99361A9936
              1A99361A99361A99361AB16550FAF6F5FFFFFFFFFFFFD9B5AB99361A99361A99
              361AA0442AEDDCD7FFFFFFFEFEFEEEDFDAA1462C99361A99361A99361A009936
              1A99361A99361A99361A99361A99361A99361A99361A9A381CB26853D4AA9EC5
              8E7E9F412799361A99361A99361A99361AA75139CEA093CEA093A7523A99361A
              99361A99361A99361A0099361A99361A99361A99361A99361A99361A99361A99
              361A99361AA1462CBB7865C38A79C79080C68F80C79182C79182C79182C79182
              C58E7EBA77649B3B1F99361A99361A99361A99361A0099361A99361A99361A99
              361A99361A99361A99361A9B3B1FCB998BFBF7F6FFFFFFFFFFFFFFFFFFFEFEFE
              FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEDDBDB49C3C2199361A99361A9936
              1A0099361A99361A99361A99361A99361A99361A99361ACE9E91FEFDFDFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
              FDC9958699361A99361A99361A0099361A99361A99361A99361A99361A99361A
              A54E35FDFAFAFFFFFFFCFBFAD1A497BD7D6BBA7764B87360B87360B87360B873
              60B87360C18574FCFBFAFFFFFFFAF6F5A7523A99361A99361A0099361A99361A
              99361A99361A99361A99361AC38A79FFFFFFFFFFFFCB998B99361A99361A9936
              1A99361A99361A99361A99361A99361A99361ACE9F91FFFFFFFFFFFFDEBFB69B
              391E99361A0099361A99361A99361A99361A99361A99361AD9B3A9FFFFFFFCFB
              FAB0634E99361A99361A99361A99361A99361A99361A99361A99361A99361AA0
              442AF0E1DDFFFFFFFDFAFAB36A5599361A0099361A99361A99361A99361A9936
              1A9B3B1FE9D5D0FEFEFEF6EEECA2472E99361A99361A99361A99361A99361A99
              361A99361A99361A99361A99361ABF8170FFFFFFFEFEFEE5CBC49B391E009936
              1A99361A99361A99361A99361AA34930F9F2F1FEFEFEE9D4CF99361A99361A99
              361A99361A99361A99361AA0442AC791829A381C99361A99361A9D3E23E9D4CF
              FEFEFEFDFCFBB7725E0099361A99361A99361A99361A99361AB0644EFFFFFFFF
              FFFFD5ADA299361A99361A99361A99361A99361A99361A99361AE7D0C9B46B57
              99361A99361A99361ABA7764FFFFFFFFFFFFE5CDC60099361A99361A99361A99
              361A99361AC48B7BFEFEFEFEFEFEC1857499361A99361A99361A99361A99361A
              99361A99361ADAB7AEE9D3CD9B3B1F99361A99361A9A381CEAD7D1FEFEFEF7F0
              EE0099361A99361A99361A99361A99361AD9B5ABFFFFFFFDFCFCAD5D4799361A
              99361A99361A99361A99361A99361A99361AE3C8C0FDFAFAAF624C99361A9936
              1A99361AAA5941D9B3A9BB78650099361A99361A99361A99361A9A381CEDDCD7
              FFFFFFF5ECE9A1462C99361A99361A99361A99361A99361A99361AA34930FBF7
              F6FFFFFFBF827099361A99361A99361A99361A99361A99361A0099361A99361A
              99361A99361AA44C33F8F1EFFEFEFEE7D1CA9B391E99361A99361A9F4328D1A4
              979E3F259B391ED9B5ABFEFEFEFEFEFEBD7D6B99361A99361A99361A99361A99
              361A99361A0099361A99361A99361A99361AB46C57FEFDFDFFFFFFD4AA9E9936
              1A99361A99361AB16550FFFFFFE6CEC7D4AA9EFEFEFEFEFEFEF9F4F2A8543C99
              361A99361A99361A99361A99361A99361A0099361A99361A99361A9D3E23D8B2
              A7FFFFFFFFFFFFBD7D6A99361A99361A99361ABF806EFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFD6AFA39A381C99361A99361A99361A99361A99361A99361A009936
              1AB7705CDFC0B7ECDAD5FEFEFEFFFFFFF9F5F3A1462C99361A99361A99361ACB
              998BFEFEFEFEFEFEFFFFFFFEFEFEE9D4CEA1462C99361A99361A99361A99361A
              99361A99361A99361A0099361AF5ECE9FFFFFFFFFFFFFEFEFEFCF9F8BF827099
              361A99361A99361A99361AD6AFA3FFFFFFFFFFFFFFFFFFFFFFFFE7D0C9A1462C
              99361A99361A99361A99361A99361A99361A99361A0099361AD7B0A5F8F1EFF5
              ECE9E4C9C2B66F5B9A381C99361A99361A99361A99361ADEBEB5FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFDCBBB199361A99361A99361A99361A99361A99361A9936
              1A0099361A9B391EA34A319F432899361A99361A99361A99361A99361A99361A
              99361AD6AEA3F1E5E1EAD6D0E0C2B9D4AA9EC58D7DAE604A99361A99361A9936
              1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A0099361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A00}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton8: TSpeedButton
            Left = 219
            Top = 10
            Width = 171
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Adicionar parcela'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              A2070000424DA207000000000000360000002800000019000000190000000100
              1800000000006C070000120B0000120B0000000000000000000099361A99361A
              99361A99361A99361A99361A9A381CAA5941CA9688E5CDC6EAD7D19B3B1F9B3B
              1FEAD7D1E5CDC6CA9688AB59429A381C99361A99361A99361A99361A99361A99
              361A99361A0099361A99361A99361A99361A99361AA9563EDEBEB5F9F5F3FFFF
              FFFFFFFFF4E9E69B3B1F9B3B1FF4E9E6FFFFFFFFFFFFF9F5F3DEBEB5A9563E99
              361A99361A99361A99361A99361A99361A8099361A99361A99361A99361AC083
              72F7F0EEFEFEFEFEFEFEEEDED9CD9D90B66F5B9A381C9A381CB66F5BCD9D90ED
              DDD8FEFEFEFEFEFEF8F1EFC0837299361A99361A99361A99361A99361A669936
              1A99361A99361ACC9B8DFDFCFBFFFFFFEBD8D3B7705C9A381C99361A99361A99
              361A99361A99361A99361A9A381CB7705CECD9D4FEFEFEFDFCFBCD9C8E99361A
              99361A99361A99361A5899361A99361AC08372FCFBFAFEFDFDDBB8AE9F432899
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9F4328
              DBB8AEFEFDFDFDFCFBC0837299361A99361A99361A0099361AA9563EF7F0EEFE
              FEFEDBB8AE9C3C2199361A99361A99361A99361A99361A99361A99361A99361A
              99361A99361A99361A99361A9C3C21DBB8AEFEFEFEF8F1EFA9563E99361A9936
              1A0D9A381CDEBEB5FFFFFFECD9D49F432899361A99361A99361A99361A99361A
              9A381CB7725EB7725E9A381C99361A99361A99361A99361A99361A9F4328ECD9
              D4FEFEFEDEBEB59A381C99361A00AB5A43FAF6F4FFFFFFB7705C99361A99361A
              99361A99361A99361A99361AA34A31F9F4F2F9F4F2A34A3199361A99361A9936
              1A99361A99361A99361AB7705CFFFFFFF9F5F3AB594299361A00CA9688FFFFFF
              EFDFDB9A381C99361A99361A99361A99361A99361A99361AA54E35FCFBFAFDFC
              FBA54E3599361A99361A99361A99361A99361A99361A9A381CEEDFDAFFFFFFCA
              968899361A00E5CDC6FFFFFFCD9D9099361A99361A99361A99361A99361A9936
              1A99361AA54E35FDFCFBFDFCFBA54E3599361A99361A99361A99361A99361A99
              361A99361ACD9D8FFFFFFFE5CDC699361A00EBD8D2F4E9E6B66E5A99361A9936
              1A99361A9A381CA34A31A54E35A54E35AF624CFDFCFBFDFCFBAF624CA54E35A5
              4E35A34A319A381C99361A99361A99361AB66E5AF4E9E6EBD8D299361A009B3B
              1F9B3B1F9A381C99361A99361A99361AB7725EF9F4F2FDFCFBFDFCFBFDFCFBFE
              FEFEFEFEFEFDFCFBFDFCFBFDFCFBF9F4F2B7725E99361A99361A99361A9A381C
              9B3B1F9B3B1F99361A009B3B1F9B3B1F9A381C99361A99361A99361AB7725EF9
              F4F2FCFBFAFCFBFAFDFCFBFEFEFEFEFEFEFDFCFBFCFBFAFCFBFAF9F4F2B7725E
              99361A99361A99361A9A381C9B3B1F9B3B1F99361A00EBD8D2F4E9E6B66F5B99
              361A99361A99361A9A381CA34A31A54E35A54E35AF624CFDFCFBFDFCFBAF624C
              A54E35A54E35A34A319A381C99361A99361A99361AB66F5BF3E8E5EAD7D19936
              1A00E5CDC6FFFFFFCD9D9099361A99361A99361A99361A99361A99361A99361A
              A54E35FCFBFAFCFBFAA54E3599361A99361A99361A99361A99361A99361A9936
              1ACD9D90FEFEFEE5CDC699361A00CA9688FFFFFFEFDFDB9A381C99361A99361A
              99361A99361A99361A99361AA54E35FDFCFBFDFCFBA54E3599361A99361A9936
              1A99361A99361A99361A9A381CEFDFDBFFFFFFCA968899361A00AB5942FAF6F4
              FFFFFFB7705C99361A99361A99361A99361A99361A99361AA34A31F9F4F2F9F4
              F2A34A3199361A99361A99361A99361A99361A99361AB7705CFFFFFFFAF6F4AA
              594199361A009A381CDEBEB5FEFEFEECD9D49F432899361A99361A99361A9936
              1A99361A9A381CB7725EB7725E9A381C99361A99361A99361A99361A99361A9F
              4328ECD9D4FEFEFEDEBEB59A381C99361A0099361AA9563EF7F0EEFEFEFEDAB7
              AE9C3C2199361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A99361A9C3C21DBB8AEFEFEFEF8F1EFA9563E99361A99361A009936
              1A99361AC08372FDFCFBFEFDFDDBB8AE9F432899361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361A9F4127DBB8AEFEFDFDFDFCFBC08372
              99361A99361A99361A0099361A99361A99361ACD9C8EFDFCFBFEFEFEECD9D4B7
              705C9A381C99361A99361A99361A99361A99361A99361A9A381CB7705CECD9D4
              FEFEFEFCFBFACC9B8D99361A99361A99361A99361A0099361A99361A99361A99
              361AC08372F7F0EEFEFEFEFFFFFFEEDED9CD9D8FB66E5A9A381C9A381CB66F5B
              CD9D8FEDDDD8FFFFFFFFFFFFF7F0EEC0837299361A99361A99361A99361A9936
              1A0099361A99361A99361A99361A99361AA9563EDEBEB5FAF6F4FFFFFFFFFFFF
              F4E9E69B3B1F9B3B1FF4E9E6FFFFFFFFFFFFFAF6F4DEBEB5A9563E99361A9936
              1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
              9A381CAB5942CA9688E5CDC6EBD8D29B3B1F9B3B1FEBD8D2E5CDC6CA9688AB59
              429A381C99361A99361A99361A99361A99361A99361A99361A0099361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A00}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton9: TSpeedButton
            Left = 396
            Top = 10
            Width = 141
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Salvar parcela'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              A2070000424DA207000000000000360000002800000019000000190000000100
              1800000000006C070000120B0000120B0000000000000000000099361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A00A0442AD8B2A7F8F1F0F4E9E6EFDFDBEDDDD8EDDDD8EDDDD8EDDD
              D8EEDED9EEDED9EEDED9EEDED9EDDDD8EEDED9EEDED9EDDDD8EEDED9EDDDD8EE
              DFDAF2E6E3F9F2F1DAB7AEA2472E99361A80D6AFA3FFFFFFF6EEEBA44C33A044
              2AA0442A9F43289F43289F43289F43289F43289F43289F43289F43289F43289F
              43289F43289F43289F4328A0442AA34930F2E6E2FFFFFFDDBBB299361A66F4E9
              E6FFFFFFEDDBD699361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361AE7D1CA
              FFFFFFF8F1F099361A58F7EFEDFFFFFFECD9D499361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
              99361A99361A99361AE6CFC8FFFFFFFAF6F499361A00F8F1EFFFFFFFEBD8D399
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
              99361A99361A99361A99361A99361A99361A99361AE7D0C9FFFFFFFAF6F49936
              1A0DF9F2F1FFFFFFEBD8D399361A99361A99361A99361A99361A99361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1AE6CFC8FFFFFFF9F5F399361A0DF9F4F2FFFFFFECD9D499361A99361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361AE6CFC8FFFFFFFAF6F499361A80F9F4F2FFFFFF
              ECD9D499361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361AE7D0C9FFFFFFFA
              F6F499361A66FAF6F4FFFFFFEBD8D399361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361AE7D1CAFFFFFFF9F5F399361A58FAF6F4FFFFFFECDAD599361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361AE7D1CAFFFFFFFAF6F499361A74FAF6
              F4FFFFFFEDDDD899361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361AE8D1CB
              FFFFFFFAF6F499361A0DFAF6F4FFFFFFF7F0EEA54E359E3F259D3E239C3C219C
              3C219C3C219C3C219C3C219C3C219C3C219C3C219C3C219C3C219D3E239C3C21
              9C3C219D3E23A2472EF3E7E4FFFFFFF9F5F399361A00FAF6F4FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF
              FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFAF6F49936
              1A80FAF6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFAF6F499361A66F9F5F3FFFFFFFEFEFEFEFEFEFEFDFDECDAD5
              E5CDC7E5CDC6E5CDC6E5CCC5E5CCC5E5CDC6E5CCC5E5CDC6E5CCC5E5CCC5E5CD
              C6E7D1CAFDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFAF6F499361A58FAF6F4FFFFFF
              FFFFFFFFFFFFE3C8C099361A99361A99361A99361A99361A99361A99361A9936
              1A9E3F25B97562B97562AD5D4799361AD4AB9FFFFFFFFFFFFFFEFEFEFFFFFFFA
              F6F499361A0DF9F4F2FFFFFFFFFFFFFFFFFFDAB7AE99361A99361A99361A9936
              1A99361A99361A99361A99361AA8543CFFFFFFFFFFFFD8B2A799361ACD9D90FF
              FFFFFFFFFFFFFFFFFFFFFFFAF6F499361A0DF9F4F2FFFFFFFEFEFEFEFEFEDAB6
              AC99361A99361A99361A99361A99361A99361A99361A99361AA8543CFEFEFEFE
              FEFED8B2A799361ACD9D90FEFEFEFEFEFEFEFEFEFEFEFEFAF6F499361A6FF9F2
              F1FFFFFFFEFEFEFEFEFEDBB8AE99361A99361A99361A99361A99361A99361A99
              361A99361AA8543CFFFFFFFEFEFED7B1A699361ACD9D90FFFFFFFEFEFEFEFEFE
              FFFFFFF9F5F399361A80F8F1EFFFFFFFFFFFFFFFFFFFDBB8AE99361A99361A99
              361A99361A99361A99361A99361A99361AA8543CFFFFFFFFFFFFD8B2A799361A
              CE9F91FFFFFFFFFFFFFFFFFFFFFFFFE2C6BE99361A66F7EFEDFFFFFFFEFEFEFE
              FEFEDCBAB099361A99361A99361A99361A99361A99361A99361A99361AA7523A
              FEFEFEFEFEFED7B1A699361ACE9E91FFFFFFFEFEFEFEFEFEF1E5E1A7523A9936
              1A58F3E7E4FFFFFFFFFFFFFEFEFEDCBAB099361A99361A99361A99361A99361A
              99361A99361A99361AA7523AFEFDFDFFFFFFD8B2A799361AD0A295FFFFFFFFFF
              FFF1E5E1AB594299361A99361A00D4AA9EFFFFFFFFFFFFFFFFFFE9D3CDA3492F
              A0442AA0442AA0442AA0442AA0442AA0442AA0442AA2472EAE5F48AF614AAA57
              40A2472EDFC0B7FFFFFFF2E6E2AB594299361A99361A99361A0D9F4328D5ABA0
              F5EBE8F9F2F1F9F4F2F1E4E0EFE0DCEFE0DCEFE0DCEFE0DCEFE0DCEEDFDAEEDF
              DAEFDFDBEEDFDAEFDFDBEFDFDBF1E4E0F9F2F1E1C3BBA7513999361A99361A99
              361A99361A0D}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton10: TSpeedButton
            Left = 543
            Top = 10
            Width = 98
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Excluir'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000C30E0000C30E0000000000000000000099361A99361A
              99361A99361AB36853E3C8C0E4C9C2E3C9C1E3C9C1E4C9C2E3C9C1E3C9C1E3C9
              C1E3C9C1E4C9C2E3C9C1E3C9C1E3C9C1E3C8C0B3685399361A99361A99361A99
              361A99361A99361A99361A9F4127E3C8C0A64F379B391E9B391E9B391E9B391E
              9B391E9B391E9B391E9B391E9B391E9B391E9B391E9B391EA64F37E2C7BF9F41
              2799361A99361A99361A99361A99361A99361AA8543CD7B0A599361A99361A99
              361A9B391E99361A99361A9A381C9A381C99361A99361A9B391E99361A99361A
              99361AD6B0A5A8543C99361A99361A99361A99361A99361A99361AA9563ED7B0
              A599361A99361A99361ACE9F91AE5F4999361ABD7E6CBE7F6D99361AAE5F49CF
              A09399361A99361A99361AD7B0A5A9563E99361A99361A99361A99361A99361A
              99361AA9563ED7B0A599361A99361A99361AD0A295AF624C99361ABF8270BF82
              7099361AAF624CD0A29599361A99361A99361AD7B0A5A9563E99361A99361A99
              361A99361A99361A99361AA9563ED6B0A599361A99361A99361AD0A295AF624C
              99361ABF8170BF817099361AAF624CD0A29599361A99361A99361AD7B0A5A956
              3E99361A99361A99361A99361A99361A99361AA9563ED7B0A599361A99361A99
              361AD0A295AF624C99361ABF8170BF817099361AAF624CCFA19499361A99361A
              99361AD7B0A5A9563E99361A99361A99361A99361A99361A99361AA9563ED7B0
              A599361A99361A99361AD0A295AF624C99361ABF8270BF827099361AAF624CD0
              A29599361A99361A99361AD7B0A5A9563E99361A99361A99361A99361A99361A
              99361AA9563ED6B0A599361A99361A99361AD0A295AF624C99361ABF8170BF81
              7099361AAF624CD0A29599361A99361A99361AD7B0A5A9563E99361A99361A99
              361A99361A99361A99361AA9563ED7B0A599361A99361A99361AD0A295AF624C
              99361ABF8170BF817099361AAF624CCFA19499361A99361A99361AD7B0A5A956
              3E99361A99361A99361A99361A99361A99361AA9563ED7B0A599361A99361A99
              361AD0A295AF624C99361ABF8270BF827099361AAF624CD0A29599361A99361A
              99361AD7B0A5A9563E99361A99361A99361A99361A99361A99361AA9563ED6B0
              A599361A99361A99361AD0A295AF624C99361ABF8170BF817099361AAF624CD0
              A29599361A99361A99361AD7B0A5A9563E99361A99361A99361A99361A99361A
              99361AA9553ED6B0A599361A99361A99361AD0A295AF624C99361ABF8270BF81
              7099361AAF624CD0A29599361A99361A99361AD7B0A5A9563E99361A99361A99
              361A99361A99361A99361AA9563ED7B0A599361A99361A99361ACFA194AF624C
              99361ABF8270BF817099361AAF624CCFA19499361A99361A99361AD7B0A5A956
              3E99361A99361A99361A99361A99361A99361AA9563ED7B0A599361A99361A99
              361AD0A295AF624C99361ABF8270BF817099361AAF624CD0A29599361A99361A
              99361AD7B0A5A9563E99361A99361A99361A99361A99361A99361AA9553ED6B0
              A599361A99361A99361AD0A295AF624C99361ABF8270BF817099361AAF624CD0
              A29599361A99361A99361AD7B0A5A9563E99361A99361A99361A99361A99361A
              99361AA65138D1A59899361A99361A99361AC99586AB5A4399361ABA7764BA77
              6499361AAB5A43C9958699361A99361A99361AD1A598A7513999361A99361A99
              361A99361A99361AA2472EA44C33A9553EA34A31A34A31A34A31A64F37A44C33
              A34A31A54E35A54E35A34A31A44C33A64F37A34A31A34A31A34A31A9563EA44C
              33A2472E99361A99361A99361AA3492FEEDED9DCBAB0DCBAB0DCBAB0DCBAB0DC
              BAB0DCBAB0DCBAB0DCBAB0DCBAB0DBB9AFDCBAB0DCBAB0DBB9AFDCBAB0DCBAB0
              DBB9AFDCBAB0DCBAB0EEDED9A3492F99361A99361AA0442AE3C8C0AB5A43AB59
              42AB5942AB5942AB5942AA5941AB5942AB5942AA5941AB5942AA5941AB5942AB
              5942AA5941AB5942AB5942AA5941AB5A43E4C9C2A0442A99361A99361A99361A
              B66F5BD4AA9ED4AA9ED3A99DD4AA9ED3A99DD3A99DD4AA9ED3A99DD3A99DD3A9
              9DD4AA9ED4AA9ED3A99DD4AA9ED4AA9ED3A99DD4AA9ED4AA9EB66F5B99361A99
              361A99361A99361A99361A99361A99361A99361A99361A99361ACA97899A381C
              99361A99361A99361A99361A9A381CCB988999361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361AD2A89CB976639B3B1F9B391E9B391E9B3B1FB97663D3A89C99361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361AA0442ADBB8AEE5CBC4E4C9C2E4C9C2E5CBC4DBB8AEA0
              442A99361A99361A99361A99361A99361A99361A99361A99361A}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton11: TSpeedButton
            Left = 679
            Top = 10
            Width = 178
            Height = 35
            Hint = 'Criar uma nova ordem de servi'#231'o'
            Caption = 'Imprimir parcelas'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            Glyph.Data = {
              A2070000424DA207000000000000360000002800000019000000190000000100
              1800000000006C070000120B0000120B0000000000000000000099361A99361A
              99361A99361A99361A99361AAA5740AF624CAF624CAF624CAF624CAF624CAF62
              4CAF624CAF624CAF614A9B391E99361A99361A99361A99361A99361A99361A99
              361A99361A2099361A99361A99361A99361A99361A9A381CE6CEC7FCFBFAFCFB
              FAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFDFCFBFCFBFAD4AA9E9C3C2199361A99
              361A99361A99361A99361A99361A99361A3E99361A99361A99361A99361A9936
              1A9A381CE7D1CAEFE0DCBC7B69BB7A67BB7A67BB7967BB7A67BB7A67E8D2CCFE
              FEFEFDFCFCD4AA9E9B391E99361A99361A99361A99361A99361A99361A209936
              1A99361A99361A99361A99361A9A381CE8D1CBE7D1CA9A381C99361A99361A99
              361A99361A99361ADDBDB4FFFFFFFEFEFEFFFFFFD6B0A59B391E99361A99361A
              99361A99361A99361A2099361A99361A99361A99361A99361A9A381CE8D1CBE8
              D1CB9A381C99361A99361A99361A99361A99361ADDBDB4FFFFFFFFFFFFFFFFFF
              FFFFFFD0A29599361A99361A99361A99361A99361A6E99361A99361A99361A99
              361A99361A9B391EE7D1CAE7D1CA9A381C99361A99361A99361A99361A99361A
              DDBDB4FEFEFEFEFEFEFFFFFFFEFEFEE8D1CB9A381C99361A99361A99361A9936
              1A2099361AE4CAC3E8D1CBE9D3CDE9D3CDE9D4CEFAF6F4E7D1CA9A381C99361A
              99361A99361A99361A99361AA8543CB0644EB16550B26853EEDED9F9F5F3E9D3
              CDE8D1CBE7D1CAE8D1CBE5CBC42099361AFAF6F4FFFFFFFFFFFFF7EFEDF3E7E4
              FCF9F8E8D1CB9A381C99361A99361A99361A99361A99361A99361A99361A9936
              1A9B391EE9D3CDFCF9F8F3E7E4F6EEEBFFFFFFFFFFFFFAF6F43099361AFAF6F4
              FFFFFFFEFEFEBF806E9B3B1FE7D1CAE7D1CA9A381C99361A99361A99361A9936
              1A99361A99361A99361A99361A9B391EE8D2CCE8D1CB9B3B1FBB7865FEFEFEFF
              FFFFF9F5F34299361AFAF6F4FFFFFFFFFFFFBE806E9A381CE8D1CBE7D1CA9A38
              1C99361A99361A99361A99361A99361A99361A99361A99361A9B391EE7D1CAE8
              D1CB9A381CBA7764FEFEFEFFFFFFFAF6F43A99361AFAF6F4FFFFFFFFFFFFBE7F
              6D9A381CE8D1CBE8D1CB9A381C99361A99361A99361A99361A99361A99361A99
              361A99361A9A381CE8D1CBE8D1CB9A381CBA7764FFFFFFFFFFFFFAF6F43E9936
              1AFAF6F4FFFFFFFEFEFEBE806E9A381CC38A79C48B7B9A381C99361A99361A99
              361A99361A99361A99361A99361A99361A9A381CC38979C389799A381CBA7764
              FEFEFEFFFFFFF9F5F32299361AFAF6F4FFFFFFFFFFFFBF827099361A99361A99
              361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
              99361A99361A99361ABA7764FEFEFEFFFFFFFAF6F46999361AFAF6F4FFFFFFFF
              FFFFE0C2B9CB9889C99687C99687C99586C99586C99485C99586C99586C99586
              C99586C99586C99586C99586C99586C99586C99586DAB6ACFFFFFFFFFFFFFAF6
              F43A99361AF9F5F3FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFAF6F42099361AFAF6F4FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFE
              FEFFFFFFFFFFFFFEFEFED0A295BB7865BB7865EBD8D2FAF6F47299361AFAF6F4
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC38877A8543CA8543CE5
              CDC6FAF6F43A99361AF9F5F3FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFF
              FFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF6F42099361ACA9688CC9B8DCD9C8ECD9C
              8ECD9D90F4E9E6F3E8E5CD9D8FCD9C8ECD9C8ECD9C8ECD9C8ECD9C8ECD9C8ECD
              9C8ECD9C8ECD9D90F3E8E5F3E8E5CD9D8FCD9C8ECD9C8ECD9C8ECA96883E9936
              1A99361A99361A99361A99361A9A381CE8D1CBE8D1CB9A381C99361A99361A99
              361A99361A99361A99361A99361A99361A9A381CE8D1CBE8D1CB9A381C99361A
              99361A99361A99361A6599361A99361A99361A99361A99361A9A381CE7D1CAE7
              D1CA9A381C99361A99361A99361A99361A99361A99361A99361A99361A9A381C
              E7D1CAE8D1CB9A381C99361A99361A99361A99361A2F99361A99361A99361A99
              361A99361A9A381CE8D1CBF1E3E0C38877C38877C38877C28877C38877C38877
              C38877C38877C38877C38877F1E4E0E8D1CB9A381C99361A99361A99361A9936
              1A6499361A99361A99361A99361A99361A9A381CE5CDC6FCF9F8FCF9F8FCF9F8
              FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8E5CDC69A38
              1C99361A99361A99361A99361A6E99361A99361A99361A99361A99361A99361A
              A7523AAC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C
              45AC5C45AC5C45A7523A99361A99361A99361A99361A99361A3299361A99361A
              99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
              1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
              361A99361A64}
            Layout = blGlyphRight
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 224
          Width = 965
          Height = 152
          Align = alBottom
          BorderStyle = bsNone
          DataSource = s_ParcelasOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGrid3CellClick
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 193
          Width = 224
          Height = 25
          DataSource = s_ParcelasOS
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
        object edtNumeroParcela: TEdit
          Left = 15
          Top = 32
          Width = 90
          Height = 25
          TabOrder = 3
        end
        object edtValorParcela: TEdit
          Left = 111
          Top = 32
          Width = 121
          Height = 25
          TabOrder = 4
        end
        object edtVencimentoParcela: TEdit
          Left = 238
          Top = 32
          Width = 91
          Height = 25
          TabOrder = 5
        end
        object edtDescontoParcela: TEdit
          Left = 336
          Top = 32
          Width = 100
          Height = 25
          TabOrder = 6
        end
        object edtJurosParcelas: TEdit
          Left = 442
          Top = 32
          Width = 100
          Height = 25
          TabOrder = 7
        end
        object edtMultaParcela: TEdit
          Left = 548
          Top = 32
          Width = 100
          Height = 25
          TabOrder = 8
        end
        object edtTotalParcela: TEdit
          Left = 654
          Top = 32
          Width = 121
          Height = 25
          TabOrder = 9
        end
        object edtDataPagamentoParcela: TDateTimePicker
          Left = 15
          Top = 91
          Width = 114
          Height = 25
          Date = 43807.000000000000000000
          Time = 0.631795821762352700
          TabOrder = 10
        end
        object edtHoraPagamento: TMaskEdit
          Left = 135
          Top = 91
          Width = 120
          Height = 25
          EditMask = '00:00:00'
          MaxLength = 8
          TabOrder = 11
          Text = '  :  :  '
        end
        object edtFormaPagamentoParcela: TComboBox
          Left = 272
          Top = 91
          Width = 145
          Height = 25
          TabOrder = 12
        end
        object edtPgtoParcela: TComboBox
          Left = 442
          Top = 91
          Width = 63
          Height = 25
          TabOrder = 13
        end
        object edtObservacoesParcela: TEdit
          Left = 15
          Top = 153
          Width = 760
          Height = 25
          TabOrder = 14
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 510
    Width = 973
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 2
    object sbNovo: TSpeedButton
      Left = 7
      Top = 24
      Width = 210
      Height = 35
      Hint = 'Criar uma nova ordem de servi'#231'o'
      Caption = 'Criar ordem de servi'#231'o'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A9A381CAA5941CA9688E5CDC6EAD7D19B3B1F9B3B
        1FEAD7D1E5CDC6CA9688AB59429A381C99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361AA9563EDEBEB5F9F5F3FFFF
        FFFFFFFFF4E9E69B3B1F9B3B1FF4E9E6FFFFFFFFFFFFF9F5F3DEBEB5A9563E99
        361A99361A99361A99361A99361A99361A8099361A99361A99361A99361AC083
        72F7F0EEFEFEFEFEFEFEEEDED9CD9D90B66F5B9A381C9A381CB66F5BCD9D90ED
        DDD8FEFEFEFEFEFEF8F1EFC0837299361A99361A99361A99361A99361A669936
        1A99361A99361ACC9B8DFDFCFBFFFFFFEBD8D3B7705C9A381C99361A99361A99
        361A99361A99361A99361A9A381CB7705CECD9D4FEFEFEFDFCFBCD9C8E99361A
        99361A99361A99361A5899361A99361AC08372FCFBFAFEFDFDDBB8AE9F432899
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9F4328
        DBB8AEFEFDFDFDFCFBC0837299361A99361A99361A0099361AA9563EF7F0EEFE
        FEFEDBB8AE9C3C2199361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A9C3C21DBB8AEFEFEFEF8F1EFA9563E99361A9936
        1A0D9A381CDEBEB5FFFFFFECD9D49F432899361A99361A99361A99361A99361A
        9A381CB7725EB7725E9A381C99361A99361A99361A99361A99361A9F4328ECD9
        D4FEFEFEDEBEB59A381C99361A00AB5A43FAF6F4FFFFFFB7705C99361A99361A
        99361A99361A99361A99361AA34A31F9F4F2F9F4F2A34A3199361A99361A9936
        1A99361A99361A99361AB7705CFFFFFFF9F5F3AB594299361A00CA9688FFFFFF
        EFDFDB9A381C99361A99361A99361A99361A99361A99361AA54E35FCFBFAFDFC
        FBA54E3599361A99361A99361A99361A99361A99361A9A381CEEDFDAFFFFFFCA
        968899361A00E5CDC6FFFFFFCD9D9099361A99361A99361A99361A99361A9936
        1A99361AA54E35FDFCFBFDFCFBA54E3599361A99361A99361A99361A99361A99
        361A99361ACD9D8FFFFFFFE5CDC699361A00EBD8D2F4E9E6B66E5A99361A9936
        1A99361A9A381CA34A31A54E35A54E35AF624CFDFCFBFDFCFBAF624CA54E35A5
        4E35A34A319A381C99361A99361A99361AB66E5AF4E9E6EBD8D299361A009B3B
        1F9B3B1F9A381C99361A99361A99361AB7725EF9F4F2FDFCFBFDFCFBFDFCFBFE
        FEFEFEFEFEFDFCFBFDFCFBFDFCFBF9F4F2B7725E99361A99361A99361A9A381C
        9B3B1F9B3B1F99361A009B3B1F9B3B1F9A381C99361A99361A99361AB7725EF9
        F4F2FCFBFAFCFBFAFDFCFBFEFEFEFEFEFEFDFCFBFCFBFAFCFBFAF9F4F2B7725E
        99361A99361A99361A9A381C9B3B1F9B3B1F99361A00EBD8D2F4E9E6B66F5B99
        361A99361A99361A9A381CA34A31A54E35A54E35AF624CFDFCFBFDFCFBAF624C
        A54E35A54E35A34A319A381C99361A99361A99361AB66F5BF3E8E5EAD7D19936
        1A00E5CDC6FFFFFFCD9D9099361A99361A99361A99361A99361A99361A99361A
        A54E35FCFBFAFCFBFAA54E3599361A99361A99361A99361A99361A99361A9936
        1ACD9D90FEFEFEE5CDC699361A00CA9688FFFFFFEFDFDB9A381C99361A99361A
        99361A99361A99361A99361AA54E35FDFCFBFDFCFBA54E3599361A99361A9936
        1A99361A99361A99361A9A381CEFDFDBFFFFFFCA968899361A00AB5942FAF6F4
        FFFFFFB7705C99361A99361A99361A99361A99361A99361AA34A31F9F4F2F9F4
        F2A34A3199361A99361A99361A99361A99361A99361AB7705CFFFFFFFAF6F4AA
        594199361A009A381CDEBEB5FEFEFEECD9D49F432899361A99361A99361A9936
        1A99361A9A381CB7725EB7725E9A381C99361A99361A99361A99361A99361A9F
        4328ECD9D4FEFEFEDEBEB59A381C99361A0099361AA9563EF7F0EEFEFEFEDAB7
        AE9C3C2199361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A9C3C21DBB8AEFEFEFEF8F1EFA9563E99361A99361A009936
        1A99361AC08372FDFCFBFEFDFDDBB8AE9F432899361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A9F4127DBB8AEFEFDFDFDFCFBC08372
        99361A99361A99361A0099361A99361A99361ACD9C8EFDFCFBFEFEFEECD9D4B7
        705C9A381C99361A99361A99361A99361A99361A99361A9A381CB7705CECD9D4
        FEFEFEFCFBFACC9B8D99361A99361A99361A99361A0099361A99361A99361A99
        361AC08372F7F0EEFEFEFEFFFFFFEEDED9CD9D8FB66E5A9A381C9A381CB66F5B
        CD9D8FEDDDD8FFFFFFFFFFFFF7F0EEC0837299361A99361A99361A99361A9936
        1A0099361A99361A99361A99361A99361AA9563EDEBEB5FAF6F4FFFFFFFFFFFF
        F4E9E69B3B1F9B3B1FF4E9E6FFFFFFFFFFFFFAF6F4DEBEB5A9563E99361A9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        9A381CAB5942CA9688E5CDC6EBD8D29B3B1F9B3B1FEBD8D2E5CDC6CA9688AB59
        429A381C99361A99361A99361A99361A99361A99361A99361A0099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A00}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbNovoClick
    end
    object sbSalvar: TSpeedButton
      Left = 223
      Top = 24
      Width = 89
      Height = 35
      Hint = 'Salva a opera'#231#227'o em andamento'
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A00A0442AD8B2A7F8F1F0F4E9E6EFDFDBEDDDD8EDDDD8EDDDD8EDDD
        D8EEDED9EEDED9EEDED9EEDED9EDDDD8EEDED9EEDED9EDDDD8EEDED9EDDDD8EE
        DFDAF2E6E3F9F2F1DAB7AEA2472E99361A80D6AFA3FFFFFFF6EEEBA44C33A044
        2AA0442A9F43289F43289F43289F43289F43289F43289F43289F43289F43289F
        43289F43289F43289F4328A0442AA34930F2E6E2FFFFFFDDBBB299361A66F4E9
        E6FFFFFFEDDBD699361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361AE7D1CA
        FFFFFFF8F1F099361A58F7EFEDFFFFFFECD9D499361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361AE6CFC8FFFFFFFAF6F499361A00F8F1EFFFFFFFEBD8D399
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361AE7D0C9FFFFFFFAF6F49936
        1A0DF9F2F1FFFFFFEBD8D399361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1AE6CFC8FFFFFFF9F5F399361A0DF9F4F2FFFFFFECD9D499361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361AE6CFC8FFFFFFFAF6F499361A80F9F4F2FFFFFF
        ECD9D499361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361AE7D0C9FFFFFFFA
        F6F499361A66FAF6F4FFFFFFEBD8D399361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361AE7D1CAFFFFFFF9F5F399361A58FAF6F4FFFFFFECDAD599361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361AE7D1CAFFFFFFFAF6F499361A74FAF6
        F4FFFFFFEDDDD899361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361AE8D1CB
        FFFFFFFAF6F499361A0DFAF6F4FFFFFFF7F0EEA54E359E3F259D3E239C3C219C
        3C219C3C219C3C219C3C219C3C219C3C219C3C219C3C219C3C219D3E239C3C21
        9C3C219D3E23A2472EF3E7E4FFFFFFF9F5F399361A00FAF6F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF
        FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFAF6F49936
        1A80FAF6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFAF6F499361A66F9F5F3FFFFFFFEFEFEFEFEFEFEFDFDECDAD5
        E5CDC7E5CDC6E5CDC6E5CCC5E5CCC5E5CDC6E5CCC5E5CDC6E5CCC5E5CCC5E5CD
        C6E7D1CAFDFCFCFEFEFEFEFEFEFEFEFEFEFEFEFAF6F499361A58FAF6F4FFFFFF
        FFFFFFFFFFFFE3C8C099361A99361A99361A99361A99361A99361A99361A9936
        1A9E3F25B97562B97562AD5D4799361AD4AB9FFFFFFFFFFFFFFEFEFEFFFFFFFA
        F6F499361A0DF9F4F2FFFFFFFFFFFFFFFFFFDAB7AE99361A99361A99361A9936
        1A99361A99361A99361A99361AA8543CFFFFFFFFFFFFD8B2A799361ACD9D90FF
        FFFFFFFFFFFFFFFFFFFFFFFAF6F499361A0DF9F4F2FFFFFFFEFEFEFEFEFEDAB6
        AC99361A99361A99361A99361A99361A99361A99361A99361AA8543CFEFEFEFE
        FEFED8B2A799361ACD9D90FEFEFEFEFEFEFEFEFEFEFEFEFAF6F499361A6FF9F2
        F1FFFFFFFEFEFEFEFEFEDBB8AE99361A99361A99361A99361A99361A99361A99
        361A99361AA8543CFFFFFFFEFEFED7B1A699361ACD9D90FFFFFFFEFEFEFEFEFE
        FFFFFFF9F5F399361A80F8F1EFFFFFFFFFFFFFFFFFFFDBB8AE99361A99361A99
        361A99361A99361A99361A99361A99361AA8543CFFFFFFFFFFFFD8B2A799361A
        CE9F91FFFFFFFFFFFFFFFFFFFFFFFFE2C6BE99361A66F7EFEDFFFFFFFEFEFEFE
        FEFEDCBAB099361A99361A99361A99361A99361A99361A99361A99361AA7523A
        FEFEFEFEFEFED7B1A699361ACE9E91FFFFFFFEFEFEFEFEFEF1E5E1A7523A9936
        1A58F3E7E4FFFFFFFFFFFFFEFEFEDCBAB099361A99361A99361A99361A99361A
        99361A99361A99361AA7523AFEFDFDFFFFFFD8B2A799361AD0A295FFFFFFFFFF
        FFF1E5E1AB594299361A99361A00D4AA9EFFFFFFFFFFFFFFFFFFE9D3CDA3492F
        A0442AA0442AA0442AA0442AA0442AA0442AA0442AA2472EAE5F48AF614AAA57
        40A2472EDFC0B7FFFFFFF2E6E2AB594299361A99361A99361A0D9F4328D5ABA0
        F5EBE8F9F2F1F9F4F2F1E4E0EFE0DCEFE0DCEFE0DCEFE0DCEFE0DCEEDFDAEEDF
        DAEFDFDBEEDFDAEFDFDBEFDFDBF1E4E0F9F2F1E1C3BBA7513999361A99361A99
        361A99361A0D}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSalvarClick
    end
    object sbEditar: TSpeedButton
      Left = 318
      Top = 24
      Width = 76
      Height = 35
      Hint = 'Edita o registro selecionado'
      Caption = 'Editar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361ACFA194E9D3CDB66E5A9A381C9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A8099361A99361A99361A99361ADEBE
        B5D7B1A6D3A99DD1A598A0442A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A669936
        1A99361A99361A99361AD6B0A5A54E3599361AB46C57E0C2B9A3493099361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A5899361A99361A99361A99361ACFA093A64F3799361A99
        361AAB5A43E6CEC7A64F3799361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A0099361A99361A99361A99
        361AC58E7EB2675299361A99361A99361AB46B57E1C5BD9F432899361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A0D99361A99361A99361A99361AB56D59C9958699361A99361A99361AA8543C
        EDDCD7CE9F9199361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361AA34930E2C6BE
        99361AA1462CCD9D90FCF9F8FFFFFFFCF9F8A7523A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A8099361A99361A
        99361A99361A9B391EE0C2B9C79080F1E3DFFFFFFFFFFFFFFFFFFFFFFFFFDBB9
        AF9B391E99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A6699361A99361A99361A99361A99361AB97562FEFEFEFFFFFFFEFE
        FEFEFEFEFFFFFFFEFEFEFCF9F9B2675199361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A5899361A99361A99361A99361A9936
        1A99361AE7D0C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE8D1CB9C3C2199
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A009936
        1A99361A99361A99361A99361A99361AB26751FBF7F6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFDFDBE806E99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A0D99361A99361A99361A99361A99361A99361A9A381CDB
        B8AEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF3E7E49D3E2399361A99361A
        99361A99361A99361A99361A99361A99361A99361A6499361A99361A99361A99
        361A99361A99361A99361AA75139F7F0EEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF
        FFFFFFCB998B99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A8099361A99361A99361A99361A99361A99361A99361A99361ACD9D90FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EFEDA6513899361A99361A99361A9936
        1A99361A99361A99361A99361A6699361A99361A99361A99361A99361A99361A
        99361A99361A9F4127F4EAE7FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED8B2
        A799361A99361A99361A99361A99361A99361A99361A99361A5899361A99361A
        99361A99361A99361A99361A99361A99361A99361ABF8270FEFDFDFFFFFFFEFE
        FEFFFFFFFFFFFFFEFEFEFBF8F7B0634E99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361A99361A99361A99361A9936
        1A9C3C21E9D3CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F6CB98899A381C99
        361A99361A99361A99361A99361A99361A0D99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361AB56D59FCFBFAFEFEFEFEFEFEFEFEFEE7
        D1CAB46B57C79080B8736099361A99361A99361A99361A99361A99361A6F9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A9B391EDD
        BBB2FEFEFEF2E6E2C18473B7725EEDDCD7FEFEFEEEDED99F412799361A99361A
        99361A99361A99361A8099361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361AA8543CD4AB9FB36853DDBBB2FDFAFAFFFFFFFFFFFF
        FFFFFFC38A7999361A99361A99361A99361A99361A6699361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361ABB7A67F8F1EF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEDDBDB499361A99361A99361A99361A9936
        1A5899361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361AA34930F4E9E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9B8D9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361AC48B7BFEFDFDFFFFFFFFFF
        FFFEFDFDE2C6BEA1462C99361A99361A99361A99361A99361A0D99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A9C3C21CFA093F7EFEDEEDED9BF82709B3B1F99361A99361A99361A99361A99
        361A99361A00}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEditarClick
    end
    object sbExcluir: TSpeedButton
      Left = 400
      Top = 24
      Width = 100
      Height = 35
      Hint = 'Exclui o registro selecionado'
      Caption = 'Excluir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361A99361A99361ABC7B69EDDB
        D6F9F4F2FAF6F4FAF6F4FAF6F4F9F5F3FAF6F4F9F4F2F8F3F1EEDFDABC7B6999
        361A99361A99361A99361A99361A99361A8099361A99361A99361A99361A9936
        1A99361AB36A55FCF9F9FBF7F6F9F4F2FFFFFFF8F1EFF1E3DFF1E3DFF9F2F1FF
        FFFFF7F0EEFBF7F6FDFAFAB56D5999361A99361A99361A99361A99361A009936
        1A99361A99361A99361A99361A9A381CE1C3BBFDFCFCBD7D6AC79182FEFEFEC3
        887799361A99361AC99485FEFEFEC08372BB7967FDFCFCE1C3BB9A381C99361A
        99361A99361A99361A0099361A99361A99361A99361A99361A9F4328F1E5E1F1
        E4E0C18473EEDED9B97562EDDCD7B7725EBB7A67EAD6D0BA7764F0E1DDBA7764
        F1E3E0F1E5E19F432899361A99361A99361A99361AFF99361A99361A99361A99
        361A99361AA75139FDFAFAFCF9F8F1E4E0AB594299361AAD5D47F1E4E0EEDFDA
        A8543C99361AB0644EF2E6E3FCF9F8FDFAFAA7513999361A99361A99361A9936
        1AFF99361A99361A99361A99361A99361AB66F5BFEFEFEF3E8E5EEDFDAB66F5B
        99361AB97562EBD8D3EEDFDAB66F5B99361ABD7D6AEEDFDAF5EDEAFEFEFEB66F
        5B99361A99361A99361A99361AFF99361A99361A99361A99361A99361AC79182
        FFFFFFC28676AA5941EFDFDBD0A295EAD6D0A65138AB5A43EDDCD7D1A599ECDA
        D5A64F37C38877FEFEFEC8938499361A99361A99361A99361A2099361A99361A
        99361A99361A99361AD9B3A9FFFFFFB165509A381CC79182FDFCFBC388779936
        1A9A381CCB998BFDFCFBC1867599361AB16550FFFFFFD8B3A899361A99361A99
        361A99361A2099361A99361A99361A99361A99361AE9D4CEFEFEFEB97663B975
        62EBD8D3B97562EDDBD7B7705CBD7D6BEAD7D1B87360EEDFDAB66F5BBF8270FE
        FEFEE9D4CE99361A99361A99361A99361A2099361A99361A99361A99361A9F41
        27F5ECE9F7F0EEF4EAE7F2E6E2A7513999361AAB5A43F3E8E5F1E3DFA6513899
        361AAB5A43F5EBE8F1E4E0F6EEECF4EBE99F412799361A99361A99361A209936
        1A99361A99361A99361AAA5740FBF7F6F8F1EFEDDBD6EDDDD8B873609A381CBF
        806EECD9D4EEDED9B7725E99361ABF8170EDDBD6EEDED9F6EEECFBF7F6AA5740
        99361A99361A99361A2099361A99361A99361A99361AB7705CFEFEFEF1E5E1A7
        5139AC5C45EEDFDAD1A598ECD9D4A8543CAD5D47EDDBD7D1A599ECDAD5A7523A
        AB5A43F5EDEAFEFEFEB7725E99361A99361A99361A2099361A99361A99361A99
        361AC89384FFFFFFE6CFC89E3F259A381CC99586FDFCFCC1847399361A99361A
        C99687FEFDFDC0837299361AA1462CEAD7D1FFFFFFC8938499361A99361A9936
        1A2099361A99361A99361A99361AD9B5ABFEFDFDE4C9C2DFC0B7C18675ECD9D4
        B7725EECD9D4B87360BF8170E9D4CFB7725EEDDCD7BD7E6CE5CBC4DDBDB4FEFD
        FDD9B4AA99361A99361A99361A2099361A99361A99361A99361AE9D5D0F8F1F0
        A7523AE1C4BCF9F4F2AD5D4799361AAD5D47F1E3E0EDDDD8A7523A99361AB46B
        57FBF8F7D9B3A9A64F37F9F2F1E9D5D099361A99361A99361A2099361A99361A
        9A381CAF624CFBF7F6F8F1EFC99586F8F3F1F1E3DFE3C8C0B87360C79182FAF6
        F4F9F4F2C38979B87360E9D4CEEEDFDAF8F3F1C48B7BF8F1EFFBF7F6AF624C9A
        381C99361AFD99361A99361AA34A31F9F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF9F4F2A34A3199361AFF99361A99361AA64F37FEFEFEFEFE
        FEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA64F3799361AFD9936
        1A99361AA34A31FAF6F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FBF7F6A34A3199361AFE99361A99361A9A381CB26751BD7E6CBF8170DDBBB2FF
        FFFFFCF9F8CD9D8FC08372BF8170C18675F1E3DFFFFFFFF5ECE9C18473C08372
        DDBBB2FFFFFFDEBEB5BE806EB267529A381C99361AFF99361A99361A99361A99
        361A99361A99361A9C3C21DCBBB1FFFFFFEDDBD7A349309B391ED1A599FEFEFE
        FFFFFFFAF6F5CD9C8EAC5C45F5EBE8E9D4CEA0442A99361A99361A99361A9936
        1AE399361A99361A99361A99361A99361A99361A99361A9C3C21D9B5ABFFFFFF
        EDDDD8DAB6ACFFFFFFEDDDD8AE5F49D7B0A5FDFCFBFDFCFBF4EBE9A64F379936
        1A99361A99361A99361A99361AFF99361A99361A99361A99361A99361A99361A
        99361A99361A9E3F25D9B5ABFFFFFFFFFFFFF0E1DDA7513999361A9A381CB975
        62E6CEC7B36A5599361A99361A99361A99361A99361A99361AD099361A99361A
        99361A99361A99361A99361A99361A99361A99361A9C3C21D9B3A9E9D4CFA752
        3A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361AFF}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbExcluirClick
    end
    object sbCancelar: TSpeedButton
      Left = 506
      Top = 24
      Width = 96
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361A99361A99361A99361AA64F
        37C38877DEBFB6EFE0DCF9F2F1F9F4F2F1E4E0E1C3BBC58E7EA8543C99361A99
        361A99361A99361A99361A99361A99361A0099361A99361A99361A99361A9936
        1A99361AA44C33D5ADA2F8F1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF8F1F0DAB6ACA7513999361A99361A99361A99361A99361A009936
        1A99361A99361A99361A99361AB7725EF2E6E3FEFEFEFFFFFFFEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF6EEEBBD7D6A99361A
        99361A99361A99361A0099361A99361A99361A99361AC18675FDFAFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF
        FFFFFFFEFEFEFDFCFBC9958699361A99361A99361A0099361A99361A99361AB7
        705CFDFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBBD7D6B99361A9936
        1A0099361A99361AA34A31F2E6E3FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFF
        FFFEFEFEF5EDEAA7523A99361A0099361A99361AD4AA9EFFFFFFFEFEFEFFFFFF
        FFFFFFFFFFFFF1E4E0D2A79AFBF8F7FFFFFFFFFFFFFEFEFEFFFFFFFCFBFAD4AA
        9EEEDED9FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEDCBAB099361A0099361AA54E35
        F7EFEDFFFFFFFFFFFFFFFFFFFFFFFFF2E6E2AB594299361ABD7D6AFAF6F4FFFF
        FFFFFFFFFCF9F8C389799A381CA75139EEDED9FFFFFFFFFFFFFFFFFFFFFFFFF8
        F3F1AA57400099361AC18574FEFEFEFEFEFEFEFEFEFFFFFFFEFEFED6AEA39A38
        1C99361A99361ABD7D6BFBF8F7FCF9F9C3887799361A99361A99361ACFA093FE
        FEFEFFFFFFFEFEFEFEFEFEFFFFFFC893840099361ADDBBB2FFFFFFFFFFFFFEFE
        FEFFFFFFFFFFFFFDFCFBC3887799361A99361A99361ABA7764BF827099361A99
        361A99361ABD7D6BFBF8F7FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFE4C9C2009936
        1AEEDED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F6C3887799361A99
        361A99361A99361A99361A99361ABD7D6BFAF6F4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5EBE80099361AF4E9E6FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
        FEFEFFFFFFFCF9F9BF827099361A99361A99361A99361ABA7764FBF8F7FFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF9F5F30099361AF5EBE8FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFCF9F9BF817099361A99361A99361A
        99361AB97663FBF8F7FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFAF6
        F40099361AEEDED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F8C38877
        99361A99361A99361A99361A99361A99361ABD7D6BFAF6F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF5EBE80099361ADDBDB4FFFFFFFEFEFEFEFEFEFFFFFF
        FEFEFEFCFBFAC38A799A381C99361A99361ABA7764BF827099361A99361A9936
        1ABD7D6BFBF8F7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE3C9C10099361AC18473
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6AFA39A381C99361A99361ABD7D6AFCF9
        F8FCF9F9C3887799361A99361A99361ACFA093FEFEFEFFFFFFFFFFFFFEFEFEFF
        FFFFC893840099361AA54E35F7EFEDFFFFFFFFFFFFFFFFFFFFFFFFF1E3E0AA57
        4099361ABD7D6AFAF6F4FFFFFFFFFFFFFBF7F6C388779A381CA75139EEDED9FF
        FFFFFFFFFFFFFFFFFFFFFFF9F4F2AA57400099361A99361AD5ABA0FEFEFEFEFE
        FEFFFFFFFEFEFEFEFEFEF1E3E0D1A598FBF8F7FFFFFFFEFEFEFEFEFEFEFEFEFC
        FBFAD2A89CEEDED9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDCBAB099361A009936
        1A99361AA34A31F3E7E4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        F5EDEAA7523A99361A0099361A99361A99361AB7725EFDFAFAFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFCFBBE7F6D99361A99361A0099361A99361A99361A99
        361AC38877FCF9F9FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCFBFAC9948599361A99361A9936
        1A0099361A99361A99361A99361A99361AB87360F4E9E6FEFEFEFFFFFFFFFFFF
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDEABD7D
        6B99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        A44C33D6AFA3F8F1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9F4F2DAB6ACA7513999361A99361A99361A99361A99361A0099361A99361A
        99361A99361A99361A99361A99361A99361AA75139C48B7BE1C3BBF2E6E2F9F4
        F2F8F1EFF2E6E2E2C6BEC68E7FA8543C99361A99361A99361A99361A99361A99
        361A99361A00}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCancelarClick
    end
    object SpeedButton1: TSpeedButton
      Left = 608
      Top = 24
      Width = 114
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Estornar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361AC08372FEFDFDFFFFFFFFFFFFECDA
        D599361A99361A99361AA8543CF9F2F1FFFFFFFFFFFFF9F4F2AA574099361A99
        361A99361A4E99361A99361A99361A99361A99361A99361A99361A99361ACFA1
        94FEFEFEFEFEFEFFFFFFFCF9F99A381C99361A99361AB36A55FEFDFDFEFEFEFE
        FEFEFFFFFFB56D5999361A99361A99361A3099361A99361A99361A99361A9936
        1A99361A99361A99361AB16550FAF6F5FFFFFFFFFFFFD9B5AB99361A99361A99
        361AA0442AEDDCD7FFFFFFFEFEFEEEDFDAA1462C99361A99361A99361A009936
        1A99361A99361A99361A99361A99361A99361A99361A9A381CB26853D4AA9EC5
        8E7E9F412799361A99361A99361A99361AA75139CEA093CEA093A7523A99361A
        99361A99361A99361A0099361A99361A99361A99361A99361A99361A99361A99
        361A99361AA1462CBB7865C38A79C79080C68F80C79182C79182C79182C79182
        C58E7EBA77649B3B1F99361A99361A99361A99361A0099361A99361A99361A99
        361A99361A99361A99361A9B3B1FCB998BFBF7F6FFFFFFFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEDDBDB49C3C2199361A99361A9936
        1A0099361A99361A99361A99361A99361A99361A99361ACE9E91FEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
        FDC9958699361A99361A99361A0099361A99361A99361A99361A99361A99361A
        A54E35FDFAFAFFFFFFFCFBFAD1A497BD7D6BBA7764B87360B87360B87360B873
        60B87360C18574FCFBFAFFFFFFFAF6F5A7523A99361A99361A0099361A99361A
        99361A99361A99361A99361AC38A79FFFFFFFFFFFFCB998B99361A99361A9936
        1A99361A99361A99361A99361A99361A99361ACE9F91FFFFFFFFFFFFDEBFB69B
        391E99361A0099361A99361A99361A99361A99361A99361AD9B3A9FFFFFFFCFB
        FAB0634E99361A99361A99361A99361A99361A99361A99361A99361A99361AA0
        442AF0E1DDFFFFFFFDFAFAB36A5599361A0099361A99361A99361A99361A9936
        1A9B3B1FE9D5D0FEFEFEF6EEECA2472E99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361ABF8170FFFFFFFEFEFEE5CBC49B391E009936
        1A99361A99361A99361A99361AA34930F9F2F1FEFEFEE9D4CF99361A99361A99
        361A99361A99361A99361AA0442AC791829A381C99361A99361A9D3E23E9D4CF
        FEFEFEFDFCFBB7725E0099361A99361A99361A99361A99361AB0644EFFFFFFFF
        FFFFD5ADA299361A99361A99361A99361A99361A99361A99361AE7D0C9B46B57
        99361A99361A99361ABA7764FFFFFFFFFFFFE5CDC60099361A99361A99361A99
        361A99361AC48B7BFEFEFEFEFEFEC1857499361A99361A99361A99361A99361A
        99361A99361ADAB7AEE9D3CD9B3B1F99361A99361A9A381CEAD7D1FEFEFEF7F0
        EE0099361A99361A99361A99361A99361AD9B5ABFFFFFFFDFCFCAD5D4799361A
        99361A99361A99361A99361A99361A99361AE3C8C0FDFAFAAF624C99361A9936
        1A99361AAA5941D9B3A9BB78650099361A99361A99361A99361A9A381CEDDCD7
        FFFFFFF5ECE9A1462C99361A99361A99361A99361A99361A99361AA34930FBF7
        F6FFFFFFBF827099361A99361A99361A99361A99361A99361A0099361A99361A
        99361A99361AA44C33F8F1EFFEFEFEE7D1CA9B391E99361A99361A9F4328D1A4
        979E3F259B391ED9B5ABFEFEFEFEFEFEBD7D6B99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361AB46C57FEFDFDFFFFFFD4AA9E9936
        1A99361A99361AB16550FFFFFFE6CEC7D4AA9EFEFEFEFEFEFEF9F4F2A8543C99
        361A99361A99361A99361A99361A99361A0099361A99361A99361A9D3E23D8B2
        A7FFFFFFFFFFFFBD7D6A99361A99361A99361ABF806EFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD6AFA39A381C99361A99361A99361A99361A99361A99361A009936
        1AB7705CDFC0B7ECDAD5FEFEFEFFFFFFF9F5F3A1462C99361A99361A99361ACB
        998BFEFEFEFEFEFEFFFFFFFEFEFEE9D4CEA1462C99361A99361A99361A99361A
        99361A99361A99361A0099361AF5ECE9FFFFFFFFFFFFFEFEFEFCF9F8BF827099
        361A99361A99361A99361AD6AFA3FFFFFFFFFFFFFFFFFFFFFFFFE7D0C9A1462C
        99361A99361A99361A99361A99361A99361A99361A0099361AD7B0A5F8F1EFF5
        ECE9E4C9C2B66F5B9A381C99361A99361A99361A99361ADEBEB5FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDCBBB199361A99361A99361A99361A99361A99361A9936
        1A0099361A9B391EA34A319F432899361A99361A99361A99361A99361A99361A
        99361AD6AEA3F1E5E1EAD6D0E0C2B9D4AA9EC58D7DAE604A99361A99361A9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A0099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A00}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 784
      Top = 24
      Width = 114
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361AAA5740AF624CAF624CAF624CAF624CAF624CAF62
        4CAF624CAF624CAF614A9B391E99361A99361A99361A99361A99361A99361A99
        361A99361A2099361A99361A99361A99361A99361A9A381CE6CEC7FCFBFAFCFB
        FAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFDFCFBFCFBFAD4AA9E9C3C2199361A99
        361A99361A99361A99361A99361A99361A3E99361A99361A99361A99361A9936
        1A9A381CE7D1CAEFE0DCBC7B69BB7A67BB7A67BB7967BB7A67BB7A67E8D2CCFE
        FEFEFDFCFCD4AA9E9B391E99361A99361A99361A99361A99361A99361A209936
        1A99361A99361A99361A99361A9A381CE8D1CBE7D1CA9A381C99361A99361A99
        361A99361A99361ADDBDB4FFFFFFFEFEFEFFFFFFD6B0A59B391E99361A99361A
        99361A99361A99361A2099361A99361A99361A99361A99361A9A381CE8D1CBE8
        D1CB9A381C99361A99361A99361A99361A99361ADDBDB4FFFFFFFFFFFFFFFFFF
        FFFFFFD0A29599361A99361A99361A99361A99361A6E99361A99361A99361A99
        361A99361A9B391EE7D1CAE7D1CA9A381C99361A99361A99361A99361A99361A
        DDBDB4FEFEFEFEFEFEFFFFFFFEFEFEE8D1CB9A381C99361A99361A99361A9936
        1A2099361AE4CAC3E8D1CBE9D3CDE9D3CDE9D4CEFAF6F4E7D1CA9A381C99361A
        99361A99361A99361A99361AA8543CB0644EB16550B26853EEDED9F9F5F3E9D3
        CDE8D1CBE7D1CAE8D1CBE5CBC42099361AFAF6F4FFFFFFFFFFFFF7EFEDF3E7E4
        FCF9F8E8D1CB9A381C99361A99361A99361A99361A99361A99361A99361A9936
        1A9B391EE9D3CDFCF9F8F3E7E4F6EEEBFFFFFFFFFFFFFAF6F43099361AFAF6F4
        FFFFFFFEFEFEBF806E9B3B1FE7D1CAE7D1CA9A381C99361A99361A99361A9936
        1A99361A99361A99361A99361A9B391EE8D2CCE8D1CB9B3B1FBB7865FEFEFEFF
        FFFFF9F5F34299361AFAF6F4FFFFFFFFFFFFBE806E9A381CE8D1CBE7D1CA9A38
        1C99361A99361A99361A99361A99361A99361A99361A99361A9B391EE7D1CAE8
        D1CB9A381CBA7764FEFEFEFFFFFFFAF6F43A99361AFAF6F4FFFFFFFFFFFFBE7F
        6D9A381CE8D1CBE8D1CB9A381C99361A99361A99361A99361A99361A99361A99
        361A99361A9A381CE8D1CBE8D1CB9A381CBA7764FFFFFFFFFFFFFAF6F43E9936
        1AFAF6F4FFFFFFFEFEFEBE806E9A381CC38A79C48B7B9A381C99361A99361A99
        361A99361A99361A99361A99361A99361A9A381CC38979C389799A381CBA7764
        FEFEFEFFFFFFF9F5F32299361AFAF6F4FFFFFFFFFFFFBF827099361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361ABA7764FEFEFEFFFFFFFAF6F46999361AFAF6F4FFFFFFFF
        FFFFE0C2B9CB9889C99687C99687C99586C99586C99485C99586C99586C99586
        C99586C99586C99586C99586C99586C99586C99586DAB6ACFFFFFFFFFFFFFAF6
        F43A99361AF9F5F3FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFAF6F42099361AFAF6F4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFE
        FEFFFFFFFFFFFFFEFEFED0A295BB7865BB7865EBD8D2FAF6F47299361AFAF6F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC38877A8543CA8543CE5
        CDC6FAF6F43A99361AF9F5F3FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFF
        FFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF6F42099361ACA9688CC9B8DCD9C8ECD9C
        8ECD9D90F4E9E6F3E8E5CD9D8FCD9C8ECD9C8ECD9C8ECD9C8ECD9C8ECD9C8ECD
        9C8ECD9C8ECD9D90F3E8E5F3E8E5CD9D8FCD9C8ECD9C8ECD9C8ECA96883E9936
        1A99361A99361A99361A99361A9A381CE8D1CBE8D1CB9A381C99361A99361A99
        361A99361A99361A99361A99361A99361A9A381CE8D1CBE8D1CB9A381C99361A
        99361A99361A99361A6599361A99361A99361A99361A99361A9A381CE7D1CAE7
        D1CA9A381C99361A99361A99361A99361A99361A99361A99361A99361A9A381C
        E7D1CAE8D1CB9A381C99361A99361A99361A99361A2F99361A99361A99361A99
        361A99361A9A381CE8D1CBF1E3E0C38877C38877C38877C28877C38877C38877
        C38877C38877C38877C38877F1E4E0E8D1CB9A381C99361A99361A99361A9936
        1A6499361A99361A99361A99361A99361A9A381CE5CDC6FCF9F8FCF9F8FCF9F8
        FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8FCF9F8E5CDC69A38
        1C99361A99361A99361A99361A6E99361A99361A99361A99361A99361A99361A
        A7523AAC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C45AC5C
        45AC5C45AC5C45A7523A99361A99361A99361A99361A99361A3299361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A64}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 532
    Top = 5
  end
  object s_Servicos: TDataSource
    OnDataChange = s_ServicosDataChange
    Left = 695
    Top = 288
  end
  object cds_tem_servicos_adicionados: TClientDataSet
    PersistDataPacket.Data = {
      810000009619E0BD010000001800000004000000000003000000810002696404
      00010000000000077365727669636F0100490000000100055749445448020002
      0064000576616C6F72080004000000010007535542545950450200490006004D
      6F6E6579000964657363726963616F0200490000000100055749445448020002
      00FF000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 604
    Top = 277
    object cds_tem_servicos_adicionadosid: TIntegerField
      FieldName = 'id'
    end
    object cds_tem_servicos_adicionadosservico: TStringField
      FieldName = 'servico'
      Size = 100
    end
    object cds_tem_servicos_adicionadosvalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object s_tem_servicos_adicionados: TDataSource
    DataSet = cds_tem_servicos_adicionados
    Left = 684
    Top = 357
  end
  object cds_tem_servicos_adicionados_edit: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD010000001800000003000000000003000000630002696404
      00010000000000077365727669636F0100490000000100055749445448020002
      0064000556616C6F72080004000000010007535542545950450200490006004D
      6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 836
    Top = 333
    object cds_tem_servicos_adicionados_editid: TIntegerField
      FieldName = 'id'
    end
    object cds_tem_servicos_adicionados_editservico: TStringField
      FieldName = 'servico'
      Size = 100
    end
    object cds_tem_servicos_adicionados_editValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object s_tem_servicos_adicionados_edit: TDataSource
    DataSet = cds_tem_servicos_adicionados_edit
    Left = 836
    Top = 277
  end
  object s_ParcelasOS: TDataSource
    OnDataChange = s_ParcelasOSDataChange
    Left = 260
    Top = 309
  end
end
