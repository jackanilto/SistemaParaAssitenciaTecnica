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
  UFactory in 'Classes\Factory\UFactory.pas',
  UClasse.Entity.Grupos in 'Classes\Entity\UClasse.Entity.Grupos.pas',
  Form.Cadastro.Grupos in 'Forms\Form.Cadastro.Grupos.pas' {formCadastroGrupos},
  Form.Cadastro.Forma.Pagamento in 'Forms\Form.Cadastro.Forma.Pagamento.pas' {formFormaPagamento},
  UClasse.Entity.Forma.Pagamento in 'Classes\Entity\UClasse.Entity.Forma.Pagamento.pas',
  Form.Cadastro.Tipo.Retiradas in 'Forms\Form.Cadastro.Tipo.Retiradas.pas' {formTipoRetiradas},
  UClasse.Entity.Tipo.Retiradas in 'Classes\Entity\UClasse.Entity.Tipo.Retiradas.pas',
  Form.Cadastro.Configurar.Parcelas in 'Forms\Form.Cadastro.Configurar.Parcelas.pas' {formConfigurarParcelas},
  UClasse.Entity.Configurar.Parcelas in 'Classes\Entity\UClasse.Entity.Configurar.Parcelas.pas',
  Form.Cadastro.Atividade.Funcionario in 'Forms\Form.Cadastro.Atividade.Funcionario.pas' {formAtividadeFuncionario},
  UClasse.Entity.Atividade.Funcionario in 'Classes\Entity\UClasse.Entity.Atividade.Funcionario.pas',
  Form.Cadastro.Contas.APagar in 'Forms\Form.Cadastro.Contas.APagar.pas' {formCadastroContasAPagar},
  UClasse.Entity.Contas.APagar in 'Classes\Entity\UClasse.Entity.Contas.APagar.pas',
  Form.Cadastro.Problemas.Frequentes in 'Forms\Form.Cadastro.Problemas.Frequentes.pas' {formCadastroProblemasFrequentes},
  UClasse.Entity.Problemas.Frequentes in 'Classes\Entity\UClasse.Entity.Problemas.Frequentes.pas',
  Form.Cadastro.Forncedores in 'Forms\Form.Cadastro.Forncedores.pas' {formCadastroFornecedores},
  UClasse.Entity.Transportadora in 'Classes\Entity\UClasse.Entity.Transportadora.pas',
  Form.Cadastro.Transportadora in 'Forms\Form.Cadastro.Transportadora.pas' {formCadastroTransportadora},
  UClasse.Entity.Forncedores in 'Classes\Entity\UClasse.Entity.Forncedores.pas',
  UClasse.Validar.Documento in 'Classes\Reusable\UClasse.Validar.Documento.pas',
  Form.Cadastro.Produtos in 'Forms\Form.Cadastro.Produtos.pas' {formCadastroProdutos},
  UClasse.Entity.Produtos in 'Classes\Entity\UClasse.Entity.Produtos.pas',
  Form.Localizar.Grupo in 'Forms\Localizar\Form.Localizar.Grupo.pas' {formLocalizarGrupo},
  Form.Localizar.Marca in 'Forms\Localizar\Form.Localizar.Marca.pas' {formLocalizarMarca},
  UCalculadora in 'Forms\Utilitarios\UCalculadora.pas' {frmCalculadoraMargemLucro},
  UClasse.Gerar.Codigo.Barras in 'Classes\Reusable\UClasse.Gerar.Codigo.Barras.pas',
  Form.Cadastro.Funcionarios in 'Forms\Form.Cadastro.Funcionarios.pas' {formCadastroDeFuncionarios},
  UClasse.Entity.Cadastro.Funcionario in 'Classes\Entity\UClasse.Entity.Cadastro.Funcionario.pas',
  Wcrypt2 in 'Classes\Biblioteca\Wcrypt2.pas',
  UClasse.Cript.password in 'Classes\Biblioteca\UClasse.Cript.password.pas',
  Form.Localizar.Atividade.Funcionario in 'Forms\Localizar\Form.Localizar.Atividade.Funcionario.pas' {formLocalizarAtividadeFuncionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TformLocalizarAtividadeFuncionario, formLocalizarAtividadeFuncionario);
  Application.Run;
end.
