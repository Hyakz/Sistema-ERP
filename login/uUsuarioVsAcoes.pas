unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmUsuarioVsAcoes = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    spl1: TSplitter;
    dbgrdUsuarios: TDBGrid;
    dbgrdAcoes: TDBGrid;
    QryUsuario: TZQuery;
    QryAcoes: TZQuery;
    dsUsuario: TDataSource;
    dsAcoes: TDataSource;
    zqryQryUsuariousuarioID: TIntegerField;
    wdstrngfldQryUsuarionome: TWideStringField;
    zqryQryAcoesusuarioID: TIntegerField;
    zqryQryAcoesacaoAcessoID: TIntegerField;
    wdstrngfldQryAcoesdescricao: TWideStringField;
    QryAcoesativo: TBooleanField;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure QryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dbgrdAcoesDblClick(Sender: TObject);
    procedure dbgrdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;

  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

uses
  uDTMConexao, Enter;

{$R *.dfm}

{ TfrmUsuarioVsAcoes }

procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarioVsAcoes.dbgrdAcoesDblClick(Sender: TObject);
var Qry:TZQuery;
    bmRegistroAtual:TBookmark;
begin
  try
    bmRegistroAtual := QryAcoes.GetBookmark;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=dtmPrincipal.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE usuariosAcaoAcesso         '+
                '    SET ativo=:ativo               '+
                '  WHERE usuarioID=:usuarioID       '+
                '    AND acaoAcessoID=:acaoAcessoID ');

    Qry.ParamByName('usuarioID').AsInteger    := QryAcoes.FieldByName('usuarioID').AsInteger;
    Qry.ParamByName('acaoAcessoID').AsInteger := QryAcoes.FieldByName('acaoAcessoID').AsInteger;
    Qry.ParamByName('ativo').AsBoolean        := not QryAcoes.FieldByName('ativo').AsBoolean;

    try
      dtmPrincipal.COnexaoDB.StartTransaction;
      Qry.ExecSQL;
      dtmPrincipal.ConexaoDB.Commit;
    except
      on E: Exception do
      begin
        dtmPrincipal.ConexaoDB.Rollback;
        ShowMessage('Erro ao atualizar a��o: ' + E.Message);
      end;
    end;

  finally
    SelecionarAcoesAcessoPorUsuario;
    QryAcoes.GotoBookmark(bmRegistroAtual);

    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

procedure TfrmUsuarioVsAcoes.dbgrdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
          Column: TColumn; State: TGridDrawState);
begin
  if not QryAcoes.FieldByName('ativo').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Font.Color:= clWhite;
    TDBGrid(sender).Canvas.Brush.Color:=clRed
  end;
    TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  try
    QryUsuario.DisableControls;
    QryUsuario.Open;
    SelecionarAcoesAcessoPorUsuario;
  finally
    QryUsuario.EnableControls;
  end;
end;

procedure TfrmUsuarioVsAcoes.QryUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
  QryAcoes.Close;
  QryAcoes.ParamByName('usuarioID').AsInteger := QryUsuario.FieldByName('usuarioID').AsInteger;
  QryAcoes.Open;
end;

end.
