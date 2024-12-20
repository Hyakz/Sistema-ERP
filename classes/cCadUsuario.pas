unit cCadUsuario;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     uFuncaoCriptografia;

type
  TUsuario = class
    private
    ConexaoDB:TZConnection;
    F_usuarioID:Integer;
    F_nome:String;
    F_senha: string;
    F_cargo: string;
    function getSenha: String;
    procedure setSenha(const Value: String);

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
    function Logar(aUsuario, aSenha: String): Boolean;
    function UsuarioExiste(aUsuario: String): Boolean;
    function AlterarSenha: Boolean;

  published
    property codigo        :Integer    read F_usuarioID      write F_usuarioID;
    property nome          :string     read F_nome           write F_nome;
    property senha         :string     read getSenha         write setSenha;
    property cargo         :string     read F_cargo          write F_cargo;
  end;

implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TUsuario.Create(aConexao:TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;
{$endRegion}


function TUsuario.Apagar:Boolean;
var Qry:TZQuery;
begin

  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+IntToStr(F_usuarioID)+#13+
                'Nome: '  +F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo
  then
  begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;

    Qry.SQL.Clear;
    Qry.SQL.Add(' DELETE FROM usuariosAcaoAcesso '+
                '  WHERE usuarioID = :usuarioID  ');
    Qry.ParamByName('usuarioID').AsInteger := F_usuarioID;
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add(' DELETE FROM usuarios          '+
                '  WHERE usuarioID =:usuarioID  ');
    Qry.ParamByName('usuarioID').AsInteger :=F_usuarioID;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuarios '+
                '   SET nome           =:nome  '+
                '       cargo          =:cargo '+
                '      ,senha          =:senha '+
                ' WHERE usuarioID=:usuarioID   ');

    Qry.ParamByName('usuarioID').AsInteger       :=Self.F_usuarioID;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('senha').AsString            :=Self.F_Senha;
    Qry.ParamByName('cargo').AsString            :=Self.F_cargo;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO usuarios (nome,   '+
                '                      cargo,  '+
                '                      senha)  '+
                ' VALUES              (:nome,  '+
                '                      :cargo, '+
                '                      :senha )');

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('senha').AsString            :=Self.F_senha;
    Qry.ParamByName('cargo').AsString            :=Self.F_cargo;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioID,            '+
                '       nome,                 '+
                '       cargo,                '+
                '       senha                 '+
                '  FROM usuarios              '+
                ' WHERE usuarioID =:usuarioID ');

    Qry.ParamByName('usuarioID').AsInteger:=id;

    Try
      Qry.Open;
      Self.F_usuarioId     := Qry.FieldByName('usuarioID').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_Senha         := Qry.FieldByName('senha').AsString;
      Self.F_cargo         := Qry.FieldByName('cargo').AsString;
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.UsuarioExiste(aUsuario:String):Boolean;
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(usuarioID) AS Qtde '+
                '  FROM usuarios '+
                ' WHERE nome =:nome ');
    Qry.ParamByName('nome').AsString :=aUsuario;
    Try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         result := true
      else
         result := false;

    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.getSenha: String;
begin
  Result := Descriptografar(Self.F_senha);
end;

procedure TUsuario.setSenha(const Value: String);
begin
  Self.F_senha := Criptografar(Value);
end;

function TUsuario.Logar(aUsuario:String; aSenha:String):Boolean;
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioID,   '+
                '       nome,        '+
                '       senha        '+
                '  FROM usuarios     '+
                ' WHERE nome =:nome  '+
                '   AND senha=:Senha ');

    Qry.ParamByName('nome').AsString :=aUsuario;
    Qry.ParamByName('senha').AsString:=Criptografar(aSenha);
    Try
      Qry.Open;

      if Qry.FieldByName('usuarioID').AsInteger>0 then
      begin
         result := true;
         F_usuarioId:= Qry.FieldByName('usuarioID').AsInteger;
         F_nome     := Qry.FieldByName('nome').AsString;
         F_senha    := Qry.FieldByName('senha').AsString;
      end
      else
         result := false;

    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TUsuario.AlterarSenha: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuarios '+
                '   SET senha =:senha '+
                ' WHERE usuarioID=:usuarioID ');

    Qry.ParamByName('usuarioID').AsInteger       :=Self.F_usuarioID;
    Qry.ParamByName('senha').AsString            :=Self.F_Senha;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

end.
