unit UClasse.Ativar.Desativar.Botoes.Ordem.Servico;

interface

uses vcl.buttons;

type

  TAtivarDesativarBotoesOrdemServico = class
  private

    btNovo: TSpeedButton;
    btSalvar: TSpeedButton;
    btEditar: TSpeedButton;
    btExcluir: TSpeedButton;
    btCancelar: TSpeedButton;
    btImprimir: TSpeedButton;
    btEstornar: TSpeedButton;

    btQuitarParcela: TSpeedButton;
    btEstotnarParcela: TSpeedButton;
    btAdiconarParcela: TSpeedButton;
    btSalvarParcela: TSpeedButton;
    btExcluirParcela: TSpeedButton;
    btCancelarParcela: TSpeedButton;
    btImprimirParcela: TSpeedButton;

  public

    procedure botaoNovo(value: TSpeedButton);
    procedure botaoSalvar(value: TSpeedButton);
    procedure botaoEditar(value: TSpeedButton);
    procedure botaoExcluir(value: TSpeedButton);
    procedure botaoCancelar(value: TSpeedButton);
    procedure botaoImprimir(value: TSpeedButton);
    procedure botaoEstornar(value: TSpeedButton);

    procedure botaoQuitarParcela(value: TSpeedButton);
    procedure botaoEstornarParcela(value: TSpeedButton);
    procedure botaoAdicionarParcela(value: TSpeedButton);
    procedure botaoSalvarParcela(value: TSpeedButton);
    procedure botaoExcluirParcela(value: TSpeedButton);
    procedure botaoCancelarParcela(value: TSpeedButton);
    procedure botaoImprimirParcelas(value: TSpeedButton);

    procedure ativarBotaoNovo;
    procedure ativarBotaoSalvar;
    procedure ativarBotaoEditar;
    procedure ativarBotaoExcluir;
    procedure ativarBotaoCancelar;
    procedure ativarBotaoImpimir;
    procedure ativarbotaoEstornar;
    procedure ativarBotoesIniciarForm;

    procedure ativarbotaoQuitarParcela;
    procedure ativarbotaoEstornarParcela;
    procedure ativarbotaoAdicionarParcela;
    procedure ativarbotaoSalvarParcela;
    procedure ativarbotaoExcluirParcela;
    procedure bativarotaoCancelarParcela;
    procedure ativarbotaoImprimirParcelas;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TAtivarDesativarBotoesOrdemServico }

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoExcluir;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := false;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoAdicionarParcela;
begin
  btAdiconarParcela.Enabled := false;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := true;
  btCancelarParcela.Enabled := true;
  btExcluirParcela.Enabled := false;
  btImprimirParcela.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoExcluirParcela;
begin
  btAdiconarParcela.Enabled := true;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := false;
  btImprimirParcela.Enabled := true
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoCancelar;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := false;
  btImprimir.Enabled := true;
  btEstornar.Enabled := true;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoEditar;
begin
  btNovo.Enabled := false;
  btSalvar.Enabled := true;
  btEditar.Enabled := false;
  btExcluir.Enabled := true;
  btCancelar.Enabled := false;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoEstornar;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := true;
  btCancelar.Enabled := true;
  btImprimir.Enabled := true;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoEstornarParcela;
begin
  btAdiconarParcela.Enabled := true;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := true;
  btImprimirParcela.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoImpimir;
begin
  //
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoImprimirParcelas;
begin
  //
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoNovo;
begin
  btNovo.Enabled := false;
  btSalvar.Enabled := true;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := true;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoQuitarParcela;
begin
  btAdiconarParcela.Enabled := true;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := true;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := true;
  btImprimirParcela.Enabled := true;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoSalvar;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := true;
  btExcluir.Enabled := true;
  btCancelar.Enabled := false;
  btImprimir.Enabled := true;
  btEstornar.Enabled := true;

end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoSalvarParcela;
begin
  btAdiconarParcela.Enabled := true;
  btQuitarParcela.Enabled := true;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := true;
  btImprimirParcela.Enabled := true;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotoesIniciarForm;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := false;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;

  btAdiconarParcela.Enabled := false;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := false;
  btImprimirParcela.Enabled := false;

end;

procedure TAtivarDesativarBotoesOrdemServico.bativarotaoCancelarParcela;
begin
  btAdiconarParcela.Enabled := false;
  btQuitarParcela.Enabled := false;
  btEstotnarParcela.Enabled := false;
  btSalvarParcela.Enabled := false;
  btCancelarParcela.Enabled := false;
  btExcluirParcela.Enabled := false;
  btImprimirParcela.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoAdicionarParcela
  (value: TSpeedButton);
begin
  btAdiconarParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoCancelar(value: TSpeedButton);
begin
  btCancelar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoCancelarParcela
  (value: TSpeedButton);
begin
  btCancelarParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoEditar(value: TSpeedButton);
begin
  btEditar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoEstornar(value: TSpeedButton);
begin
  btEstornar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoEstornarParcela
  (value: TSpeedButton);
begin
  btEstotnarParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoExcluir(value: TSpeedButton);
begin
  btExcluir := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoExcluirParcela
  (value: TSpeedButton);
begin
  btExcluirParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoImprimir(value: TSpeedButton);
begin
  btImprimir := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoImprimirParcelas
  (value: TSpeedButton);
begin
  btImprimirParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoNovo(value: TSpeedButton);
begin
  btNovo := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoQuitarParcela
  (value: TSpeedButton);
begin
  btQuitarParcela := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoSalvar(value: TSpeedButton);
begin
  btSalvar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoSalvarParcela
  (value: TSpeedButton);
begin
  btSalvarParcela := value;
end;

constructor TAtivarDesativarBotoesOrdemServico.create;
begin

end;

destructor TAtivarDesativarBotoesOrdemServico.destroy;
begin

  inherited;
end;

end.
