unit cCadCategoria;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,                  //LISTA DE UNITS
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils;

type
     TCategoria = class    //DECLARAÇÃO TIPO DE CLASSE

  private               //DECLARA SOMENTE DENTRO DA CLASSE

    ConexaoDB     :TZConnection;
    F_categoriaId :Integer;
    F_descricao   :String;

    function    getCodigo               :Integer;
    function    getDescricao            :string;
    procedure   setCodigo(const Value   :Integer);
    procedure   setDescricao(const Value:string);

  public                //VISIVEL DENTRO E FORA DA CALASSE

    constructor Create(aConexao:TZConnection);     //CONSTRUTOR DA CLASSE
    destructor  Destroy; override;                 //DESTROI A CLASSE
    function    Inserir               :Boolean;
    function    Atualizar             :Boolean;
    function    Apagar                :Boolean;
    function    Selecionar(id:Integer):Boolean;

  published             //VARIAVEIS PUBLICADAS E UTILIZADAS POR CLASSES
                        //PARA FORNECER INFORMAÇÕES EM RUNTIME = TEMPO REAL

    property codigo   :Integer   read getCodigo    write setCodigo;
    property descricao:string    read getDescricao write setDescricao;

  end;

implementation

{ TCategoria }

constructor TCategoria.Create(aConexao:TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;

function TCategoria.Apagar: Boolean;
var Qry:TZQuery;

begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_categoriaId)+#13+
                'Descrição: '+F_descricao,mtConfirmation,[mbYes, mbNo],0)=mrNo
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
    Qry.SQL.Add('DELETE FROM categorias '+
                ' WHERE categoriaId=:categoriaID ');

    Qry.ParamByName('categoriaID').AsInteger :=F_categoriaId;

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

function TCategoria.Atualizar: Boolean;
var Qry:TZQuery;

begin
  try
    Result              :=true;
    Qry                 :=TZQuery.Create(nil);
    Qry.Connection      :=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE categorias              '+
                'SET descricao    =:descricao   '+
                'WHERE categoriaID=:categoriaID ');

    Qry.ParamByName('categoriaId').AsInteger :=Self.F_categoriaId;
    Qry.ParamByName('descricao').AsString    :=Self.F_descricao;

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

function TCategoria.Inserir: Boolean;
var      Qry:TZQuery;

begin
  try
    Result          :=true;
    Qry             :=TZQuery.Create(nil);
    Qry.Connection  :=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');
    Qry.ParamByName('descricao').AsString:=Self.F_descricao;

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

function TCategoria.Selecionar(id: Integer): Boolean;
var      Qry:TZQuery;
begin
  try
   Result          :=true;
   Qry             :=TZQuery.Create(nil);
   Qry.Connection  :=ConexaoDB;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT categoriaId,             ' +
               '       descricao                ' +
               '  FROM categorias               ' +
               ' WHERE categoriaId=:categoriaId ');

   Qry.ParamByName('categoriaId').AsInteger:=id;

   Try
     Qry.Open;

     Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
     Self.F_descricao   := Qry.FieldByName('descricao').AsString;
   Except
     Result:=false;
   End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;



end.
