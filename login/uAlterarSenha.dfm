object frmAlterarSenha: TfrmAlterarSenha
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'Altera'#231#227'o de Senha para Usuario Logado'
  ClientHeight = 430
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    339
    430)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 430
    Anchors = []
    BevelOuter = bvNone
    Color = 1644825
    ParentBackground = False
    TabOrder = 0
    object btn1: TSpeedButton
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'X'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 2237183
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btn1Click
    end
    object lblUsuarioLogado: TLabel
      Left = -49
      Top = 28
      Width = 439
      Height = 34
      Alignment = taCenter
      AutoSize = False
      Caption = 'USUARIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnl2: TPanel
      Left = 22
      Top = 75
      Width = 292
      Height = 75
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        292
        75)
      object lbl3: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 21
        Align = alTop
        Caption = 'SENHA ATUAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semilight'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = -1
      end
      object pnl3: TPanel
        Left = 0
        Top = 73
        Width = 292
        Height = 2
        Align = alBottom
        BevelOuter = bvNone
        Color = 6052956
        ParentBackground = False
        TabOrder = 0
      end
      object edtSenhaAtual: TEdit
        Left = -1
        Top = 27
        Width = 293
        Height = 29
        Anchors = []
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
      end
    end
    object pnl4: TPanel
      Left = 21
      Top = 168
      Width = 292
      Height = 77
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        292
        77)
      object lbl4: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 21
        Align = alTop
        Caption = 'NOVA SENHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semilight'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = -28
        ExplicitTop = 4
      end
      object pnl5: TPanel
        Left = 0
        Top = 75
        Width = 292
        Height = 2
        Align = alBottom
        BevelOuter = bvNone
        Color = 6052956
        ParentBackground = False
        TabOrder = 0
      end
      object edtSenhaNova: TEdit
        Left = 1
        Top = 31
        Width = 290
        Height = 29
        Anchors = []
        AutoSize = False
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
      end
    end
    object pnl6: TPanel
      Left = 23
      Top = 370
      Width = 291
      Height = 35
      BevelOuter = bvNone
      Color = 11096071
      ParentBackground = False
      TabOrder = 2
      object btnAlterar: TSpeedButton
        Left = 0
        Top = 0
        Width = 291
        Height = 35
        Cursor = crHandPoint
        Align = alClient
        Caption = 'CONFIRMAR'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
        OnClick = btnAlterarClick
        ExplicitTop = -8
        ExplicitHeight = 34
      end
    end
    object pnl7: TPanel
      Left = 22
      Top = 265
      Width = 292
      Height = 78
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        292
        78)
      object lbl5: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 21
        Align = alTop
        Caption = 'DIGITE NOVAMENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semilight'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 159
      end
      object pnl1: TPanel
        Left = 0
        Top = 76
        Width = 292
        Height = 2
        Align = alBottom
        BevelOuter = bvNone
        Color = 6052956
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 75
      end
      object edtRepetirNovaSenha: TEdit
        Left = 1
        Top = 31
        Width = 290
        Height = 29
        Anchors = []
        AutoSize = False
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
      end
    end
  end
end
