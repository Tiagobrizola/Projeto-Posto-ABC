object FrmImpressao: TFrmImpressao
  Left = 0
  Top = 0
  Caption = 'Imprimir relat'#243'rio'
  ClientHeight = 214
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 59
    Width = 86
    Height = 13
    Caption = 'Informe a bomba:'
  end
  object Label2: TLabel
    Left = 87
    Top = 86
    Width = 55
    Height = 13
    Caption = 'Data inicial:'
  end
  object Label3: TLabel
    Left = 250
    Top = 88
    Width = 26
    Height = 13
    Caption = 'Final:'
  end
  object ControlBar1: TControlBar
    Left = 477
    Top = 0
    Width = 100
    Height = 214
    Align = alRight
    TabOrder = 3
    object BtnImprimir: TButton
      Left = 11
      Top = 2
      Width = 83
      Height = 48
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = BtnImprimirClick
    end
    object BtnSair: TButton
      Left = 11
      Top = 54
      Width = 81
      Height = 48
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object DtDataInicial: TDateTimePicker
    Left = 148
    Top = 83
    Width = 93
    Height = 21
    Date = 44829.864889733800000000
    Time = 44829.864889733800000000
    TabOrder = 1
  end
  object DtDataFinal: TDateTimePicker
    Left = 280
    Top = 83
    Width = 93
    Height = 21
    Date = 44829.864889733800000000
    Time = 44829.864889733800000000
    TabOrder = 2
  end
  object CbBomba: TComboBox
    Left = 148
    Top = 56
    Width = 135
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
  end
end
