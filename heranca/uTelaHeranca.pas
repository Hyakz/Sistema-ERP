unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls, ZConnection,
  uDtmConexao, ZAbstractRODataset, ZAbstractDataset, ZDataset, uEnum, RxToolEdit, RxCurrEdit, ZAbstractConnection,
  cUsuarioLogado, System.UITypes;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure mskPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    SelectOriginal:string;
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
              btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
              pgcPrincipal: TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab      (pgcPrincipal         : TPageControl; Indice: Integer);
    function  RetornarCampoTraduzido  (Campo: String)       : String;
    procedure ExibirLabelIndice       (Campo: string; aLabel: TLabel);
    function  ExisteCampoObrigatorio  :Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
    procedure LoadGridListagemColumns;
    procedure SaveGridListagemColumns;
    procedure DeleteSelectedRecord(Grid: TDBGrid);

  public
    IndiceAtual                     :string;
    EstadoDoCadastro                :TEstadoDoCadastro;
    function Apagar                 :Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);

  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uPrincipal;

//--------------------------------------------OBSERVA��ES--------------------------------------------------------------------------------------------------------------------------------------------------------------------

 //TAG: 1 - Chave Prim�ria - PK
 //TAG: 2 - Campos Obrigat�rios

//--------------------------------------- FUN��ES E PROCEDURES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
          pgcPrincipal: TPageControl; Flag:Boolean);
begin
  btnNovo.Enabled                  :=Flag;
  btnApagar.Enabled                :=Flag;
  btnAlterar.Enabled               :=Flag;
  Navegador.Enabled                :=Flag;
  pgcPrincipal.Pages[0].TabVisible :=Flag;
  btnCancelar.Enabled              :=not(Flag);
  btnGravar.Enabled                :=not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:String):String;
var i:Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do
  begin
    if lowercase(QryListagem.Fields[i].FieldName)=lowercase(Campo) then
    begin
      Result := QryListagem.Fields[i].DisplayLabel;
      Break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
Var
  i:Integer;
begin
Result:=False;
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if(TLabeledEdit(Components[i]).Tag = 2) and
        (TLabeledEdit(Components[i]).Text=EmptyStr)
      then
      begin
        MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
        ' � um campo obrigat�rio! ',mtInformation,[mbOK],0);
        TLabeledEdit(Components[i]).SetFocus;

        Result:=true;
        Break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
Var
  i:Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if  (TLabeledEdit(Components[i]).Tag = 1) then
      begin
        TLabeledEdit(Components[i]).Enabled:=false;
        Break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
Var
  i:Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
     if (Components[i] is TLabeledEdit) then
         TLabeledEdit(Components[i]).Text := EmptyStr
     else
     if (Components[i] is TMemo) then
         TMemo(Components[i]).Text := ''
     else
     if (Components[i] is TDBLookupComboBox) then
         TDBLookupComboBox(Components[i]).KeyValue:=Null
     else
     if (Components[i] is TCurrencyEdit) then
         TCurrencyEdit(Components[i]).Value:=0
     else
     if (Components[i] is TDateEdit) then
         TDateEdit(Components[i]).Date:=0
     else
     if (Components[i] is TMaskEdit) then
         TMaskEdit(Components[i]).Text := ''
  end;
end;

//----------------------------------------- M�TODOS VIRTUAIS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TfrmTelaHeranca.Apagar: Boolean;
begin
  ShowMessage('DELETADO');
  Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;
begin
  if (EstadoDoCadastro=ecInserir) then
           showmessage('Inserir')
  else
  if (EstadoDoCadastro=ecAlterar) then
      showmessage('Alterado');

  Result := True;
end;

//--------------------------------------------  BOT�ES ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TBitBtn(sender).Name, dtmPrincipal.ConexaoDB) then
   begin
     MessageDlg('Usu�rio: '+OUsuarioLogado.nome+', N�o possui Permiss�o de acesso!!',mtWarning,[mbOK],0);
     Abort;
   end;

  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                  btnApagar, btnNavigator, pgcPrincipal,false);

  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnPesquisarClick(Sender: TObject);
