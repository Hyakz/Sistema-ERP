object DTMGrafico: TDTMGrafico
  OldCreateOrder = False
  Height = 276
  Width = 450
  object QryProdutoEstoque: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      
        'select convert(VARCHAR, produtoID) +'#39'  -  '#39'+nome As Label, quant' +
        'idade AS value FROM produtos')
    Params = <>
    Left = 39
    Top = 32
    object wdstrngfldQryProdutoEstoqueLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object fltfldQryProdutoEstoquevalue: TFloatField
      FieldName = 'value'
    end
  end
  object QryValorVendaPorCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      
        'SELECT CONVERT(VARCHAR, vendas.clienteID) + '#39' -  '#39'+clientes.nome' +
        ' As Label, '
      '   '#9'   SUM(vendas.totalVenda) AS Value'
      ' FROM  vendas'
      
        '       INNER JOIN clientes ON clientes.clienteID = vendas.client' +
        'eID'
      
        ' WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) AND C' +
        'ONVERT(DATE, GETDATE())'
      ' GROUP BY vendas.clienteID, clientes.nome')
    Params = <>
    Left = 160
    Top = 32
    object wdstrngfldQryValorVendaPorClienteLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object fltfldQryValorVendaPorClienteValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object Qry10ProdutosMaisVendidos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      
        'SELECT TOP 10 CONVERT(VARCHAR, vi.produtoID) + '#39'  -  '#39' + p.nome ' +
        'AS Label,'
      '       SUM(vi.totalProduto) AS Value'
      '  FROM ItensVenda AS vi'
      ' INNER JOIN produtos as p on p.produtoID = vi.produtoID'
      ' GROUP BY vi.produtoID, p.nome')
    Params = <>
    Left = 303
    Top = 33
    object wdstrngfldQry10ProdutosMaisVendidosLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 95
    end
    object fltfldQry10ProdutosMaisVendidosValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object QryVendasUltimasSemanas: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      
        '  SELECT vendas.dataVenda AS label, SUM(vendas.totalVenda) AS Va' +
        'lue'
      '    FROM vendas'
      
        '   WHERE vendas.dataVenda BETWEEN CONVERT(date, GETDATE()-7) AND' +
        ' CONVERT(DATE, GETDATE())'
      '   GROUP BY vendas.dataVenda')
    Params = <>
    Left = 72
    Top = 152
    object dtmfldQryVendasUltimasSemanaslabel: TDateTimeField
      FieldName = 'label'
      Required = True
    end
    object fltfldQryVendasUltimasSemanasValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
end
