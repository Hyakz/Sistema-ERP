program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'datamodule\uDTMConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'heranca\uEnum.pas',
  cCadCategoria in 'classes\cCadCategoria.pas',
  uCadCliente in 'cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'classes\cCadCliente.pas',
  uCadProduto in 'cadastro\uCadProduto.pas' {frmCadProduto},
  cCadProduto in 'classes\cCadProduto.pas',
  uDtmVenda in 'datamodule\uDtmVenda.pas' {dtmVenda: TDataModule},
  uProVenda in 'processo\uProVenda.pas' {frmProVenda},
  cProVenda in 'classes\cProVenda.pas',
  cControleEstoque in 'classes\cControleEstoque.pas',
  uRelCadCategorias in 'relatorios\uRelCadCategorias.pas' {frmRelCadCategorias},
  uRelCadClientes in 'relatorios\uRelCadClientes.pas' {frmRelCadClientes},
  uRelCadClientesFicha in 'relatorios\uRelCadClientesFicha.pas' {frmRelCadClientesFicha},
  uRelCadProdutos in 'relatorios\uRelCadProdutos.pas' {frmRelCadProdutos},
  uRelCadProdutosComGrupoCategoria in 'relatorios\uRelCadProdutosComGrupoCategoria.pas' {frmRelCadProdutosComGrupoCategoria},
  uSelecionarData in 'relatorios\uSelecionarData.pas' {frmSelecionarData},
  uRelProVendaPorData in 'relatorios\uRelProVendaPorData.pas' {frmRelProVendaPorData},
  uRelProVenda in 'relatorios\uRelProVenda.pas' {frmRelProVenda},
  uFuncaoCriptografia in 'heranca\uFuncaoCriptografia.pas',
  uCadUsuario in 'cadastro\uCadUsuario.pas' {frmCadUsuario},
  cCadUsuario in 'classes\cCadUsuario.pas',
  cUsuarioLogado in 'login\cUsuarioLogado.pas',
  uAlterarSenha in 'login\uAlterarSenha.pas' {frmAlterarSenha},
  cAtualizacaoBancoDeDados in 'classes\cAtualizacaoBancoDeDados.pas',
  cAtualizacaoTabelaMSSQL in 'classes\cAtualizacaoTabelaMSSQL.pas',
  cAtualizacaoCampoMSSQL in 'classes\cAtualizacaoCampoMSSQL.pas',
  cArquivoIni in 'classes\cArquivoIni.pas',
  cAcaoAcesso in 'classes\cAcaoAcesso.pas',
  uCadAcaoAcesso in 'cadastro\uCadAcaoAcesso.pas' {frmCadAcaoAcesso},
  uUsuarioVsAcoes in 'login\uUsuarioVsAcoes.pas' {frmUsuarioVsAcoes},
  uDTMGrafico in 'datamodule\uDTMGrafico.pas' {DTMGrafico: TDataModule},
  cFuncao in 'classes\cFuncao.pas',
  uTelaHerancaConsulta in 'heranca\uTelaHerancaConsulta.pas' {frmTelaHerancaConsulta},
  uConCategoria in 'consulta\uConCategoria.pas' {frmConCategoria},
  Utilidades in 'utilidades\Utilidades.pas' {$R *.res},
  uFrmAtualizaDB in 'datamodule\uFrmAtualizaDB.pas' {$R *.res},
  uGrafico in 'graficos\uGrafico.pas' {frmGraficos},
  uSubCategoria in 'cadastro\uSubCategoria.pas' {frmSubCategoria},
  cSubCategoria in 'classes\cSubCategoria.pas',
  uLogin in 'login\uLogin.pas' {frmLogin},
  uCaixaPDV in 'processo\uCaixaPDV.pas' {frmCaixaPDV},
  uTextBox in 'processo\uTextBox.pas' {frmTextBox},
  uFinalizarVenda in 'processo\uFinalizarVenda.pas' {frmFinalizarVenda},
  uQRCode in 'processo\uQRCode.pas' {frmQRCode};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
