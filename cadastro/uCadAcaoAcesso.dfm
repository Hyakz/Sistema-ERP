inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      ExplicitLeft = 7
      ExplicitTop = 31
      ExplicitWidth = 886
      ExplicitHeight = 400
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoID'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 469
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Width = 360
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 892
      ExplicitHeight = 406
      object edtAcaoAcessoID: TLabeledEdit
        Tag = 1
        Left = 94
        Top = 145
        Width = 162
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
        Left = 94
        Top = 197
        Width = 686
        Height = 25
        EditLabel.Width = 57
        EditLabel.Height = 17
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 94
        Top = 251
        Width = 686
        Height = 25
        EditLabel.Width = 35
        EditLabel.Height = 17
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNovo: TBitBtn
      Left = 2
      Width = 90
      ExplicitLeft = 2
      ExplicitWidth = 90
    end
    inherited btnAlterar: TBitBtn
      Left = 98
      Width = 88
      ExplicitLeft = 98
      ExplicitWidth = 88
    end
    inherited btnCancelar: TBitBtn
      Left = 191
      Width = 93
      ExplicitLeft = 191
      ExplicitWidth = 93
    end
    inherited btnGravar: TBitBtn
      Left = 290
      Width = 92
      ExplicitLeft = 290
      ExplicitWidth = 92
    end
    inherited btnApagar: TBitBtn
      Left = 388
      Width = 93
      ExplicitLeft = 388
      ExplicitWidth = 93
    end
    inherited btnFechar: TBitBtn
      Left = 786
      Width = 92
      ExplicitLeft = 786
      ExplicitWidth = 92
    end
    inherited btnNavigator: TDBNavigator
      Left = 886
      Top = 19
      Width = 264
      Hints.Strings = ()
      Visible = False
      ExplicitLeft = 886
      ExplicitTop = 19
      ExplicitWidth = 264
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT acaoAcessoID,'
      '       descricao,'
      '       chave'
      '  FROM acaoAcesso')
    Left = 596
    object zqryQryListagemacaoAcessoID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoID'
      ReadOnly = True
    end
    object wdstrngfldQryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object wdstrngfldQryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
  inherited dtsListagem: TDataSource
    Left = 644
  end
end
