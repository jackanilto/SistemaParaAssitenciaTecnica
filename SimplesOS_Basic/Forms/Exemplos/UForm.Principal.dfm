object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 350
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 513
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 568
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 201
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 328
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 328
    Top = 229
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 328
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 48
    Top = 302
    Width = 81
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 135
    Top = 302
    Width = 162
    Height = 21
    TabOrder = 7
    Text = 'Edit3'
  end
  object Button5: TButton
    Left = 328
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 424
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 505
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 10
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 586
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 11
    OnClick = Button8Click
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 384
    Top = 8
  end
  object FDStoredProc1: TFDStoredProc
    Left = 488
    Top = 168
  end
end
