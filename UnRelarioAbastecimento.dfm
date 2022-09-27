object FrmImprimirReport: TFrmImprimirReport
  Left = 0
  Top = 0
  Caption = 'Imprimir relat'#243'rio'
  ClientHeight = 662
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportAbastecimento: TRLReport
    Left = 40
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBandCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btTitle
      object RLDrawCabecalho: TRLDraw
        Left = 3
        Top = 16
        Width = 712
        Height = 48
      end
      object RLLabel1: TRLLabel
        Left = 104
        Top = 24
        Width = 497
        Height = 32
        Caption = 'Relat'#243'rio abastecimento - Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 120
      DataFields = 'DATA'
      object RLBandDados: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 49
        BandType = btHeader
        BeforePrint = RLBandDadosBeforePrint
        object RLDrawDados: TRLDraw
          Left = 3
          Top = 16
          Width = 712
          Height = 26
        end
        object RLLabelData: TRLLabel
          Left = 166
          Top = 21
          Width = 78
          Height = 16
        end
        object RLLabel3: TRLLabel
          Left = 33
          Top = 21
          Width = 126
          Height = 16
          Caption = 'Abastecimento dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBandDatelhe: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 68
        BeforePrint = RLBandDatelheBeforePrint
        object RLDraw1: TRLDraw
          Left = 3
          Top = 2
          Width = 712
          Height = 63
        end
        object RLLabelTanque: TRLLabel
          Left = 142
          Top = 16
          Width = 93
          Height = 16
        end
        object RLLabel4: TRLLabel
          Left = 80
          Top = 16
          Width = 56
          Height = 16
          Caption = 'Tanque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 280
          Top = 16
          Width = 53
          Height = 16
          Caption = 'Bomba:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelBomba: TRLLabel
          Left = 341
          Top = 16
          Width = 92
          Height = 16
        end
        object RLLabel: TRLLabel
          Left = 94
          Top = 40
          Width = 42
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = -314
          Top = 248
          Width = 58
          Height = 16
        end
        object RLLabelValor: TRLLabel
          Left = 142
          Top = 40
          Width = 81
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 237
          Top = 40
          Width = 96
          Height = 16
          Caption = 'Valor imposto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelImposto: TRLLabel
          Left = 344
          Top = 40
          Width = 97
          Height = 16
        end
        object RLLabel7: TRLLabel
          Left = 480
          Top = 40
          Width = 40
          Height = 16
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabelTotal: TRLLabel
          Left = 526
          Top = 40
          Width = 79
          Height = 16
        end
      end
    end
    object RLBandRodapé: TRLBand
      Left = 38
      Top = 233
      Width = 718
      Height = 56
      BeforePrint = RLBandRodapéBeforePrint
      object RLDraw2: TRLDraw
        Left = 3
        Top = 5
        Width = 712
        Height = 48
      end
      object RLLabel8: TRLLabel
        Left = 343
        Top = 24
        Width = 177
        Height = 16
        Caption = 'Valor total abastecimentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelTotalGeral: TRLLabel
        Left = 526
        Top = 24
        Width = 110
        Height = 16
      end
    end
  end
end
