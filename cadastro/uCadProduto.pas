unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, RxCurrEdit,
  cCadProduto, uEnum, uDTMConexao, uCadCategoria, cFuncao, uConCategoria, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, System.Actions, Vcl.ActnList;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    edtProdutoID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TZQuery;
    dsCategoria: TDataSource;
    zqryQryQryCategoriacategoriaID: TIntegerField;
    wdstrngfldCategoriadescricao: TWideStringField;
    edt1: TLabel;
    edt2: TLabel;
    btnIncluirCategoria: TSpeedButton;
    btnPesquisarCategoria: TSpeedButton;
    pmImagem: TPopupMenu;
    mniCARREGARIMAGEM1: TMenuItem;
    mniLIMPARIMAGEM1: TMenuItem;
    pnl1: TPanel;
    pnlProduto: TPanel;
    imgProduto: TImage;
    lbl1: TLabel;
    pnlProduto1: TPanel;
    imgImagem: TImage;
    lbl2: TLabel;
    lbl3: TLabel;
    lkpSubCategoria: TDBLookupComboBox;
    QrySubCategoria: TZQuery;
    dsSubCategoria: TDataSource;
    zqryQryListagemprodutoID: TIntegerField;
    wdstrngfldQryListagemnome: TWideStringField;
    wdstrngfldQryListagemdescricao: TWideStringField;
    fltfldQryListagemvalor: TFloatField;
    fltfldQryListagemquantidade: TFloatField;
    zqryQryListagemcategoriaID: TIntegerField;
    wdstrngfldQryListagemDescricaoCategoria: TWideStringField;
    wdstrngfldQryListagemSubCategoria: TWideStringField;
    QryListagemfoto: TBlobField;
    zqryQrySubCategoriasubCategoriaID: TIntegerField;
    zqryQrySubCategoriaCategoriaID: TIntegerField;
    wdstrngfldQrySubCategoriacategoria: TWideStringField;
    wdstrngfldQrySubCategoriadescricao: TWideStringField;
    actlst1: TActionList;
    actExibirProdutos: TAction;
    actQuantidade: TAction;
    actExcluir: TAction;
    actSair: TAction;
    btnFechar1: TBitBtn;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCategoriaClick(Sender: TObject);
    procedure btnPesquisarCategoriaClick(Sender: TObject);
    procedure mniLIMPARIMAGEM1Click(Sender: TObject);
    procedure mniCARREGARIMAGEM1Click(Sender: TObject);
    procedure lkpCategoriaClick(Sender: TObject);
    procedure grdListagemCellClick(Column: TColumn);
    procedure actSairExecute(Sender: TObject);
    procedure grdListagemMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);

  private
    { Private declarations }

    oProduto:Tproduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    procedure AtualizarSubCategorias;


  public


  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfrmCadProduto.actSairExecute(Sender: TObject);
begin
  Close;
end;

function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoID').AsInteger) then
  begin
      Result:=oProduto.Apagar;
  end;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoID.Text<>EmptyStr then
     oProduto.codigo:=StrToInt(edtProdutoID.Text)
  else
     oProduto.codigo:=0;

  oProduto.nome           := edtNome.Text;
  oProduto.descricao      := edtDescricao.Text;
  oProduto.categoriaID    := lkpCategoria.KeyValue;
  oProduto.valor          := edtValor.Value;
  oProduto.quantidade     := edtQuantidade.Value;
  oProduto.SubCategoriaID := lkpSubCategoria.KeyValue;

  if imgImagem.Picture.Bitmap.Empty then
     oProduto.Foto.Assign(nil)
  else
    oProduto.Foto.Assign(imgImagem.Picture);

  if (EstadoDoCadastro=ecInserir) then
      Result:=oProduto.Inserir

  else if (EstadoDoCadastro=ecAlterar) then
      Result:=oProduto.Atualizar;

  imgImagem.Free;
end;

procedure TfrmCadProduto.grdListagemCellClick(Column: TColumn);
var
  Stream: TMemoryStream;
begin
  inherited;
  imgProduto.Picture := nil;

  if not QryListagemfoto.IsNull then
  begin
    Stream := TMemoryStream.Create;
    try
      TBlobField(QryListagem.FieldByName('foto')).SaveToStream(Stream);
      Stream.Position := 0;
      imgProduto.Picture.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end;
end;

procedure TfrmCadProduto.grdListagemMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if WheelDelta > 0 then
    QryListagem.Prior
  else
    QryListagem.Next;

  grdListagemCellClick(grdListagem.Columns[0]);
  Handled := True;
end;

procedure TfrmCadProduto.lkpCategoriaClick(Sender: TObject);
begin
  AtualizarSubCategorias;
end;

procedure TfrmCadProduto.btnIncluirCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
  QryCategoria.Refresh;
end;

procedure TfrmCadProduto.btnPesquisarCategoriaClick(Sender: TObject);
begin
  inherited;
  try
    frmConCategoria := TfrmConCategoria.Create(Self);

    if not VarIsNull(lkpCategoria.KeyValue) then
       frmConCategoria.aIniciarPesquisaID := lkpCategoria.KeyValue;

    frmConCategoria.ShowModal;

    if not VarIsEmpty(frmConCategoria.aRetornarIdSelecionado) then
    begin
      if LowerCase(VarToStr(lkpCategoria.KeyValue)) <> LowerCase(VarToStr(frmConCategoria.aRetornarIdSelecionado)) then
        lkpCategoria.KeyValue := frmConCategoria.aRetornarIdSelecionado;
    end;

  finally
    frmConCategoria.Release;
  end;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoID').AsInteger) then
  begin
    edtProdutoID.Text             :=IntToStr(oProduto.codigo);
    edtNome.Text                  :=oProduto.nome;
    edtDescricao.Text             :=oProduto.descricao;
    lkpCategoria.KeyValue         :=oProduto.categoriaID;
    edtValor.Value                :=oProduto.valor;
    edtQuantidade.Value           :=oProduto.quantidade;
    lkpSubCategoria.KeyValue      :=oProduto.SubCategoriaID;

    imgImagem.Picture.Assign(oProduto.foto);
  end

  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  QrySubCategoria.Close;

  if Assigned(oProduto)then
     FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
   oProduto:=TProduto.Create(dtmPrincipal.ConexaoDB);
   IndiceAtual:='nome';

   lkpSubCategoria.ListSource := dsSubCategoria;
   lkpSubCategoria.ListField  := 'descricao';
   lkpSubCategoria.KeyField   := 'subCategoriaID';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  QryCategoria.Open;
  QrySubCategoria.Open;
end;

procedure TfrmCadProduto.AtualizarSubCategorias;
var
  categoriaID: Integer;
begin
  categoriaID := lkpCategoria.KeyValue;

  if categoriaID > 0 then
  begin
    QrySubCategoria.Close;
    QrySubCategoria.SQL.Text := 'SELECT subCategoriaID, categoria, descricao, CategoriaID FROM subCategorias WHERE CategoriaID = :CategoriaID';
    QrySubCategoria.ParamByName('CategoriaID').AsInteger := categoriaID;
    QrySubCategoria.Open;
  end;
end;

// ---------------------------------------------------- IMAGEM ----------------------------------------------------------------------

procedure TfrmCadProduto.mniCARREGARIMAGEM1Click(Sender: TObject);
begin
  inherited;
  TFuncao.CarregarImagem(imgImagem);
end;

procedure TfrmCadProduto.mniLIMPARIMAGEM1Click(Sender: TObject);
begin
  inherited;
  TFuncao.LimparImagem(imgImagem);
end;



end.
