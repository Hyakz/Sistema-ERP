unit cAtualizacaoTabelaMSSQL;

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
     cAtualizacaoBancoDeDados,
     cCadUsuario,
     uSubCategoria;

type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)

  private
    function  TabelaExiste(aNomeTabela:String):Boolean;


  protected

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    procedure Categoria;
    procedure Cliente;
    procedure Produto;
    procedure Vendas;
    procedure ItensVenda;
    procedure Usuario;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;
    procedure SubCategorias;
    procedure Pessoas;
    procedure Status;
end;

implementation

{ TAtualizacaoTableMSSQL }

constructor TAtualizacaoTableMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
  Categoria;
  SubCategorias;
  Status;
  Pessoas;
  Cliente;
  Produto;
  Usuario;
  AcaoAcesso;
  UsuariosAcaoAcesso;
  Vendas;
  ItensVenda;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin
  inherited;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
Var Qry:TZQuery;
Begin
  Try
    Result:=False;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT OBJECT_ID (:NomeTabela) As ID ');
    Qry.ParamByName('NomeTabela').AsString:=aNomeTabela;
    Qry.Open;

    if Qry.FieldByName('ID').AsInteger>0 then
       Result:=True;

  Finally
    Qry.Close;

    if Assigned(Qry) then
       FreeAndNil(Qry);
  End;
end;

procedure TAtualizacaoTableMSSQL.Usuario;
Var oUsuario:TUsuario;
begin
  if not TabelaExiste('usuarios') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE usuarios(                             '+
      '	            usuarioID int identity(1,1) not null, '+
      '	            nome varchar(50) not null,            '+
      '             cargo varchar(50) not null,           '+
      '	            senha varchar(40) not null,           '+
      '	            PRIMARY KEY (usuarioID)               '+
      '	                                                 )'
    );
  end;

  Try
    oUsuario:=TUsuario.Create(ConexaoDB);
    oUsuario.nome :='ADMIN';
    oUsuario.senha:='1234';
    oUsuario.cargo:='Administrador';

    if not oUsuario.UsuarioExiste(oUsuario.nome) then
      oUsuario.Inserir;
  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;
end;

procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin
  if not TabelaExiste('AcaoAcesso') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE acaoAcesso(                              '+
    '	            acaoAcessoID int IDENTITY(1,1) NOT NULL,  '+
    '	            descricao varchar(100) NOT NULL,          '+
    '             chave varchar(60) NOT NULL,               '+
    '	            PRIMARY KEY (acaoAcessoID)                '+
    '	                                                     )'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Status;
begin
  if not TabelaExiste('status') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE status (                              ' +
    '     statusID INT IDENTITY(1,1) PRIMARY KEY,        ' +
    '     tipoStatus VARCHAR(30)                         ' +
    '                                                  );'
    );

    ExecutaDiretoBancoDeDados(
    ' INSERT INTO status (tipoStatus) VALUES ' +
    ' (''Ativo''),                           ' +
    ' (''Inativo''),                         ' +
    ' (''Bloqueado''),                       ' +
    ' (''Aten��o''),                         ' +
    ' (''Prospecto'')                        '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Pessoas;
begin
  if not TabelaExiste('pessoas') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE pessoas(                               '+
    '              pessoaID INT IDENTITY(1,1) primary key,'+
    '              tipoPessoa varchar(30)                 '+
    '                                                    )'
    );

    ExecutaDiretoBancoDeDados(
    ' INSERT INTO pessoas (tipoPessoa) VALUES '+
    ' (''Fisica''),                           '+
    ' (''Juridica'')                          '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin
  if not TabelaExiste('categorias') then
  begin
    ExecutaDiretoBancoDeDados(
     ' CREATE TABLE categorias(                                                    '+
     '	            categoriaID int IDENTITY(1,1) NOT NULL,                        '+
     '	            descricao  varchar(30) NULL,                                   '+
     '	            PRIMARY KEY (categoriaID)                                      '+
     '	                                                                          )'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.SubCategorias;
begin
  if not TabelaExiste('subCategorias') then
  begin
    ExecutaDiretoBancoDeDados(
    'create table subCategorias(                                                                       '+
		'	            subCategoriaID int identity(1,1) primary key,                                        '+
		'	            CategoriaID INT,                                                                     '+
		'	            categoria varchar(50),                                                               '+
		'	            descricao varchar(50),                                                               '+
    '  CONSTRAINT FK_SubcategoriaCategoria FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)'+
    '                                                                                                 )'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Cliente;
begin
  if not TabelaExiste('clientes') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE clientes (                             ' +
      '     clienteID INT IDENTITY(1,1) NOT NULL,           ' +
      '     nome VARCHAR(60) NULL,                          ' +
      '     endereco VARCHAR(60) NULL,                      ' +
      '     cidade VARCHAR(50) NULL,                        ' +
      '     bairro VARCHAR(40) NULL,                        ' +
      '     estado VARCHAR(2) NULL,                         ' +
      '     cep VARCHAR(10) NULL,                           ' +
      '     telefone VARCHAR(14) NULL,                      ' +
      '     email VARCHAR(100) NULL,                        ' +
      '     cpfcnpj VARCHAR(20) NULL,                       ' +
      '     dataNascimento DATETIME NULL,                   ' +
      '     PRIMARY KEY (clienteID)                         ' +
      ' )                                                   '
    );

    ExecutaDiretoBancoDeDados(
      'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS ' +
      'WHERE TABLE_NAME = ''clientes'' AND COLUMN_NAME = ''statusID'') ' +
      'BEGIN ' +
      'ALTER TABLE clientes ' +
      'ADD statusID INT; ' +
      'END'
    );

    ExecutaDiretoBancoDeDados(
      'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS ' +
      'WHERE TABLE_NAME = ''clientes'' AND COLUMN_NAME = ''pessoaID'') ' +
      'BEGIN ' +
      'ALTER TABLE clientes ' +
      'ADD pessoaID INT; ' +
      'END'
    );

//    ExecutaDiretoBancoDeDados(
//      'IF NOT EXISTS (SELECT * FROM sys.foreign_keys ' +
//      'WHERE name = ''FK_statusCliente'') ' +
//      'BEGIN ' +
//      'ALTER TABLE clientes ' +
//      'ADD CONSTRAINT FK_statusCliente ' +
//      'FOREIGN KEY (statusID) REFERENCES status(statusID); ' +
//      'END'
//    );
//
//    ExecutaDiretoBancoDeDados(
//      'IF NOT EXISTS (SELECT * FROM sys.foreign_keys ' +
//      'WHERE name = ''FK_pessoaCliente'') ' +
//      'BEGIN ' +
//      'ALTER TABLE clientes ' +
//      'ADD CONSTRAINT FK_pessoaCliente ' +
//      'FOREIGN KEY (pessoaID) REFERENCES pessoas(pessoaID); ' +
//      'END'
//    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Produto;
begin
  if not TabelaExiste('produtos') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE  produtos(                                                             '+
      '	            	produtoID int IDENTITY(1,1) NOT NULL,                                 '+
      '	            	nome varchar(60) NULL,                                                '+
      '	            	descricao varchar(255) null,                                          '+
      '	            	valor decimal(18,5) default 0.00000 null,                             '+
      '	            	quantidade decimal(18,5) default 0.00000 null,                        '+
      '	            	categoriaID int null,                                                 '+
      '               subCategoriaID int null,                                              '+
      '	            	PRIMARY KEY (produtoID),                                              '+
      '	            	CONSTRAINT FK_ProdutosCategorias                                      '+
      '	            	FOREIGN KEY (categoriaID) references categorias(categoriaID)          '+
      'ON DELETE SET NULL'+
      '	                                                                                  ) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Vendas;
begin
  if not TabelaExiste('vendas') then
  begin
    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE vendas (                                             '+
      '	             vendaID int identity(1,1) not null,                  '+
      '	             clienteID int NULL,                                  '+
      '	             dataVenda datetime default getdate(),                '+
      '	             totalVenda decimal(18,5) default 0.00000,            '+
      '	             PRIMARY KEY (vendaID),                               '+
      '	             CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteID) '+
      '		           REFERENCES clientes(clienteID)                       '+
      '		           ON DELETE SET NULL                                   '+
      '	)                                                                 '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.ItensVenda;
begin
  if not TabelaExiste('ItensVenda') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE ItensVenda (                                              '+
      ' 	           vendaID int not null,                                     '+
      '	             produtoID int not null,                                   '+
      '	             valorUnitario decimal (18,5) default 0.00000,             '+
      '	             quantidade decimal (18,5) default 0.00000,                '+
      '	             totalProduto decimal (18,5) default 0.00000,              '+
      '	             PRIMARY KEY (vendaID,produtoID),                          '+
      '	             CONSTRAINT FK_ItensVendaProdutos FOREIGN KEY (produtoID)  '+
      '	           	 REFERENCES produtos(produtoID)                            '+
      ')                                                                       '
       );
  end;
end;

procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
begin
  if not TabelaExiste('usuariosAcaoAcesso') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE usuariosAcaoAcesso(                                             '+
    ' 	           usuarioID int NOT NULL,                                         '+
    '	             acaoAcessoID int NOT NULL,                                      '+
    '	             ativo bit NOT NULL default 1,                                   '+
    '	             PRIMARY KEY (usuarioID, acaoAcessoID),                          '+
    '	             CONSTRAINT FK_UsuarioAcaoAcessoUsuario                          '+
    '              FOREIGN KEY (usuarioID) REFERENCES usuarios(usuarioID),         '+
    '	           	 CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso                       '+
    '              FOREIGN KEY (acaoAcessoID) references acaoAcesso(acaoAcessoID), '+
    ' ) '
      );
  end;
end;




end.
