unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, cAcaoAcesso, uEnum, uDTMConexao;

type
    TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    zqryQryListagemacaoAcessoID: TIntegerField;
    wdstrngfldQryListagemdescricao: TWideStringField;
    wdstrngfldQryListagemchave: TWideStringField;
    edtAcaoAcessoID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(estadoDoCadastro:TEstadoDoCadastro): Boolean; override;
    function Apagar:Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{ TfrmCadAcaoAcesso }

function TfrmCadAcaoAcesso.Apagar: Boolean;
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoID').AsInteger) then
  begin
      Result:=oAcaoAcesso.Apagar;
  end;
end;

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin
 if  oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoID').AsInteger) then
 begin
     edtAcaoAcessoID.Text   := oAcaoAcesso.codigo.ToString();
     edtDescricao.Text      := oAcaoAcesso.descricao;
     edtChave.Text          := oAcaoAcesso.chave;
 end

 else
 begin
   btnCancelar.Click;
   Abort;
 end;

   inherited;
end;

procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin
  if edtAcaoAcessoID.Text<>EmptyStr then
     oAcaoAcesso.codigo:=StrToInt(edtAcaoAcessoID.Text)
  else
     oAcaoAcesso.codigo:=0;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave     :=edtChave.Text;

  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then
  begin
    MessageDlg('Chave j� cadastrada!', mtInformation, [mbok],0);
    edtChave.SetFocus;
    abort;
  end;


  inherited;
end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoAcesso) then
     FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso:=TAcaoAcesso.Create(DtmPrincipal.ConexaoDB);
  IndiceAtual:='descricao';
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:=oAcaoAcesso.Inserir
  else
  if EstadoDoCadastro=ecAlterar then
     Result:=oAcaoAcesso.Atualizar;
end;

end.
