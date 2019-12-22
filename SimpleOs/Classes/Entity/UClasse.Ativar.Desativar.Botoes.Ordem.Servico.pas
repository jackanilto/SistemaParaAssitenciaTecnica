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

  public

    procedure botaoNovo(value: TSpeedButton);
    procedure botaoSalvar(value: TSpeedButton);
    procedure botaoEditar(value: TSpeedButton);
    procedure botaoExcluir(value: TSpeedButton);
    procedure botaoCancelar(value: TSpeedButton);
    procedure botaoImprimir(value: TSpeedButton);
    procedure botaoEstornar(value: TSpeedButton);

    procedure ativarBotaoNovo;
    procedure ativarBotaoSalvar;
    procedure ativarBotaoEditar;
    procedure ativarBotaoExcluir;
    procedure ativarBotaoCancelar;
    procedure ativarBotaoImpimir;
    procedure ativarbotaoEstornar;
    procedure ativarBotoesIniciarForm;

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

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoCancelar;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := false;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoEditar;
begin
  btNovo.Enabled := false;
  btSalvar.Enabled := true;
  btEditar.Enabled := false;
  btExcluir.Enabled := true;
  btCancelar.Enabled := true;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarbotaoEstornar;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := true;
  btExcluir.Enabled := true;
  btCancelar.Enabled := true;
  btImprimir.Enabled := true;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.ativarBotaoImpimir;
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

procedure TAtivarDesativarBotoesOrdemServico.ativarBotoesIniciarForm;
begin
  btNovo.Enabled := true;
  btSalvar.Enabled := false;
  btEditar.Enabled := false;
  btExcluir.Enabled := false;
  btCancelar.Enabled := false;
  btImprimir.Enabled := false;
  btEstornar.Enabled := false;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoCancelar(value: TSpeedButton);
begin
  btCancelar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoEditar(value: TSpeedButton);
begin
  btEditar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoEstornar(value: TSpeedButton);
begin
  btEstornar := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoExcluir(value: TSpeedButton);
begin
  btExcluir := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoImprimir(value: TSpeedButton);
begin
  btImprimir := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoNovo(value: TSpeedButton);
begin
  btNovo := value;
end;

procedure TAtivarDesativarBotoesOrdemServico.botaoSalvar(value: TSpeedButton);
begin
  btSalvar := value;
end;

constructor TAtivarDesativarBotoesOrdemServico.create;
begin

end;

destructor TAtivarDesativarBotoesOrdemServico.destroy;
begin

  inherited;
end;

end.
