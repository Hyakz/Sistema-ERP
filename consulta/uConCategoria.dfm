inherited frmConCategoria: TfrmConCategoria
  Caption = 'Consulta de Categorias'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnl1: TPanel
    ExplicitWidth = 701
    inherited edtIndice: TLabel
      Left = 5
      Width = 56
      Font.Name = 'Segoe UI Semibold'
      ExplicitLeft = 5
      ExplicitWidth = 56
    end
    inherited medtPesquisa: TMaskEdit
      ExplicitTop = 24
      ExplicitWidth = 699
    end
  end
  inherited pnl2: TPanel
    ExplicitWidth = 701
    ExplicitHeight = 288
    inherited dbgrdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'categoriaID'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 809
          Visible = True
        end>
    end
  end
  inherited pnl3: TPanel
    ExplicitTop = 338
    ExplicitWidth = 701
    inherited btnFechar: TBitBtn
      ExplicitLeft = 791
    end
  end
  inherited dsListagem: TDataSource
    Left = 632
    Top = 272
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT categoriaID, descricao FROM categorias')
    Left = 632
    Top = 200
    object zqryQryListagemcategoriaID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaID'
      ReadOnly = True
    end
    object wdstrngfldQryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
