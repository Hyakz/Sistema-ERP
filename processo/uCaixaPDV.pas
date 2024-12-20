unit uCaixaPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, System.DateUtils,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Datasnap.DBClient, System.UITypes;

type
  TfrmCaixaPDV = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    img1: TImage;
    pnl5: TPanel;
    lbl2: TLabel;
    pnl7: TPanel;
    lbl5: TLabel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    lbl6: TLabel;
    edtCodigoBarras: TEdit;
    pnl14: TPanel;
    imgProdutos: TImage;
    lbl7: TLabel;
    lblNome: TLabel;
    lbl9: TLabel;
    lblQuantidade: TLabel;
    lblValorUnitario: TLabel;
    lbl12: TLabel;
    lblSubTotal: TLabel;
    lbl16: TLabel;
    lblTotal: TLabel;
    DBGridCaixa: TDBGrid;
    lbl20: TLabel;
    tmr1: TTimer;
    actlstAtalhos: TActionList;
    actSair: TAction;
    lbl21: TLabel;
    QryCaixa: TZQuery;
    dsCaixa: TDataSource;
    lbl22: TLabel;
    actQuantidade: TAction;
    actExcluir: TAction;
    lbl23: TLabel;
    lblNomeCliente: TLabel;
    zqryQryCaixaprodutoID: TIntegerField;
    fltfldQryCaixaquantidade: TFloatField;
    fltfldQryCaixavalorUnitario: TFloatField;
    fltfldQryCaixatotalProduto: TFloatField;
    wdstrngfldQryCaixaprodutoNome: TWideStringField;
    QryCaixafoto: TBlobField;
    QryUpdate: TZQuery;
    dsUpdate: TDataSource;
    actExibirProdutos: TAction;
    actFinalizarVenda: TAction;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    zqryVendasprodutoID: TIntegerField;
    fltfldVendasquantidade: TFloatField;
    fltfldVendasvalorUnitario: TFloatField;
    fltfldVendastotalProduto: TFloatField;
    wdstrngfldVendasprodutoNome: TWideStringField;
    cdsItensfoto: TBlobField;
    img2: TImage;
    lbl24: TLabel;
    lbl25: TLabel;
    actInserirProdutos: TAction;
    lbl4: TLabel;
    fltfldItenstotalVenda: TFloatField;
    procedure tmr1Timer(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridCaixaCellClick(Column: TColumn);
    procedure actQuantidadeExecute(Sender: TObject);
    procedure DBGridCaixaMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
          var Handled: Boolean);
    procedure actExcluirExecute(Sender: TObject);
    procedure actExibirProdutosExecute(Sender: TObject);
    procedure edtCodigoBarrasExit(Sender: TObject);
    procedure actFinalizarVendaExecute(Sender: TObject);
    procedure actInserirProdutosExecute(Sender: TObject);

  private
    FNomeCliente: string;
    OriginalQuery: string;


    procedure AtualizarInformacoesProduto;
    procedure AtualizarQuantidadeNoBanco(const NovoValor: String);
    procedure BuscarProduto;
    procedure DefinirImagemProduto(const CaminhoImagem: string);

  public
     FValorTotal: Currency;
     procedure CalcularTotalGeral;
     procedure CarregarDadosVenda(NomeCliente: string; ValorTotal: Currency);
     function TotalizarProduto(valorUnitario, quantidade: Double): Double;
  end;

var
  frmCaixaPDV: TfrmCaixaPDV;

implementation

uses
  uDtmVenda, uDTMConexao, uTextBox, uProVenda, cProVenda, uCadProduto, uFinalizarVenda;

{$R *.dfm}

// Form

procedure TfrmCaixaPDV.FormCreate(Sender: TObject);
begin
  cdsItens.CreateDataSet;
  OriginalQuery := 'SELECT ' +
                   '  iv.produtoID, ' +
                   '  iv.quantidade, ' +
                   '  iv.valorUnitario, ' +
                   '  iv.totalProduto, ' +
                   '  p.nome AS produtoNome, ' +
                   '  p.foto ' +
                   'FROM ' +
                   '  itensVenda iv ' +
                   'JOIN ' +
                   '  produtos p ON iv.produtoID = p.produtoID';

  edtCodigoBarras.Text := '';
  QryCaixa.SQL.Text := OriginalQuery;
  QryCaixa.Open;

  lbl4.Caption := DateToStr(Date);
  AtualizarInformacoesProduto;
  CalcularTotalGeral;
