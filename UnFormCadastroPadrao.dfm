object FormCadastroPadrao: TFormCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'FormCadastroPadrao'
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
  object ControlBar1: TControlBar
    Left = 535
    Top = 0
    Width = 100
    Height = 299
    Align = alRight
    TabOrder = 0
    object BtnSalvar: TButton
      Left = 11
      Top = 2
      Width = 83
      Height = 48
      Caption = 'Salvar'
      TabOrder = 0
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
end
