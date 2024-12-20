inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      ExplicitLeft = 7
      ExplicitTop = 31
      ExplicitWidth = 886
      ExplicitHeight = 400
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'descricao'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SubCategoriaDescricao'
            Width = 521
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 892
      ExplicitHeight = 406
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 91
        Top = 162
        Width = 182
        Height = 25
        EditLabel.Width = 43
        EditLabel.Height = 17
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 91
        Top = 218
        Width = 701
        Height = 25
        EditLabel.Width = 57
        EditLabel.Height = 17
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnAlterar: TBitBtn
      Left = 95
      ExplicitLeft = 95
    end
    inherited btnCancelar: TBitBtn
      Left = 179
      Width = 98
      ExplicitLeft = 179
      ExplicitWidth = 98
    end
    inherited btnGravar: TBitBtn
      Left = 279
      ExplicitLeft = 279
    end
    inherited btnNavigator: TDBNavigator
      Width = 344
      Hints.Strings = ()
      ExplicitWidth = 344
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT c.categoriaId,'
      '       c.descricao,'
      '       s.descricao AS SubCategoriaDescricao'
      '  FROM categorias c'
      '  LEFT JOIN subCategorias s ON c.categoriaId = s.categoriaID'
      'ORDER BY c.categoriaId, s.descricao;')
    Left = 757
    Top = 43
    object QryListagemcategoriaId: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Categoria'
      FieldName = 'descricao'
      Size = 30
    end
    object wdstrngfldQryListagemSubCategoriaDescricao: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Sub Categoria'
      FieldName = 'SubCategoriaDescricao'
      Required = True
      Size = 255
    end
  end
  inherited dtsListagem: TDataSource
    Left = 835
    Top = 43
  end
end
