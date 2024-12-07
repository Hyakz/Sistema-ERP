object frmRelCadProdutoComCategoria: TfrmRelCadProdutoComCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCadProdutoComCategoria'
  ClientHeight = 839
  ClientWidth = 986
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
    Left = -15
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 55
      BandType = btHeader
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 3
        Top = 8
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 38
        Width = 712
        Height = 7
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 36
      BandType = btFooter
      Transparent = False
      object RLSystemInfo3: TRLSystemInfo
        Left = 3
        Top = 17
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
        Transparent = False
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
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 664
        Top = 17
        Width = 18
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
        Transparent = False
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
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 696
        Top = 17
        Width = 19
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
        Transparent = False
      end
      object RLDraw2: TRLDraw
        Left = 3
        Top = 5
        Width = 712
        Height = 8
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 93
      Width = 718
      Height = 124
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 0
        BandType = btHeader
      end
      object CabecalhoLabel: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 18
        BandType = btColumnHeader
        Transparent = False
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          Align = faClient
          Color = 4366591
          ParentColor = False
          Transparent = False
          object RLLabel4: TRLLabel
            Left = 9
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
            Width = 115
            Height = 16
            Caption = 'Nome do Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 416
            Top = 3
            Width = 132
            Height = 16
            Caption = 'Quantidade Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel7: TRLLabel
            Left = 642
            Top = 3
            Width = 38
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
      object RegistrosDB: TRLBand
        Left = 0
        Top = 18
        Width = 718
        Height = 22
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 9
          Top = 1
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutos
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 105
          Top = 1
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsProdutos
          Text = ''
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 645
          Top = 3
          Width = 34
          Height = 16
          Alignment = taRightJustify
          DataField = 'Valor'
          DataSource = dtsProdutos
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 507
          Top = 3
          Width = 41
          Height = 18
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Text = ''
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
    Left = 864
    Top = 96
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      '  SELECT  produtos.produtoID,'
      '          produtos.nome,'
      #9#9'      produtos.descricao,'
      #9#9'      produtos.valor,'
      #9#9'      produtos.quantidade,'
      '          produtos.categoriaID,'
      '          categorias.descricao AS DescricaoCategoria'
      '    FROM  produtos'
      
        'LEFT JOIN categorias on categorias.categoriaID = produtos.catego' +
        'riaID'
      ' ORDER BY produtos.categoriaID, produtos.produtoID')
    Params = <>
    Left = 864
    Top = 32
    object QryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object QryProdutosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.00'
    end
    object QryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.00'
    end
    object QryProdutosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object zqryQryProdutoscategoriaID: TIntegerField
      FieldName = 'categoriaID'
    end
    object wdstrngfldQryProdutosDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 920
    Top = 32
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 864
    Top = 144
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 864
    Top = 200
  end
end
