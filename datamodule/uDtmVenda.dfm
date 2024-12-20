object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 169
  Width = 251
  object QryCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT clienteID,'
      '       nome'
      'FROM clientes')
    Params = <>
    Left = 31
    Top = 32
    object zqryQryClienteclienteID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteID'
      ReadOnly = True
    end
    object wdstrngfldQryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT produtoID,'
      '       nome,'
      '       valor,'
      '       quantidade'
      'FROM   produtos')
    Params = <>
    Left = 96
    Top = 32
    object zqryQryProdutosprodutoID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoID'
      ReadOnly = True
    end
    object wdstrngfldQryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object fltfldQryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      DisplayFormat = 'R$ ###,##0.00'
    end
    object fltfldQryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 32
    object zqryItensVendasprodutoID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoID'
    end
    object cdsItensVendaNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'nomeProduto'
      Size = 60
    end
    object fltfldItensVendasQuantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object fltfldItensVendasValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorUnitario'
      DisplayFormat = 'R$ ###,##0.00'
    end
    object fltfldItensVendasValorTotalProduto: TFloatField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'totalProduto'
      DisplayFormat = 'R$ ###,##0.00'
    end
  end
  object dsCliente: TDataSource
    DataSet = QryCliente
    Left = 34
    Top = 88
  end
  object dsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 96
    Top = 88
  end
  object dsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 168
    Top = 88
  end
end
