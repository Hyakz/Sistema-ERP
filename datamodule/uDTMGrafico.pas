unit uDTMGrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDTMGrafico = class(TDataModule)
    QryProdutoEstoque: TZQuery;
    wdstrngfldQryProdutoEstoqueLabel: TWideStringField;
    fltfldQryProdutoEstoquevalue: TFloatField;
    QryValorVendaPorCliente: TZQuery;
    wdstrngfldQryValorVendaPorClienteLabel: TWideStringField;
    fltfldQryValorVendaPorClienteValue: TFloatField;
    Qry10ProdutosMaisVendidos: TZQuery;
    wdstrngfldQry10ProdutosMaisVendidosLabel: TWideStringField;
    fltfldQry10ProdutosMaisVendidosValue: TFloatField;
    QryVendasUltimasSemanas: TZQuery;
    dtmfldQryVendasUltimasSemanaslabel: TDateTimeField;
    fltfldQryVendasUltimasSemanasValue: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DTMGrafico: TDTMGrafico;

implementation

uses
  uDTMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
