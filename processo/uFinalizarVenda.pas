unit uFinalizarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,
  System.Actions, Vcl.ActnList, Vcl.Buttons, uCaixaPDV, cProVenda, uDtmVenda, uDTMConexao;

type
  TfrmFinalizarVenda = class(TForm)
    pnlTop: TPanel;
    pnl4: TPanel;
    img1: TImage;
    pnl5: TPanel;
    pnl7: TPanel;
    pnl2: TPanel;
    pnlBottom: TPanel;
    pnlPrincipal: TPanel;
    pnl10: TPanel;
    pnlFormasPagamento: TPanel;
    lbl18: TLabel;
    pnl13: TPanel;
    grp1: TGroupBox;
    lbl6: TLabel;
    img2: TImage;
    lbl2: TLabel;
    lbl7: TLabel;
    lblNomeCliente: TLabel;
    tmr1: TTimer;
    DBGridCaixa: TDBGrid;
    pnl14: TPanel;
    actlstAtalhos: TActionList;
    actSair: TAction;
    lbl21: TLabel;
    grp2: TGroupBox;
    pnl3: TPanel;
    pnl6: TPanel;
    lbl8: TLabel;
    imgDinheiro: TImage;
    pnlDinheiro: TPanel;
    pnl8: TPanel;
    lbl3: TLabel;
    imgDebito: TImage;
    pnlDebito: TPanel;
    pnl9: TPanel;
    lbl5: TLabel;
    imgCredito: TImage;
    pnlCredito: TPanel;
    pnlPix: TPanel;
    imgPix: TImage;
    lbl9: TLabel;
    actFinalizar: TAction;
    lbl22: TLabel;
    pnl1: TPanel;
    edtTotal: TEdit;
    lbl1: TLabel;
    pnl11: TPanel;
    lbl4: TLabel;
    edtTroco: TEdit;
    pnl12: TPanel;
    lbl10: TLabel;
    edtValorRecebido: TEdit;
    procedure pnlDinheiroClick(Sender: TObject);
    procedure imgDinheiroClick(Sender: TObject);
    procedure pnlDebitoClick(Sender: TObject);
    procedure pnlCreditoClick(Sender: TObject);
    procedure pnlPixClick(Sender: TObject);
    procedure imgDebitoClick(Sender: TObject);
    procedure imgCreditoClick(Sender: TObject);
    procedure imgPixClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure edtValorRecebidoExit(Sender: TObject);

  private
    dtmVenda: TdtmVenda;
    oVenda: TVenda;

  public
     procedure AtualizarTotal(ValorTotal: Double);

  end;

var
  frmFinalizarVenda: TfrmFinalizarVenda;

implementation

uses
  uQRCode;


{$R *.dfm}

// form

procedure TfrmFinalizarVenda.FormCreate(Sender: TObject);
begin
  lbl7.Caption := DateToStr(Date);
end;

// atalhos

procedure TfrmFinalizarVenda.actFinalizarExecute(Sender: TObject);
Var
  vendaID: Integer;
  totalVenda: Double;
begin
  if imgPix.Visible then
  begin
    if not Assigned(frmQrCode) then
       frmQrCode := TfrmQrCode.Create(Self);

    frmQrCode.ShowModal;

    frmQrCode.Free;
    frmQrCode := nil;
  end;

  if (imgDinheiro.Visible) and (imgDebito.Visible) and (imgCredito.Visible)then
  begin
    if (edtValorRecebido.Text = '') or
         (StrToFloat(edtValorRecebido.Text) < StrToFloat(edtTotal.Text))
    then
    begin
          ShowMessage('Insira um valor v�lido!');
          edtValorRecebido.SetFocus;
    end
    else
    begin
          ShowMessage('Venda Finalizada!');
          frmFinalizarVenda.Close;
    end;
  end;
end;

procedure TfrmFinalizarVenda.actSairExecute(Sender: TObject);
begin
  Close;
end;

//

procedure TfrmFinalizarVenda.edtValorRecebidoExit(Sender: TObject);
var
  ValorTotal, ValorRecebido, Troco: Double;
begin
  if not Assigned(frmCaixaPDV) then
     frmCaixaPDV := TfrmCaixaPDV.Create(nil);

  ValorTotal := StrToFloat(edtTotal.Text);

  ValorRecebido := StrToFloat(edtValorRecebido.Text);

  Troco := ValorRecebido - ValorTotal;

  edtValorRecebido.Text := FormatFloat('0.00', ValorRecebido);
  edtTroco.Text         := FormatFloat('0.00', Troco);
end;

procedure TfrmFinalizarVenda.AtualizarTotal(ValorTotal: Double);
begin
  edtTotal.Text := FormatFloat('0.00', ValorTotal);
end;

// images

procedure TfrmFinalizarVenda.imgCreditoClick(Sender: TObject);
begin
  pnlCredito.Visible := True;
  imgCredito.Visible := False;
end;

procedure TfrmFinalizarVenda.imgDebitoClick(Sender: TObject);
begin
  pnlDebito.Visible := True;
  imgDebito.Visible := False;
end;

procedure TfrmFinalizarVenda.imgDinheiroClick(Sender: TObject);
begin
  pnlDinheiro.Visible := True;
  imgDinheiro.Visible := False;
end;

procedure TfrmFinalizarVenda.imgPixClick(Sender: TObject);
begin
  pnlPix.Visible := True;
  imgPix.Visible := False;

  edtValorRecebido.Enabled := True;
  edtTroco.Enabled := True;
end;

// panels

procedure TfrmFinalizarVenda.pnlCreditoClick(Sender: TObject);
begin
  pnlCredito.Visible := False;
  imgCredito.Visible := True;
end;

procedure TfrmFinalizarVenda.pnlDebitoClick(Sender: TObject);
begin
  pnlDebito.Visible := False;
  imgDebito.Visible := True;
end;

procedure TfrmFinalizarVenda.pnlDinheiroClick(Sender: TObject);
begin
  pnlDinheiro.Visible := False;
  imgDinheiro.Visible := True;
end;

procedure TfrmFinalizarVenda.pnlPixClick(Sender: TObject);
begin
  pnlPix.Visible := False;
  imgPix.Visible := True;

  edtValorRecebido.Clear;
  edtValorRecebido.Enabled := False;

  edtTroco.Clear;
  edtTroco.Enabled := False;
end;

// timer - hora/minutos/segundos

procedure TfrmFinalizarVenda.tmr1Timer(Sender: TObject);
begin
  lbl2.Caption := TimeToStr(Time);
end;

end.
