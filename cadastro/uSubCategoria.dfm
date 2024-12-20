inherited frmSubCategoria: TfrmSubCategoria
  Caption = 'Sub Categoria'
  ClientWidth = 896
  ExplicitWidth = 896
  PixelsPerInch = 96
  TextHeight = 17
  inherited pgcPrincipal: TPageControl
    Width = 896
    ActivePage = tabManutencao
    ExplicitWidth = 896
    inherited tabListagem: TTabSheet
      ExplicitLeft = 7
      ExplicitTop = 31
      ExplicitWidth = 882
      ExplicitHeight = 400
      inherited pnlListagemTopo: TPanel
        Width = 882
        ExplicitWidth = 882
      end
      inherited grdListagem: TDBGrid
        Width = 882
        Columns = <
          item
            Expanded = False
            FieldName = 'subCategoriaID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'categoria'
            Width = 409
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 379
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 888
      ExplicitHeight = 406
      object lbledt2: TLabel
        Left = 92
        Top = 173
        Width = 57
        Height = 17
        Caption = 'Categoria'
      end
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 92
        Top = 134
        Width = 350
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
        Left = 92
        Top = 258
        Width = 701
        Height = 25
        EditLabel.Width = 83
        EditLabel.Height = 17
        EditLabel.Caption = 'Sub Categoria'
        MaxLength = 30
        TabOrder = 2
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 92
        Top = 196
        Width = 350
        Height = 25
        BevelOuter = bvRaised
        KeyField = 'categoriaID'
        ListField = 'descricao'
        ListSource = dsCategoria
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 896
    ExplicitWidth = 896
    inherited btnFechar: TBitBtn
      Left = 800
      ExplicitLeft = 800
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'Select * from subCategorias')
    Left = 697
    Top = 305
    object zqryQryListagemsubCategoriaID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'ID'
      FieldName = 'subCategoriaID'
      ReadOnly = True
    end
    object wdstrngfldQryListagemcategoria: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Categoria'
      FieldName = 'categoria'
      Required = True
      Size = 50
    end
    object wdstrngfldQryListagemdescricao: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Sub Categoria'
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object zqryQryListagemCategoriaID: TIntegerField
      Alignment = taCenter
      FieldName = 'CategoriaID'
      Required = True
    end
  end
  inherited dtsListagem: TDataSource
    AutoEdit = True
    Left = 776
    Top = 305
  end
  object dsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 775
    Top = 234
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'Select categoriaID, descricao from categorias')
    Params = <>
    Left = 702
    Top = 237
    object zqryQryCategoriacategoriaID: TIntegerField
      FieldName = 'categoriaID'
      ReadOnly = True
    end
    object wdstrngfldQryCategoriadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
end
