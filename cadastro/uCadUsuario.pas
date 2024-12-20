unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uEnum, cCadUsuario, cAcaoAcesso;

type
    TfrmCadUsuario = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
    edtUsuarioID: TLabeledEdit;
    edtSenha: TLabeledEdit;
    edtConfirmarSenha: TLabeledEdit;
    btnVisualizar:TBitBtn;
    btnNaoVisualizar:TBitBtn;
    btnVisualizar2: TBitBtn;
    btnNaoVisualizar2: TBitBtn;
    cbbCargos: TComboBox;
    zqryQryListagemusuarioID: TIntegerField;
    wdstrngfldQryListagemnome: TWideStringField;
    wdstrngfldQryListagemsenha: TWideStringField;
    wdstrngfldQryListagemcargo: TWideStringField;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnNaoVisualizarClick(Sender: TObject);
    procedure btnVisualizar2Click(Sender: TObject);
    procedure btnNaoVisualizar2Click(Sender: TObject);

  private
    { Private declarations }

    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;

  public
    oUsuario:TUsuario;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses uPrincipal, uDTMConexao;

{ TfrmCadUsuario }

function TfrmCadUsuario.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oUsuario.Inserir

  else if EstadoDoCadastro=ecAlterar then
     Result:= oUsuario.Atualizar;

  TacaoAcesso.PreencherUsuariosVsAcoes(dtmPrincipal.ConexaoDB);
end;

function TfrmCadUsuario.Apagar: Boolean;
begin
   if oUsuario.Selecionar(QryListagem.FieldByName('usuarioID').AsInteger) then
  begin
     Result:=oUsuario.Apagar;
  end;
end;

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(QryListagem.FieldByName('usuarioID').AsInteger) then
  begin
     edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
     edtNome.Text     :=oUsuario.nome;
     edtSenha.Text    :=oUsuario.senha;
     cbbCargos.Text   :=oUsuario.cargo;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin
//  if oUsuario.UsuarioExiste(edtNome.Text) then
//  begin
//    MessageDlg('Esse Usu�rio ja existe!', mtInformation, [mbOK], 0);
//    edtNome.SetFocus;
//    Abort;
//  end;

  if edtSenha.Text <> edtConfirmarSenha.Text then
  begin
    MessageDlg('As senhas digitadas n�o s�o iguais! Por favor, corrija.', mtWarning, [mbOK], 0);
    edtSenha.SetFocus;
    Exit;
  end;

  if edtUsuarioId.Text <> EmptyStr then
    oUsuario.codigo := StrToInt(edtUsuarioId.Text)
  else
    oUsuario.codigo := 0;

  oUsuario.nome  := edtNome.Text;
  oUsuario.senha := edtSenha.Text;
  oUsuario.cargo := cbbCargos.Text;
  inherited;
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oUsuario) then
     FreeAndNil(oUsuario);
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

//Senha Normal

procedure TfrmCadUsuario.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  edtSenha.PasswordChar := #0;
  btnVisualizar.Visible :=False;
end;

procedure TfrmCadUsuario.btnNaoVisualizarClick(Sender: TObject);
begin
  inherited;
  edtSenha.PasswordChar:= '*';
  btnVisualizar.Visible:=True;
end;

//Confirmar senha

procedure TfrmCadUsuario.btnVisualizar2Click(Sender: TObject);
begin
  inherited;
  edtConfirmarSenha.PasswordChar := #0;
  btnVisualizar2.Visible :=False;
end;

procedure TfrmCadUsuario.btnNaoVisualizar2Click(Sender: TObject);
begin
  inherited;
  edtConfirmarSenha.PasswordChar := '*';
  btnVisualizar2.Visible:=True;
end;

end.


