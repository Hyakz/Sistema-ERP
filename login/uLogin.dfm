object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Login'
  ClientHeight = 750
  ClientWidth = 1050
  Color = 1644825
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    1050
    750)
  PixelsPerInch = 96
  TextHeight = 21
  object pnlPrincipal: TPanel
    Left = 355
    Top = 178
    Width = 348
    Height = 393
    Anchors = []
    BevelOuter = bvNone
    Color = 526344
    ParentBackground = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 97
      Top = 28
      Width = 145
      Height = 32
      Caption = 'Fa'#231'a seu login'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semilight'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object btn1: TSpeedButton
      AlignWithMargins = True
      Left = 323
      Top = 0
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
    object pnl2: TPanel
      Left = 27
      Top = 94
      Width = 292
      Height = 75
      BevelOuter = bvNone
      TabOrder = 0
      object lbl3: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 21
        Align = alTop
        Caption = 'NOME DE USU'#193'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semilight'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 153
      end
      object edtUsuario: TEdit
        Left = 0
        Top = 30
        Width = 292
        Height = 29
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'ADMIN'
        OnClick = edtUsuarioClick
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
        TabOrder = 1
      end
    end
    object pnl4: TPanel
      Left = 26
      Top = 186
      Width = 292
      Height = 77
      BevelOuter = bvNone
      TabOrder = 1
      object lbl4: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 21
        Align = alTop
        Caption = 'SENHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semilight'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 54
      end
      object edtSenha: TEdit
        Left = 0
        Top = 31
        Width = 292
        Height = 29
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        Text = '1234'
        OnClick = edtSenhaClick
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
        TabOrder = 1
      end
      object pnlImage: TPanel
        Left = 267
        Top = 34
        Width = 22
        Height = 22
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object imgNaoVisualizar: TImage
          Left = 0
          Top = 0
          Width = 22
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D494844520000001D0000
            001D08060000005693670F000000017352474200AECE1CE9000002B849444154
            78DAE5965B884D7114C6D7191E98919452843CB845E4925B6EB9E59E312E8DDC
            5E45213C285144490AE5525224B9E412CA48E392CC34A32193E40165C40BD161
            1CB7C6EDFB5A6B4FDBB6F6EE1C75CE3C58F5AB33FBBFF7FAFE7BFDBFB566A7A4
            0522F5DF8AB6035FC1F7428952F01A4883D27C0A8745A7820A50042E82058E70
            2FD01B74051DC11BD000EAC0877F11652C04A74CF80A980B9A4007F000F448C8
            F5109C0747C1CB5C44C584CE8256A012CC34E181A05AF41892E2A7096F02AFB3
            1565EC016BED374B5E6AC263C01170C1D6868051A0BD93230396804BD988AE04
            0722D7AE8239261C8D22DBE00ED0C6595F050E2689CEB7D27A711DCC02DF62D6
            7B827A50E2947B0AB8E989F611354B5B27E167506C0FF28CD9CB23C17E700EEC
            B2E42BC021E7F9B7A02F781716A569EE8141CE03DCFD6AD11EE6866E99F01730
            42D46C87C106BBFF05E8EEE4390D168545CB455BC50B9A6A1D980D2EDBB5B0F0
            7051B37401BFC019D1D6F3622CA80A44D95F6531376E06DB4127F9B3056E8319
            567ABAF8B9E834DB02B6C6E4E286CA03D124039D004B455D4A13B50EAD558169
            E053E8DA5EB02626D76270321065424E94FECE8D8FC000FB7D0C2C8FACDF01D3
            43C235A2268BC66351CF3485DD3B0CD4DA06A2C1F3ABB012F3EC2746D6ABED8D
            3356EA1BA2A333083A7BB4E5FFAB4FD783DD8E68DA9235D8DF9D2D6937DB0CDD
            7F174C36E1C1A2ED1508B33AC78364DE448A33020DC379BA4FD4A541CC13F543
            CA8439083EDA91D06C1B455BAA39E2662F2DCFA15DECAC35DAB9DD171D8BE3C0
            84D07AAD0967EC4DDF4713247DAEB0EF768A0EED5C3F6BEAACD48DDE6236C9FA
            816D56C6A478257ABECB44073F27DC244F389737E097C278D1B3E2733F44672A
            07C613D1D662D0A51C992571C2F9FA1A64FBD1BDFC875F6F9B6D16CEE7276820
            FC4CB4AFD38510650C054FA540E54D8C1611FD0D09D0991E3CEF747400000000
            49454E44AE426082}
          Proportional = True
          Visible = False
          OnClick = imgNaoVisualizarClick
          ExplicitTop = -1
        end
        object imgVisualizar: TImage
          Left = 0
          Top = 0
          Width = 22
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D494844520000001D0000
            001D08060000005693670F000000017352474200AECE1CE90000023A49444154
            78DAED964B48556110C7BF5B81511086101164542258D1A224DCB4086A173D08
            7BDC2C42108A1609090A91DD22B2851241544421054A454A2EDCB8681182482D
            2A6D1124F4D8E403C31031A8F4379C39783DCC77EEBD1158E4C00FCE63BEF99F
            6FCECC9C937073608979D1FF5E743994C21A580143F0015EC0D89F145D072760
            3F6C8AF17B036DD00C9F7F577435344032C78CFC52E17330988BE831B8038B8D
            7B5FA117DEEACEB7B920ED511BD7384FB311BD0029E3FA04D4C10D984ABBBE00
            CEC015CF439E869B71A207E1914770330CC4A4B5085EC15223DDBBE09925BA16
            FA618911B00AEEC222A8D5B415C22778005735F849B865AC972A2F81D1A8E873
            D86E2C18D05D885D836AC3A7096AF4F8A33E50D41EC29174D13DD0E1495B2B1C
            D5E349C8337CBEBB99F7F918CA3DB16453DDA1E81338E0714CC145170C8341E7
            37B93F0C97E0BCC747EAE570285AAE4F9869A73F6061869D4A1A0F7962C9C6DA
            4351297B29A212C331EC47B1FB70DCF0916150A9C7EFA0D8F091F8D20153E985
            2433B5571F206ABBA15353D8023BD3EE7569264660AF338601F613B6C26B3989
            F6E959683416C914DAE282E12EB6D2CDB4CC17BDB61E5E42BEB1FE14DC0E4FAC
            8954EF82C2899A0C0899A7D7DDEC892431A48D2E3BBBC7A5959A5C6481653299
            9A3D41BE410FF4B9E01D95C1328F5F525FCB2C8BFB7AAC72C1A4A970B97D65A4
            C2EFB9A06D862D876C826DD0D4EDCBE02FC522ED257DFA3E2E602E3B28801DB0
            31B24EC464D0CB18CDEAEFE19FF8479A17FDFB45A701DEFA6D1EDA35144A0000
            000049454E44AE426082}
          Proportional = True
          OnClick = imgVisualizarClick
          ExplicitTop = -1
        end
      end
    end
    object pnl6: TPanel
      Left = 27
      Top = 307
      Width = 292
      Height = 38
      BevelOuter = bvNone
      Color = 11096071
      ParentBackground = False
      TabOrder = 2
      object btnAcessar: TSpeedButton
        Left = 0
        Top = 0
        Width = 292
        Height = 38
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
        OnClick = btnAcessarClick
        OnMouseEnter = btnAcessarMouseEnter
        OnMouseLeave = btnAcessarMouseLeave
        ExplicitLeft = 1
        ExplicitTop = -8
        ExplicitHeight = 41
      end
    end
  end
end