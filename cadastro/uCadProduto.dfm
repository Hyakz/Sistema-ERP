inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pgcPrincipal: TPageControl
    ExplicitWidth = 894
    inherited tabListagem: TTabSheet
      ExplicitLeft = 7
      ExplicitTop = 31
      ExplicitWidth = 880
      ExplicitHeight = 400
      inherited pnlListagemTopo: TPanel
        ExplicitWidth = 880
        inherited lblIndice: TLabel
          Width = 97
          Caption = 'Campo Pesquisa'
          ExplicitWidth = 97
        end
        inherited mskPesquisar: TMaskEdit
          Width = 553
          ExplicitWidth = 553
        end
        inherited btnPesquisar: TBitBtn
          Left = 568
          Top = 35
          Width = 106
          ExplicitLeft = 568
          ExplicitTop = 35
          ExplicitWidth = 106
        end
      end
      inherited grdListagem: TDBGrid
        Width = 668
        Font.Name = 'Segoe UI Semilight'
        OnCellClick = grdListagemCellClick
        OnMouseWheel = grdListagemMouseWheel
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoID'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 155
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SubCategoria'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 87
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 668
        Top = 66
        Width = 212
        Height = 334
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object lbl1: TLabel
          Left = 19
          Top = 6
          Width = 185
          Height = 30
          Caption = 'Imagem do Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI Semilight'
          Font.Style = []
          ParentFont = False
        end
        object pnlProduto: TPanel
          Left = 2
          Top = 83
          Width = 210
          Height = 210
          BorderStyle = bsSingle
          ParentBackground = False
          TabOrder = 0
          object imgProduto: TImage
            AlignWithMargins = True
            Left = 11
            Top = 11
            Width = 184
            Height = 184
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alClient
            Center = True
            Proportional = True
            ExplicitLeft = 5
            ExplicitTop = 0
            ExplicitWidth = 210
            ExplicitHeight = 210
          end
        end
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 886
      ExplicitHeight = 406
      object edt1: TLabel
        Left = 16
        Top = 145
        Width = 57
        Height = 17
        Caption = 'Descri'#231#227'o'
      end
      object lblValor: TLabel
        Left = 16
        Top = 322
        Width = 30
        Height = 17
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 168
        Top = 322
        Width = 68
        Height = 17
        Caption = 'Quantidade'
      end
      object edt2: TLabel
        Left = 463
        Top = 27
        Width = 57
        Height = 17
        Caption = 'Categoria'
      end
      object btnIncluirCategoria: TSpeedButton
        Left = 807
        Top = 47
        Width = 34
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD2222DDDDD
          DDDDDD627326666644DDDD62832FFFFFF4DD2222872222FFF6DD2877777732FF
          F6DD2888878872FFF6DD2222872222FFF6DDDD62872FFFFFF6DDDD62882FFFFF
          F6DDDD62222FFFFFF6DDDD6FFFFFFFFFF6DDDD6FFFFFFFFFF6DDDD6FFFFFFFFF
          F6DDDD6FFFFFFFFFF6DDDD666666666666DDDDDDDDDDDDDDDDDD}
        ParentFont = False
        OnClick = btnIncluirCategoriaClick
      end
      object btnPesquisarCategoria: TSpeedButton
        Left = 807
        Top = 102
        Width = 34
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDD4444DDDDDDDDDDDD4F84DDDDDDDDDDDD4F84DD
          DDDDDDDDDD4F84DDDDDDDDDDD846448DDDDDDDDDD778877DDDDDDDDD76888868
          DDDDDDD868888876DDDDDDD768F888767DDDDD868FF8887668DDD8678F888876
          67DDD768FF888876668DD44444444444446DDDDDDDDDDDDDDDDD}
        OnClick = btnPesquisarCategoriaClick
      end
      object lbl2: TLabel
        Left = 315
        Top = 344
        Width = 271
        Height = 25
        Caption = 'Adicione imagem ao produto >>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 463
        Top = 84
        Width = 83
        Height = 17
        Caption = 'Sub Categoria'
      end
      object edtProdutoID: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 47
        Width = 425
        Height = 25
        EditLabel.Width = 43
        EditLabel.Height = 17
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 102
        Width = 425
        Height = 25
        EditLabel.Width = 36
        EditLabel.Height = 17
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 16
        Top = 164
        Width = 570
        Height = 128
        MaxLength = 225
        TabOrder = 4
      end
      object edtValor: TCurrencyEdit
        Tag = 2
        Left = 16
        Top = 342
        Width = 121
        Height = 25
        TabOrder = 5
      end
      object edtQuantidade: TCurrencyEdit
        Tag = 2
        Left = 168
        Top = 345
        Width = 121
        Height = 25
        DisplayFormat = '0.00;-,0.00'
        TabOrder = 6
      end
      object lkpCategoria: TDBLookupComboBox
        Tag = 2
        Left = 463
        Top = 47
        Width = 334
        Height = 25
        BevelOuter = bvRaised
        KeyField = 'categoriaID'
        ListField = 'descricao'
        ListSource = dsCategoria
        TabOrder = 2
        OnClick = lkpCategoriaClick
      end
      object pnlProduto1: TPanel
        Left = 635
        Top = 164
        Width = 206
        Height = 206
        BorderStyle = bsSingle
        TabOrder = 7
        object imgImagem: TImage
          AlignWithMargins = True
          Left = 11
          Top = 11
          Width = 180
          Height = 180
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          PopupMenu = pmImagem
          Proportional = True
          ExplicitLeft = -2
          ExplicitTop = -2
          ExplicitWidth = 285
          ExplicitHeight = 196
        end
      end
      object lkpSubCategoria: TDBLookupComboBox
        Left = 463
        Top = 102
        Width = 334
        Height = 25
        BevelInner = bvNone
        BevelOuter = bvNone
        KeyField = 'subCategoriaID'
        ListField = 'descricao'
        ListSource = dsSubCategoria
        TabOrder = 3
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnAlterar: TBitBtn
      Left = 93
      Width = 78
      ExplicitLeft = 93
      ExplicitWidth = 78
    end
    inherited btnCancelar: TBitBtn
      Left = 176
      Width = 92
      ExplicitLeft = 176
      ExplicitWidth = 92
    end
    inherited btnGravar: TBitBtn
      Left = 270
      Width = 83
      ExplicitLeft = 270
      ExplicitWidth = 83
    end
    inherited btnApagar: TBitBtn
      Left = 358
      ExplicitLeft = 358
    end
    inherited btnFechar: TBitBtn
      Left = 785
      Width = 108
      ExplicitLeft = 785
      ExplicitWidth = 108
    end
    inherited btnNavigator: TDBNavigator
      Left = 447
      Width = 332
      Hints.Strings = ()
      ExplicitLeft = 447
      ExplicitWidth = 332
    end
  end
  object btnFechar1: TBitBtn [2]
    Left = 771
    Top = 456
    Width = 108
    Height = 35
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = '&FECHAR'
    DragCursor = crHandPoint
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FF244E6E
      0A6B9BA6B2F19FA4DAA29CBFAD9BAAB69E9EB69E9EB69F9FB69F9FB69F9FB69F
      9F3C9DBE244E6EFF00FFFF00FF244E6E0A6B9B95AAFC8199FC6F8BFC5D7DFC56
      72F06272D47A79B899879CAB9090AB90903FA0BF244E6EFF00FFFF00FF244E6E
      0A6B9B849CFC728DFC607FFC4E71FC3C62FC2A54FC1745FC0A3AFAA08181A081
      8142A3C1244E6EFF00FFFF00FF244E6E0D6E9D7490FC6282FC5074FC3E64FC2C
      56FC1A48FC0A3BFC0A34F095727295727245A6C2244E6EFF00FFFF00FF244E6E
      10719F6684FC5475FC4267FC3059FC1E4AFC0C3CFC0A36F20A2FE58963638963
      6348A9C4244E6EFF00FFFF00FF244E6E1374A15778FC4569FC335BFC214DFC0F
      3EFC0A37F40A2FE60A2ADA7E54547E54544BACC6244E6EFF00FFFF00FF244E6E
      1575A3486CFC365EFC244FFC1240FC0A37F50A31E80A2ADC0A24D07446467446
      464EAEC8244E6EFF00FFFF00FF244E6E1778A53960FC2751FC1543FC0A38F70A
      32EA0A2BDE0A7ED80AA0E16A3C3C6B3B3B50B1CA244E6EFF00FFFF00FF244E6E
      1A7BA72A54FC1744FC0A39F90A33ED0A2CE00A27D30B91EA4DC9F3693D3E6B3B
      3B53B4CC244E6EFF00FFFF00FF244E6E1D7EA91947FC0A3AFB0A34EF0A2DE30A
      28D50A21C90A1BBD0A15B06B3B3B6B3B3B56B7CE244E6EFF00FFFF00FF244E6E
      2081AB0A3BFC0A35F10A2EE40A29D80A22CB0A1CBF0A16B20A0EA56B3B3B6B3B
      3B59BAD0244E6EFF00FFFF00FF244E6E2384AC0A36F30A2FE60A2ADA0A23CE0A
      1DC00A15B10A0FA40A0A9B6B3B3B6B3B3B5CBDD1244E6EFF00FFFF00FF244E6E
      2687AE0A31E80A2ADC0A24D00A1BBE0A13AD0A0EA30A0A9C0A0A9B6B3B3B6B3B
      3B5EBFD3244E6EFF00FFFF00FF244E6E2989B00A2BDE0A21C90A17B40A11AA0A
      0EA20A0B9C0A0A9B0A0A9B6B3B3B6B3B3B61C1D5244E6EFF00FFFF00FF244E6E
      2B8CB23192B53697B93C9CBC3FA0BF45A6C24AABC64FB0C954B5CD59BAD15FBF
      D363C4D7244E6EFF00FFFF00FF244E6E244E6E244E6E244E6E244E6E244E6E24
      4E6E244E6E244E6E244E6E244E6E244E6E244E6E244E6EFF00FF}
    TabOrder = 2
    Visible = False
    OnClick = btnFecharClick
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT p.produtoID,'
      '       p.nome,'
      '       p.descricao,'
      '       p.valor,'
      '       p.quantidade,'
      '       p.categoriaID,'
      '       c.descricao AS DescricaoCategoria,'
      '       s.descricao AS SubCategoria,'
      '       p.foto'
      '  FROM produtos AS p'
      '  LEFT JOIN categorias AS c ON c.categoriaID = p.categoriaID'
      
        ' INNER JOIN subCategorias AS s ON s.subCategoriaID = p.subCatego' +
        'riaID'
      '')
    Left = 860
    Top = 2
    object zqryQryListagemprodutoID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoID'
      ReadOnly = True
    end
    object wdstrngfldQryListagemnome: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object wdstrngfldQryListagemdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object fltfldQryListagemvalor: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      DisplayFormat = 'R$ ###,###.00'
      EditFormat = 'R$ '
    end
    object fltfldQryListagemquantidade: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Qtde'
      FieldName = 'quantidade'
    end
    object zqryQryListagemcategoriaID: TIntegerField
      FieldName = 'categoriaID'
    end
    object wdstrngfldQryListagemDescricaoCategoria: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Categoria'
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
    object wdstrngfldQryListagemSubCategoria: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Sub categoria'
      FieldName = 'SubCategoria'
      Required = True
      Size = 50
    end
    object QryListagemfoto: TBlobField
      FieldName = 'foto'
    end
  end
  inherited dtsListagem: TDataSource
    AutoEdit = True
    Left = 717
    Top = 2
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'Select categoriaID, descricao from categorias')
    Params = <>
    Left = 791
    Top = 4
    object zqryQryQryCategoriacategoriaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaID'
      ReadOnly = True
    end
    object wdstrngfldCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 642
    Top = 4
  end
  object pmImagem: TPopupMenu
    Left = 577
    Top = 4
    object mniCARREGARIMAGEM1: TMenuItem
      Caption = 'CARREGAR IMAGEM'
      OnClick = mniCARREGARIMAGEM1Click
    end
    object mniLIMPARIMAGEM1: TMenuItem
      Caption = 'LIMPAR IMAGEM'
      OnClick = mniLIMPARIMAGEM1Click
    end
  end
  object QrySubCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'select * from subCategorias')
    Params = <>
    Left = 863
    Top = 64
    object zqryQrySubCategoriasubCategoriaID: TIntegerField
      FieldName = 'subCategoriaID'
      ReadOnly = True
    end
    object zqryQrySubCategoriaCategoriaID: TIntegerField
      FieldName = 'CategoriaID'
      Required = True
    end
    object wdstrngfldQrySubCategoriacategoria: TWideStringField
      FieldName = 'categoria'
      Required = True
      Size = 50
    end
    object wdstrngfldQrySubCategoriadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsSubCategoria: TDataSource
    DataSet = QrySubCategoria
    Left = 863
    Top = 122
  end
  object actlst1: TActionList
    Left = 823
    Top = 400
    object actExibirProdutos: TAction
      Caption = 'actExibirProdutos'
      ShortCut = 113
    end
    object actQuantidade: TAction
      Caption = 'actQuantidade'
      ShortCut = 114
    end
    object actExcluir: TAction
      Caption = 'actExcluir'
      ShortCut = 115
    end
    object actSair: TAction
      Caption = 'actSair'
      ShortCut = 120
      OnExecute = actSairExecute
    end
  end
end
