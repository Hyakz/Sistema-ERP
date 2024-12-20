object frmGraficos: TfrmGraficos
  Left = 220
  Top = 130
  BorderStyle = bsNone
  Caption = 'Gr'#225'fico'
  ClientHeight = 540
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  StyleElements = []
  PixelsPerInch = 96
  TextHeight = 13
  object spl3: TSplitter
    Left = 510
    Top = 41
    Width = 4
    Height = 458
    ExplicitLeft = 694
    ExplicitTop = 0
    ExplicitHeight = 800
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1400
    object btnFechar: TSpeedButton
      Left = 964
      Top = 2
      Width = 35
      Height = 35
      Cursor = crHandPoint
      Caption = 'X'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharClick
      OnMouseEnter = btnFecharMouseEnter
      OnMouseLeave = btnFecharMouseLeave
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 499
    Width = 999
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 759
    ExplicitWidth = 1400
  end
  object pnl3: TPanel
    Left = 999
    Top = 41
    Width = 0
    Height = 458
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 1400
    ExplicitHeight = 718
  end
  object pnl4: TPanel
    Left = 514
    Top = 41
    Width = 0
    Height = 458
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = 702
    ExplicitHeight = 718
  end
  object pnlEsquerda: TPanel
    Left = 514
    Top = 41
    Width = 485
    Height = 458
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 702
    ExplicitWidth = 698
    ExplicitHeight = 718
    object spl2: TSplitter
      Left = 0
      Top = 235
      Width = 485
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 398
      ExplicitWidth = 699
    end
    object pnlVendaPorClienteUltimaSemana: TPanel
      Left = 0
      Top = 0
      Width = 485
      Height = 235
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object char1: TDBChart
        Left = 0
        Top = 0
        Width = 485
        Height = 235
        Title.Text.Strings = (
          'Valor de Venda por Cliente na '#218'ltima Semana')
        Legend.TextStyle = ltsLeftPercent
        View3DOptions.Elevation = 315
        View3DOptions.HorizOffset = 99
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DOptions.VertOffset = -1
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        ExplicitWidth = 698
        ExplicitHeight = 397
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 17
        object Series2: TPieSeries
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = False
          Marks.Style = smsLabelPercentTotal
          Marks.Callout.Length = 20
          DataSource = DTMGrafico.QryValorVendaPorCliente
          Title = 'ValorDeVendaPorClienteNaUltimaSemana'
          XLabelsSource = 'Label'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'Value'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.TextStyle = ltsPercent
          OtherSlice.Legend.Visible = False
        end
      end
    end
    object pnl10ProdutosMaisVendidos: TPanel
      Left = 0
      Top = 238
      Width = 485
      Height = 220
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 400
      ExplicitWidth = 698
      ExplicitHeight = 318
      object char2: TDBChart
        Left = 0
        Top = 0
        Width = 485
        Height = 220
        Title.Text.Strings = (
          'Os 10 Produtos Mais Vendidos')
        Legend.TextStyle = ltsLeftPercent
        View3DOptions.Elevation = 315
        View3DOptions.HorizOffset = 159
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DOptions.VertOffset = -1
        View3DOptions.Zoom = 120
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        ExplicitWidth = 698
        ExplicitHeight = 318
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 18
        object PieSeries1: TPieSeries
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = False
          Marks.Style = smsLabelPercentTotal
          Marks.Callout.Length = 20
          Marks.MultiLine = True
          DataSource = DTMGrafico.Qry10ProdutosMaisVendidos
          Title = '10ProdutosMaisVendidos'
          XLabelsSource = 'Label'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'Value'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.TextStyle = ltsPercent
          OtherSlice.Legend.Visible = False
        end
      end
    end
  end
  object pnlPnlDireita: TPanel
    Left = 0
    Top = 41
    Width = 510
    Height = 458
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 5
    object spl1: TSplitter
      Left = 0
      Top = 235
      Width = 510
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 398
      ExplicitWidth = 698
    end
    object pnlProdutoEstoque: TPanel
      Left = 0
      Top = 0
      Width = 510
      Height = 235
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object charGrafico: TDBChart
        Left = 0
        Top = 0
        Width = 510
        Height = 235
        Title.Text.Strings = (
          'Produto em Estoque')
        Chart3DPercent = 63
        View3DOptions.HorizOffset = 60
        View3DOptions.Perspective = 20
        View3DOptions.VertOffset = 4
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        ExplicitLeft = -2
        ExplicitWidth = 698
        ExplicitHeight = 298
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          BarBrush.Gradient.EndColor = 6144242
          ConePercent = 52
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = False
          DataSource = DTMGrafico.QryProdutoEstoque
          SeriesColor = 8404992
          Title = 'Produto Estoque'
          XLabelsSource = 'Label'
          Gradient.EndColor = 6144242
          MultiBar = mbNone
          Sides = 45
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'value'
        end
      end
    end
    object pnlVendasDaUltimaSemana: TPanel
      Left = 0
      Top = 238
      Width = 510
      Height = 220
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 401
      ExplicitWidth = 698
      ExplicitHeight = 317
      object pnlVendasDaUltimaSemana1: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 220
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 698
        ExplicitHeight = 317
        object char3: TDBChart
          Left = 0
          Top = 0
          Width = 510
          Height = 220
          Title.Text.Strings = (
            'Vendas da '#218'ltima Semana')
          Chart3DPercent = 11
          View3DOptions.Elevation = 360
          View3DOptions.HorizOffset = 41
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 10
          View3DOptions.Rotation = 360
          View3DOptions.VertOffset = 1
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          ExplicitWidth = 397
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series3: TFastLineSeries
            DataSource = DTMGrafico.QryVendasUltimasSemanas
            SeriesColor = clBlack
            Title = 'VendasDaUltimaSemana'
            XLabelsSource = 'label'
            LinePen.Width = 0
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'Value'
          end
        end
      end
    end
  end
end
