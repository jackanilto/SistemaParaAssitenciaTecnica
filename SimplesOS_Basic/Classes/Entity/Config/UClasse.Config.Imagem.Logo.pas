unit UClasse.Config.Imagem.Logo;

interface

uses
  UClasse.Config.Conexao, Data.DB, Vcl.Dialogs, System.SysUtils, Vcl.Forms,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

Type
  TConfigImagemLogo = class
  private
    FConfigImagem: TClasseConexaoConfig;
  public

    procedure getImagemBD(value:TImage);
    procedure salvarImagemBd(value:TJPEGImage);

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TConfigImagemLogo }

constructor TConfigImagemLogo.create;
begin

  FConfigImagem := TClasseConexaoConfig.create;
  FConfigImagem.Query('config_img');
end;

destructor TConfigImagemLogo.destroy;
begin
  FreeAndNil(FConfigImagem);
  inherited;
end;

procedure TConfigImagemLogo.getImagemBD(value: TImage);
begin
  try
    value.Picture.Assign(FConfigImagem.retornarQuery.FieldByName('img'));
  except
  begin
    value.Picture.LoadFromFile(ExtractFilePath(application.ExeName+'\logo.png'));
  end;
  end;
end;

procedure TConfigImagemLogo.salvarImagemBd(value: TJPEGImage);
begin

try
  if FConfigImagem.retornarQuery.RecordCount >= 1 then
  begin
    FConfigImagem.retornarQuery.Edit;
    FConfigImagem.retornarQuery.FieldByName('id').AsInteger := 1;
    FConfigImagem.retornarQuery.FieldByName('img').Assign(value);
    FConfigImagem.retornarQuery.Post;
//    showmessage('Opera��o realizada com sucesso!');
  end
  else
  begin
    FConfigImagem.retornarQuery.Append;
    FConfigImagem.retornarQuery.FieldByName('id').AsInteger := 1;
    FConfigImagem.retornarQuery.FieldByName('img').Assign(value);
    FConfigImagem.retornarQuery.Post;
//    showmessage('Opera��o realizada com sucesso!');
  end;
except on e:exception do
begin
  raise Exception.Create('ERRO!. N�o foi poss�vel definir a logomarca. '+e.Message);
end;

end;

end;

end.
