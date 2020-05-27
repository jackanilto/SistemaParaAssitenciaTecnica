program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  VCL.onguard in 'VCL.onguard.pas',
  VCL.ogutil in 'VCL.ogutil.pas',
  VCL.onguard2 in 'VCL.onguard2.pas' {CodeGenerateFrm},
  VCL.onguard3 in 'VCL.onguard3.pas' {KeyMaintFrm},
  VCL.ognetwrk in 'VCL.ognetwrk.pas',
  VCL.onguard4 in 'VCL.onguard4.pas' {EditProductFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
