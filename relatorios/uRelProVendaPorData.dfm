object frmRelProVendaPorData: TfrmRelProVendaPorData
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda por Data'
  ClientHeight = 749
  ClientWidth = 984
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
    Left = 8
    Top = 0
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
        Width = 291
        Height = 24
        Caption = 'Listagem de Venda por Data'
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
      Top = 226
      Width = 718
      Height = 36
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 3
        Top = 17
        Width = 189
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
      Height = 100
      DataFields = 'dataVenda'
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
          Left = 70
          Top = 3
          Width = 73
          Height = 16
          Alignment = taRightJustify
          DataField = 'dataVenda'
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
          Top = 5
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
      object RegistrosDB: TRLBand
        Left = 0
        Top = 46
        Width = 718
        Height = 23
        object RLDBText1: TRLDBText
          Left = 4
          Top = 3
          Width = 47
          Height = 16
          DataField = 'vendaId'
          DataSource = dtsVendas
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 75
          Top = 3
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsVendas
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 609
          Top = 3
          Width = 40
          Height = 16
          DataField = 'totalVenda'
          DataSource = dtsVendas
          DisplayMask = 'R$ ###,##0.00'
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 69
        Width = 718
        Height = 34
        BandType = btSummary
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLLabel10: TRLLabel
          Left = 498
          Top = 15
          Width = 40
          Height = 17
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 610
          Top = 15
          Width = 105
          Height = 16
          DataField = 'totalVenda'
          DataSource = dtsVendas
          DisplayMask = 'R$ ###,##0.00'
          Info = riSum
          Text = ''
          Transparent = False
        end
        object RLDraw3: TRLDraw
          Left = 498
          Top = 7
          Width = 220
          Height = 7
          DrawKind = dkLine
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 21
        BandType = btColumnHeader
        Color = 14869218
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 2
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 70
          Top = 2
          Width = 114
          Height = 16
          Caption = ' Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 608
          Top = 1
          Width = 103
          Height = 16
          Caption = 'Valor da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 33
      BandType = btSummary
      object RLLabel6: TRLLabel
        Left = 459
        Top = 12
        Width = 79
        Height = 16
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 609
        Top = 12
        Width = 105
        Height = 16
        DataField = 'totalVenda'
        DataSource = dtsVendas
        DisplayMask = 'R$ ###,##0.00'
        Info = riSum
        Text = ''
        Transparent = False
      end
      object RLDraw4: TRLDraw
        Left = 460
        Top = 3
        Width = 257
        Height = 7
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
    Left = 832
    Top = 88
  end
  object QryVendas: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      #9'SELECT       vendas.vendaID,'
      #9'             vendas.clienteID,'
      #9#9'           clientes.nome,'
      #9#9'           vendas.dataVenda,'
      #9#9'           vendas.totalVenda'
      #9'       FROM  vendas'
      '    INNER JOIN clientes on clientes.clienteID = vendas.clienteID'
      '         WHERE vendas.dataVenda'
      '       BETWEEN :DataInicio'
      '           AND :DataFim'
      '      ORDER BY vendas.dataVenda, vendas.clienteID'
      ''
      '')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/07/2024'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '30/07/2024'
      end>
    Left = 832
    Top = 32
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/07/2024'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '30/07/2024'
      end>
    object zqryQryVendasvendaID: TIntegerField
      FieldName = 'vendaID'
      ReadOnly = True
    end
    object zqryQryVendasclienteID: TIntegerField
      FieldName = 'clienteID'
      Required = True
    end
    object wdstrngfldQryVendasnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object dtmfldQryVendasdataVenda: TDateTimeField
      FieldName = 'dataVenda'
    end
    object fltfldQryVendastotalVenda: TFloatField
      FieldName = 'totalVenda'
    end
  end
  object dtsVendas: TDataSource
    DataSet = QryVendas
    Left = 896
    Top = 32
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 832
    Top = 136
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 832
    Top = 192
  end
end
