object FrmPostoABC: TFrmPostoABC
  Left = 0
  Top = 0
  Caption = 'Controle de abastecimentos'
  ClientHeight = 459
  ClientWidth = 635
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 560
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Bomba1: TMenuItem
        Action = act_cadastroBomba
      end
    end
    object Lanamento1: TMenuItem
      Caption = 'Lan'#231'amento'
      object Lanarabastecimento1: TMenuItem
        Action = act_abastecimento
      end
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      object Imprimirrelatrio1: TMenuItem
        Action = act_imprimir
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object ActionList1: TActionList
    Left = 568
    Top = 80
    object act_abastecimento: TAction
      Caption = 'Lan'#231'ar abastecimento'
      OnExecute = act_abastecimentoExecute
    end
    object act_cadastroBomba: TAction
      Caption = 'Cadastro bomba'
      OnExecute = act_cadastroBombaExecute
    end
    object act_imprimir: TAction
      Caption = 'Imprimir relat'#243'rio'
      OnExecute = act_imprimirExecute
    end
  end
  object FDQuery1: TFDQuery
    Left = 560
    Top = 152
  end
end
