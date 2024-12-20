unit cCadCliente;

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
      System.SysUtils;

type
  Tcliente = class

  private
    ConexaoDB:TZConnection;
    F_clienteID:Integer;  //Int
    F_nome:String; //VarChar
    F_endereco: string;
    F_cidade: string;
    F_bairro: string;
    F_estado: string;
    F_cep: string;
    F_telefone: string;
    F_email: string;
    F_dataNascimento: TDateTime;
    F_pessoa: string;
    F_status: string;
    F_cpfcnpj: string;
    function GetPessoa: string;
    procedure SetPessoa(const Value: string);

  public

    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:integer):Boolean;

    published
    property codigo             :Integer          read F_clienteID           write F_clienteID;
    property nome               :string           read F_nome                write F_nome;
    property endereco           :string           read F_endereco            write F_endereco;
    property bairro             :string           read F_bairro              write F_bairro;
    property cidade             :string           read F_cidade              write F_cidade;
    property estado             :string           read F_estado              write F_estado;
    property cep                :string           read F_cep                 write F_cep;
    property telefone           :string           read F_telefone            write F_telefone;
    property email              :string           read F_email               write F_email;
    property dataNascimento     :TDateTime        read F_dataNascimento      write F_dataNascimento;
    property Pessoa             :string           read F_pessoa              write F_pessoa;
    property status             :string           read F_status              write F_status;
    property cpfcnpj            :string           read F_cpfcnpj             write F_cpfcnpj;
    end;

  implementation

function TCliente.GetPessoa: string;
begin
  Result := F_pessoa;
end;

procedure TCliente.SetPessoa(const Value: string);
begin
  F_pessoa := Value;
end;

function Tcliente.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE clientes                              '+
                '   SET nome                  =:nome          '+
                '       ,endereco             =:endereco      '+
                '       ,cidade               =:cidade        '+
                '       ,bairro               =:bairro        '+
                '       ,estado               =:estado        '+
                '       ,cep                  =:cep           '+
                '       ,telefone             =:telefone      '+
                '       ,email                =:email         '+
                '       ,pessoaID             =:pessoaID      '+
                '       ,statusID             =:statusID      '+
                '       ,cpfcnpj              =:cpfcnpj       '+
                '       ,dataNascimento       =:dataNascimento'+
                '       WHERE clienteID=:clienteID            ');

    Qry.ParamByName('clienteId').AsInteger          :=Self.F_clienteId;
    Qry.ParamByName('nome').AsString                :=Self.F_nome;
    Qry.ParamByName('endereco').AsString            :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString              :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString              :=Self.F_bairro;
    Qry.ParamByName('estado').AsString              :=Self.F_estado;
    Qry.ParamByName('cep').AsString                 :=Self.F_cep;
    Qry.ParamByName('telefone').AsString            :=Self.F_telefone;
    Qry.ParamByName('email').AsString               :=Self.F_email;
    Qry.ParamByName('pessoaID').AsString            :=Self.F_pessoa;
    Qry.ParamByName('statusID').AsString            :=Self.F_status;
    Qry.ParamByName('cpfcnpj').AsString             :=Self.F_cpfcnpj;
    Qry.ParamByName('dataNascimento').AsDateTime    :=Self.F_dataNascimento;

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

constructor TCliente.Create(aConexao:TZConnection);
begin
     ConexaoDB:=aConexao;
end;

destructor  TCliente.Destroy;
begin
  inherited;
end;

