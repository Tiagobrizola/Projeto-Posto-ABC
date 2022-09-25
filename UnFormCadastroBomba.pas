unit UnFormCadastroBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UnConexaoDm, Vcl.ExtCtrls;

type
  TFrmCadastroBomba = class(TForm)
    CbTanque: TComboBox;
    LblTanque: TLabel;
    LblNomeBomba: TLabel;
    EdtNomeBomba: TEdit;
    LblVlrLitro: TLabel;
    EdtVlrLitro: TEdit;
    ControlBar1: TControlBar;
    BtnSalvar: TButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDmConexao: TDmConexao;
    function GetDmConexao: TDmConexao;
    { Private declarations }
  public
    { Public declarations }
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
  end;

var
  FrmCadastroBomba: TFrmCadastroBomba;

implementation

uses
  UnBomba;

{$R *.dfm}

procedure TFrmCadastroBomba.BtnSalvarClick(Sender: TObject);
var
  LBomba: TBomba;
begin
  try
    LBomba := TBomba.Create;
    LBomba.SqlConexao := DmConexao.FDConnection;
    LBomba.Nome := EdtNomeBomba.Text;
    LBomba.ValorLitro := StrToCurr(EdtVlrLitro.Text);
    LBomba.Tanque := CbTanque.Text;
    LBomba.Cadastrar;

    ShowMessage('Cadastro realizado com sucesso.');

    EdtNomeBomba.Clear;
    EdtVlrLitro.Clear;
    CbTanque.Clear;
  finally
    FreeAndNil(LBomba);
  end;
end;

procedure TFrmCadastroBomba.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL, 0, 0);
end;

function TFrmCadastroBomba.GetDmConexao: TDmConexao;
begin
  if not Assigned(FDmConexao) then
    FDmConexao := TDmConexao.Create(Self);

  Result := FDmConexao;
end;

end.
