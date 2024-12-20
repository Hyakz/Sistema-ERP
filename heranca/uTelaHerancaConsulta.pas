unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmTelaHerancaConsulta = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edtIndice: TLabel;
    dbgrdPesquisa: TDBGrid;
    dsListagem: TDataSource;
    QryListagem: TZQuery;
    btnFechar: TBitBtn;
    medtPesquisa: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgrdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbgrdPesquisaDblClick(Sender: TObject);
    procedure dbgrdPesquisaTitleClick(Column: TColumn);
    procedure medtPesquisaChange(Sender: TObject);

  private
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: string): String;

    { Private declarations }

  public
    { Public declarations }
    aRetornarIdSelecionado :Variant;
    aIniciarPesquisaID     :Variant;
    aCampoID               :string;
    IndiceAtual            :string;


  end;

var
  frmTelaHerancaConsulta: TfrmTelaHerancaConsulta;

implementation

{$R *.dfm}

uses Utilidades;

procedure TfrmTelaHerancaConsulta.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHerancaConsulta.dbgrdPesquisaDblClick(Sender: TObject);
begin
  aRetornarIdSelecionado:=QryListagem.FieldByName(aCampoID).AsVariant;
end;

procedure TfrmTelaHerancaConsulta.dbgrdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = 46) then
      Key := 0;
end;

procedure TfrmTelaHerancaConsulta.dbgrdPesquisaTitleClick(Column: TColumn);
begin
  IndiceAtual:=Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, edtIndice);
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if QryListagem.Active then
     QryListagem.Close;
end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
begin
  if QryListagem.Active then
     QryListagem.Close;

  ExibirLabelIndice(IndiceAtual, edtIndice);
  QryListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
begin
  if (aIniciarPesquisaID<>Unassigned) then
  begin
    QryListagem.Locate(aCampoID, aIniciarPesquisaID,[loPartialKey]);
  end;
end;

procedure TfrmTelaHerancaConsulta.medtPesquisaChange(Sender: TObject);
begin
   QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey]);
end;

procedure TfrmTelaHerancaConsulta.ExibirLabelIndice(Campo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHerancaConsulta.RetornarCampoTraduzido(Campo: string): string;
var
  i: Integer;
  CampoSemAcentos: string;
begin
  CampoSemAcentos := TUtilidades.RemoverAcentos(Campo);

  for i := 0 to QryListagem.FieldCount - 1 do
  begin
    if LowerCase(TUtilidades.RemoverAcentos(QryListagem.Fields[i].FieldName)) = LowerCase(CampoSemAcentos) then
    begin
      Result := QryListagem.Fields[i].DisplayLabel;
      Exit;
    end;
  end;

  Result := '';
end;

end.
