object formEncerramentoCaixa: TformEncerramentoCaixa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Encerramento de caixa'
  ClientHeight = 420
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 24
    Top = 53
    Width = 157
    Height = 21
    Caption = 'Valores recebidos (OS)'
  end
  object Label2: TLabel
    Left = 24
    Top = 125
    Width = 186
    Height = 21
    Caption = 'Valores recebidos (Vendas)'
  end
  object Label3: TLabel
    Left = 24
    Top = 197
    Width = 180
    Height = 21
    Caption = 'Valor de abertura do caixa'
  end
  object Label4: TLabel
    Left = 290
    Top = 53
    Width = 167
    Height = 21
    Caption = 'Valores estornados (OS)'
  end
  object Label5: TLabel
    Left = 290
    Top = 125
    Width = 196
    Height = 21
    Caption = 'Valores estornados (Vendas)'
  end
  object Label6: TLabel
    Left = 290
    Top = 197
    Width = 65
    Height = 21
    Caption = 'Retiradas'
  end
  object Label7: TLabel
    Left = 72
    Top = 267
    Width = 119
    Height = 28
    Caption = 'Total do caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    DesignSize = (
      708
      41)
    object sbFechar: TSpeedButton
      Left = 656
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
      Left = 170
      Top = 10
      Width = 163
      Height = 19
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Encerramento de caixa'
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
  object Panel2: TPanel
    Left = 0
    Top = 348
    Width = 708
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 1
    object sbIniciarCaixa: TSpeedButton
      Left = 200
      Top = 16
      Width = 145
      Height = 49
      Caption = 'Encerrar caixa'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361A99361A99361A99361AA34A
        31C18675E1C3BBF3E7E4FAF6F4FAF6F4F3E7E4E0C2B9C18675A34A3199361A99
        361A99361A99361A99361A99361A99361A0099361A99361A99361A99361A9936
        1A99361A9E3F25CD9C8EF5ECE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF4EBE9CB998B9E3F2599361A99361A99361A99361A99361A009936
        1A99361A99361A99361A99361AA64F37E8D1CBFEFEFEFFFFFFFEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEE7D0C9A54E3599361A
        99361A99361A99361A0099361A99361A99361A99361AA7523AF0E1DDFFFFFFFF
        FFFFFFFFFFFEFDFDEBD8D3D5ADA2C79182C79182D5ADA2EDDBD6FDFCFCFFFFFF
        FFFFFFFEFEFEF0E1DDA7513999361A99361A99361A0099361A99361A99361A9C
        3C21E9D4CEFFFFFFFFFFFFFFFFFFEEDED9B873609D3E2399361A99361A99361A
        99361A9D3E23B97562EFDFDBFFFFFFFFFFFFFFFFFFE8D1CB9C3C2199361A9936
        1A0099361A99361A99361AC89384FEFEFEFFFFFFFEFEFEE5CDC6A3493099361A
        99361A99361A99361A99361A99361A99361A99361AA34A31E6CEC7FEFEFEFFFF
        FFFEFEFEC7918299361A99361A0099361A99361AA3492FF5ECE9FEFEFEFFFFFF
        F1E3DF9F432899361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A9F4328F0E2DEFFFFFFFFFFFFF4EAE7A2472E99361A2099361A99361A
        C08372FFFFFFFFFFFFFDFCFBB9766399361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361AB97663FDFCFBFFFFFFFFFFFFBF
        817099361A2099361A99361ADDBDB4FEFEFEFEFEFEEDDDD89C3C2199361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9C
        3C21EDDDD8FEFEFEFEFEFEDDBCB399361A0099361A9A381CF1E3DFFFFFFFFEFE
        FED2A89C99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361AD5ABA0FFFFFFFEFEFEF0E2DE9B391E009936
        1A9E3F25F5EBE8FFFFFFFFFFFFC48B7B99361A99361A99361A99361A99361AA3
        4A31D6AFA3D6AFA3A34A3199361A99361A99361A99361A99361AC58D7DFFFFFF
        FFFFFFF5ECE99F41270099361A9F4127F4EBE9FEFEFEFEFEFEC3887799361A99
        361A99361A99361A99361AD5ACA1FEFEFEFEFEFED2A89C99361A99361A99361A
        99361A99361AC38979FEFEFEFEFEFEF5ECE99F43280099361A9B3B1FF2E6E2FF
        FFFFFFFFFFCFA09399361A99361A99361A99361A99361AE0C2B9FFFFFFFEFEFE
        DAB7AE99361A99361A99361A99361A99361ACFA194FFFFFFFEFEFEF1E5E19B3B
        1F3A99361A99361AE3C8C0FFFFFFFFFFFFE9D4CE9B391E99361A99361A99361A
        99361AE0C2B9FFFFFFFFFFFFDBB8AE99361A99361A99361A99361A9B391EEAD6
        D0FFFFFFFFFFFFE1C6BE99361A0099361A99361AC79182FEFEFEFEFEFEFCF9F9
        B36A5599361A99361A99361A99361AE0C2BAFEFEFEFEFEFEDBB8AE99361A9936
        1A99361A99361AB46C57FCF9F9FEFEFEFEFEFEC68E7F99361A0099361A99361A
        A54E35F8F1EFFFFFFFFFFFFFEDDBD79F412799361A99361A99361AE1C3BBFFFF
        FFFEFEFEDAB7AE99361A99361A99361A9F4328EDDDD8FFFFFFFFFFFFF8F1EFA4
        4C3399361A0099361A99361A9A381CCFA093FFFFFFFFFFFFFFFFFFDEBFB6A146
        2C99361A99361AE1C3BBFFFFFFFFFFFFDBB8AE99361A99361AA1462CE1C3BBFF
        FFFFFFFFFFFFFFFFCE9E9199361A99361A0099361A99361A99361A9E3F25EDDD
        D8FFFFFFFEFEFEFEFEFEE9D4CEA54E3599361AE1C4BCFEFEFEFEFEFEDBB8AE99
        361AA54E35E9D4CFFEFEFEFEFEFEFEFEFEEDDDD89E3F2599361A99361A009936
        1A99361A99361A99361AA9563EF1E4E0FFFFFFFFFFFFFFFFFFD0A29599361AE1
        C5BDFFFFFFFEFEFEDBB8AE99361AD0A295FFFFFFFEFEFEFEFEFEF1E4E0A9553E
        99361A99361A99361A0099361A99361A99361A99361A99361AAA5941ECD9D4FF
        FFFFFEFDFDC3897999361AE2C6BEFFFFFFFFFFFFDAB7AE99361AC48B7BFEFDFD
        FFFFFFECD9D4AB594299361A99361A99361A99361A0099361A99361A99361A99
        361A99361A99361AA0442AC58D7DBF806E9C3C2199361AE1C4BCFEFEFEFEFEFE
        DBB8AE99361A9C3C21BF8270C58C7C9F432899361A99361A99361A99361A9936
        1A0099361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361AE0C2B9FFFFFFFFFFFFDAB7AE99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361AD8B3A8FFFFFFFFFFFFD7B1A699361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A0099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361AAD5D47EDDC
        D7EDDBD6AC5C4599361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0F}
      ParentFont = False
      OnClick = sbIniciarCaixaClick
    end
    object SpeedButton1: TSpeedButton
      Left = 351
      Top = 15
      Width = 129
      Height = 49
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object edtParcelasRecebidasOS: TEdit
    Left = 24
    Top = 80
    Width = 190
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 13587235
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = 'R$ 0,00'
  end
  object edtParcelasRecebidasVendas: TEdit
    Left = 24
    Top = 152
    Width = 190
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 13587235
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'R$ 0,00'
  end
  object edtValorDeAbertura: TEdit
    Left = 24
    Top = 224
    Width = 190
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 13587235
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'R$ 0,00'
  end
  object edtParcelasEstornadasOS: TEdit
    Left = 290
    Top = 80
    Width = 195
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1323998
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = 'R$ 0,00'
  end
  object edtParcelasEstornadasVendas: TEdit
    Left = 290
    Top = 152
    Width = 195
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1323998
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'R$ 0,00'
  end
  object edtRetiradas: TEdit
    Left = 290
    Top = 224
    Width = 195
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1323998
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = 'R$ 0,00'
  end
  object edtTotalDoCaixa: TEdit
    Left = 72
    Top = 300
    Width = 305
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3050003
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'R$ 0,00'
  end
end
