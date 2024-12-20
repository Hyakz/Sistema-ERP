unit cProVenda;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset, cControleEstoque,
  Data.DB, uEnum,
  Datasnap.DBClient,
  System.SysUtils;

type
  TVenda = class

  private
    ConexaoDB   : TZConnection;
    F_vendaID   : Integer;
    F_clienteID : Integer;
    F_dataVenda : TDateTime;
    F_totalVenda: Double;
    function InserirItens(cds: TClientDataSet; idVenda: Integer):Boolean;
    function ApagaItens(cds: TClientDataSet): Boolean;
    function InNot(cds: TClientDataSet): String;
    function EsteItemExiste(vendaID, produtoID: Integer): Boolean;
    function AtualizarItem(cds: TClientDataSet): Boolean;
    procedure RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
    procedure BaixarEstoque(produtoID: Integer; quantidade: Double);

  public
    constructor Create(aConexao: TZConnection);
    destructor Destroy; override;
    function Inserir(cds:TClientDataSet)                    :Integer;
    function Atualizar(cds:TClientDataSet)                  :Boolean;
    function Apagar                                         :Boolean;
    function Selecionar(id: integer; var cds:TClientDataSet):Boolean;

  published
    property vendaID    : Integer   read F_vendaID    write F_vendaID;
    property clienteID  : Integer   read F_clienteID  write F_clienteID;
    property dataVenda  : TDateTime read F_dataVenda  write F_dataVenda;
    property totalVenda : Double    read F_totalVenda write F_totalVenda;

  end;

implementation

{$REGION 'Constructor and Destructor'}

constructor TVenda.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TVenda.Destroy;
begin

  inherited;
end;

{$ENDREGION}

function TVenda.Apagar: Boolean;
var
  Qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: ' + #13 + #13 +
                'Venda N�mero: ' + IntToStr(vendaID), mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    Result := True;
    Qry := TZQuery.Create(nil);
    try
      ConexaoDB.StartTransaction;
      Qry.Connection := ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM ItensVenda ' +
                 ' WHERE vendaID=:vendaID ');

      Qry.ParamByName('vendaID').AsInteger :=vendaID;

      try
        Qry.ExecSQL;
        Qry.SQL.Clear;
        Qry.SQL.Add('DELETE FROM vendas       ' +
                    '  WHERE vendaID=:vendaID ');

        Qry.ParamByName('vendaID').AsInteger := vendaID;
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

function TVenda.Atualizar(cds:TClientDataSet): Boolean;
var Qry: TZQuery;
begin
  try
    conexaoDB.StartTransaction;
    Qry := TZQuery.Create(nil);
    Result := true;
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE vendas                           ' +
                '    SET clienteID          =:clienteID,  ' +
                '        dataVenda          =:dataVenda,  ' +
                '        totalVenda         =:totalVenda  ' +
                '        WHERE vendaID      =:vendaID     ' );
    Qry.ParamByName('vendaID').AsInteger    := Self.F_vendaID;
    Qry.ParamByName('clienteID').AsInteger  := Self.F_clienteID;
    Qry.ParamByName('dataVenda').AsDateTime := Self.F_dataVenda;
    Qry.ParamByName('totalVenda').AsFloat   := Self.F_totalVenda;

    try
      //update vendas
      Qry.ExecSQL;

      //apaga itens no banco que foram apagados da tela
      ApagaItens(cds);

      cds.First;
      while not cds.Eof do
      begin
        if EsteItemExiste(Self.F_vendaID, cds.FieldByName('produtoID').AsInteger) then
        begin
          AtualizarItem(cds);
        end

        else
        begin
          InserirItens(cds, Self.F_vendaID);
        end;
          cds.Next;
      end;

      ConexaoDB.Commit;
    Except
      Result:=false;
      ConexaoDB.Rollback;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.AtualizarItem(cds:TClientDataSet): Boolean;
