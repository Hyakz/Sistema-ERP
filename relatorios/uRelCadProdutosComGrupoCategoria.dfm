object frmRelCadProdutosComGrupoCategoria: TfrmRelCadProdutosComGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produto por Categoria'
  ClientHeight = 839
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 1
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
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
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 42
        Width = 712
        Height = 7
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 36
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 3
        Top = 17
        Width = 188
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
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 93
      Width = 718
      Height = 124
      DataFields = 'categoriaId'
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
        object RLDBText6: TRLDBText
          Left = 117
          Top = 5
          Width = 128
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 42
          Top = 5
          Width = 76
          Height = 16
          Alignment = taRightJustify
          DataField = 'categoriaId'
          DataSource = dtsProdutos
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
          Width = 70
          Height = 16
          Caption = 'Categoria:'
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
        Height = 20
        object RLDBText1: TRLDBText
          Left = 5
          Top = 4
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 107
          Top = 4
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsProdutos
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 603
          Top = 5
          Width = 45
          Height = 16
          DataField = 'Valor'
          DataSource = dtsProdutos
          DisplayMask = 'R$ ###,##0.00'
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 424
          Top = 6
          Width = 45
          Height = 16
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 66
        Width = 718
        Height = 70
        BandType = btSummary
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDBResult1: TRLDBResult
          Left = 657
          Top = 20
          Width = 45
          Height = 16
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Info = riSum
          Text = ''
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 626
          Top = 42
          Width = 45
          Height = 16
          DataField = 'Valor'
          DataSource = dtsProdutos
          DisplayMask = 'R$ ###,##0.00'
          Info = riAverage
          Text = ''
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 424
          Top = 20
          Width = 227
          Height = 16
          Caption = 'Quantidade Estoque por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 424
          Top = 42
          Width = 196
          Height = 16
          Caption = 'M'#233'dia de Valor por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDraw3: TRLDraw
          Left = 424
          Top = 7
          Width = 371
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
          Top = 3
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
          Left = 105
          Top = 3
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 424
          Top = 3
          Width = 54
          Height = 16
          Caption = 'Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 603
          Top = 3
          Width = 45
          Height = 16
          Caption = 'Valor'
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
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    FileName = 'C:\Users\VIRTUAL\Documents\Teste.pdf'
    DisplayName = 'Documento PDF'
    Left = 840
    Top = 24
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      '  SELECT  produtos.produtoId, '
      '          produtos.Nome, '
      #9#9'  produtos.Descricao, '
      #9#9'  produtos.Valor, '
      #9#9'  produtos.Quantidade,'
      #9#9'  produtos.categoriaId,'
      #9#9'  categorias.descricao AS DescricaoCategoria'
      'FROM  produtos'
      ''
      
        'LEFT JOIN categorias on categorias.CategoriaId = produtos.Catego' +
        'riaId'
      ' ORDER BY produtos.categoriaId, produtos.produtoId')
    Params = <>
    Left = 840
    Top = 96
    object QryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object QryProdutosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object QryProdutosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.00'
    end
    object QryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.00'
    end
    object QryProdutoscategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object QryProdutosDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 840
    Top = 168
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 896
    Top = 24
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 952
    Top = 24
  end
end
