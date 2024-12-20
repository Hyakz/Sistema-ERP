unit uPrincipal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter, ZDbcIntfs, Vcl.Imaging.pngimage,
    Vcl.ExtCtrls, uFrmAtualizaDB, cUsuarioLogado, Vcl.ComCtrls, cAtualizacaoBancoDeDados, RLReport, VclTee.TeeGDIPlus,
    Data.DB, VCLTee.Series, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, ZAbstractRODataset,
    ZAbstractDataset, ZDataset, cFuncao, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.CategoryButtons, Vcl.Buttons, System.Actions,
    Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg, uGrafico, System.UITypes, uSubCategoria;

type
    TfrmPrincipal = class(TForm)
    pnlCabecalho: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    img1: TImage;
    img2: TImage;
    pnl4: TPanel;
    edt2: TLabel;
    pnl5: TPanel;
    pnl6: TPanel;
    img3: TImage;
    img4: TImage;
    pnl7: TPanel;
    edt3: TLabel;
    edt4: TLabel;
    imgList1: TImageList;
    actlst1: TActionList;
    actCadastro: TAction;
    actVendas: TAction;
    actRelatorios: TAction;
    imgList2: TImageList;
    actlst2: TActionList;
    actCliente: TAction;
    actCategoria: TAction;
    actProdutos: TAction;
    actUsuarios: TAction;
    actAlterarSenha: TAction;
    imgList3: TImageList;
    actlst3: TActionList;
    actRelCategoria: TAction;
    actRelCliente: TAction;
    actRelFichaDeCliente: TAction;
    actRelProduto: TAction;
    actReltProdutosPorCategoria: TAction;
    actRelVendaPorData: TAction;
    actAcoes: TAction;
    imgList4: TImageList;
    actlst4: TActionList;
    actAcoesGerais: TAction;
    actAcoesUsuarios: TAction;
    actGrafico: TAction;
    lbledt1: TLabel;
    actSubCategoria: TAction;
    pnlPrincipal: TPanel;
    SplitView1: TSplitView;
    CategoryButtons1: TCategoryButtons;
    pnl8: TPanel;
    btnSair: TSpeedButton;
    SplitView2: TSplitView;
    pnl9: TPanel;
    lbledt5: TLabel;
    FlowPanel1: TFlowPanel;
    btnCliente: TSpeedButton;
    btnCategoria: TSpeedButton;
    btnSubCategoria: TSpeedButton;
    SplitView3: TSplitView;
    pnl10: TPanel;
    lbledt6: TLabel;
    FlowPanel2: TFlowPanel;
    btnRelCategoria: TSpeedButton;
    btnRelFichaDeCliente: TSpeedButton;
    btnRelCliente1: TSpeedButton;
    btnRelFichaDeCliente1: TSpeedButton;
    btnReltProdutosPorCategoria: TSpeedButton;
    btnRelCliente: TSpeedButton;
    SplitView4: TSplitView;
    pnl11: TPanel;
    lbl1: TLabel;
    FlowPanel3: TFlowPanel;
    btnReltProdutosPorCategoria1: TSpeedButton;
    btnRelVendaPorData: TSpeedButton;
    btnAlterarSenha: TSpeedButton;
    imgPrincipal: TImage;
    btnProdutos: TSpeedButton;
    btnUsuarios: TSpeedButton;
    actlst5: TActionList;
    imgList5: TImageList;
    SplitView5: TSplitView;
    pnl12: TPanel;
    lbl2: TLabel;
    FlowPanel4: TFlowPanel;
    btnVendasDOIS: TSpeedButton;
    btnCaixaPDV: TSpeedButton;
    actVendasDOIS: TAction;
    actCaixaPDV: TAction;

    procedure mniFecharClick(Sender                 : TObject);
    procedure FormCreate(Sender                     : TObject);
    procedure FormClose(Sender                      : TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure img1MouseEnter(Sender: TObject);
    procedure img2MouseLeave(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3MouseEnter(Sender: TObject);
    procedure img4MouseLeave(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure actCadastroExecute(Sender: TObject);
    procedure actRelProdutoExecute(Sender: TObject);
    procedure actAlterarSenhaExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actCategoriaExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actRelatoriosExecute(Sender: TObject);
    procedure actRelCategoriaExecute(Sender: TObject);
    procedure actRelClienteExecute(Sender: TObject);
    procedure actRelFichaDeClienteExecute(Sender: TObject);
    procedure actReltProdutosPorCategoriaExecute(Sender: TObject);
    procedure actRelVendaPorDataExecute(Sender: TObject);
    procedure actAcoesExecute(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure actAcoesUsuariosExecute(Sender: TObject);
    procedure actAcoesGeraisExecute(Sender: TObject);
    procedure btnClienteMouseEnter(Sender: TObject);
    procedure btnClienteMouseLeave(Sender: TObject);
    procedure btnCategoriaMouseEnter(Sender: TObject);
    procedure btnCategoriaMouseLeave(Sender: TObject);
    procedure btnProdutosMouseEnter(Sender: TObject);
    procedure btnProdutosMouseLeave(Sender: TObject);
    procedure btnUsuariosMouseEnter(Sender: TObject);
    procedure btnUsuariosMouseLeave(Sender: TObject);
    procedure btnAlterarSenhaMouseEnter(Sender: TObject);
    procedure btnAlterarSenhaMouseLeave(Sender: TObject);
    procedure actGraficoExecute(Sender: TObject);
    procedure btnRelCategoriaMouseEnter(Sender: TObject);
    procedure btnRelCategoriaMouseLeave(Sender: TObject);
    procedure btnRelFichaDeClienteMouseEnter(Sender: TObject);
    procedure btnRelFichaDeClienteMouseLeave(Sender: TObject);
    procedure btnRelCliente1MouseEnter(Sender: TObject);
    procedure btnRelCliente1MouseLeave(Sender: TObject);
    procedure btnRelFichaDeCliente1MouseEnter(Sender: TObject);
    procedure btnRelFichaDeCliente1MouseLeave(Sender: TObject);
    procedure btnReltProdutosPorCategoriaMouseEnter(Sender: TObject);
    procedure btnReltProdutosPorCategoriaMouseLeave(Sender: TObject);
    procedure btnRelClienteMouseEnter(Sender: TObject);
    procedure btnRelClienteMouseLeave(Sender: TObject);
    procedure btnReltProdutosPorCategoria1MouseEnter(Sender: TObject);
    procedure btnReltProdutosPorCategoria1MouseLeave(Sender: TObject);
    procedure btnRelVendaPorDataMouseEnter(Sender: TObject);
    procedure btnRelVendaPorDataMouseLeave(Sender: TObject);
    procedure btnSubCategoriaMouseLeave(Sender: TObject);
    procedure btnSubCategoriaMouseEnter(Sender: TObject);
    procedure actSubCategoriaExecute(Sender: TObject);
    procedure actVendasDOISExecute(Sender: TObject);
    procedure actCaixaPDVExecute(Sender: TObject);
    procedure btnVendasDOISMouseEnter(Sender: TObject);
    procedure btnVendasDOISMouseLeave(Sender: TObject);
    procedure btnCaixaPDVMouseEnter(Sender: TObject);
    procedure btnCaixaPDVMouseLeave(Sender: TObject);

  private
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure AtualizarDashBoard;

  public

  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado:TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria,
     uCadCliente,
     uCadProduto,
     uProVenda,
     uRelCadCategorias,
     uRelCadClientes,
     uRelCadProdutos,
     uRelCadClientesFicha,
     uRelCadProdutosComGrupoCategoria,
     uDtmVenda,
     uSelecionarData,
     uRelProVendaPorData,
     uCadUsuario,
     uLogin,
     uAlterarSenha,
     cArquivoIni,
     uCadAcaoAcesso,
     cAcaoAcesso,
     uUsuarioVsAcoes,
     uTelaHeranca,
     uDTMGrafico,
     cCadUsuario, uCaixaPDV;

// ------------------------------------------------- CLICKS MENU PRINCIPAL -----------------------------------------------------

procedure TfrmPrincipal.mniFecharClick(Sender: TObject);
begin
  //Close;
  Application.Terminate;
end;

// ------------------------------------------------------------ FORMS --------------------------------------------------------------

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
  FreeAndNil(DTMGrafico);

  if Assigned(oUsuarioLogado) then
     FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not FIleExists(TArquivoIni.ArquivoIni) then
  begin
    TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL                ');
    TArquivoIni.AtualizarIni('SERVER', 'HostName',     '.\                   ');
    TArquivoIni.AtualizarIni('SERVER', 'Port',         '1433                 ');
    TArquivoIni.AtualizarIni('SERVER', 'User',         'sa                   ');
    TArquivoIni.AtualizarIni('SERVER', 'Password',     'domtec@10            ');
    TArquivoIni.AtualizarIni('SERVER', 'Database',     'vendas               ');

    MessageDlg('Arquivo' + TArquivoIni.ArquivoIni + ' Criado com Sucesso!' +#13+
               'Configure o Arquivo antes de inicializar a aplica��o.', mtInformation,[mbOK], 0);

    Application.Terminate;
  end

  else
  begin
    frmAtualizaDB:=TfrmAtualizaDB.Create(self);
    frmAtualizaDB.Refresh;

    dtmPrincipal := TdtmPrincipal.Create(Self);

    with dtmPrincipal.ConexaoDB do
    begin
      SQLHourGlass          := False;
      if TArquivoIni.LerIni ('SERVER', 'TipoDataBase')='MSSQL' then
         Protocol           := 'mssql';
      LibraryLocation       := 'C:\Users\devmv\Desktop\Projeto Delphi\ntwdblib.dll';
      HostName              := TArquivoIni.LerIni('SERVER', 'HostName');
      Port                  := StrToInt(TArquivoIni.LerIni('SERVER','Port'));
      User                  := TArquivoIni.LerIni('SERVER', 'User');
      Password              := TArquivoIni.LerIni('SERVER', 'Password');
      Database              := TArquivoIni.LerIni('SERVER', 'DataBase');
      AutoCommit            := True;
      TransactIsolationLevel:= tiReadCommitted;
      Connected             := True;
    end;

    AtualizacaoBancoDados(frmAtualizaDB);

    TAcaoAcesso.CriarAcoes(TfrmCadCategoria, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadCliente, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadProduto, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadUsuario, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmAlterarSenha, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmProVenda, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelProVendaPorData, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadClientesFicha, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadClientes, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadProdutosComGrupoCategoria, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadProdutos, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadCategorias, dtmPrincipal.ConexaoDB );
    TAcaoAcesso.CriarAcoes(TfrmGraficos, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmSubCategoria, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCaixaPDV, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmLogin, dtmPrincipal.ConexaoDB);
    TAcaoAcesso.PreencherUsuariosVsAcoes(dtmPrincipal.ConexaoDB);

    DTMGrafico:=TDTMGrafico.Create(self);
    AtualizarDashBoard;

    frmAtualizaDB.Free;

    TeclaEnter              := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := True;
    TeclaEnter.FocusColor   := $00FFF3E8;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    oUsuarioLogado :=TUsuarioLogado.Create;
    frmLogin :=TfrmLogin.Create(Self);
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    edt4.Caption:=oUsuarioLogado.nome;
    edt3.Caption:='Administrador';
  end;
end;

procedure TfrmPrincipal.actAlterarSenhaExecute(Sender: TObject);
begin
  if SplitView4.Opened then
     SplitView4.Opened := False;

  TFuncao.CriarForm(TfrmAlterarSenha, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
  aForm.Refresh;

  try
    oAtualizarMSSQL:= TAtualizaBancoDadosMSSQL.Create(dtmPrincipal.ConexaoDB);
    oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
    if Assigned(oAtualizarMSSQL) then
       FreeAndNil(oAtualizarMSSQL);
  end;
end;

procedure TfrmPrincipal.AtualizarDashBoard;
begin
  try
    Screen.Cursor:=crDefault;

    if DTMGrafico.QryProdutoEstoque.Active then
       DTMGrafico.QryProdutoEstoque.Close;

    if DTMGrafico.QryValorVendaPorCliente.Active then
       DTMGrafico.QryValorVendaPorCliente.Close;

    if DTMGrafico.Qry10ProdutosMaisVendidos.Active then
       DTMGrafico.Qry10ProdutosMaisVendidos.Close;

    if DTMGrafico.QryVendasUltimasSemanas.Active then
       DTMGrafico.QryVendasUltimasSemanas.Close;

    DTMGrafico.QryProdutoEstoque.Open;
    DTMGrafico.QryValorVendaPorCliente.Open;
    DTMGrafico.Qry10ProdutosMaisVendidos.Open;
    DTMGrafico.QryVendasUltimasSemanas.Open;

  finally
    Screen.Cursor:=crDefault;
  end;
end;

// -------------------------------------------- DESIGN MENU PRINCIPAL -------------------------------------------------------

// MOUSE ENTER / LEAVE

procedure TfrmPrincipal.btnAlterarSenhaMouseEnter(Sender: TObject);
begin
  btnAlterarSenha.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnAlterarSenhaMouseLeave(Sender: TObject);
begin
  btnAlterarSenha.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnCaixaPDVMouseEnter(Sender: TObject);
begin
  btnCaixaPDV.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnCaixaPDVMouseLeave(Sender: TObject);
begin
  btnCaixaPDV.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnCategoriaMouseEnter(Sender: TObject);
begin
  btnCategoria.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnCategoriaMouseLeave(Sender: TObject);
begin
  btnCategoria.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnClienteMouseEnter(Sender: TObject);
begin
  btnCliente.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnClienteMouseLeave(Sender: TObject);
begin
  btnCliente.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnProdutosMouseEnter(Sender: TObject);
begin
  btnProdutos.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnProdutosMouseLeave(Sender: TObject);
begin
  btnProdutos.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelCategoriaMouseEnter(Sender: TObject);
begin
  btnRelCategoria.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelCategoriaMouseLeave(Sender: TObject);
begin
  btnRelCategoria.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelCliente1MouseEnter(Sender: TObject);
begin
  btnRelCliente1.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelCliente1MouseLeave(Sender: TObject);
begin
  btnRelCliente1.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelClienteMouseEnter(Sender: TObject);
begin
  btnRelCliente.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelClienteMouseLeave(Sender: TObject);
begin
  btnRelCliente.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelFichaDeCliente1MouseEnter(Sender: TObject);
begin
  btnRelFichaDeCliente1.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelFichaDeCliente1MouseLeave(Sender: TObject);
begin
  btnRelFichaDeCliente1.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelFichaDeClienteMouseEnter(Sender: TObject);
begin
  btnRelFichaDeCliente.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelFichaDeClienteMouseLeave(Sender: TObject);
begin
  btnRelFichaDeCliente.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnReltProdutosPorCategoria1MouseEnter(Sender: TObject);
begin
  btnReltProdutosPorCategoria1.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnReltProdutosPorCategoria1MouseLeave(Sender: TObject);
begin
  btnReltProdutosPorCategoria1.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnReltProdutosPorCategoriaMouseEnter(Sender: TObject);
begin
  btnReltProdutosPorCategoria.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnReltProdutosPorCategoriaMouseLeave(Sender: TObject);
begin
  btnReltProdutosPorCategoria.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnRelVendaPorDataMouseEnter(Sender: TObject);
begin
  btnRelVendaPorData.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnRelVendaPorDataMouseLeave(Sender: TObject);
begin
  btnRelVendaPorData.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnUsuariosMouseEnter(Sender: TObject);
begin
  btnUsuarios.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnUsuariosMouseLeave(Sender: TObject);
begin
  btnUsuarios.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnVendasDOISMouseEnter(Sender: TObject);
begin
  btnVendasDOIS.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnVendasDOISMouseLeave(Sender: TObject);
begin
  btnVendasDOIS.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnSairMouseEnter(Sender: TObject);
begin
  btnSair.Font.Color := clBlack;
end;

procedure TfrmPrincipal.btnSairMouseLeave(Sender: TObject);
begin
  btnSair.Font.Color := clWhite;
end;

procedure TfrmPrincipal.btnSubCategoriaMouseEnter(Sender: TObject);
begin
  btnSubCategoria.Font.Color := clPurple;
end;

procedure TfrmPrincipal.btnSubCategoriaMouseLeave(Sender: TObject);
begin
  btnSubCategoria.Font.Color := clWhite;
end;

// IMAGE

procedure TfrmPrincipal.img1MouseEnter(Sender: TObject);
begin
  img1.Visible:=False;
  img2.Visible:=True;
end;

procedure TfrmPrincipal.img2MouseLeave(Sender: TObject);
begin
  img1.Visible := True;
  img2.Visible := False;
end;

procedure TfrmPrincipal.img3MouseEnter(Sender: TObject);
begin
  img3.Visible:=False;
  img4.Visible:=True;
end;

procedure TfrmPrincipal.img4Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadUsuario, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.img4MouseLeave(Sender: TObject);
begin
  img3.Visible:=True;
  img4.Visible:=False;
end;

procedure TfrmPrincipal.img2Click(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  if SplitView3.Opened then
     SplitView3.Opened := False;

  if SplitView4.Opened then
     SplitView4.Opened := False;

  if SplitView1.Opened then
     SplitView1.Close
  else
     SplitView1.Open;
end;

// SPLIT VIEWS

procedure TfrmPrincipal.actCadastroExecute(Sender: TObject);
begin
  if SplitView3.Opened then
     SplitView3.Opened := False;

  if SplitView4.Opened then
     SplitView4.Opened := False;

  if SplitView5.Opened then
     SplitView5.Opened := False;

  SplitView2.Opened := not SplitView2.Opened;
end;

procedure TfrmPrincipal.actRelatoriosExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  if SplitView4.Opened then
     SplitView4.Opened := False;

  if SplitView5.Opened then
     SplitView5.Opened := False;

  SplitView3.Opened := not SplitView3.Opened;
end;

procedure TfrmPrincipal.actAcoesExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  if SplitView3.Opened then
     SplitView3.Opened := False;

  if SplitView5.Opened then
     SplitView5.Opened := False;

  SplitView4.Opened := not SplitView4.Opened;
end;

procedure TfrmPrincipal.actVendasExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  if SplitView3.Opened then
     SplitView3.Opened := False;

  if SplitView4.Opened then
     SplitView4.Opened := False;

  SplitView5.Opened := not SplitView5.Opened;
end;

procedure TfrmPrincipal.actGraficoExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  if SplitView3.Opened then
     SplitView3.Opened := False;

  if SplitView4.Opened then
     SplitView4.Opened := False;

  if SplitView5.Opened then
     SplitView5.Opened := False;

  AtualizarDashBoard;
  TFuncao.CriarForm(TfrmGraficos, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

// A�oes

procedure TfrmPrincipal.actAcoesGeraisExecute(Sender: TObject);
begin
  if SplitView4.Opened then
     SplitView4.Opened := False;

  TFuncao.CriarForm(TfrmCadAcaoAcesso, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actAcoesUsuariosExecute(Sender: TObject);
begin
  if SplitView4.Opened then
     SplitView4.Opened := False;

  TFuncao.CriarForm(TfrmUsuarioVsAcoes, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actCategoriaExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actClienteExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  TFuncao.CriarForm(TfrmCadCliente, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actProdutosExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  TFuncao.CriarForm(TfrmCadProduto, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actSubCategoriaExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

     TFuncao.CriarForm(TfrmSubCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actUsuariosExecute(Sender: TObject);
begin
  if SplitView2.Opened then
     SplitView2.Opened := False;

  TFuncao.CriarForm(TfrmCadUsuario, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actVendasDOISExecute(Sender: TObject);
begin
  if SplitView5.Opened then
     SplitView5.Opened := False;

  TFuncao.CriarForm(TfrmProVenda, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actCaixaPDVExecute(Sender: TObject);
begin
  if SplitView5.Opened then
     SplitView5.Opened := False;

  TFuncao.CriarForm(TfrmCaixaPDV, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

// relatorios

procedure TfrmPrincipal.actRelCategoriaExecute(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadCategorias, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actRelClienteExecute(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadClientes, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actRelFichaDeClienteExecute(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadClientesFicha, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actRelProdutoExecute(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProdutos, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actReltProdutosPorCategoriaExecute(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProdutosComGrupoCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.actRelVendaPorDataExecute(Sender: TObject);
begin
  try
    frmSelecionarData:=TfrmSelecionarData.Create(Self);
    frmSelecionarData.ShowModal;

    frmRelProVendaPorData:=TfrmRelProVendaPorData.Create(self);
    frmRelProVendaPorData.QryVendas.Close;
    frmRelProVendaPorData.QryVendas.ParamByName('DataInicio').AsDate:=frmSelecionarData.EdtDataInicio.Date;
    frmRelProVendaPorData.QryVendas.ParamByName('DataFim').AsDate:=frmSelecionarData.EdtDataFinal.Date;
    frmRelProVendaPorData.QryVendas.Open;
    frmRelProVendaPorData.Relatorio.PreviewModal;

  finally
    if Assigned(frmSelecionarData) then
       frmSelecionarData.Release;

    if Assigned(frmRelProVendaPorData) then
       frmRelProVendaPorData.Release;
  end;
end;

// SAIR

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
