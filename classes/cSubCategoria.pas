unit cSubCategoria;

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
      System.StrUtils,
      Vcl.Imaging.jpeg,
      Vcl.Graphics,
      System.SysUtils;

 type
    TSubCategoria = class
  private
    ConexaoDB          :TZConnection;
    F_SubCategoriaID   :Integer;  //Int
    F_NomeSubCategoria :String; //VarChar
    F_Categoria        :string;
    F_CategoriaID      :Integer;

    public

    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:integer):Boolean;

    published
    property codigo             :Integer          read F_SubCategoriaID           write F_SubCategoriaID;
    property nome               :string           read F_NomeSubCategoria         write F_NomeSubCategoria;
    property descricao          :string           read F_Categoria                write F_Categoria;
    property codigoCategoria    :Integer          read F_CategoriaID              write F_CategoriaID;

    end;

implementation

{ TProduto }
constructor TSubCategoria.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TSubCategoria.Destroy;
begin
  inherited;
end;

function TSubCategoria.Apagar: Boolean;
   var QRY: TZQuery;
begin
  if MessageDlg('Apagar o registro' +#13 +#13+
              ' C�digo: ' + IntToStr(F_SubCategoriaId)+ #13+
              ' Descri��o: '+F_NomeSubCategoria, mtConfirmation, [mbYes, mbNo], 0)=mrNo
  then
  begin
     Result:= False;
     Abort;
  end;
   QRY :=  TZQuery.Create(nil);
  try
    Try
      Result := True;

      QRY.Connection:= ConexaoDB;
      QRY.SQL.Clear;
      QRY.SQL.Add('DELETE FROM subCategorias ' +
                      ' WHERE subCategoriaID=:subCategoriaID ');
      QRY.ParamByName('subCategoriaID').AsInteger :=  F_SubCategoriaId;

    try
      ConexaoDB.StartTransaction;
      QRY.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
    except
      on e: Exception do
      begin
        ShowMessage('Classe do erro:' + e.ClassName + 'Mensagem do erro' + e.Message);
      end;
    End;
  finally
    QRY.Free;
  end;
    Result := True;
end;

function TSubCategoria.Atualizar: Boolean;
var QRY:TZQuery;
begin
    QRY :=  TZQuery.Create(nil);
  try
    Result := True;
    QRY.Connection:= ConexaoDB;
    QRY.SQL.Clear;
    QRY.sQL.Add('UPDATE subCategorias' +
                    '   SET categoria     =:categoria ' +
                    '   ,descricao        =:descricao ' +
                    '   ,CategoriaID      =:CategoriaID ' +
                    ' WHERE subCategoriaID=:subCategoriaID');

    QRY.ParamByName('SubCategoriaID').AsInteger := Self.F_SubCategoriaId;
    QRY.ParamByName('categoria').AsString       := Self.F_Categoria;
    QRY.ParamByName('descricao').AsString       := Self.F_NomeSubCategoria;
    QRY.ParamByName('CategoriaID').AsInteger    := Self.F_CategoriaID;

   try
      ConexaoDB.StartTransaction;
      QRY.ExecSQL;
      ConexaoDB.Commit;
   except
      ConexaoDB.Rollback;
      Result:=False;
    end;

  finally
    QRY.Free;
  end;
end;

function TSubCategoria.Gravar: Boolean;
var      Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add (' INSERT INTO subCategorias               '+
                '                       (categoria,        '+
                '                        descricao,        '+
                '                        CategoriaID)      '+
                '  VALUES               (:categoria,       '+
                '                        :descricao,       '+
                '                        :CategoriaID)     ');

    QRY.ParamByName('categoria').AsString       := Self.F_Categoria;
    QRY.ParamByName('descricao').AsString       := Self.F_NomeSubCategoria;
    QRY.ParamByName('CategoriaID').AsInteger    := Self.F_CategoriaID;

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

function TSubCategoria.Selecionar(id: integer): Boolean;
var
  Qry:TZQuery;
begin
    Qry:=TZQuery.Create(nil);
  try
    Result:=true;
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT subCategoriaID,     '+
                '       CategoriaID,        '+
                '       categoria,          '+
                '       descricao           '+
                '  FROM subCategorias       '+
                ' WHERE subCategoriaID=:subCategoriaID');
    Qry.ParamByName('subCategoriaID').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_SubCategoriaId     := Qry.FieldByName('subCategoriaID').AsInteger;
      Self.F_Categoria          := Qry.FieldByName('categoria').AsString;
      Self.F_NomeSubCategoria   := Qry.FieldByName('descricao').AsString;
      Self.F_CategoriaID        := Qry.FieldByName('CategoriaID').AsInteger;

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
