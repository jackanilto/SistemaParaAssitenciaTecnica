unit UClasse.Ativar.Desativar.Botoes.Quitar.Parcelas;

interface

uses
  Vcl.Buttons;

Type
  TClasseBotoesQuitarParcelas = class
  private
    btQuitar: TSpeedButton;
    btEstornar: TSpeedButton;
    btAdicionar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    btCancelar: TSpeedButton;
    btImprimirParcela: TSpeedButton;
    btExportar: TSpeedButton;
  public

    procedure BotaoQuitar(value: TSpeedButton);
    procedure BotaoEstornar(value: TSpeedButton);
    procedure BotaoAdicionarParcela(value: TSpeedButton);
    procedure BotaoSalvarPacela(value: TSpeedButton);
    procedure BotaoExcluirParcela(value: TSpeedButton);
    procedure BotalCancelar(value: TSpeedButton);
    procedure BotaoImpimirParcela(value: TSpeedButton);
    procedure BotaoExportar(value: TSpeedButton);

    procedure btQuitarParcela;
    procedure btEstornarParcela;
    procedure btAdicionarParcela;
    procedure btSalvarParcela;
    procedure btExcluirParcela;
    procedure btCancelarParcela;
    procedure botoesAbrirForm;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TClasseBotoesQuitarParcelas }

procedure TClasseBotoesQuitarParcelas.BotalCancelar(value: TSpeedButton);
begin
   btCancelar := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoAdicionarParcela(value: TSpeedButton);
begin
 btAdicionar := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoEstornar(value: TSpeedButton);
begin
 btEstornar := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoExcluirParcela(value: TSpeedButton);
begin
 btExcluir := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoExportar(value: TSpeedButton);
begin
 btExportar := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoImpimirParcela(value: TSpeedButton);
begin
   btImprimirParcela := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoQuitar(value: TSpeedButton);
begin
  btQuitar := value;
end;

procedure TClasseBotoesQuitarParcelas.BotaoSalvarPacela(value: TSpeedButton);
begin
  btSalvar := value;
end;

procedure TClasseBotoesQuitarParcelas.botoesAbrirForm;
begin
   btQuitar.Enabled := false;
   btAdicionar.Enabled := false;
   btEstornar.Enabled := false;
   btSalvar.Enabled := false;
   btExcluir.Enabled := false;
   btCancelar.Enabled := false;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btAdicionarParcela;
begin
   btQuitar.Enabled := false;
   btAdicionar.Enabled := false;
   btEstornar.Enabled := false;
   btSalvar.Enabled := true;
   btExcluir.Enabled := false;
   btCancelar.Enabled := true;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btCancelarParcela;
begin
   btQuitar.Enabled := false;
   btAdicionar.Enabled := false;
   btEstornar.Enabled := false;
   btSalvar.Enabled := false;
   btExcluir.Enabled := false;
   btCancelar.Enabled := false;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btEstornarParcela;
begin
   btQuitar.Enabled := true;
   btAdicionar.Enabled := true;
   btEstornar.Enabled := false;
   btSalvar.Enabled := false;
   btExcluir.Enabled := true;
   btCancelar.Enabled := true;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btExcluirParcela;
begin
   btQuitar.Enabled := false;
   btAdicionar.Enabled := true;
   btEstornar.Enabled := false;
   btSalvar.Enabled := false;
   btExcluir.Enabled := false;
   btCancelar.Enabled := false;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btQuitarParcela;
begin
   btQuitar.Enabled := false;
   btAdicionar.Enabled := true;
   btEstornar.Enabled := true;
   btSalvar.Enabled := false;
   btExcluir.Enabled := true;
   btCancelar.Enabled := false;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

procedure TClasseBotoesQuitarParcelas.btSalvarParcela;
begin
   btQuitar.Enabled := true;
   btAdicionar.Enabled := false;
   btEstornar.Enabled := false;
   btSalvar.Enabled := false;
   btExcluir.Enabled := false;
   btCancelar.Enabled := false;
   btImprimirParcela.Enabled := false;
   btExportar.Enabled := false;
end;

constructor TClasseBotoesQuitarParcelas.create;
begin

end;

destructor TClasseBotoesQuitarParcelas.destroy;
begin

  inherited;
end;

end.
