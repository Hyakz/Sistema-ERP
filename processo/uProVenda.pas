unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uDTMConexao, uDtmVenda,
  RxCurrEdit, RxToolEdit, uEnum, cProVenda;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    zqryQryListagemvendaID: TIntegerField;
    wdstrngfldQryListagemnome: TWideStringField;
    dtmfldQryListagemdataVenda: TDateTimeField;
    fltfldQryListagemtotalVenda: TFloatField;
    edtVendaID: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    edt2: TLabel;
    dtdtDataVenda: TDateEdit;
    edt3: TLabel;
    pnl1: TPanel;
    pnl4: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edtValorTotal: TCurrencyEdit;
    edt4: TLabel;
    dbgrdItensVenda: TDBGrid;
    lkpProduto: TDBLookupComboBox;
    edt5: TLabel;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdicionarItem: TBitBtn;
    btnApagarItem: TBitBtn;
    edt6: TLabel;
    edt7: TLabel;
    edt8: TLabel;
    zqryQryListagemclienteID: TIntegerField;
    btnCaixaPDV: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdItensVendaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure lkpProdutoMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
          var MouseActivate: TMouseActivate);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure dbgrdItensVendaDblClick(Sender: TObject);
    procedure dbgrdItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCaixaPDVClick(Sender: TObject);

  private
    { Private declarations }

    dtmVenda: TdtmVenda;
    oVenda: TVenda;
    function  Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    function  Apagar: Boolean; override;
    function  TotalizarProduto(valorUnitario, quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function  TotalizarVenda: Double;

  public

  end;

var
  frmProVenda: TfrmProVenda;

implementation

uses
  uRelProVenda, uCaixaPDV;

{$R *.dfm}

function TfrmProVenda.Apagar: Boolean;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaID').AsInteger, dtmVenda.cdsItensVenda) then
  begin
    Result := oVenda.Apagar;
  end;
end;

function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if Trim(edtVendaID.Text) <> EmptyStr then
    oVenda.vendaID := StrToInt(edtVendaID.Text)
  else
    oVenda.VendaID := 0;

  oVenda.clienteID := lkpCliente.KeyValue;
  oVenda.dataVenda := dtdtDataVenda.Date;
  oVenda.totalVenda:= edtValorTotal.Value;

  if (EstadoDoCadastro = ecInserir) then
      oVenda.vendaID := oVenda.Inserir(dtmVenda.cdsItensVenda)
  else if (EstadoDoCadastro=ecAlterar) then
           oVenda.Atualizar(dtmVenda.cdsItensVenda);

   frmRelProVenda:=TfrmRelProVenda.Create(Self);
   frmRelProVenda.QryVendas.Close;
   frmRelProVenda.QryVendas.ParamByName('vendaID').AsInteger:=oVenda.vendaID;
   frmRelProVenda.QryVendas.Open;

   frmRelProVenda.QryItensVenda.Close;
   frmRelProVenda.QryItensVenda.ParamByName('vendaID').AsInteger:=oVenda.vendaID;
   frmRelProVenda.QryItensVenda.Open;

   frmRelProVenda.Relatorio.PreviewModal;
   frmRelProVenda.Release;

   Result:=True;
end;

procedure TfrmProVenda.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iColuna : Integer;
begin
  for iColuna := 0 to grdListagem.Columns.Count -1 do
  begin
    grdListagem.Columns[iColuna].Title.Color      := $00606060;
    grdListagem.Columns[iColuna].Title.Font.Color := clWhite;
    grdListagem.Columns[iColuna].Title.Alignment  := taCenter;
  end;

  if not (gdSelected in State) then
  begin
    if Odd(grdListagem.DataSource.DataSet.RecNo) then
       grdListagem.Canvas.Brush.Color := clWhite
    else
      grdListagem.Canvas.Brush.Color := $00EBEBEB;

    grdListagem.Canvas.FillRect(rect);
    grdListagem.DefaultDrawDataCell(Rect, Column.Field, State);
    grdListagem.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue <> Unassigned then
  begin
    edtValorUnitario.Value := dtmVenda.QryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value := 1;

    edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

procedure TfrmProVenda.lkpProdutoMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y,
          HitTest: Integer; var MouseActivate: TMouseActivate);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaID').AsInteger, dtmVenda.cdsItensVenda) then
  begin
    edtVendaID.Text         := IntToStr(oVenda.vendaID);
    lkpCliente.KeyValue     := oVenda.clienteID;
    dtdtDataVenda.Date      := oVenda.dataVenda;
    edtValorTotal.Value     := oVenda.totalVenda;
  end

  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmProVenda.btnApagarItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue = Unassigned then
  begin
    MessageDlg('Selecione o produto a ser exclu�do', mtInformation, [mbOK], 0);
    dbgrdItensVenda.SetFocus;
    Abort;
  end;

  if dtmVenda.cdsItensVenda.Locate('produtoID', lkpProduto.KeyValue, []) then
  begin
    dtmVenda.cdsItensVenda.Delete;
    edtValorTotal.Value := TotalizarVenda;
    LimparComponenteItem;
  end;
end;

procedure TfrmProVenda.btnCaixaPDVClick(Sender: TObject);
var
  NomeCliente: string;
  ValorTotal: Currency;
