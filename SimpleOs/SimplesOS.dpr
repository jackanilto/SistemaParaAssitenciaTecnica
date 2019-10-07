program SimplesOS;

uses
  Vcl.Forms,
  Form.Principal in 'Forms\Form.Principal.pas' {formPrincipal},
  UClasse.Calcular.Juros in 'Classes\Reusable\UClasse.Calcular.Juros.pas',
  UClasse.CapturarErro in 'Classes\Reusable\UClasse.CapturarErro.pas',
  UClasse.Gravar.Log.Sistema in 'Classes\Reusable\UClasse.Gravar.Log.Sistema.pas',
  UClasse.ObertValorPorExtenso in 'Classes\Reusable\UClasse.ObertValorPorExtenso.pas',
  UClasse.Obter.Data.Hora.PorExtenso in 'Classes\Reusable\UClasse.Obter.Data.Hora.PorExtenso.pas',
  UClasse.Query in 'Classes\Query\UClasse.Query.pas',
  UInterfaces in 'Classes\Interfaces\UInterfaces.pas',
  UFactory.Entity in 'Classes\Factory\UFactory.Entity.pas',
  UFactory.Query in 'Classes\Factory\UFactory.Query.pas',
  UClasse.Entity in 'Classes\Entity\UClasse.Entity.pas',
  UClasse.Entity.Table in 'Classes\Entity\UClasse.Entity.Table.pas',
  UDados.Conexao in 'DataModule\UDados.Conexao.pas' {DataModule1: TDataModule},
  UForm.Exemplo.Embeded in 'Forms\Exemplos\UForm.Exemplo.Embeded.pas' {formExemploEmbeded},
  UClasse.Entity.Marcas in 'Classes\Entity\UClasse.Entity.Marcas.pas',
  Form.Cadastro.Marcas in 'Forms\Form.Cadastro.Marcas.pas' {formCadastroMarcas},
  UClasse.Criar.Janela in 'Classes\UClasse.Criar.Janela.pas',
  UFactory in 'Classes\Factory\UFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.