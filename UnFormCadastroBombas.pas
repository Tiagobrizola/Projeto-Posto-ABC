unit UnFormCadastroBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnFormCadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, UnConexaoDm;

type
  TFormCadastroBombas = class(TFormCadastroPadrao)
    LblTanque: TLabel;
    CbTanque: TComboBox;
    LblNomeBomba: TLabel;
    EdtNomeBomba: TEdit;
    EdtVlrLitro: TEdit;
    LblVlrLitro: TLabel;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SalvarAlteracoes; override;
  end;

  TCaptionHelper = record helper for TCaption
  private
    function ToCurrency: Currency;
  end;

var
  FormCadastroBombas: TFormCadastroBombas;

implementation

uses
  UnBomba, UnComum;

{$R *.dfm}

procedure TFormCadastroBombas.BtnSalvarClick(Sender: TObject);

begin
  inherited;
  SalvarAlteracoes;
end;

{ TCaptionHelper }

function TCaptionHelper.ToCurrency: Currency;
begin
  Result := StrToCurr(Self);
end;

procedure TFormCadastroBombas.FormShow(Sender: TObject);
begin
  inherited;
  CbTanque.SetFocus;
end;

procedure TFormCadastroBombas.SalvarAlteracoes;
var
  LBomba: TBomba;
begin
  inherited;
  try
    LBomba := TBomba.Create;
    LBomba.SqlConexao := DmConexao.FDConnection;
    LBomba.Nome := EdtNomeBomba.Text;
    LBomba.ValorLitro := EdtVlrLitro.Text.ToCurrency;
    LBomba.Tanque := CbTanque.Text;
    LBomba.Cadastrar;

    ShowMessage('Cadastro realizado com sucesso.');

    LimparCampos(FormCadastroBombas);
  finally
    FreeAndNil(LBomba);
  end;
end;

end.
