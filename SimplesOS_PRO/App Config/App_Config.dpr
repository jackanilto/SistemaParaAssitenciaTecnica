program App_Config;

uses
  Vcl.Forms,
  Form.Conf in 'Form.Conf.pas' {formAppConfigMenu},
  Form.Configuracoes.Backup in 'Forms\Form.Configuracoes.Backup.pas' {formConfiguracoesBackUp},
  Form.Configurar.Conexcao.Banco in 'Forms\Form.Configurar.Conexcao.Banco.pas' {formConfigurarConexaoBanco},
  UClasse.Config.Acesso.Banco in 'Classe\UClasse.Config.Acesso.Banco.pas',
  UClasse.Config.BackUp in 'Classe\UClasse.Config.BackUp.pas',
  UClasse.Config.Conexao in 'Classe\UClasse.Config.Conexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformAppConfigMenu, formAppConfigMenu);
  Application.Run;
end.
