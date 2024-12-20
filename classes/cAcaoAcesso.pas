unit cAcaoAcesso;

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
     Vcl.Forms,
     Vcl.Buttons;

type
  TAcaoAcesso = class

  private
    ConexaoDB      :TZConnection;
    F_acaoAcessoID :Integer;
    F_descricao    :String;
    F_chave        :String;

    class procedure PreencherAcoes(aForm: TForm; aConexao:TZConnection); static;
    class procedure VerificarUsuarioAcao(aUsuarioID, aAcaoAcessoID: Integer; aConexao: TZConnection); Static;


  public
    constructor create(aConexao:TZConnection);
    destructor Destroy; override;
    class procedure PreencherUsuariosVsAcoes(aConexao: TZConnection); static;

    function Inserir                                  :Boolean;
    function Atualizar                                :Boolean;
    function Apagar                                   :Boolean;
    function Selecionar(id:Integer)                   :Boolean;
    function ChaveExiste(aChave:string; aID:Integer=0):Boolean;

    class procedure CriarAcoes(aNomeForm: TFormClass; aConexao: TZConnection); Static;


  published
    property codigo     :Integer   read F_acaoAcessoID  write F_acaoAcessoID;
    property descricao  :string    read F_descricao     write F_descricao;
    property chave      :string    read F_chave         write F_chave;
end;

implementation

{ TAcaoAcesso }


function TAcaoAcesso.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro:   '+#13+#13+
                'C�digo:  '+F_acaoAcessoID.ToString()+#13+
                'Nome:  '  +F_descricao, mtConfirmation,[mbYes, mbNo],0) = mrNo
  then
  begin
    Result:= false;
    abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' DELETE FROM acaoAcesso             '+
                 'WHERE  acaoAcessoID=:acaoAcessoID  ');

    Qry.ParamByName('acaoAcessoID').AsInteger :=F_acaoAcessoID;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      result:=false;
    end;

  finally
    if Assigned(Qry)  then
       FreeAndNil(Qry);
  end;
end;

function TAcaoAcesso.Atualizar: Boolean;
var Qry: TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Result:=True;
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE acaoAcesso                  ' +
                '    SET descricao    =:descricao,   ' +
                '        chave        =:chave        ' +
                '  WHERE acaoAcessoID =:acaoAcessoID ' );

    Qry.ParamByName('acaoAcessoID').AsInteger  := Self.F_acaoAcessoID;
    Qry.ParamByName('descricao').AsString      := Self.F_descricao;
    Qry.ParamByName('chave').AsString          := Self.F_chave;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=False;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TAcaoAcesso.ChaveExiste(aChave: string; aID:Integer): Boolean;
var  Qry :TZQuery;
begin
  try
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT COUNT (acaoAcessoID) AS Qtde  ' +
                '   FROM acaoAcesso                    ' +
                '  WHERE chave =:chave                 ');

    if aID > 0 then
    begin
      Qry.SQL.Add('  AND acaoAcessoID<>:acaoAcessoID');
      Qry.ParamByName('acaoAcessoID').AsInteger :=aID;
    end;

    Qry.ParamByName('chave').AsString :=aChave;

    try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         Result:=True
      else
         Result:=False;
    Except
      Result:=False;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

constructor TAcaoAcesso.create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TAcaoAcesso.Destroy;
begin

  inherited;
end;

function TAcaoAcesso.Inserir: Boolean;
var  Qry :TZQuery;
begin
  try
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' INSERT INTO acaoAcesso (descricao,  '+
                '                         chave)      '+
                '  VALUES                (:descricao, '+
                '                         :chave )'   );

    Qry.ParamByName('descricao').AsString  := Self.F_descricao;
    Qry.ParamByName('chave').AsString      := Self.F_chave;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=False;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