function Tcliente.Inserir: Boolean;
var Qry:TZQuery;
begin
try
Qry:=TZQuery.Create(nil);
  try
    Result:=true;
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO clientes  (nome,             '+
                '                       endereco,         '+
                '                       cidade,           '+
                '                       bairro,           '+
                '                       estado,           '+
                '                       cep,              '+
                '                       telefone,         '+
                '                       email,            '+
                '                       pessoaID,         '+
                '                       statusID,         '+
                '                       cpfcnpj,          '+
                '                       dataNascimento)   '+
                '  VALUES               (:nome,           '+
                '                       :endereco,        '+
                '                       :cidade,          '+
                '                       :bairro,          '+
                '                       :estado,          '+
                '                       :cep,             '+
                '                       :telefone,        '+
                '                       :email,           '+
                '                       :pessoaID,        '+
                '                       :statusID,        '+
                '                       :cpfcnpj,          '+
                '                       :dataNascimento)  ');

    Qry.ParamByName('nome').AsString                      :=Self.F_nome;
    Qry.ParamByName('endereco').AsString                  :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString                    :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString                    :=Self.F_bairro;
    Qry.ParamByName('estado').AsString                    :=Self.F_estado;
    Qry.ParamByName('cep').AsString                       :=Self.F_cep;
    Qry.ParamByName('telefone').AsString                  :=Self.F_telefone;
    Qry.ParamByName('email').AsString                     :=Self.F_email;
    Qry.ParamByName('pessoaID').AsString                  :=Self.F_pessoa;
    Qry.ParamByName('statusID').AsString                  :=Self.F_status;
    Qry.ParamByName('cpfcnpj').AsString                   :=Self.F_cpfcnpj;
    Qry.ParamByName('dataNascimento').AsDateTime          :=Self.F_dataNascimento;

    ConexaoDB.StartTransaction;
    Try
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
except
  on E: Exception do
  begin
    ShowMessage('Erro ao gravar dados: ' + E.Message);
  end;
end;
end;

function Tcliente.Selecionar(id: integer): Boolean;
var Qry:TZQuery;
begin
try
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT clienteID,           '+
                '       nome,                '+
                '       endereco,            '+
                '       cidade,              '+
                '       bairro,              '+
                '       estado,              '+
                '       cep,                 '+
                '       telefone,            '+
                '       email,               '+
                '       pessoaID,            '+
                '       statusID,            '+
                '       cpfcnpj,             '+
                '       dataNascimento       '+
                '  FROM clientes             '+
                ' WHERE clienteID=:clienteID ');
    Qry.ParamByName('clienteID').AsInteger:=id;
    Qry.Open;

    Self.F_clienteId        := Qry.FieldByName('clienteID').AsInteger;
    Self.F_nome             := Qry.FieldByName('nome').AsString;
    Self.F_endereco         := Qry.FieldByName('endereco').AsString;
    Self.F_cidade           := Qry.FieldByName('cidade').AsString;
    Self.F_bairro           := Qry.FieldByName('bairro').AsString;
    Self.F_estado           := Qry.FieldByName('estado').AsString;
    Self.F_cep              := Qry.FieldByName('cep').AsString;
    Self.F_telefone         := Qry.FieldByName('telefone').AsString;
    Self.F_email            := Qry.FieldByName('email').AsString;
    Self.F_pessoa           := Qry.FieldByName('pessoaID').AsString;
    Self.F_status           := Qry.FieldByName('statusID').AsString;
    Self.F_cpfcnpj          := Qry.FieldByName('cpfcnpj').AsString;
    Self.F_dataNascimento   := Qry.FieldByName('dataNascimento').AsDateTime;

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

except
  on E: Exception do
  begin
    ShowMessage('Erro ao gravar dados: ' + E.Message);
  end;
end;
end;

function TCliente.Apagar: Boolean;
var      Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+IntToStr(F_clienteID)+#13+
                'Nome: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrYes
  then
  begin
  Qry:=TZQuery.Create(nil);
    try
      Result:=true;
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM clientes        '+
                  ' WHERE clienteID=:clienteID ');

      Qry.ParamByName('clienteID').AsInteger :=F_clienteID;

      ConexaoDB.StartTransaction;

        try
          Qry.ExecSQL;
          ConexaoDB.Commit;
          Result := True;
        except
          on E: Exception do
          begin
            ConexaoDB.Rollback;
            ShowMessage('Erro ao apagar registro: ' + E.Message);
          end;
        end;

    finally
      if Assigned(Qry) then
         FreeAndNil(Qry);
    end;
  end

  else
  begin
    Result:=false;
    abort;
  end;
end;

end.
