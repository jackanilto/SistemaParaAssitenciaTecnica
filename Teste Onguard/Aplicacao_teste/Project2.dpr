program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  UDados in 'UDados.pas' {tabela: TDataModule},
  VCL.onguard in 'VCL.onguard.pas',
  URegistro in 'URegistro.pas' {frmRegistro},
  UInterface.RegEdit in 'Interface\UInterface.RegEdit.pas',
  VCL.ognetwrk in '..\VCL.ognetwrk.pas',
  VCL.ogutil in '..\VCL.ogutil.pas',
  VCL.onguard2 in '..\VCL.onguard2.pas' {CodeGenerateFrm},
  VCL.onguard3 in '..\VCL.onguard3.pas' {KeyMaintFrm},
  VCL.onguard4 in '..\VCL.onguard4.pas' {EditProductFrm},
  VCL.onguard1 in '..\VCL.onguard1.pas' {KeyGenerateFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(Ttabela, tabela);
  Application.Run;
end.
