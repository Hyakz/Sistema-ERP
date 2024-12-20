unit uGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VclTee.TeeGDIPlus, Data.DB, VCLTee.Series, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, uDTMGrafico, uDTMConexao, Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TfrmGraficos = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnlEsquerda: TPanel;
    spl2: TSplitter;
    pnlVendaPorClienteUltimaSemana: TPanel;
    char1: TDBChart;
    pnl10ProdutosMaisVendidos: TPanel;
    char2: TDBChart;
    PieSeries1: TPieSeries;
    pnlPnlDireita: TPanel;
    spl1: TSplitter;
    pnlProdutoEstoque: TPanel;
    charGrafico: TDBChart;
    Series1: TBarSeries;
    pnlVendasDaUltimaSemana: TPanel;
    pnlVendasDaUltimaSemana1: TPanel;
    char3: TDBChart;
    Series3: TFastLineSeries;
    spl3: TSplitter;
    Series2: TPieSeries;
    btnFechar: TSpeedButton;
    procedure btnFecharMouseEnter(Sender: TObject);
    procedure btnFecharMouseLeave(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure actlst1Execute(Action: TBasicAction; var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGraficos: TfrmGraficos;

implementation

{$R *.dfm}

procedure TfrmGraficos.btnFecharMouseEnter(Sender: TObject);
begin
  btnFechar.Font.Color := clRed;
end;

procedure TfrmGraficos.btnFecharMouseLeave(Sender: TObject);
begin
  btnFechar.Font.Color := clBlack;
end;

procedure TfrmGraficos.actlst1Execute(Action: TBasicAction; var Handled: Boolean);
begin
  Close;
end;

procedure TfrmGraficos.btnFecharClick(Sender: TObject);
begin
  Close;
end;



end.
