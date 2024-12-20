unit uDtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVenda = class(TDataModule)
    QryCliente: TZQuery;
    zqryQryClienteclienteID: TIntegerField;
    wdstrngfldQryClientenome: TWideStringField;
    QryProdutos: TZQuery;
    zqryQryProdutosprodutoID: TIntegerField;
    wdstrngfldQryProdutosnome: TWideStringField;
    fltfldQryProdutosvalor: TFloatField;
    fltfldQryProdutosquantidade: TFloatField;
    dsCliente: TDataSource;
    dsProdutos: TDataSource;
    dsItensVenda: TDataSource;
    cdsItensVenda: TClientDataSet;
    zqryItensVendasprodutoID: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    fltfldItensVendasQuantidade: TFloatField;
    fltfldItensVendasValorUnitario: TFloatField;
    fltfldItensVendasValorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

uses
  uDTMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  QryCliente.Open;
  QryProdutos.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;

end.
