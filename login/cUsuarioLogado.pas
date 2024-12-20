unit cUsuarioLogado;

interface

uses System.Classes,
     ZAbstractConnection,
     ZConnection,
     Data.DB,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils;

type
  TUsuarioLogado = class
  private
    F_usuarioID:Integer;
    F_nome:  String;
    F_senha: string;
    F_cargo: string;

  public
    class function TenhoAcesso(aUsuarioID: Integer; aChave: string; aConexao: TZConnection): Boolean; static;

  published
    property codigo        :Integer    read F_usuarioID      write F_usuarioID;
    property nome          :string     read F_nome           write F_nome;
    property senha         :string     read F_senha          write F_senha;
    property cargo         :string     read F_cargo          write F_cargo;
  end;


implementation

class function TUsuarioLogado.TenhoAcesso(aUsuarioID: Integer; aChave: string; aConexao: TZConnection): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection := aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT usuarioID                                                                   '+
                '   FROM usuariosAcaoAcesso                                                          '+
                '  WHERE usuarioID=:usuarioID                                                        '+
                '    AND acaoAcessoID=(SELECT TOP 1 acaoAcessoID FROM acaoAcesso WHERE chave=:chave) '+
                '    AND ativo=1                                                                     ');

    Qry.ParamByName('usuarioID').AsInteger  :=aUsuarioID;
    Qry.ParamByName('chave').AsString       :=aChave;
    Qry.Open;

    if Qry.IsEmpty then
       Result:=False;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

end.
