unit UClasse.Chamar.Cadastro.Clientes.Ordens;

interface

uses Form.Cadastro.Clientes, Vcl.Forms;

type
  TclasseCadastroClientesOrdem = class
  private
    Fnome: string;
    procedure Setnome(const Value: string);
  public
    procedure chamarCadastroClientes;
    property nome: string read Fnome write Setnome;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TclasseCadastroClientesOrdem }

procedure TclasseCadastroClientesOrdem.chamarCadastroClientes;
begin
  formCadastroDeClientes := TformCadastroDeClientes.create(application);
  try
    formCadastroDeClientes.ShowModal;
  finally
    formCadastroDeClientes.Free;
  end;
end;

constructor TclasseCadastroClientesOrdem.create;
begin

end;

destructor TclasseCadastroClientesOrdem.destroy;
begin

  inherited;
end;

procedure TclasseCadastroClientesOrdem.Setnome(const Value: string);
begin
  Fnome := Value;
end;

end.
