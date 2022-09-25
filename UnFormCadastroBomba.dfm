object FrmCadastroBomba: TFrmCadastroBomba
  Left = 0
  Top = 0
  Caption = 'Cadastrar bomba'
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
  PixelsPerInch = 96
  TextHeight = 13
  object LblTanque: TLabel
    Left = 128
    Top = 43
    Width = 40
    Height = 13
    Caption = 'Tanque:'
  end
  object LblNomeBomba: TLabel
    Left = 102
    Top = 71
    Width = 66
    Height = 13
    Caption = 'Nome bomba:'
  end
  object LblVlrLitro: TLabel
    Left = 119
    Top = 99
    Width = 49
    Height = 13
    Caption = 'Valor litro:'
  end
  object CbTanque: TComboBox
    Left = 173
    Top = 40
    Width = 188
    Height = 21
    TabOrder = 0
    Items.Strings = (
      'Tanque 1 Gasolina'
      'Tanque 2 Diesel')
  end
  object EdtNomeBomba: TEdit
    Left = 173
    Top = 68
    Width = 188
    Height = 21
    TabOrder = 1
  end
  object EdtVlrLitro: TEdit
    Left = 173
    Top = 96
    Width = 76
    Height = 21
    TabOrder = 2
  end
  object ControlBar1: TControlBar
    Left = 535
    Top = 0
    Width = 100
    Height = 299
    Align = alRight
    TabOrder = 3
    object BtnSalvar: TButton
      Left = 11
      Top = 2
      Width = 83
      Height = 48
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
  end
end
