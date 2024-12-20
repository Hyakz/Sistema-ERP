object frmUsuarioVsAcoes: TfrmUsuarioVsAcoes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Usu'#225'rios e A'#231#245'es'
  ClientHeight = 471
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object spl1: TSplitter
    Left = 417
    Top = 0
    Height = 426
    ExplicitLeft = 400
    ExplicitTop = 216
    ExplicitHeight = 100
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 426
    Align = alLeft
    TabOrder = 0
    object dbgrdUsuarios: TDBGrid
      Left = 1
      Top = 1
      Width = 415
      Height = 424
      Align = alClient
      DataSource = dsUsuario
      DrawingStyle = gdsClassic
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 313
          Visible = True
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 426
    Width = 894
    Height = 45
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      894
      45)
    object btnFechar: TBitBtn
      Left = 788
      Top = 5
      Width = 105
      Height = 35
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
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
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pnl3: TPanel
    Left = 420
    Top = 0
    Width = 474
    Height = 426
    Align = alClient
    TabOrder = 2
    object dbgrdAcoes: TDBGrid
      Left = 1
      Top = 1
      Width = 472
      Height = 424
      Align = alClient
      Color = clBtnFace
      DataSource = dsAcoes
      DrawingStyle = gdsClassic
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdAcoesDrawColumnCell
      OnDblClick = dbgrdAcoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'acaoAcessoID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 505
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Visible = False
        end>
    end
  end
  object QryUsuario: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    AfterScroll = QryUsuarioAfterScroll
    SQL.Strings = (
      'SELECT usuarioID,'
      '       nome'
      '  FROM usuarios')
    Params = <>
    Left = 343
    Top = 143
    object zqryQryUsuariousuarioID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioID'
      ReadOnly = True
    end
    object wdstrngfldQryUsuarionome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
  object QryAcoes: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT ua.usuarioID,'
      '       ua.acaoAcessoID,'
      '       a.descricao,'
      '       ua.ativo'
      '  FROM usuariosAcaoAcesso AS ua'
      
        '       INNER JOIN acaoAcesso AS a ON a.acaoAcessoID = ua.acaoAce' +
        'ssoID'
      ' WHERE ua.usuarioID=:usuarioID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'usuarioID'
        ParamType = ptUnknown
      end>
    Left = 831
    Top = 105
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuarioID'
        ParamType = ptUnknown
      end>
    object zqryQryAcoesusuarioID: TIntegerField
      FieldName = 'usuarioID'
      Required = True
    end
    object zqryQryAcoesacaoAcessoID: TIntegerField
      FieldName = 'acaoAcessoID'
      Required = True
    end
    object wdstrngfldQryAcoesdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QryAcoesativo: TBooleanField
      FieldName = 'ativo'
      Required = True
    end
  end
  object dsUsuario: TDataSource
    DataSet = QryUsuario
    Left = 341
    Top = 67
  end
  object dsAcoes: TDataSource
    DataSet = QryAcoes
    Left = 832
    Top = 39
  end
end
