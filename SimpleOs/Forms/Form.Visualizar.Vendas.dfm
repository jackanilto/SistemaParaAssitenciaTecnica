object formVisualizarVendas: TformVisualizarVendas
  Left = 0
  Top = 0
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'Visualizar vendas'
  ClientHeight = 558
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1133
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    ExplicitLeft = -454
    ExplicitWidth = 917
    DesignSize = (
      1133
      41)
    object sbFechar: TSpeedButton
      Left = 1081
      Top = 0
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
      ExplicitLeft = 940
    end
    object lblCaption: TLabel
      Left = 411
      Top = 10
      Width = 126
      Height = 19
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Visualizar vendas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 483
    Width = 1133
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 491
    ExplicitWidth = 992
    DesignSize = (
      1133
      75)
    object sbImprimirLista: TSpeedButton
      Left = 17
      Top = 24
      Width = 128
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Imprimir lista'
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
    object Label4: TLabel
      Left = 799
      Top = 11
      Width = 97
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Tipo de pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 572
    end
    object Label5: TLabel
      Left = 934
      Top = 11
      Width = 168
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Digite o que deseja pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 707
    end
    object sbExportarLista: TSpeedButton
      Left = 151
      Top = 24
      Width = 130
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Exportar lista'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A9F4328AC5C45BD7D6AD1A497E5CB
        C4E5CBC499361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A9B3B1FA2472EAE5F48C08372D5ABA0E8D1CBF5ECE9FCF9F8
        FFFFFFFFFFFFFFFFFFECDAD599361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361AC38A79D9B3A9E9D4CFF7EFEDFFFFFFFEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEEDDBD69F4127B16550B16550B16550
        B16550B16550B16550B16550B0634EA54E35FAF6F4FFFFFFFFFFFFFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECDAD5B26752FE
        FEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF3E8E5FAF6F4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFECDAD5B26752FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        F2F1FAF6F4FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEEDDBD6A64F37CD9D8FCD9D8FE5CDC7E3C9C1CD9D8FCD9D
        90CD9D8FF8F1F0F9F4F2FAF6F4FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECDAD599361A99361A99361ACB9889
        C58E7E99361A99361A9A381CF2E6E2F9F4F2FAF6F4FFFFFFF5ECE9B87360B770
        5CE6CEC7FFFFFFFFFFFFE1C3BBB7725EBD7D6BF7EFEDFFFFFFECDAD5A8543CD8
        B2A7D8B2A7EBD8D2E9D4CFD8B3A8D9B4AADAB6ACFAF6F4FAF6F4FAF6F4FFFFFF
        FEFEFEC1867599361AB0644EFEFEFEF9F5F3AC5C4599361AC99687FEFEFEFEFE
        FEEDDBD6B26752FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF9
        F5F3FAF6F4FFFFFFFFFFFFF5EDEAA7513999361ADEBEB5D6AFA399361AAA5740
        F9F2F1FFFFFFFEFEFEECDAD59E3F25AE5F49AE5F49D5ADA2D2A79AAE5F49AE5F
        49AE5F49F5EBE8FAF6F4FAF6F4FFFFFFFFFFFFFFFFFFDDBDB49B391EAE5F49A7
        523A9A381CE0C2B9FFFFFFFFFFFFFFFFFFECDAD59B391EA1462CA1462CCEA093
        CA9789A1462CA1462CA1462CF3E7E4FAF6F4FAF6F4FFFFFFFEFEFEFEFEFEFCFB
        FABB786599361A99361AB66F5BFFFFFFFFFFFFFEFEFEFEFEFEEDDBD6AF624CF4
        EAE7F5EBE8F9F5F3F8F3F1F5EBE8F4EAE7F4EAE7FDFCFBF9F5F3FAF6F4FFFFFF
        FFFFFFFFFFFFFDFAFAB7705C99361A99361AB66F5BFDFCFCFFFFFFFFFFFFFEFE
        FEEDDBD6AE5F49EFDFDBEEDFDAF6EEECF6EEEBEEDFDAEFDFDBEFDFDBFDFAFAFA
        F6F4FAF6F4FFFFFFFFFFFFFFFFFFDEBEB59B391EAA5740AF624C9A381CDFC0B7
        FFFFFFFFFFFFFFFFFFEDDBD69A381C9E3F259E3F25CD9D90C995869E3F259E3F
        259E3F25F2E6E2FAF6F4F9F5F3FFFFFFFEFEFEF9F4F2AB594299361AD2A79AE1
        C5BD9A381CAA5740F9F2F1FEFEFEFEFEFEEDDBD6A0442AB66F5BB66F5BDAB6AC
        D6AEA3B66F5BB66F5BB66F5BF4EBE9FAF6F4FAF6F4FFFFFFFFFFFFCD9D909936
        1AA2472EFAF6F5FDFAFAB66E5A99361AC99586FEFEFEFEFEFEEDDBD6B26751FE
        FEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFAF6F4F9F4F2FFFFFF
        FEFDFDC99586C38A79DBB9AFFFFFFFFFFFFFECD9D4C58E7ECB9889FAF6F4FFFF
        FFEDDBD6A75139CFA194CFA194E5CBC4E5CBC4CFA194D0A396D1A599F9F4F2FA
        F6F4F9F4F2FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEEDDBD699361A99361A99361AC58E7EC58E7E99361A9936
        1A9A381CF1E5E1FAF6F4F9F4F2FFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECDAD5A8543CD6AEA3D6AEA3E8D2CC
        E8D2CCD6AEA3D6AEA3D6AEA3F9F4F2F8F3F1F9F4F2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDBD6B26752FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F2F1F9F2F1FFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFE
        FEECD9D4B26752FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF1
        E3E0BA7764CFA093E2C6BEF1E3E0FDFAFAFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFECD9D49D3E23A9563EA9553EA9563EA9563EA9563EA854
        3CA8543CA7523A9F432899361A99361A9A381C9F4127A65138B7725ECC9B8DE0
        C2B9F1E3DFF9F4F2FDFCFCFFFFFFFFFFFFEAD7D199361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A9B391EA65138B56D59C89384DDBBB2DDBBB299361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbExportarListaClick
    end
    object sbEstornarVenda: TSpeedButton
      Left = 287
      Top = 24
      Width = 250
      Height = 35
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Caption = 'Estornar venda selecionada'
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
      OnClick = sbEstornarVendaClick
    end
    object Label1: TLabel
      Left = 560
      Top = 11
      Width = 120
      Height = 15
      Caption = 'Entre datas de venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 719
      Top = 28
      Width = 34
      Height = 25
      Hint = 'Cancela a opera'#231#227'o em andamento'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361AA34A31DDBDB4F9F2F1E4CAC3A9
        563E99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361AA34A31E9D3CDFFFF
        FFFFFFFFFFFFFFE4CAC399361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361AA0442A
        EAD6D0FFFFFFFEFEFEFEFEFEFFFFFFF9F2F199361A99361A99361A99361A9936
        1A99361AA0442AB97562D1A497DEBEB5E2C6BEDCBAB0CB9889B165509C3C2199
        361AA34A31EAD6D0FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFDDBDB499361A99361A
        99361A99361AA0442ACB9889F5EBE8FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCF9F9EBD8D3BF8270E8D2CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D2CCA3
        4A3199361A99361A99361AAB5942ECD9D4FEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEEAD6D0A34A3199361A99361A99361AAD5D47F7F0EEFFFFFFFFFFFFFFFFFFF9
        F4F2E2C7BFCFA093CA9688D3A89CE9D3CDFDFAFAFFFFFFFEFEFEFFFFFFFFFFFF
        FEFEFEFFFFFFEAD6D0A0442A99361A99361A99361AA34A31F0E1DDFFFFFFFFFF
        FFFDFCFBD8B2A7A7523A9A381C99361A99361A99361A9B3B1FAF624CE5CDC6FF
        FFFFFFFFFFFFFFFFFFFFFFE8D2CCA34A3199361A99361A99361A99361AD5ADA2
        FEFEFEFEFEFEFDFCFBC790809A381C99361A99361A99361A99361A99361A9936
        1A99361A9C3C21DAB6ACFEFEFEFEFEFEFEFEFEBF817099361A99361A99361A99
        361AA9563EFAF6F4FFFFFFFEFEFED1A49799361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A9C3C21E5CDC6FFFFFFFEFEFEEBD8D39C3C
        2199361A99361A99361AC99586FFFFFFFFFFFFF2E6E2A2472E99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361AAF624CFDFAFA
        FFFFFFFDFAFAB1655099361A99361A99361AE4C9C2FFFFFFFEFEFED2A89C9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A9B3B1FE9D3CDFEFEFEFFFFFFCB988999361A99361A99361AF5EBE8FFFFFF
        FFFFFFBA776499361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361AD3A89CFEFEFEFFFFFFDCBAB099361A99361A99
        361AFAF6F4FFFFFFFFFFFFB2675299361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361AC99687FFFFFFFFFFFFE2C6
        BE99361A99361A99361AF6EEECFFFFFFFEFEFEB7705C99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361ACFA093
        FEFEFEFEFEFEDEBEB599361A99361A99361AE9D3CDFFFFFFFFFFFFCB998B9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A9A381CE2C7BFFEFEFEFFFFFFD1A49799361A99361A99361AD1A497FFFFFF
        FFFFFFECD9D49D3E2399361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361AA7523AF9F4F2FFFFFFFEFDFDB9756299361A99361A99
        361AB16550FDFAFAFEFEFEFDFCFCC0837299361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A9A381CD8B2A7FEFEFEFEFEFEF4EAE7A044
        2A99361A99361A99361A9A381CE2C6BEFEFEFEFEFEFEF9F2F1B3685399361A99
        361A99361A99361A99361A99361A99361A99361A99361AC68F80FDFCFBFEFEFE
        FEFEFECA978999361A99361A99361A99361A99361AAC5C45F8F1EFFFFFFFFFFF
        FFF9F2F1C083729D3E2399361A99361A99361A99361A99361AA2472ED1A497FD
        FCFBFFFFFFFFFFFFECD9D4A0442A99361A99361A99361A99361A99361A99361A
        BC7B69FDFCFCFFFFFFFEFEFEFDFCFCECD9D4CB998BB7705CB26752BA7764D2A8
        9CF2E6E2FEFEFEFEFEFEFFFFFFF7F0EEAB594299361A99361A99361A99361A99
        361A99361A99361A99361ABC7B69F7F0EEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E1DDAD5D4799361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361AAC5C45E2C6BEFDFAFAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F4D5ADA2A34A3199361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A9A381CB16550D1A599E9D3CDF6EEECFAF6F4F4EAE7E4C9C2C99586A9563E99
        361A99361A99361A99361A99361A99361A99361A99361A99361A}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object cbPesquisar: TComboBox
      Left = 799
      Top = 32
      Width = 129
      Height = 23
      Anchors = [akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 583
    end
    object edtPesquisar: TEdit
      Left = 934
      Top = 32
      Width = 168
      Height = 23
      Anchors = [akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 718
    end
    object edtData1: TMaskEdit
      Left = 559
      Top = 32
      Width = 74
      Height = 23
      EditMask = '00/00/0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object edtData2: TMaskEdit
      Left = 639
      Top = 32
      Width = 74
      Height = 23
      EditMask = '00/00/0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 1133
    Height = 232
    Align = alTop
    Caption = 'Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 39
    ExplicitWidth = 1108
    object DBGrid1: TDBGrid
      Left = 2
      Top = 19
      Width = 1129
      Height = 211
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource_Vendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid1CellClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 279
    Width = 1133
    Height = 204
    Align = alBottom
    Caption = 'Itens contidos na venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 1108
    object DBGrid2: TDBGrid
      Left = 2
      Top = 19
      Width = 1129
      Height = 183
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  object DataSource_Vendas: TDataSource
    Left = 512
    Top = 89
  end
  object DataSource_Itens: TDataSource
    Left = 496
    Top = 367
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 113
    object Excluirestavenda1: TMenuItem
      Caption = 'Excluir esta venda'
      OnClick = Excluirestavenda1Click
    end
    object Estornarestavenda1: TMenuItem
      Caption = 'Estornar esta venda'
    end
    object Imprimirparcelasdestavenda1: TMenuItem
      Caption = 'Imprimir parcelas desta venda'
    end
    object Imprimircomprovantedavenda1: TMenuItem
      Caption = 'Imprimir comprovante da venda'
    end
    object Estornar1: TMenuItem
      Caption = 'Estornar esta venda'
      OnClick = Estornar1Click
    end
    object Exportalistadasvendas1: TMenuItem
      Caption = 'Exporta lista das vendas'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 272
    Top = 359
    object Exportaritens1: TMenuItem
      Caption = 'Exportar itens'
      OnClick = Exportaritens1Click
    end
  end
end