var      Qry:TZQuery;
begin
  Qry:=TZQuery.Create(nil);
  try
    Result := true;
    RetornarEstoque(cds.FieldByName('produtoID').AsString, aeeAlterar);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE ItensVenda                                   ' +
                '    SET valorUnitario              =:valorUnitario   ' +
                '       ,quantidade                 =:quantidade      ' +
                '       ,totalProduto               =:totalProduto    ' +
                '  WHERE vendaID                    =:vendaID         ' +
                '    AND produtoID                  =:produtoID       ' );

    Qry.ParamByName('vendaID').AsInteger     := Self.F_vendaID;
    Qry.ParamByName('produtoID').AsInteger   := cds.FieldByName('produtoID').AsInteger;
    Qry.ParamByName('valorUnitario').AsFloat := cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('quantidade').AsFloat    := cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('totalProduto').AsFloat  := cds.FieldByName('totalProduto').AsFloat;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;

      BaixarEstoque(cds.FieldByName('produtoID').AsInteger, cds.FieldByName('quantidade').AsFloat);
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.EsteItemExiste(vendaID: Integer; produtoID:Integer): Boolean;
var Qry:TZQuery;
begin
  Qry := TZQuery.Create(nil);
  try
    try
      conexaoDB.StartTransaction;
      Result := True;
      Qry.Connection := ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add(' SELECT Count (vendaID) AS Qtde      '+
                  ' FROM ItensVenda                     '+
                  ' WHERE vendaID   =:vendaID           '+
                  ' AND produtoID   =:produtoID         ');
      Qry.ParamByName('vendaID').AsInteger     :=vendaID;
      Qry.ParamByName('produtoID').AsInteger   :=produtoID;

      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         Result:=true
      else
         Result:=False;

    Except
      on e: Exception do
      begin
        ShowMessage('Erro. Classe de Erro: ' +
        e.ClassName + 'Mensagem de Erro; ' +
        e.Message);
        Result:=false;
      end;
    End;

  finally
    Qry.Free;
  end;
end;

function TVenda.ApagaItens(cds:TClientDataSet): Boolean;
var Qry:TZQuery;
    sCodNoCds:String;
begin
 Qry:=TZQuery.Create(nil);
  try
    Result:=True;
    sCodNoCds:= InNot(cds);
    RetornarEstoque(sCodNoCds, aeeApagar);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' DELETE                                  ' +
                '   FROM ItensVenda                       ' +
                '  WHERE vendaID=:vendaID                 ' +
                '    AND produtoID NOT IN ('+sCodNoCds+') ' );

    Qry.ParamByName('vendaID').AsInteger      :=Self.F_vendaID;

    try
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

function TVenda.InNot(cds:TClientDataSet):String;
var sInNot:String;
begin
  sInNot:=EmptyStr;
  cds.First;

  while not cds.Eof do
  begin
      if sInNot=EmptyStr then
         sInNot:=cds.FieldByName('produtoID').AsString
      else
         sInNot:=sInNot + ',' +cds.FieldByName('produtoID').AsString;
         cds.Next;
  end;
  Result := sInNot;
end;

function TVenda.Inserir(cds:TClientDataSet): Integer;
var
Qry          : TZQuery;
idVendaGerado: Integer;
begin
  try
    ConexaoDB.StartTransaction;
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' INSERT INTO vendas   (clienteID,   ' +
                '                       dataVenda,   ' +
                '                       totalVenda)  ' +
                '  VALUES              (:clienteID,  ' +
                '                       :dataVenda,  ' +
                '                       :totalVenda) ' );

    Qry.ParamByName('clienteID').AsInteger  := Self.F_clienteID;
    Qry.ParamByName('dataVenda').AsDateTime := Self.F_dataVenda;
    Qry.ParamByName('totalVenda').AsFloat   := Self.F_totalVenda;

    try
      Qry.ExecSQL;
      //recupera id gerado no insert
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      Qry.Open;

      //id da tabela master (venda)
      idVendaGerado := Qry.FieldByName('ID').AsInteger;

      //gravar itens na tabela de vendas
      cds.First;

      while not cds.Eof do
      begin
        InserirItens(cds, idVendaGerado);
        cds.Next;
      end;

      ConexaoDB.Commit;
      Result:=idVendaGerado;
    except
      ConexaoDB.Rollback;
      Result:=-1;
    end;
  finally
     if Assigned(Qry) then
        FreeAndNil(Qry);
  end;
end;

function TVenda.InserirItens(cds:TClientDataSet; idVenda:Integer):Boolean;
var      Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO ItensVenda ( vendaID, produtoID, valorUnitario, quantidade, totalProduto)' +
                '            VALUES     (:vendaID,:produtoID,:valorUnitario,:quantidade,:totalProduto)' );

    Qry.ParamByName('vendaID').AsInteger    := idVenda;
    Qry.ParamByName('produtoID').AsInteger  := cds.FieldByName('produtoID').AsInteger;
    Qry.ParamByName('quantidade').AsFloat   := cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('valorUnitario').AsFloat:= cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('totalProduto').AsFloat := cds.FieldByName('totalProduto').AsFloat;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      COnexaoDB.Commit;

      BaixarEstoque(cds.FieldByName('produtoID').AsInteger, cds.FieldByName('quantidade').AsFloat);
    except
      ConexaoDB.Rollback;
      result:=false;
    end;

  finally
     if Assigned(Qry) then
        FreeAndNil(Qry);
  end;
