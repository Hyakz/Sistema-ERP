unit cCadProduto;

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

      System.StrUtils,
      Vcl.Imaging.jpeg,
      Vcl.Graphics;


type
  tproduto = class

  private
    ConexaoDB     :TZConnection;
    F_produtoID   :Integer;
    F_nome        :String;
    F_descricao   :string;
    F_valor       :Double;
    F_quantidade  :Double;
    F_categoriaID :Integer;
    F_subCategoriaID :Integer;
    F_Foto        :TBitmap;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir               :Boolean;
    function Atualizar             :Boolean;
    function Apagar                :Boolean;
    function Selecionar(id:integer):Boolean;

  published
    property codigo             :Integer          read F_produtoID           write F_produtoID;
    property nome               :string           read F_nome                write F_nome;
    property descricao          :string           read F_descricao           write F_descricao;
    property valor              :Double           read F_valor               write F_valor;
    property quantidade         :Double           read F_quantidade          write F_quantidade;
    property categoriaID        :Integer          read F_categoriaID         write F_categoriaID;
    property subCategoriaID     :Integer          read F_subCategoriaID      write F_subCategoriaID;
    property foto               :TBitmap          read F_Foto                write F_Foto;
  end;

implementation

{$REGION 'Constructor and Destructor'}

constructor TProduto.Create(aConexao:TZConnection);
begin
    ConexaoDB:=aConexao;
    F_Foto:=TBitmap.Create;
    F_Foto.Assign(nil);
end;

destructor TProduto.Destroy;
begin
  if Assigned(F_Foto) then
  begin
    F_Foto.Assign(nil);
    F_Foto.Free;
  end;
  inherited;
end;

{$ENDREGION}

function TProduto.Apagar: Boolean;
var      Qry:TZQuery;

begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+IntToStr(F_produtoID)+#13+
                'Nome: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrYes
  then
  begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM produtos '+
                ' WHERE produtoID=:produtoID ');

    Qry.ParamByName('produtoID').AsInteger :=F_produtoID;

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
end;

function TProduto.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE produtos                         '+
                '    SET nome           =:nome           '+
                '       ,descricao      =:descricao      '+
                '       ,valor          =:valor          '+
                '       ,quantidade     =:quantidade     '+
                '       ,categoriaID    =:categoriaID    '+
                '       ,subCategoriaID =:subCategoriaID '+
                '       ,foto           =:foto           '+
                '  WHERE produtoID=:produtoID            ');

    Qry.ParamByName('produtoID').AsInteger     :=Self.F_produtoID;
    Qry.ParamByName('nome').AsString           :=Self.F_nome;
    Qry.ParamByName('descricao').AsString      :=Self.F_descricao;
    Qry.ParamByName('valor').AsFloat           :=Self.F_valor;
    Qry.ParamByName('quantidade').AsFloat      :=Self.F_quantidade;
    Qry.ParamByName('categoriaID').AsInteger   :=Self.F_categoriaID;
    Qry.ParamByName('subCategoriaID').AsInteger:=Self.F_subCategoriaID;

    if Self.F_Foto.Empty then
       Qry.ParamByName('foto').Clear
    else
       Qry.ParamByName('foto').Assign(Self.F_Foto);

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

function tproduto.Inserir: Boolean;
var      Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add (' INSERT INTO produtos (nome,            '+
                '                        descricao,       '+
                '                        valor,           '+
                '                        quantidade,      '+
                '                        categoriaID,     '+
                '                        subCategoriaID,  '+
                '                        foto)            '+
                '  VALUES               (:nome,           '+
                '                        :descricao,      '+
                '                        :valor,          '+
                '                        :quantidade,     '+
                '                        :categoriaID,    '+
                '                        :subCategoriaID, '+
                '                        :foto)           ');

    Qry.ParamByName('nome').AsString           :=Self.F_nome;
    Qry.ParamByName('descricao').AsString      :=Self.F_descricao;
    Qry.ParamByName('valor').AsFloat           :=Self.F_valor;
    Qry.ParamByName('quantidade').AsFloat      :=Self.F_quantidade;
    Qry.ParamByName('categoriaID').AsInteger   :=Self.F_categoriaID;
    Qry.ParamByName('subCategoriaID').AsInteger:=Self.F_subCategoriaID;

    if Self.F_Foto.Empty then
       Qry.ParamByName('foto').Clear
    else
       Qry.ParamByName('foto').Assign(Self.F_Foto);

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

function TProduto.Selecionar(id: integer): Boolean;
var      Qry:TZQuery;
begin
  Qry:=TZQuery.Create(nil);
  try
    Result:=true;
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT produtoID,          '+
                '       nome,               '+
                '       descricao,          '+
                '       valor,              '+
                '       quantidade,         '+
                '       categoriaID,        '+
                '       subCategoriaID,     '+
                '       foto                '+
                '  FROM produtos            '+
                ' WHERE produtoID=:produtoID');
    Qry.ParamByName('produtoID').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_produtoID        := Qry.FieldByName('produtoID').AsInteger;
      Self.F_nome             := Qry.FieldByName('nome').AsString;
      Self.F_descricao        := Qry.FieldByName('descricao').AsString;
      Self.F_valor            := Qry.FieldByName('valor').AsFloat;
      Self.F_quantidade       := Qry.FieldByName('quantidade').AsFloat;
      Self.F_categoriaID      := Qry.FieldByName('categoriaID').AsInteger;
      Self.F_subCategoriaID   := Qry.FieldByName('subCategoriaID').AsInteger;
      Self.F_Foto.Assign(Qry.FieldByName('foto'));

    Except
      on e: Exception do
      begin
        ShowMessage('Erro ao Selecionar cliente. Classe de Erro: ' +
        e.ClassName + 'Mensagem de Erro; ' +
        e.Message);
        Result:=false;
      end;
    End;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

end.