end;

procedure TfrmCaixaPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCaixa.Close;
end;

//

procedure TfrmCaixaPDV.CarregarDadosVenda(NomeCliente: string; ValorTotal: Currency);
begin
  FNomeCliente := NomeCliente;
  FValorTotal := ValorTotal;

  lblNomeCliente.Caption := FNomeCliente;
  lblTotal.Caption := FormatFloat('R$ ###,##0.00', FValorTotal);
end;

// ATALHOS - ActionList

procedure TfrmCaixaPDV.actExcluirExecute(Sender: TObject);
begin
  if not cdsItens.IsEmpty then
  begin
    if MessageDlg('Voc� realmente deseja excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      cdsItens.Delete;

      if cdsItens.IsEmpty then
        imgProdutos.Picture := nil;

      AtualizarInformacoesProduto;
      CalcularTotalGeral;


    end;
  end
  else
    ShowMessage('Nenhum item selecionado.');
end;

procedure TfrmCaixaPDV.actExibirProdutosExecute(Sender: TObject);
begin
  if not Assigned(frmCadProduto) then
    frmCadProduto := TfrmCadProduto.Create(nil);

  frmCadProduto.pnlRodape.Visible := False;
  frmCadProduto.grdListagem.OnDblClick := nil;

  if Assigned(frmCadProduto.pgcPrincipal) then
  begin
    if Assigned(frmCadProduto.tabManutencao) then
    begin
      frmCadProduto.tabManutencao.TabVisible := False;
      frmCadProduto.btnFechar1.Visible := True;
    end;
  end;

  frmCadProduto.ShowModal;
end;

procedure TfrmCaixaPDV.actFinalizarVendaExecute(Sender: TObject);
begin
  CalcularTotalGeral;

  if not Assigned(frmFinalizarVenda) then
     frmFinalizarVenda := TfrmFinalizarVenda.Create(nil);

  frmFinalizarVenda.AtualizarTotal(cdsItens.FieldByName('totalVenda').AsFloat);

  frmFinalizarVenda.ShowModal;
end;

procedure TfrmCaixaPDV.actQuantidadeExecute(Sender: TObject);
var
  NovoValor: String;
  RegistroID: Integer;
begin
  if not Assigned(frmTextBox) then
    frmTextBox := TfrmTextBox.Create(Self);

  try
    NovoValor := lblQuantidade.Caption;
    RegistroID := QryCaixa.FieldByName('produtoID').AsInteger;

    if frmTextBox.ShowModalValue(NovoValor) then
    begin
      lblQuantidade.Caption := frmTextBox.Value;
      AtualizarQuantidadeNoBanco(frmTextBox.Value);

      QryCaixa.Close;
      QryCaixa.Open;

      QryCaixa.Locate('produtoID', RegistroID, []);

      CalcularTotalGeral;
      AtualizarInformacoesProduto;
    end;
  finally
    frmTextBox.Free;
    frmTextBox := nil;
  end;
end;

procedure TfrmCaixaPDV.actInserirProdutosExecute(Sender: TObject);
begin
  edtCodigoBarras.SetFocus;
end;

procedure TfrmCaixaPDV.actSairExecute(Sender: TObject);
begin
  Close;
end;

//

procedure TfrmCaixaPDV.AtualizarQuantidadeNoBanco(const NovoValor: String);
var
  NovoQuantidade: Double;
  NovoTotalProduto: Double;
begin
  NovoQuantidade := StrToFloatDef(NovoValor, 0);
  NovoTotalProduto := TotalizarProduto(cdsItens.FieldByName('valorUnitario').AsFloat, NovoQuantidade);

  if not cdsItens.IsEmpty then
  begin
    cdsItens.Edit;
    cdsItens.FieldByName('quantidade').AsFloat := NovoQuantidade;
    cdsItens.FieldByName('totalProduto').AsFloat := NovoTotalProduto;
    cdsItens.Post;

//    with QryUpdate do
//    begin
//      ParamByName('NovaQuantidade').AsFloat   := NovoQuantidade;
//      ParamByName('NovoTotalProduto').AsFloat := NovoTotalProduto;
//      ParamByName('ProdutoID').AsInteger      := cdsItens.FieldByName('produtoID').AsInteger;
//      ExecSQL;
//    end;

    cdsItens.Close;
    cdsItens.Open;
    CalcularTotalGeral;
  end;
end;

// Buscar e Inserir produtos

procedure TfrmCaixaPDV.BuscarProduto;
var
  CodigoBarras: Integer;
  ProdutoEncontrado: Boolean;
  fotoStream: TMemoryStream;
begin
  if edtCodigoBarras.Text = '' then
  begin
    QryCaixa.Close;
    QryCaixa.SQL.Text        := OriginalQuery;
    QryCaixa.Open;
    Exit;
  end;

  if not TryStrToInt(edtCodigoBarras.Text, CodigoBarras) then
  begin
    ShowMessage('C�digo de barras inv�lido.');
    Exit;
  end;

  QryCaixa.Close;
  QryCaixa.SQL.Text :=
    'SELECT                                                    ' +
    '  p.produtoID,                                            ' +
    '  COALESCE(iv.quantidade, 1) AS quantidade,               ' +
    '  p.valor AS valorUnitario,                               ' +
    '  (COALESCE(iv.quantidade, 1) * p.valor) AS totalProduto, ' +
    '  p.nome AS produtoNome,                                  ' +
    '  p.foto                                                  ' +
    'FROM                                                      ' +
    '  produtos p                                              ' +
    'LEFT JOIN                                                 ' +
    '  itensVenda iv ON iv.produtoID = p.produtoID             ' +
    'WHERE                                                     ' +
    '  p.produtoID = :produtoID                                ' ;

  QryCaixa.ParamByName('produtoID').AsInteger := CodigoBarras;
  QryCaixa.Open;

  if QryCaixa.IsEmpty then
  begin
    ShowMessage('Produto n�o encontrado.');
    lblNome.Caption          := '';
    lblQuantidade.Caption    := '0';
    lblValorUnitario.Caption := 'R$ 0,00';
    lblSubTotal.Caption      := 'R$ 0,00';
    Exit;
  end;

  ProdutoEncontrado := False;
  cdsItens.DisableControls;

  try
    cdsItens.First;
    while not cdsItens.Eof do
    begin
      if cdsItens.FieldByName('produtoID').AsInteger = CodigoBarras then
      begin
        ProdutoEncontrado := True;
        cdsItens.Edit;
        cdsItens.FieldByName('quantidade').AsFloat := cdsItens.FieldByName('quantidade').AsFloaT + 1;
        cdsItens.FieldByName('totalProduto').AsFloat := cdsItens.FieldByName('quantidade').AsFloat * cdsItens.FieldByName('valorUnitario').AsFloat;
      end;
      cdsItens.Next;
    end;

    if not ProdutoEncontrado then
    begin
      cdsItens.Append;
      cdsItens.FieldByName('produtoID').AsInteger   := CodigoBarras;
      cdsItens.FieldByName('produtoNome').AsString  := QryCaixa.FieldByName('produtoNome').AsString;
      cdsItens.FieldByName('quantidade').AsFloat    := QryCaixa.FieldByName('quantidade').AsFloat;
      cdsItens.FieldByName('valorUnitario').AsFloat := QryCaixa.FieldByName('valorUnitario').AsFloat;
      cdsItens.FieldByName('totalProduto').AsFloat  := QryCaixa.FieldByName('totalProduto').AsFloat;

      fotoStream := TMemoryStream.Create;
      try
        (QryCaixa.FieldByName('foto') as TBlobField).SaveToStream(fotoStream);
        fotoStream.Position := 0;
        (cdsItens.FieldByName('foto') as TBlobField).LoadFromStream(fotoStream);
      finally
        fotoStream.Free;
      end;

      cdsItens.Post;
    end;

    CalcularTotalGeral;
  finally
    cdsItens.EnableControls;
  end;

  AtualizarInformacoesProduto;
  edtCodigoBarras.SetFocus;
end;

procedure TfrmCaixaPDV.edtCodigoBarrasExit(Sender: TObject);
begin
  BuscarProduto;
  edtCodigoBarras.Clear;
end;

//

procedure TfrmCaixaPDV.DBGridCaixaCellClick(Column: TColumn);
begin
  AtualizarInformacoesProduto;
end;

procedure TfrmCaixaPDV.DBGridCaixaMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if WheelDelta > 0 then
    cdsItens.Prior
  else
    cdsItens.Next;

  DBGridCaixaCellClick(DBGridCaixa.Columns[0]);
  Handled := True;
end;

//

procedure TfrmCaixaPDV.CalcularTotalGeral;
var
  totalVenda: Double;
begin
  totalVenda := 0;

  cdsItens.First;
  while not cdsItens.Eof do
  begin
    totalVenda := totalVenda + cdsItens.FieldByName('totalProduto').AsFloat;
    cdsItens.Next;
  end;

  if cdsItens.Active then
  begin
    cdsItens.DisableControls;
    try
      cdsItens.First;
      while not cdsItens.Eof do
      begin
        cdsItens.Edit;
        cdsItens.FieldByName('totalVenda').AsFloat := totalVenda;
        cdsItens.Post;
        cdsItens.Next;
      end;
    finally
      cdsItens.EnableControls;
    end;
  end;

  lblTotal.Caption := FormatFloat('R$ ###,##0.00', totalVenda);
end;

//

procedure TfrmCaixaPDV.AtualizarInformacoesProduto;
var
  quantidade: Integer;
  valorUnitario, totalProduto: Double;
  fotoStream: TMemoryStream;
  blobField: TBlobField;
begin
  if not cdsItens.IsEmpty then
  begin
    edtCodigoBarras.Text     := cdsItens.FieldByName('produtoID').AsString;
    lblNome.Caption          := cdsItens.FieldByName('produtoNome').AsString;

    quantidade    := cdsItens.FieldByName('quantidade').AsInteger;
    valorUnitario := cdsItens.FieldByName('valorUnitario').AsFloat;

    totalProduto  := TotalizarProduto(valorUnitario, quantidade);

    lblQuantidade.Caption    := IntToStr(quantidade);
    lblValorUnitario.Caption := FormatFloat('R$ ###,##0.00', valorUnitario);
    lblSubTotal.Caption      := FormatFloat('R$ ###,##0.00', totalProduto);

    fotoStream := TMemoryStream.Create;
    try
      blobField := cdsItens.FieldByName('foto') as TBlobField;

      if not blobField.IsNull then
      begin
        blobField.SaveToStream(fotoStream);
        fotoStream.Position := 0;
        imgProdutos.Picture.LoadFromStream(fotoStream);
      end

      else
      begin
        imgProdutos.Picture := nil;
      end;
    finally
      fotoStream.Free;
    end;
  end;
end;

function TfrmCaixaPDV.TotalizarProduto(valorUnitario, quantidade: Double): Double;
begin
  Result := valorUnitario * quantidade;
end;

procedure TfrmCaixaPDV.DefinirImagemProduto(const CaminhoImagem: string);
begin
  if (CaminhoImagem = '') or not FileExists(CaminhoImagem) then
  begin
    imgProdutos.Picture.LoadFromFile('C:\Users\devmv\Desktop\Projeto Delphi\imagens geral\imagens produtos\sem imagem.jpg');
  end
  else
  begin
    imgProdutos.Picture.LoadFromFile(CaminhoImagem);
  end;
end;

// timer - hora/minutos/segundos

procedure TfrmCaixaPDV.tmr1Timer(Sender: TObject);
begin
  lbl2.Caption := TimeToStr(Time);
end;



end.
