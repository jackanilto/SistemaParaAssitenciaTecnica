unit UClasse.Demo;

interface

uses system.SysUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Vcl.Forms, Vcl.Dialogs, UClasse.Cript.password,
  UInterfaces, UClasse.DiasMeses, EAppProt;

type
  TClasseDemo = class

  private

    function Crypt(Action, Src: String; keychar: string): String;
    procedure ativarProtecao;

  var
    FCriptografia: iCriptPasss;
    FDiasMeses: TCalcularDiaMeses;
    EvAppProtect1: TEvAppProtect;
    FInitialFile: TDate;
    FInitialBD: TDate;
    FDemo: Boolean;
    FQueryFile: TFDQuery;

  const
    INITIALkEYFILE = 'jhgfd12355dssed-p40';
    INITIALKEYBD = 'lopty478ds';
    KEYPOSTFILE = 'DFASDFGQWERHJKLRTYUIOPZXMNCBVAASDSSPPOKJH';
    KEYPOSTBD = 'SADFQGWERHJKLRTYUIOPZXMNCBVAASDSSPPOUIP';

    procedure ativarDemo;
  public

    procedure demoActive(value: Boolean);

    procedure gravarInformacoesArquivo;
    procedure gravarInformacoesBD;

    procedure validarInformacoes;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TClasseDemo }

uses UDados.Conexao, Form.Principal;

procedure TClasseDemo.ativarDemo;
begin

end;

procedure TClasseDemo.ativarProtecao;
begin
 if FDemo = false then
 begin

   EvAppProtect1:= TEvAppProtect.Create(nil);

   try

    EvAppProtect1.Active := False;
    EvAppProtect1.IdApplication := 81395;
    EvAppProtect1.EvalDays := 0;
    EvAppProtect1.EvalLoads := 0;
    EvAppProtect1.RegKey := '\SOFTWARE\Criosoftware\SimplesOSPRO\';
    EvAppProtect1.Active := True;

   finally
     EvAppProtect1.Free;
//     started := 'no';
//     Application.Terminate;
   end;

 end;

end;

constructor TClasseDemo.create;
begin

  FCriptografia := TCriptPass.new;

  FDiasMeses := TCalcularDiaMeses.Create;

  FQueryFile := TFDQuery.create(nil);

  FQueryFile.Connection := DataModule1.Conexao;

  FQueryFile.Active := false;
  FQueryFile.SQL.Clear;
  FQueryFile.Open('select * from AUXILIAR');
  FQueryFile.Active := true;

end;

function TClasseDemo.Crypt(Action, Src, keychar: string): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;
  Key := keychar;
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;

procedure TClasseDemo.demoActive(value: Boolean);
var
  data: TDate;
  dias:word;
begin

  FDemo := value;

  ativarProtecao;

  if value = true then
  begin

    MessageDlg('Esta � um vers�o de demonstra��o com validade de 30 dias',
      mtInformation, [mbOK], 0, mbOK);

    if FQueryFile.FieldByName('KEY_WORD').AsString <> INITIALkEYFILE then
    begin

      if FQueryFile.FieldByName('KEY_WORD').AsString = FCriptografia.md5
        ('Demonstra��o ativada profissional') then
      begin

        try

          data := StrToDate(Crypt('D', FQueryFile.FieldByName('KEY_INITIAL')
            .AsString, KEYPOSTFILE));

          if data > date then
          begin
            MessageDlg('ERRO! er03', mtWarning, [mbOK], 0, mbOK);
            started := 'no';
            Application.Terminate;
          end;

          if ((date - data) > 30) then
          begin
            MessageDlg
              ('Seu per�odo de teste acabou. Compre agora mesmo um licen�a no site www.criosoftware.com.br',
              mtWarning, [mbOK], 0, mbOK);
            started := 'no';
            Application.Terminate;
          end;

        except
          begin
            MessageDlg('ERRO! er02', mtWarning, [mbOK], 0, mbOK);
            started := 'no';
            Application.Terminate;
          end;

        end;

      end
      else
      begin
        MessageDlg('ERRO! er01', mtWarning, [mbOK], 0, mbOK);
        started := 'no';
        Application.Terminate;
      end;

    end
    else
    begin

      try

        FQueryFile.Edit;

        FQueryFile.FieldByName('KEY_WORD').AsString :=
          FCriptografia.md5('Demonstra��o ativada profissional');

        FQueryFile.FieldByName('KEY_INITIAL').AsString :=
          Crypt('C', DateToStr(date), KEYPOSTFILE);

        FQueryFile.Post;

      except
        begin
          started := 'no';
          raise Exception.create('ERRO! Arquivo parece estar danificado');
        end;

      end;

    end;

  end;
end;

destructor TClasseDemo.destroy;
begin
  FreeAndNil(FQueryFile);
  FreeAndNil(FDiasMeses);
  inherited;
end;

procedure TClasseDemo.gravarInformacoesArquivo;
begin

end;

procedure TClasseDemo.gravarInformacoesBD;
begin

end;

procedure TClasseDemo.validarInformacoes;
begin

end;

end.