var I:Integer;

    TipoCampo   :TFieldType;
    NomeCampo   :String;
    WhereOrAnd  :String;
    CondicaoSQL :String;
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', N�o possui permiss�o de acesso!!',mtWarning,[mbOK],0);
     Abort;
  end;

  if mskPesquisar.Text = '' then
  begin
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    Abort;
  end;

  for I := 0 to QryListagem.FieldCount-1 do
  begin
    if QryListagem.Fields[i].FieldName=IndiceAtual then
    begin
      TipoCampo := QryListagem.Fields[i].DataType;
      if QryListagem.Fields[i].Origin<>'' then
      begin
        if Pos('.', QryListagem.Fields[i].Origin) > 0 then
           NomeCampo :=QryListagem.Fields[i].Origin
        else
           NomeCampo :=QryListagem.Fields[i].Origin+'.'+QryListagem.Fields[i].FieldName
      end
      else
        NomeCampo :=QryListagem.Fields[i].FieldName;
      Break;
    end;
  end;

  if Pos('where',LowerCase(SelectOriginal)) > 1 then
  begin
    WhereOrAnd := ' and '
  end

  else
  begin
    WhereOrAnd := ' where ';
  end;

  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
  begin
    CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisar.Text+'%');
  end

  else
  if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisar.Text
  end

  else
  if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then
  begin
     CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisar.Text)
  end

  else
  if (TipoCampo = ftFloat) or (TipoCampo = ftCurrency) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
  end;

  QryListagem.Close;
  QryListagem.SQL.Clear;
  QryListagem.SQL.Add(SelectOriginal);
  QryListagem.SQL.Add(CondicaoSQL);
  QryListagem.Open;

  mskPesquisar.Text := '';
  mskPesquisar.SetFocus;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name + '_' + TBitBtn(sender).Name, dtmPrincipal.ConexaoDB) then
   begin
     MessageDlg('Usu�rio: ' + OUsuarioLogado.nome + ', N�o possui Permiss�o de acesso!!',mtWarning,[mbOK],0);
     Abort;
   end;

   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                   btnApagar, btnNavigator, pgcPrincipal,false);
   EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name + '_' + TBitBtn(sender).Name, dtmPrincipal.ConexaoDB) then
  begin
    MessageDlg('Usu�rio: ' + OUsuarioLogado.nome + ', N�o possui Permiss�o de acesso!!',mtWarning,[mbOK],0);
    Abort;
  end;

  Try
    if (Apagar) then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                      btnApagar, btnNavigator, pgcPrincipal,true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      QryListagem.Refresh;
    end
    else
    begin
      MessageDlg('Erro na Exclus�o', mtError, [mbok] ,0);
    end;
  Finally
    EstadoDoCadastro := ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                  btnApagar, btnNavigator, pgcPrincipal,true);

  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name + '_' + TBitBtn(sender).Name, dtmPrincipal.ConexaoDB) then
    begin
       MessageDlg('Usu�rio: ' + OUsuarioLogado.nome + ', N�o possui Permiss�o de acesso!!',mtWarning,[mbOK],0);
       Abort;
    end;

    if (ExisteCampoObrigatorio) then
        abort;
    Try
      if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
        btnApagar, btnNavigator, pgcPrincipal,true);

        ControlarIndiceTab(pgcPrincipal, 0);
        EstadoDoCadastro := ecNenhum;
        LimparEdits;
        QryListagem.Refresh;
      end

      else
      begin
        MessageDlg('Erro na Grava��o', mtError, [mbok] ,0);
      end;

    Finally
      EstadoDoCadastro:=ecNenhum;
      LimparEdits;
    End;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gravar dados: ' + E.Message);
    end;
  end;
end;

//-------------------------------------------- FORM // GRID -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  QryListagem.Connection :=dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet    :=QryListagem;
  grdListagem.DataSource :=dtsListagem;
  grdListagem.Options    :=[dgTitles,
                         dgIndicator,
                         dgColumnResize,
                         dgColLines,
                         dgRowLines,
                         dgTabs,
                         dgRowSelect,
                         dgAlwaysShowSelection,
                         dgCancelOnExit,
                         dgTitleClick,
                         dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text<>EmptyStr) then
  begin
    QryListagem.IndexFieldNames:=IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    SelectOriginal:=QryListagem.SQL.Text;
    QryListagem.Open;
  end;
    ControlarIndiceTab(pgcPrincipal, 0);
    DesabilitarEditPK;
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
    IndiceAtual                 := Column.FieldName;
    QryListagem.IndexFieldNames := IndiceAtual;

    ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmTelaHeranca.mskPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnPesquisar.Click;
  end;
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
      Key  := 0;
end;

// EXCLUIR

procedure TfrmTelaHeranca.DeleteSelectedRecord(Grid: TDBGrid);
var
  DataSet: TDataSet;
begin
  DataSet := Grid.DataSource.DataSet;
  if not DataSet.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir o registro selecionado?', ' ', MB_YESNO or MB_ICONQUESTION) = IDYES then
       DataSet.Delete;
  end;
end;

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
     DeleteSelectedRecord(grdListagem);
end;

// SALVAR GRID

procedure TfrmTelaHeranca.SaveGridListagemColumns;
var
  SavePath: string;
begin
//  SavePath := 'C:\App\Grids\ListagemColumns.cfg';
//
//  // Verifica se o diret�rio existe e tenta criar se n�o existir
//  if not DirectoryExists(ExtractFileDir(SavePath)) then
//  begin
//    if not ForceDirectories(ExtractFileDir(SavePath)) then
//    begin
//      ShowMessage('Erro ao criar diret�rio: ' + ExtractFileDir(SavePath));
//      Exit;
//    end;
//  end;
//
//  // Tenta salvar as configura��es da gridListagem
//  try
//    grdListagem.Columns.SaveToFile(SavePath);
//    ShowMessage('Configura��es da gridListagem salvas com sucesso.');
//  except
//    on E: Exception do
//      ShowMessage('Erro ao salvar configura��es da gridListagem: ' + E.Message);
//  end;
end;

procedure TfrmTelaHeranca.LoadGridListagemColumns;
var
  SavePath: string;
begin
//  SavePath := 'C:\App\Grids\ListagemColumns.cfg';
//
//  // Verifica se o arquivo de configura��o existe e tenta carregar
//  if FileExists(SavePath) then
//  begin
//    try
//      grdListagem.Columns.LoadFromFile(SavePath);
//      ShowMessage('Configura��es da gridListagem carregadas com sucesso.');
//    except
//      on E: Exception do
//        ShowMessage('Erro ao carregar configura��es da gridListagem: ' + E.Message);
//    end;
//  end;
end;


end.
