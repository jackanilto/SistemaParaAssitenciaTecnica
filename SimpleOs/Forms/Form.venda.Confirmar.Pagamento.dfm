object FormVendaConfirmarPagamento: TFormVendaConfirmarPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Confirmar venda'
  ClientHeight = 465
  ClientWidth = 805
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
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 112
    Height = 21
    Caption = 'Total da venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 128
    Width = 72
    Height = 21
    Caption = 'Desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 208
    Width = 130
    Height = 28
    Caption = 'Total a pagar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 131784
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotalAPagar: TLabel
    Left = 160
    Top = 208
    Width = 71
    Height = 28
    Caption = 'R$:0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 131784
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 256
    Width = 153
    Height = 21
    Caption = 'N'#250'mero de parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 385
    Top = 56
    Width = 163
    Height = 21
    Caption = 'Forma de pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 385
    Top = 128
    Width = 111
    Height = 21
    Caption = 'Valor recebido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 385
    Top = 200
    Width = 42
    Height = 21
    Caption = 'Troco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 183
    Top = 256
    Width = 92
    Height = 21
    Caption = 'Vencimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 24
    Top = 336
    Width = 136
    Height = 28
    Caption = 'Total parcelas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 131784
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 166
    Top = 336
    Width = 71
    Height = 28
    Caption = 'R$:0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 131784
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 5
    OnMouseDown = Panel1MouseDown
    ExplicitWidth = 764
    DesignSize = (
      805
      41)
    object sbFechar: TSpeedButton
      Left = 753
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
      Left = 83
      Top = 10
      Width = 119
      Height = 19
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Confirmar venda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitLeft = 42
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 390
    Width = 805
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    Color = 8406532
    ParentBackground = False
    TabOrder = 6
    ExplicitTop = 351
    ExplicitWidth = 764
    object sbConfirmarVenda: TSpeedButton
      Left = 20
      Top = 24
      Width = 146
      Height = 35
      Hint = 'Finaliza a venda em andamento'
      Caption = 'Finalizar Venda'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E00000000000000000000804604804604
        804604804604804604804604804604905D23B4916AD6C4B0EBE3D9F7F3EFF8F5
        F1EEE6DED9C8B4B7977293622980460480460480460480460480460480460480
        46048046048046048046048046048046048E5A20CBB499F6F2EDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2EED1BCA4915F258046048046
        04804604804604804604804604804604804604804604A67D4FEFE8E1FEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        F4EFE9AC875C804604804604804604804604804604804604804604B29068FCFB
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFE
        FEFEFFFFFFFFFFFFFEFEFEFDFCFBBC9D7A804604804604804604804604804604
        A57C4DFCFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBAD875D80460480
        46048046048D591EEFE8E1FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        F7F3EFF1EBE5FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEF3EEE8926027804604804604C9B195FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE7DCD0905D23875012ECE4DBFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF
        FEFEFEFFFFFFFFFFFFFEFEFED3BFA88046048F5C22F5F0EBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE8DED28E5A20804604804604A27747FAF8F5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F095642DB28F66FEFEFE
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEE7DDD18F5C228046048046048046048046
        04C7AD90FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFBA
        9B78D4C1AAFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFE7DDD18E5A20804604804604
        A880528B561A804604875012E6DBCEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFF
        FFFEFEFEFFFFFFDDCEBCEAE1D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8987480
        4604804604B4916AFAF8F5CEB89F8046048046049C6F3BFCFBF9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2ECE5F1EBE3FFFFFFFEFEFEFEFEFEFFFF
        FFFEFEFEF2EDE6A27747B4916AFCFBFAFFFFFFFEFEFDA57C4D804604804604C4
        A98AFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF8F5F2F2ECE5FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFF0E9
        E18D591D804604864F10E4D8CAFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF9
        F6F3EAE1D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD1BCA48249088046049C6F3BF9F6F3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF2ECE5D5C2ACFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFBFAF8AB8459804604814706C0A483
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDCCDBBB18E66FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFF4F0EA8E
        5A20804604834A0AE6DBCFFFFFFFFFFFFFFEFEFEFFFFFFBB9C788F5C22F5F0EB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFD7C5B0844C0C8A5518E2D6C7FFFFFFFFFFFFFFFFFFF8F5F195
        642D804604CAB297FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFCD6C4AEECE3DAFEFEFEFEFEFEFEFE
        FEFEFEFED3BFA88046048046048D591EF0E9E1FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFFFFFFFEFEFEF3EEE8926027804604804604804604A67D4FFCFBF9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBAE895F804604804604804604804604
        804604B4916AFBFAF8FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFE
        FEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCFBFABB9D7A80460480460480
        4604804604804604804604804604A77F51F1EBE3FEFEFEFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EEE8AD875D8046
        048046048046048046048046048046048046048046048046048E5A20CCB59BF6
        F2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5F1D1BCA4
        915F258046048046048046048046048046048046048046048046048046048046
        04804604804604915F25B6946ED9C8B4EFE8E0F8F5F1F6F2EDEFE8E0DBCBB8B8
        9772936229804604804604804604804604804604804604804604}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbConfirmarVendaClick
    end
    object sbCancelarVenda: TSpeedButton
      Left = 172
      Top = 24
      Width = 157
      Height = 35
      Hint = 'Cancela a venda em andamento'
      Caption = 'Cancelar (ESC)'
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
    end
    object sbImprimir: TSpeedButton
      Left = 335
      Top = 24
      Width = 160
      Height = 35
      Hint = 'Imprime a s parcelas da venda'
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
    object sbImprimirRecibo: TSpeedButton
      Left = 501
      Top = 24
      Width = 153
      Height = 35
      Hint = 'Exclui o registro selecionado'
      Caption = 'Imprimir recibo'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E00000000000000000000804604804604
        B89772F8F5F2F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F9F6F3F8F5
        F2F9F6F3F9F6F3F8F5F2F9F6F3F9F6F3F8F5F2F9F6F3F9F6F3B8977280460480
        4604804604804604CDB69DFEFEFDE4D8CAE1D3C4E1D3C4E1D3C4E1D3C4E1D3C4
        E1D3C4E1D3C4E1D3C4E1D3C4E1D3C4E1D3C4E1D3C4E1D3C4E1D3C4E5D9CCFFFF
        FFCDB69D804604804604804604804604CDB69DFCFBFA8F5C2280460480460480
        4604804604804604804604804604804604804604804604804604804604804604
        804604926027FEFEFECDB69C804604804604804604804604CDB69DFCFBFA8F5C
        21A37949AF8B62B08C62B08C62AF8B62B08C62B08C62AF8B62AF8B62A3794980
        4604804604804604804604926027FEFEFECDB69D804604804604804604804604
        CDB69DFDFCFB8F5C21D6C4AEF7F3EFF7F3EFF7F3EFF7F3EFF7F3EFF7F3EFF7F3
        EFF7F3EFD8C6B2804604804604804604804604926027FFFFFFCDB69D80460480
        4604804604804604CDB69DFCFBFA8F5C228C571C905D23905D23905D23905D23
        905D23905D23905D23905D238C571C804604804604804604804604926027FEFE
        FECDB69C804604804604804604804604CCB59BFCFBFA8F5C21A98155B69570B6
        9570B69570B69570B69570B69570B69570B79670B79670B69570B4926C8B561A
        804604926027FEFEFECDB69D804604804604804604804604CCB59BFDFCFB8F5C
        22D7C5B0F5F0EBF5F0EBF5F0EBF5F0EBF5F0EBF5F0EBF5F0EBF5F0EBF5F0EBF5
        F0EBF2ECE5976731804604926027FFFFFFCDB69D804604804604804604804604
        CCB59BFCFBFA8F5C218953168C571C8C571C8C571C8C571C8C571C8C571C8C57
        1C8C571C8C571C8C571C8B561A824908804604926027FEFEFECDB69C80460480
        4604804604804604CCB59BFCFBFA8F5C22AD875DBEA07EBD9F7EBEA07EBEA07E
        BD9F7EBEA07EBEA07EBD9F7EAE895F804604804604804604804604926027FEFE
        FECDB69D804604804604804604804604CCB59BFDFCFB8F5C21D3BFA8F2ECE5F2
        ECE5F2ECE5F2ECE5F2ECE5F2ECE5F2ECE5F2ECE5D5C2AC804604804604804604
        804604926027FFFFFFCDB69D804604804604804604804604CCB59BFCFBFA8F5C
        22854D0E875012875012875012875012875012875012875012875012854D0E80
        4604804604804604804604926027FEFEFECDB69C804604804604804604804604
        CCB49AFDFCFB8F5C21B79670CCB59BCCB59BCCB59BCCB59BCCB59BCCB59BCCB5
        9BCCB59BCCB59BCCB59BCAB2978F5C22804604926027FEFEFECDB69D80460480
        4604804604804604CCB59BFDFCFB8F5C22D1BCA4F0E9E1F0E9E1F0E9E1F0E9E1
        F0E9E1F0E9E1F0E9E1F0E9E1F0E9E1F0E9E1EDE5DC96662F804604926027FFFF
        FFCDB69D804604804604804604804604CCB49AFCFBFA8F5C2181470682490882
        4908824908824908824908824908824908824908824908824908824908804604
        804604926027FEFEFECDB69D804604804604804604804604CBB398FDFCFB8F5C
        21BB9C78D3BFA8D3BFA8D3BFA8D3BFA8D3BFA8D3BFA8D3BFA8D3BFA8BEA07E80
        4604804604804604804604926027FEFEFECDB69D804604804604804604804604
        CBB499FDFCFB8F5C22C8AF93E5D9CCE5D9CCE5D9CCE5D9CCE5D9CCE5D9CCE5D9
        CCE5D9CCCBB499804604804604804604804604926027FFFFFFCDB69D80460480
        4604804604804604CBB398FCFBFA8F5C21804604804604804604804604804604
        804604804604804604804604804604804604804604804604804604926027FEFE
        FECDB69D804604804604804604804604CBB499FCFBFA8F5C22C0A382D9C9B5DA
        C9B6D9C9B5D9C9B5DAC9B6D9C9B5D9C9B5DAC9B6D9C9B5D9C9B5D7C5B0915F25
        804604926027FFFFFFCDB69D804604804604804604804604CAB297FDFCFB8F5C
        22C3A889DDCEBCDDCEBCDDCEBCDDCEBCDDCEBCDDCEBCDDCEBCDDCEBCDDCEBCDD
        CEBCDBCBB8926027804604926027FFFFFFCDB69C804604804604804604804604
        CAB297FCFBFA8F5C218046048046048046048046048046048046048046048046
        04804604804604804604804604804604804604926027FEFEFECDB69D80460480
        4604804604804604CAB297FCFBFA8F5C21804604804604804604804604804604
        804604804604804604804604804604804604804604804604804604926027FEFE
        FECDB69C804604804604804604804604CAB297FFFFFFE6DBCFE4D8CAE4D8CAE3
        D7C9E4D8CAE4D8CAE3D7C9E4D8CAE3D7C9E4D8CAE3D7C9E3D7C9E4D8CAE3D7C9
        E3D7C9E8DED2FFFFFFCDB69D804604804604804604804604B4916AF4EFE9F7F3
        EFF7F3EFF7F4F0F8F5F1F8F5F1F8F5F1F9F6F3F8F5F2F9F6F3F8F5F1F8F5F1F8
        F5F1F8F5F1F8F5F1F8F5F1F8F5F1F8F5F1B6946E804604804604}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
  end
  object edtConfirmarTotalDaVenda: TEdit
    Left = 24
    Top = 83
    Width = 264
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtConfirmarDesconto: TEdit
    Left = 24
    Top = 155
    Width = 264
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = edtConfirmarDescontoExit
    OnKeyUp = edtConfirmarDescontoKeyUp
  end
  object edtConfirmarFormaPagamento: TComboBox
    Left = 385
    Top = 83
    Width = 269
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtConfirmarValorRecebido: TEdit
    Left = 385
    Top = 155
    Width = 269
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = edtConfirmarValorRecebidoExit
    OnKeyUp = edtConfirmarValorRecebidoKeyUp
  end
  object edtConfirmarTroco: TEdit
    Left = 385
    Top = 227
    Width = 269
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 131784
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtConfirmarParcela: TEdit
    Left = 24
    Top = 283
    Width = 153
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnExit = edtConfirmarParcelaExit
    OnKeyUp = edtConfirmarParcelaKeyUp
  end
  object edtConfirmarVencimento: TMaskEdit
    Left = 183
    Top = 283
    Width = 104
    Height = 29
    EditMask = '00/00/0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 8
    Text = '  /  /    '
  end
end