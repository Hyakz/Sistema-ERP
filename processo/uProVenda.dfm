inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas de Produtos'
  ClientWidth = 898
  ExplicitWidth = 898
  PixelsPerInch = 96
  TextHeight = 17
  inherited pgcPrincipal: TPageControl
    Width = 898
    ExplicitWidth = 898
    inherited tabListagem: TTabSheet
      ExplicitLeft = 7
      ExplicitTop = 31
      ExplicitWidth = 884
      ExplicitHeight = 400
      inherited pnlListagemTopo: TPanel
        Width = 884
        ExplicitWidth = 884
        inherited mskPesquisar: TMaskEdit
          Top = 30
          Width = 755
          ExplicitTop = 30
          ExplicitWidth = 755
        end
        inherited btnPesquisar: TBitBtn
          Left = 655
          Top = 1
          Width = 109
          Height = 26
          Font.Name = 'Segoe UI Semilight'
          Glyph.Data = {00000000}
          ParentFont = False
          ExplicitLeft = 655
          ExplicitTop = 1
          ExplicitWidth = 109
          ExplicitHeight = 26
        end
        object btnCaixaPDV: TButton
          Left = 770
          Top = 0
          Width = 113
          Height = 55
          Cursor = crHandPoint
          Caption = '&CAIXA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Semilight'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnCaixaPDVClick
        end
      end
      inherited grdListagem: TDBGrid
        Width = 884
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaID'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteID'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 466
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'totalVenda'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Width = 99
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 890
      ExplicitHeight = 406
      object edt2: TLabel
        Left = 315
        Top = 14
        Width = 39
        Height = 17
        Caption = 'Cliente'
      end
      object edt3: TLabel
        Left = 706
        Top = 14
        Width = 86
        Height = 17
        Caption = 'Data da Venda'
      end
      object edtVendaID: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 31
        Width = 273
        Height = 25
        Color = clWhite
        EditLabel.Width = 107
        EditLabel.Height = 17
        EditLabel.Caption = 'N'#250'mero da Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object lkpCliente: TDBLookupComboBox
        Left = 301
        Top = 31
        Width = 382
        Height = 25
        Cursor = crHandPoint
        BevelOuter = bvNone
        DropDownRows = 10
        KeyField = 'clienteID'
        ListField = 'nome'
        ListSource = dtmVenda.dsCliente
        TabOrder = 1
      end
      object dtdtDataVenda: TDateEdit
        Left = 701
        Top = 31
        Width = 169
        Height = 25
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        TabOrder = 2
      end
      object pnl1: TPanel
        Left = 0
        Top = 83
        Width = 890
        Height = 323
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object pnl4: TPanel
          Left = 0
          Top = 277
          Width = 890
          Height = 46
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object edt4: TLabel
            Left = 620
            Top = 12
            Width = 119
            Height = 21
            Caption = 'Valor da Venda:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 747
            Top = 9
            Width = 139
            Height = 28
            Alignment = taCenter
            Color = 14737632
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI Semilight'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 0
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 890
          Height = 60
          Align = alTop
          BevelOuter = bvNone
          Color = 15461355
          ParentBackground = False
          TabOrder = 1
          object edt5: TLabel
            Left = 15
            Top = 4
            Width = 47
            Height = 17
            Caption = 'Produto'
          end
          object edt6: TLabel
            Left = 435
            Top = 4
            Width = 80
            Height = 17
            Caption = 'Valor Unit'#225'rio'
          end
          object edt7: TLabel
            Left = 304
            Top = 4
            Width = 68
            Height = 17
            Caption = 'Quantidade'
          end
          object edt8: TLabel
            Left = 564
            Top = 4
            Width = 99
            Height = 17
            Caption = 'Total do Produto'
          end
          object lkpProduto: TDBLookupComboBox
            Left = 15
            Top = 20
            Width = 273
            Height = 25
            Cursor = crHandPoint
            KeyField = 'produtoID'
            ListField = 'nome'
            ListSource = dtmVenda.dsProdutos
            TabOrder = 0
            OnExit = lkpProdutoExit
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 431
            Top = 20
            Width = 121
            Height = 25
            DisplayFormat = 'R$ 0.00;-,R$ 0.00'
            ReadOnly = True
            TabOrder = 2
          end
          object edtQuantidade: TCurrencyEdit
            Left = 300
            Top = 20
            Width = 121
            Height = 25
            DisplayFormat = '0.00;-,0.00'
            TabOrder = 1
            OnChange = edtQuantidadeChange
            OnEnter = edtQuantidadeEnter
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 561
            Top = 20
            Width = 121
            Height = 25
            DisplayFormat = 'R$ 0.00;-,R$ 0.00'
            ReadOnly = True
            TabOrder = 3
          end
          object btnAdicionarItem: TBitBtn
            Left = 700
            Top = 3
            Width = 170
            Height = 28
            Cursor = crHandPoint
            Caption = '&ADICIONAR'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
              4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
              B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
              C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
              6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
              53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
              D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
              F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
              0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
              DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
              F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
              C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
              E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
              FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
              C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
              EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
              CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
              F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
              CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
              17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 4
            OnClick = btnAdicionarItemClick
          end
          object btnApagarItem: TBitBtn
            Left = 700
            Top = 31
            Width = 170
            Height = 28
            Cursor = crHandPoint
            Caption = 'RE&MOVER'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFBDA79BB17B5BA95C2FA44B199B3B0A9B3B0A9D400FA8592DB17B5EBEA8
              9EFF00FFFF00FFFF00FFFF00FFFF00FFAB6945A44A12BF6E21D89D5AE6BF8BEE
              CC97EFCB91EDC486E1AE71C6844AA65020AF7556FF00FFFF00FFFF00FFFF00FF
              A14818E9BA7CF6DCBBF7E4CCF7ECDBF7E6CBF8E0BAF9DAAAF9D9A9F9D7A8F0C8
              95A44E22FF00FFFF00FFFF00FFFF00FFA3491AF4D1A6F5DAB6F6E3C7F7E9D4F7
              E4C6F7DEB5F8D9A7F8D8A7F9D6A7F9D4A5A34818FF00FFFF00FFFF00FFC3B8B2
              AE5E2DF3D0A1F4D8B1F5E1C2F6E6CFF7E2C0F7DCB0F7D7A5F8D7A5F8D6A6F9D4
              A5B36132C3BBB6FF00FFFF00FFBEA89EBB723EF2CE9DF3D6AEF4DEBFF5E4C8F6
              DFBBF7D9ACF7D6A3F7D5A3F8D5A4F8D4A4C27B4DBEAAA0FF00FFFF00FFB89787
              C7824BF1CC99F2D4AAF3DCBAF4E1C2F5DCB6F6D8A9F7D4A0F7D4A2F7D4A3F8D4
              A4CF9163B99A89FF00FFFF00FFB48973CF9054F0CA96F2D2A6F2DAB6F3DEBDF4
              DAB1F5D6A6F6D39EF7D3A0F7D3A1F7D2A2DDA877B58A73FF00FFFF00FFAF7658
              D89C5DEFC891F1D0A2F2D8B1F3DBB8F4D8ADF5D4A2F6D29CF6D29EF7D2A0F7D2
              A2E6B485B1795BFF00FFFF00FFAA643CE0A768EFC68EF0CE9EF1D6AEF2D9B3F3
              D6A9F4D29FF5D19AF6D19DF7D29FF7D2A1EDC091AC6844FF00FFFF00FFA55426
              E5B172F0D0A2F2D8B3F5E3C7F5E4CBF6E5CBF6E5CBF7E6CDF7E7D0F7E1C0F8DD
              B9F3CA9AAA5A2FFF00FFFF00FFBE805FEBCB9CE4B162E1A64ADD9A34DFA141E1
              A84FE3AE5CE5B569E7BB76ECCA95F1D8B2F4E3CDC79073FF00FFFF00FF9E4211
              B45D0FC57315CF8322D79431DFA242E1A84FE4AE5DE5B56AE1B16FDAA76CCF97
              62B97344A24B1FFF00FFFF00FFC3B8B2B2836AAB6238A653239F44139B3B0A9B
              3B0A9B3B0A9B3B0AA14415A7562AAE6C48B48A75C5BEBBFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 5
            OnClick = btnApagarItemClick
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 60
          Width = 890
          Height = 217
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object dbgrdItensVenda: TDBGrid
            Left = 0
            Top = 0
            Width = 890
            Height = 217
            Align = alClient
            DataSource = dtmVenda.dsItensVenda
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdItensVendaDrawColumnCell
            OnDblClick = dbgrdItensVendaDblClick
            OnKeyDown = dbgrdItensVendaKeyDown
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'produtoID'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'nomeProduto'
                Width = 441
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'quantidade'
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'valorUnitario'
                Width = 116
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'totalProduto'
                Title.Caption = 'Valor Total'
                Width = 135
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 898
    ExplicitWidth = 898
    inherited btnNovo: TBitBtn
      Left = 4
      Width = 85
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      ExplicitLeft = 4
      ExplicitWidth = 85
    end
    inherited btnAlterar: TBitBtn
      Left = 93
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      ParentFont = False
      ExplicitLeft = 93
    end
    inherited btnCancelar: TBitBtn
      Left = 177
      Width = 98
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      ParentFont = False
      ExplicitLeft = 177
      ExplicitWidth = 98
    end
    inherited btnGravar: TBitBtn
      Left = 281
      Width = 86
      ExplicitLeft = 281
      ExplicitWidth = 86
    end
    inherited btnApagar: TBitBtn
      Left = 373
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      ParentFont = False
      ExplicitLeft = 373
    end
    inherited btnFechar: TBitBtn
      Left = 784
      Width = 104
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      ParentFont = False
      ExplicitLeft = 784
      ExplicitWidth = 104
    end
    inherited btnNavigator: TDBNavigator
      Left = 460
      Width = 320
      Hints.Strings = ()
      ExplicitLeft = 460
      ExplicitWidth = 320
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT vendas.vendaID'
      '      ,vendas.clienteID'
      '      ,clientes.nome'
      '      ,vendas.dataVenda'
      '      ,vendas.totalVenda'
      '  FROM vendas'
      ' INNER JOIN clientes ON clientes.clienteID = vendas.clienteID')
    Left = 757
    Top = 298
    object zqryQryListagemvendaID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#250'mero Venda'
      FieldName = 'vendaID'
      Origin = 'vendas'
      ReadOnly = True
    end
    object wdstrngfldQryListagemnome: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Origin = 'clientes'
      Size = 60
    end
    object dtmfldQryListagemdataVenda: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da Venda'
      FieldName = 'dataVenda'
      Origin = 'vendas'
      Required = True
    end
    object fltfldQryListagemtotalVenda: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
      Origin = 'vendas'
      Required = True
      DisplayFormat = 'R$ ###,###.00'
    end
    object zqryQryListagemclienteID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'clienteID'
      Origin = 'vendas'
      Required = True
      Visible = False
    end
  end
  inherited dtsListagem: TDataSource
    Left = 759
    Top = 352
  end
end
