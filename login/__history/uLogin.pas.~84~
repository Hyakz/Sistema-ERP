unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Enter, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnlPrincipal: TPanel;
    lbl1: TLabel;
    btn1: TSpeedButton;
    pnl2: TPanel;
    lbl3: TLabel;
    edtUsuario: TEdit;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl4: TLabel;
    edtSenha: TEdit;
    pnl5: TPanel;
    pnl6: TPanel;
    btnAcessar: TSpeedButton;
    pnlImage: TPanel;
    imgVisualizar: TImage;
    imgNaoVisualizar: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnAcessarMouseEnter(Sender: TObject);
    procedure btnAcessarMouseLeave(Sender: TObject);
    procedure edtSenhaClick(Sender: TObject);
    procedure edtUsuarioClick(Sender: TObject);
    procedure imgVisualizarClick(Sender: TObject);
    procedure imgNaoVisualizarClick(Sender: TObject);

  private
    { Private declarations }
    bFechar:Boolean;
    procedure FecharAplicacao;
    procedure FecharFormulario;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses cCadUsuario, uPrincipal, uDTMConexao;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  FecharAplicacao;
end;

procedure TfrmLogin.edtSenhaClick(Sender: TObject);
begin
  pnlImage.Color := $00FFF3E8;
end;

procedure TfrmLogin.edtUsuarioClick(Sender: TObject);
begin
  pnlImage.Color := clWhite;
end;

procedure TfrmLogin.btn1Click(Sender: TObject);
begin
  FecharAplicacao;
end;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  Try
    oUsuario:=TUsuario.Create(dtmPrincipal.ConexaoDB);
    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then
    begin
       oUsuarioLogado.codigo := oUsuario.codigo;
       oUsuarioLogado.nome   := oUsuario.nome;
       oUsuarioLogado.senha  := oUsuario.senha;

       FecharFormulario;
    end

    else
    begin
      MessageDlg('Usuário Inválido',mtInformation,[mbok],0);
      edtUsuario.SetFocus;
    end;

  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;
end;

procedure TfrmLogin.btnAcessarMouseEnter(Sender: TObject);
begin
  btnAcessar.Font.Color := clBlack;
end;

procedure TfrmLogin.btnAcessarMouseLeave(Sender: TObject);
begin
  btnAcessar.Font.Color := clWhite;
end;

procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := true;
  Application.Terminate;
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := true;
  Close;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  bFechar:=false;
end;

procedure TfrmLogin.imgVisualizarClick(Sender: TObject);
begin
  edtSenha.PasswordChar    := #0;
  imgVisualizar.Visible    := False;
  imgNaoVisualizar.Visible := True;
end;

procedure TfrmLogin.imgNaoVisualizarClick(Sender: TObject);
begin
  edtSenha.PasswordChar    := '*';
  imgNaoVisualizar.Visible := False;
  imgVisualizar.Visible    := True;
end;



end.
