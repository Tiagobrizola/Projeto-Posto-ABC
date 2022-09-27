inherited FormCadastroBombas: TFormCadastroBombas
  Caption = 'Cadastrar bombas'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblTanque: TLabel [0]
    Left = 128
    Top = 43
    Width = 40
    Height = 13
    Caption = 'Tanque:'
  end
  object LblNomeBomba: TLabel [1]
    Left = 102
    Top = 71
    Width = 66
    Height = 13
    Caption = 'Nome bomba:'
  end
  object LblVlrLitro: TLabel [2]
    Left = 119
    Top = 99
    Width = 49
    Height = 13
    Caption = 'Valor litro:'
  end
  inherited ControlBar1: TControlBar
    inherited BtnSalvar: TButton
      OnClick = BtnSalvarClick
    end
  end
  object CbTanque: TComboBox
    Left = 173
    Top = 40
    Width = 188
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 1
    Items.Strings = (
      'Tanque 1 Gasolina'
      'Tanque 2 Diesel')
  end
  object EdtNomeBomba: TEdit
    Left = 173
    Top = 68
    Width = 188
    Height = 21
    TabOrder = 2
  end
  object EdtVlrLitro: TEdit
    Left = 173
    Top = 96
    Width = 76
    Height = 21
    TabOrder = 3
    Text = '0,00'
  end
end
