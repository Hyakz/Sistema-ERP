unit uRelProVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLXLSFilter,
  RLXLSXFilter;

type
  TfrmRelProVendaPorData = class(TForm)
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    QryVendas: TZQuery;
    dtsVendas: TDataSource;
    Rodape: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDraw2: TRLDraw;
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RegistrosDB: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand1: TRLBand;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand4: TRLBand;
    zqryQryVendasvendaID: TIntegerField;
    zqryQryVendasclienteID: TIntegerField;
    wdstrngfldQryVendasnome: TWideStringField;
    dtmfldQryVendasdataVenda: TDateTimeField;
    fltfldQryVendastotalVenda: TFloatField;
    RLLabel6: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProVendaPorData: TfrmRelProVendaPorData;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmRelProVendaPorData.FormDestroy(Sender: TObject);
begin
  QryVendas.Close;
end;

end.
