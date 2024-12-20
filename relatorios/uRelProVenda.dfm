object frmRelProVenda: TfrmRelProVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 839
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 0
    Top = -2
    Width = 794
    Height = 1123
    DataSource = dtsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 55
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 14
        Width = 77
        Height = 24
        Caption = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 38
        Width = 712
        Height = 7
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 227
      Width = 718
      Height = 36
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 3
        Top = 17
        Width = 181
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 614
        Top = 17
        Width = 44
        Height = 16
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 671
        Top = 17
        Width = 11
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 685
        Top = 17
        Width = 8
        Height = 16
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 603
        Top = 17
        Width = 112
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 3
        Top = 5
        Width = 712
        Height = 8
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 93
      Width = 718
      Height = 92
      DataFields = 'vendaId'
      Degrade.OppositeColor = clSilver
      FooterMeasuring = fmBeforeDetail
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLDBText5: TRLDBText
          Left = 77
          Top = 3
          Width = 55
          Height = 16
          DataField = 'vendaId'
          DataSource = dtsVendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 3
          Top = 4
          Width = 53
          Height = 16
          Caption = 'Venda: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RegistrosDB: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 21
        object RLDBText2: TRLDBText
          Left = 77
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVendas
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 651
          Top = 3
          Width = 66
          Height = 16
          Alignment = taRightJustify
          DataField = 'dataVenda'
          DataSource = dtsVendas
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 3
          Top = 3
          Width = 57
          Height = 16
          Caption = 'Cliente: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 614
          Top = 3
          Width = 37
          Height = 16
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 46
        Width = 718
        Height = 48
        DataSource = dsItensVenda
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 21
          BandType = btColumnHeader
          Color = clSilver
          ParentColor = False
          Transparent = False
          object RLLabel4: TRLLabel
            Left = 3
            Top = 4
            Width = 54
            Height = 16
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel10: TRLLabel
            Left = 413
            Top = 2
            Width = 78
            Height = 16
            Alignment = taRightJustify
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel11: TRLLabel
            Left = 510
            Top = 3
            Width = 92
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel12: TRLLabel
            Left = 615
            Top = 2
            Width = 90
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand1: TRLBand
          Left = 0
          Top = 21
          Width = 718
          Height = 25
          object RLDBText1: TRLDBText
            Left = 1
            Top = 5
            Width = 56
            Height = 16
            Alignment = taRightJustify
            DataField = 'produtoID'
            DataSource = dsItensVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText4: TRLDBText
            Left = 77
            Top = 5
            Width = 36
            Height = 16
            DataField = 'nome'
            DataSource = dsItensVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLLabel9: TRLLabel
            Left = 63
            Top = 4
            Width = 8
            Height = 20
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 413
            Top = 5
            Width = 67
            Height = 16
            DataField = 'quantidade'
            DataSource = dsItensVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText7: TRLDBText
            Left = 510
            Top = 5
            Width = 74
            Height = 16
            DataField = 'valorUnitario'
            DataSource = dsItensVenda
            DisplayMask = 'R$ ###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText8: TRLDBText
            Left = 620
            Top = 5
            Width = 74
            Height = 16
            DataField = 'totalProduto'
            DataSource = dsItensVenda
            DisplayMask = 'R$ ###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
            Transparent = False
          end
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 42
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 620
        Top = 16
        Width = 105
        Height = 16
        DataField = 'totalVenda'
        DataSource = dtsVendas
        DisplayMask = 'R$ ###,##0.00'
        Info = riSum
        Text = ''
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 413
        Top = 16
        Width = 101
        Height = 16
        Caption = 'Total da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDraw3: TRLDraw
        Left = 413
        Top = 1
        Width = 324
        Height = 9
        DrawKind = dkLine
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    FileName = 'C:\Users\VIRTUAL\Documents\Teste.pdf'
    DisplayName = 'Documento PDF'
    Left = 848
    Top = 200
  end
  object QryVendas: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      #9'SELECT vendas.vendaId,'
      #9'       vendas.clienteId,'
      #9#9'     clientes.nome,'
      '   '#9#9'   vendas.dataVenda,'
      #9'  '#9'   vendas.totalVenda'
      #9'  FROM vendas'
      
        '         INNER JOIN clientes on clientes.clienteId = vendas.clie' +
        'nteId'
      '   WHERE vendas.vendaId =:vendaId'
      #9' ORDER BY vendas.dataVenda, clienteId'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    Left = 848
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    object QryVendasvendaId: TIntegerField
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object QryVendasclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object QryVendasnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryVendasdataVenda: TDateTimeField
      FieldName = 'dataVenda'
      Required = True
    end
    object QryVendastotalVenda: TFloatField
      FieldName = 'totalVenda'
      Required = True
      DisplayFormat = '#0.00'
    end
  end
  object dtsVendas: TDataSource
    DataSet = QryVendas
    Left = 944
    Top = 40
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 848
    Top = 264
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 848
    Top = 328
  end
  object dsItensVenda: TDataSource
    DataSet = QryItensVenda
    Left = 944
    Top = 96
  end
  object QryItensVenda: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT     ItensVenda.vendaID,'
      '           ItensVenda.produtoID,'
      #9'         produtos.nome,'
      #9'         ItensVenda.quantidade,'
      #9'         ItensVenda.valorUnitario,'
      #9'         ItensVenda.totalProduto'
      '  FROM     ItensVenda'
      'INNER JOIN produtos on produtos.produtoID = ItensVenda.produtoID'
      '     WHERE ItensVenda.vendaID=:vendaID'
      '  ORDER BY ItensVenda.produtoID'
      ''
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    Left = 848
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    object zqryQryItensVendavendaID: TIntegerField
      FieldName = 'vendaID'
      Required = True
    end
    object zqryQryItensVendaprodutoID: TIntegerField
      FieldName = 'produtoID'
      Required = True
    end
    object wdstrngfldQryItensVendanome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object fltfldQryItensVendaquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object fltfldQryItensVendavalorUnitario: TFloatField
      FieldName = 'valorUnitario'
      Required = True
    end
    object fltfldQryItensVendatotalProduto: TFloatField
      FieldName = 'totalProduto'
      Required = True
    end
  end
end
