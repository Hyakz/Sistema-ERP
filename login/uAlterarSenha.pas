unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAlterarSenha = class(TForm)
    pnlPrincipal: TPanel;
    btn1: TSpeedButton;
    pnl2: TPanel;
    lbl3: TLabel;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl4: TLabel;
    pnl5: TPanel;
    pnl6: TPanel;
    btnAlterar: TSpeedButton;
    edtSenhaAtual: TEdit;
    edtSenhaNova: TEdit;
    pnl7: TPanel;
    lbl5: TLabel;
    pnl1: TPanel;
    edtRepetirNovaSenha: TEdit;
    lblUsuarioLogado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);

  private
    { Private declarations }
    procedure LimparEdits;
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

{$R *.dfm}

uses uPrincipal, cCadUsuario, uDTMConexao;

procedure TfrmAlterarSenha.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
Var oUsuario:TUsuario;
begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha) then
  begin
    if (edtSenhaNova.Text=edtRepetirNovaSenha.Text)then
    begin
      try
        oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
        oUsuario.codigo := oUsuarioLogado.codigo;
        oUsuario.senha  := edtSenhaNova.Text;
        oUsuario.AlterarSenha;
        oUsuarioLogado.senha := edtSenhaNova.Text;
        MessageDlg('Senha Alterada',MtInformation,[mbok],0);
        LimparEdits;
      finally
        FreeAndNil(oUsuario);
      end;
    end

    else
    begin
      MessageDlg('Senhas digitadas n�o coincidem,',mtinformation,[mbok],0);
      edtSenhaNova.SetFocus;
    end;
  end

  else
  begin
    MessageDlg('Senha Atual est� inv�lida',mtinformation,[mbok],0);
  end;
end;

procedure TfrmAlterarSenha.LimparEdits;
begin
  edtSenhaAtual.Clear;
  edtSenhaNova.Clear;
  edtRepetirNovaSenha.Clear;
  lblUsuarioLogado.Caption:=oUsuarioLogado.nome;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
  LimparEdits;
end;

end.
