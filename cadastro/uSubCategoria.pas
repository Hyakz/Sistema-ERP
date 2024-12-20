unit uSubCategoria;

interface

uses
  cSubCategoria,
  uConCategoria,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uTelaHeranca,
  Data.DB,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.ExtCtrls,
  RxToolEdit,
  RxCurrEdit,
  uEnum,
  uDTMConexao,
  Vcl.ComCtrls,
  cFuncao,
  uCadCategoria,
  cCadCategoria,
  cUsuarioLogado,
  cCadProduto,
  Vcl.Menus;

type
  TfrmSubCategoria = class(TfrmTelaHeranca)
    edtDescricao: TLabeledEdit;
    edtCategoriaId: TLabeledEdit;
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TZQuery;
    zqryQryListagemsubCategoriaID: TIntegerField;
    wdstrngfldQryListagemcategoria: TWideStringField;
    wdstrngfldQryListagemdescricao: TWideStringField;
    zqryQryListagemCategoriaID: TIntegerField;
    zqryQryCategoriacategoriaID: TIntegerField;
    wdstrngfldQryCategoriadescricao: TWideStringField;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCategoriaClick(Sender: TObject);
    procedure btnPesquisarCategoriaClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);

  private
    oSubCategoria:TSubCategoria;
    function  Apagar:Boolean; override;
    function  gravar(statusdocadastro:TEstadodoCadastro):Boolean; override;
    procedure LoadGridFromFile(const FileName: string);
    procedure SalvarGridFile(const FileName: string);

  public
    { Public declarations }
  end;

var
  frmSubCategoria: TfrmSubCategoria;
  frmTelaHeranca: TfrmTelaHeranca;

implementation

uses
  uPrincipal;

{$R *.dfm}

{ TfrmCadProduto }

function TfrmSubCategoria.Apagar: Boolean;
begin
  if oSubCategoria.Selecionar(QryListagem.FieldByName('subCategoriaID').AsInteger) then
  begin
    result:=oSubCategoria.Apagar;
  end;
end;

procedure TfrmSubCategoria.btnIncluirCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
  QryCategoria.Refresh;
end;

procedure TfrmSubCategoria.btnAlterarClick(Sender: TObject);
begin
  if oSubCategoria.Selecionar(QryListagem.FieldByName('subCategoriaID').AsInteger ) then
  begin
    edtCategoriaId.Text   := IntToStr(oSubCategoria.codigo);
    edtDescricao.text     := oSubCategoria.nome;
    lkpCategoria.KeyValue := oSubCategoria.codigoCategoria;
  end

  else
  begin
    btnCancelar.Click;
    abort;
  end;
  inherited;
end;

procedure TfrmSubCategoria.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmSubCategoria.btnPesquisarCategoriaClick(Sender: TObject);
begin
  inherited;
  frmConCategoria := TfrmConCategoria.Create(Self);

  if lkpCategoria.KeyValue <> Null then
    frmConCategoria.aIniciarPesquisaId := lkpCategoria.KeyValue;

  frmConCategoria.ShowModal;

  if frmConCategoria.aRetornarIdSelecionado <> Unassigned then
    lkpCategoria.KeyValue := frmConCategoria.aRetornarIdSelecionado;

  frmConCategoria.Release;
end;

procedure TfrmSubCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCategoria.Close;
  oSubCategoria.Free;

  SalvarGridFile('C:\App\Grids\GridConfigSubCategorias.conf');
end;

procedure TfrmSubCategoria.FormCreate(Sender: TObject);
begin
  inherited;

  oSubCategoria := TSubCategoria.create(dtmPrincipal.ConexaoDB);

  indiceAtual:='subCategoriaID';

  LoadGridFromFile('C:\App\Grids\GridConfigSubCategorias.conf');
end;

procedure TfrmSubCategoria.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;
end;

function TfrmSubCategoria.gravar(statusdocadastro: TEstadodoCadastro): Boolean;
begin
  if edtCategoriaId.Text <> EmptyStr then
    oSubCategoria.codigo:=StrToInt(edtDescricao.Text)
  else
    oSubCategoria.codigo:=0;

  oSubCategoria.descricao         := lkpCategoria.Text;
  oSubCategoria.nome              := edtDescricao.text;
  oSubCategoria.codigoCategoria   := lkpCategoria.KeyValue;


   if  (statusdoCadastro=ecInserir) then
        result:=oSubCategoria.Gravar

   else if(statusdoCadastro=ecAlterar) then
        result:=oSubCategoria.Atualizar;
end;

procedure TfrmSubCategoria.grdListagemDblClick(Sender: TObject);
begin
  inherited;
  btnAlterar.CLick;
end;

//--------------------------SALVAR--GRIDS--------------------------------

procedure TfrmSubCategoria.SalvarGridFile(const FileName: string);
begin
  ForceDirectories(ExtractFilePath(FileName));
  grdListagem.Columns.SaveToFile(FileName);
end;

procedure TfrmSubCategoria.LoadGridFromFile(const FileName: string);
begin
  if FileExists(FileName) then
  begin
    grdListagem.Columns.LoadFromFile(FileName);
  end
  else
    SalvarGridFile('C:\App\Grids\GridConfigSubCategorias.conf');
end;


end.
