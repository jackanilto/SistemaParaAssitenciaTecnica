unit UClasse.Config.BackUp;

interface

uses
  UClasse.Config.Conexao, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Def, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Vcl.StdCtrls, Data.DB,
  System.Generics.Collections;

Type
  TClasseConfigBackUp = class
  private

   ListaHorarios: TList<string>;

    FQuery: TClasseConexaoConfig;
    FDI_Restore: TFDIBRestore;
    FDI_Backup: TFDIBBackup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FlocalBD: string;
    FlocalSalvarArquivo: string;

    procedure SetlocalBD(const Value: string);
    procedure SetlocalSalvarArquivo(const Value: string);

  public

    procedure retornarDados(Value: TDataSource);
    procedure inserir;
    procedure gravar(Value: string);
    procedure editar;
    procedure excluir;
    procedure cancelar;

    property localBD: string read FlocalBD write SetlocalBD;
    property localSalvarArquivo: string read FlocalSalvarArquivo
      write SetlocalSalvarArquivo;

    procedure iniciarBackUpManual;
    procedure iniciarBackUpAutomaticamente;

    function listarHorariosBackupAutomatico:TList<string>;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TClasseConfigBackUp }

procedure TClasseConfigBackUp.cancelar;
begin
  FQuery.retornarQuery.Cancel;
end;

constructor TClasseConfigBackUp.create;
begin

  FQuery := TClasseConexaoConfig.create;
  FQuery.Query('config_backup');

  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.create(nil);

  FDPhysFBDriverLink1.VendorLib := ExtractFilePath(application.exename) +
    'fbclient.dll';

    ListaHorarios := TList<string>.Create;

    while not FQuery.retornarQuery.Eof do
    begin

      ListaHorarios.Add(FQuery.retornarQuery.FieldByName('horario').AsString);

      FQuery.retornarQuery.Next;

    end

end;

destructor TClasseConfigBackUp.destroy;
begin

  FreeAndNil(FQuery);
  FreeAndNil(FDPhysFBDriverLink1);
  FreeAndNil(ListaHorarios);

  inherited;
end;

procedure TClasseConfigBackUp.editar;
begin
  FQuery.retornarQuery.Edit;
end;

procedure TClasseConfigBackUp.excluir;
begin
  FQuery.retornarQuery.Delete;
end;

procedure TClasseConfigBackUp.gravar(Value: string);
begin

  try
    FQuery.retornarQuery.FieldByName('horario').AsDateTime := StrToTime(Value);
    FQuery.retornarQuery.Post;
    ShowMessage('Operação realizada com sucesso!!!');
  except
    on e: Exception do
    begin
      MessageDlg('ERRO. Não foi possivel inserir o horário para backup. ' +
        e.Message, mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

procedure TClasseConfigBackUp.iniciarBackUpAutomaticamente;
var
  Data: string;
  hora: string;

  threadBackUp: TThread;

begin

  threadBackUp := TThread.CreateAnonymousThread(
    procedure
    begin
      Data := FormatDateTime('ddmmyy', date);
      hora := FormatDateTime('hhmmss', time);

      if not DirectoryExists(ExtractFilePath(application.exename) + 'BackUp')
      then
      begin
        // if not CreateDir(ExtractFilePath(application.exename) + 'BackUp') then
        // raise Exception.create
        // ('Não foi possível criar o diretório de backup.');
        ForceDirectories(localSalvarArquivo + 'BackUp')
      end;

      try

        FDI_Backup := TFDIBBackup.create(nil);

        try

          FDI_Backup.DriverLink := FDPhysFBDriverLink1;
          FDI_Backup.UserName := 'sysdba';
          FDI_Backup.Password := 'masterkey';
          FDI_Backup.host := 'localhost';
          FDI_Backup.Protocol := ipTCPIP;
          FDI_Backup.Verbose := True;
          FDI_Backup.Database := localBD;
          FDI_Backup.BackupFiles.Add(localSalvarArquivo + '\BackUp\' + 'BackUp_'
            + Data + hora + '.fbk');
          FDI_Backup.BackUp;

        except
          on e: Exception do
          begin
            raise Exception.create('Ocorreu um erro ao tentar realizar o BackUp'
              + e.Message);
          end;
        end;
      finally
        FDI_Backup.Free;
      end;
    end);

  threadBackUp.Start();

end;

procedure TClasseConfigBackUp.iniciarBackUpManual;
var
  Data: string;
  hora: string;
begin

  Data := FormatDateTime('ddmmyy', date);
  hora := FormatDateTime('hhmmss', time);

  if not DirectoryExists(localSalvarArquivo + 'BackUp') then
  begin
    // if not CreateDir(ExtractFilePath(application.exename) + 'BackUp') then
    ForceDirectories(localSalvarArquivo + 'BackUp')
  end;

  try

    FDI_Backup := TFDIBBackup.create(nil);

    try

      FDI_Backup.DriverLink := FDPhysFBDriverLink1;
      FDI_Backup.UserName := 'sysdba';
      FDI_Backup.Password := 'masterkey';
      FDI_Backup.host := 'localhost';
      FDI_Backup.Protocol := ipTCPIP;
      FDI_Backup.Verbose := True;
      FDI_Backup.Database := localBD;
      FDI_Backup.BackupFiles.Add(localSalvarArquivo + '\BackUp\' + 'BackUp_' +
        Data + hora + '.fbk');
      FDI_Backup.BackUp;

      MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOk], 0);

      // ExtractFilePath(application.exename)

    except
      on e: Exception do
      begin
        raise Exception.create('Ocorreu um erro ao tentar realizar o BackUp' +
          e.Message);
      end;
    end;
  finally
    FDI_Backup.Free;
  end;

end;

procedure TClasseConfigBackUp.inserir;
begin
  FQuery.retornarQuery.Insert;
end;

function TClasseConfigBackUp.listarHorariosBackupAutomatico: TList<string>;
begin
  result := ListaHorarios;
end;

procedure TClasseConfigBackUp.retornarDados(Value: TDataSource);
begin

  FQuery.retornarQuery.FieldByName('id').Visible := false;
  FQuery.retornarQuery.FieldByName('horario').DisplayLabel := 'Horário';

  Value.DataSet := FQuery.retornarQuery;

end;

procedure TClasseConfigBackUp.SetlocalBD(const Value: string);
begin

  if Value = EmptyStr then
    raise Exception.create
      ('ERRO! Informe qual banco de dados deseja realizar o backup;');

  FlocalBD := Value;
end;

procedure TClasseConfigBackUp.SetlocalSalvarArquivo(const Value: string);
begin

  if Value = EmptyStr then
    raise Exception.create
      ('ERRO! Informe o local que deseja salvar o banco dados.');

  FlocalSalvarArquivo := Value;
end;

end.