class procedure TAcaoAcesso.PreencherAcoes(aForm: TForm; aConexao: TZConnection);
var i :Integer;
oAcaoAcesso:TAcaoAcesso;
begin
  try
    oAcaoAcesso:=TAcaoAcesso.Create(aConexao);
    oAcaoAcesso.descricao:=aForm.Caption;
    oAcaoAcesso.chave:=aForm.Name;

    if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
           oAcaoAcesso.Inserir;

    for I := 0 to aForm.ComponentCount -1 do
    begin
      if (aForm.Components[i] is TBitBtn) then
      begin
        if TBitBtn(aForm.Components[i]).Tag=99 then
        begin
          oAcaoAcesso.descricao := '   - BOT�O '+StringReplace(TBitBtn(aForm.Components[i]).Caption, '&','',[rfReplaceAll]);
          oAcaoAcesso.chave     := aForm.Name+'_'+TBitBtn(aForm.Components[i]).Name;

          if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
                 oAcaoAcesso.Inserir;
        end;
      end;
    end;

  finally
    if Assigned(oAcaoAcesso) then
       FreeAndNil(oAcaoAcesso);
  end;
end;

class procedure TAcaoAcesso.CriarAcoes(aNomeForm: TFormClass; aConexao: TZConnection);
Var Form:TForm;
begin
  try
    Form:=aNomeForm.Create(Application);
    PreencherAcoes(form, aConexao);
  finally
    if Assigned(Form) then
       Form.Release;
  end;
end;

function TAcaoAcesso.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT acaoAcessoID,                '+
                '        descricao,                  '+
                '        chave                       '+
                '        FROM acaoAcesso             '+
                '  WHERE acaoAcessoID=:acaoAcessoID  ');
    Qry.ParamByName('acaoAcessoID').AsInteger:=id;

    try
      Qry.Open;
      Self.F_acaoAcessoId  := Qry.FieldByName('acaoAcessoID').AsInteger ;
      Self.F_descricao     := Qry.FieldByName('descricao').AsString;
      Self.F_chave         := Qry.FieldByName('chave').AsString;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry)  then
       FreeAndNil(Qry);
  end;
end;

class procedure TAcaoAcesso.VerificarUsuarioAcao(aUsuarioID, aAcaoAcessoID: Integer; aConexao: TZConnection);
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioID                  '+
                '  FROM usuariosAcaoAcesso         '+
                ' WHERE usuarioID=:usuarioID       '+
                '   AND acaoAcessoID=:acaoAcessoID ');

    Qry.ParamByName('usuarioID').AsInteger    :=aUsuarioID;
    Qry.ParamByName('acaoAcessoID').AsInteger :=aAcaoAcessoID;
    Qry.Open;

    if Qry.IsEmpty then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(' INSERT INTO usuariosAcaoAcesso '+
                  '             (usuarioID,        '+
                  '              acaoAcessoID,     '+
                  '              ativo)            '+
                  '  VALUES     (:usuarioID,       '+
                  '              :acaoAcessoID,    '+
                  '              :ativo)           ');

      Qry.ParamByName('usuarioID').AsInteger    := aUsuarioID;
      Qry.ParamByName('acaoAcessoID').AsInteger := aAcaoAcessoID;
      Qry.ParamByName('ativo').AsBoolean        := True;

      try
        aConexao.StartTransaction;
        Qry.ExecSQL;
        aConexao.Commit;
      Except
        aConexao.Rollback;
      End;
    end;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

class procedure TAcaoAcesso.PreencherUsuariosVsAcoes(aConexao: TZConnection);
var Qry:TZQuery;
    QryAcaoAcesso:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;

    QryACaoAcesso:=TZQuery.Create(nil);
    QryAcaoAcesso.Connection:=aConexao;
    QryAcaoAcesso.SQL.Clear;

    Qry.SQL.Add(' SELECT usuarioID FROM usuarios ');
    Qry.Open;

    QryAcaoAcesso.SQL.Add(' SELECT acaoAcessoID FROM acaoAcesso ');
    QryAcaoAcesso.Open;

    Qry.First;

    while not Qry.Eof do  //Usuarios
    begin
      QryAcaoAcesso.First;

      while not QryAcaoAcesso.Eof do  //AcaoAcesso
      begin
        VerificarUsuarioAcao(Qry.FieldByName('usuarioID').AsInteger,
        QryAcaoAcesso.FieldByName('acaoAcessoID').AsInteger, aConexao);

        QryAcaoAcesso.Next;
      end;

      Qry.Next;
    end;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);

    if Assigned(QryACaoAcesso) then
       FreeAndNil(QryACaoAcesso);
  end;
end;

end.
