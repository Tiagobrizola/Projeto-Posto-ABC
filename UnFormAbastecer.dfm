object FrmAbastecimento: TFrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Lan'#231'ar abastecimento'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 125
    Top = 99
    Width = 93
    Height = 13
    Caption = 'Selecione a bomba:'
  end
  object Label2: TLabel
    Left = 117
    Top = 126
    Width = 101
    Height = 13
    Caption = 'Quantidade de litros:'
  end
  object Label3: TLabel
    Left = 165
    Top = 208
    Width = 53
    Height = 13
    Caption = 'Valor total:'
  end
  object Label4: TLabel
    Left = 118
    Top = 72
    Width = 100
    Height = 13
    Caption = 'Data abastecimento:'
  end
  object Label5: TLabel
    Left = 150
    Top = 154
    Width = 68
    Height = 13
    Caption = 'Valor por litro:'
  end
  object Label6: TLabel
    Left = 150
    Top = 181
    Width = 68
    Height = 13
    Caption = 'Valor imposto:'
  end
  object Label7: TLabel
    Left = 336
    Top = 184
    Width = 27
    Height = 13
    Caption = '13%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtQtdLitros: TEdit
    Left = 224
    Top = 123
    Width = 102
    Height = 21
    TabOrder = 2
    Text = '0,00'
    OnExit = EdtQtdLitrosExit
  end
  object EdtVlrTotal: TEdit
    Left = 224
    Top = 205
    Width = 102
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object ControlBar1: TControlBar
    Left = 535
    Top = 0
    Width = 100
    Height = 299
    Align = alRight
    TabOrder = 6
    object BtnSalvar: TButton
      Left = 11
      Top = 2
      Width = 83
      Height = 48
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
    object BtnSair: TButton
      Left = 11
      Top = 54
      Width = 83
      Height = 48
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object DtData: TDateTimePicker
    Left = 224
    Top = 69
    Width = 145
    Height = 21
    Date = 44829.414800324080000000
    Time = 44829.414800324080000000
    Enabled = False
    TabOrder = 0
  end
  object EdtVlrLitro: TEdit
    Left = 224
    Top = 151
    Width = 102
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object CbBomba: TComboBox
    Left = 224
    Top = 96
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 1
    OnChange = CbBombaChange
  end
  object EdtVlrImposto: TEdit
    Left = 224
    Top = 178
    Width = 102
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object FDQuery1: TFDQuery
    Left = 472
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 480
    Top = 120
  end
end