end;

function TVenda.Selecionar(id: integer; var cds:TClientDataSet): Boolean;
var      Qry:TZQuery;
begin
Qry:=TZQuery.Create(nil);
  try
   try
     Result:=true;
     Qry.Connection:=ConexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add( ' SELECT vendaID         ' +
                  '       ,clienteID       ' +
                  '       ,dataVenda       ' +
                  '       ,totalVenda      ' +
                  '   FROM vendas          ' +
                  '  WHERE vendaID=:vendaID');
     Qry.ParamByName('vendaID').AsInteger:=id;
     Qry.Open;

     Self.F_vendaID          :=Qry.FieldByName('vendaID').AsInteger;
     Self.F_clienteID        :=Qry.FieldByName('clienteID').AsInteger;
     Self.F_dataVenda        :=Qry.FieldByName('dataVenda').AsDateTime;
     Self.F_totalVenda       :=Qry.FieldByName('totalVenda').AsFloat;

    // (selecionar na tabela ItensVenda) apaga o ClientDataSet caso esteja com registro

    cds.First;

    while not cds.Eof do
    begin
      cds.Delete;
    end;

    //  seleciona os itens do banco de dados com a propriedade F_VendaID

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT ItensVenda.produtoID                                             '+
                '       ,Produtos.nome as nomeProduto                                     '+
                '       ,ItensVenda.valorUnitario                                         '+
                '       ,ItensVenda.quantidade                                            '+
                '       ,ItensVenda.totalProduto                                          '+
                '  FROM  ItensVenda                                                       '+
                '        INNER JOIN produtos On produtos.produtoID = ItensVenda.produtoID '+
                ' WHERE ItensVenda.vendaID=:vendaID                                       ');
    Qry.ParamByName('vendaID').AsInteger :=Self.F_vendaID;
    Qry.Open;

    Qry.First;

    while not qry.Eof do
    begin
      cds.Append;
      cds.FieldByName('produtoID').AsInteger    :=Qry.FieldByName('produtoID').AsInteger;
      cds.FieldByName('nomeProduto').AsString   :=Qry.FieldByName('nomeProduto').AsString;
      cds.FieldByName('valorUnitario').AsFloat  :=Qry.FieldByName('valorUnitario').AsFloat;
      cds.FieldByName('quantidade').AsFloat     :=Qry.FieldByName('quantidade').AsFloat;
      cds.FieldByName('totalProduto').AsFloat   :=Qry.FieldByName('totalProduto').AsFloat;
      cds.Post;
      Qry.Next;
    end;
      cds.First;
   Except
     on e: Exception do
     begin
       ShowMessage('Erro. Classe de Erro: ' +
       e.ClassName + 'Mensagem de Erro; ' +
       e.Message);
       Result:=false;
     end;
   End;
  finally
    Qry.Free;
  end;
end;

Procedure TVenda.RetornarEstoque(sCodigo:String; Acao:TAcaoExcluirEstoque);
var Qry:TZQuery;
    oControleEstoque:TControleEstoque;
begin
  Qry:=TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add(' SELECT produtoID, quantidade '+
              '   FROM ItensVenda            '+
              '  WHERE vendaID=:vendaID      ');

  if Acao=aeeApagar then
     Qry.SQL.Add('  AND produtoID NOT IN ('+sCodigo+') ')
  else
     Qry.SQL.Add('  AND produtoID = '+sCodigo+' ');

  Qry.ParamByName('vendaID').AsInteger :=Self.F_vendaId;

  Try
    oControleEstoque:=TControleEstoque.Create(ConexaoDB);
    Qry.Open;
    Qry.First;
      while not Qry.Eof do
      begin
        oControleEstoque.ProdutoID  :=Qry.FieldByName('produtoID').AsInteger;
        oControleEstoque.quantidade :=Qry.FieldByName('quantidade').AsFloat;
        oControleEstoque.RetornarEstoque;
        Qry.Next;
      end;
  Finally
    if Assigned(oControleEstoque) then
       FreeAndNil(oControleEstoque);
  End;
end;

Procedure TVenda.BaixarEstoque(produtoID:Integer; quantidade:Double);
var oControleEstoque:TControleEstoque;
begin
  Try
    oControleEstoque:=TControleEstoque.Create(ConexaoDB);
    oControleEstoque.ProdutoID    :=produtoID;
    oControleEstoque.quantidade   :=quantidade;
    oControleEstoque.BaixarEstoque;
  Finally
    if Assigned(oControleEstoque) then
       FreeAndNil(oControleEstoque);
  End;
end;


end.