begin
  NomeCliente := QryListagem.FieldByName('nome').AsString;
  ValorTotal  := QryListagem.FieldByName('totalVenda').AsCurrency;

  if not Assigned(frmCaixaPDV) then
    frmCaixaPDV := TfrmCaixaPDV.Create(Self);

  frmCaixaPDV.CarregarDadosVenda(NomeCliente, ValorTotal);
  frmCaixaPDV.ShowModal;
end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtVendaID.Text := '';
  lkpCliente.KeyValue := Unassigned;
  dtdtDataVenda.Clear;
  edtValorTotal.Value := 0;
  LimparCds;
end;

procedure TfrmProVenda.btnFecharClick(Sender: TObject);
begin
  inherited;
  if Assigned(dtmVenda) then
     FreeAndNil(dtmVenda);

  if Assigned(oVenda) then
     FreeAndNil(oVenda);

     QryListagem.Close;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnAdicionarItemClick(Sender: TObject);
begin
inherited;
  if lkpProduto.KeyValue = Unassigned then
  begin
    MessageDlg('Produto � um campo obrigat�rio!', mtInformation, [mbOK], 0);
    lkpProduto.SetFocus;
    Abort;
  end;

  if Trim(edtValorUnitario.Text) = '' then
  begin
    MessageDlg('Informe um valor unit�rio v�lido.', mtInformation, [mbOK], 0);
    edtValorUnitario.SetFocus;
    Abort;
  end;

  if edtValorUnitario.Value <= 0 then
  begin
    MessageDlg('Valor unit�rio n�o pode ser ZERO!', mtInformation, [mbOK], 0);
    edtValorUnitario.SetFocus;
    Abort;
  end;

  if edtQuantidade.Value <= 0 then
  begin
    MessageDlg('Quantidade n�o pode ser ZERO!', mtInformation, [mbOK], 0);
    edtQuantidade.SetFocus;
    Abort;
  end;

  if dtmVenda.cdsItensVenda.Locate('produtoID', lkpProduto.KeyValue, []) then
  begin
    MessageDlg('Esse Produto j� foi Selecionado.', mtInformation, [mbOK], 0);
    lkpProduto.SetFocus;
    Abort;
  end;

  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  dtmVenda.cdsItensVenda.Append;
  dtmVenda.cdsItensVenda.FieldByName('produtoID').AsInteger := lkpProduto.KeyValue;
  dtmVenda.cdsItensVenda.FieldByName('nomeProduto').AsString := dtmVenda.QryProdutos.FieldByName('nome').AsString;
  dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat := edtQuantidade.Value;
  dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat := edtValorUnitario.Value;
  dtmVenda.cdsItensVenda.FieldByName('totalProduto').AsFloat := edtTotalProduto.Value;
  dtmVenda.cdsItensVenda.Post;

  edtValorTotal.Value := TotalizarVenda;
  LimparComponenteItem;

  lkpProduto.SetFocus;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue    := Unassigned;
  edtQuantidade.Value    := 0;
  edtValorUnitario.Value := 0;
  edtTotalProduto.Value  := 0;
end;

function TfrmProVenda.TotalizarProduto(valorUnitario, quantidade: Double): Double;
begin
  Result := valorUnitario * quantidade;
end;

procedure TfrmProVenda.LimparCds;
begin
  dtmVenda.cdsItensVenda.First;

  while not dtmVenda.cdsItensVenda.Eof do
   dtmVenda.cdsItensVenda.Delete;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  dtdtDataVenda.Date := Date;
  lkpCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVenda.dbgrdItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.dbgrdItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
          State: TGridDrawState);
var
  iColuna : Integer;
begin
  inherited;
  for iColuna := 0 to dbgrdItensVenda.Columns.Count -1 do
  begin
    dbgrdItensVenda.Columns[iColuna].Title.Color      := $00606060;
    dbgrdItensVenda.Columns[iColuna].Title.Font.Color := clWhite;
    dbgrdItensVenda.Columns[iColuna].Title.Alignment  := taCenter;
  end;

  if not (gdSelected in State) then
  begin
    if Odd(dbgrdItensVenda.DataSource.DataSet.RecNo) then
       dbgrdItensVenda.Canvas.Brush.Color := $00EBEBEB
    else
      dbgrdItensVenda.Canvas.Brush.Color:=clWhite;

    dbgrdItensVenda.Canvas.FillRect(rect);
    dbgrdItensVenda.DefaultDrawDataCell(Rect, Column.Field, State);
    dbgrdItensVenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmProVenda.dbgrdItensVendaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmProVenda.edtQuantidadeChange(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
     FreeAndNil(dtmVenda);

  if Assigned(oVenda) then
     FreeAndNil(oVenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda    := TdtmVenda.Create(Self);
  oVenda      := TVenda.Create(dtmPrincipal.ConexaoDB);
  QryListagem.Open;
  IndiceAtual := 'nome';
  edtValorTotal.ReadOnly:=True;
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue     := dtmVenda.cdsItensVenda.FieldByName('produtoID').AsInteger;
  edtQuantidade.Value     := dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value  := dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value   := dtmVenda.cdsItensVenda.FieldByName('totalProduto').AsFloat;
end;

function TfrmProVenda.TotalizarVenda: Double;
begin
  Result := 0;
  dtmVenda.cdsItensVenda.First;

  while not dtmVenda.cdsItensVenda.Eof do
  begin
    Result := Result + dtmVenda.cdsItensVenda.FieldByName('totalProduto').AsFloat;
    dtmVenda.cdsItensVenda.Next;
  end;
end;


end.


