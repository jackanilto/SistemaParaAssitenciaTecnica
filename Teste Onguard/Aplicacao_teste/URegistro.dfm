object frmRegistro: TfrmRegistro
  Left = 0
  Top = 0
  Caption = 'Registro do software'
  ClientHeight = 255
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 169
    Height = 13
    Caption = 'Envie o c'#243'digo abaixo para registro'
  end
  object Label2: TLabel
    Left = 40
    Top = 80
    Width = 131
    Height = 13
    Caption = 'Digite o c'#243'digo de libera'#231#227'o'
  end
  object edtCodigo: TEdit
    Left = 40
    Top = 43
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'teste'
  end
  object edtCodLiberacao: TEdit
    Left = 40
    Top = 99
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 96
    Top = 144
    Width = 129
    Height = 65
    Caption = 'Liberar sistema'
    TabOrder = 2
    OnClick = Button1Click
  end
end
