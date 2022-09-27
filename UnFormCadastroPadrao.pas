unit UnFormCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UnConexaoDm;

type
  TFormCadastroPadrao = class(TForm)
    ControlBar1: TControlBar;
    BtnSalvar: TButton;
    BtnSair: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
  private
    FDmConexao: TDmConexao;
    function GetDmConexao: TDmConexao;
    { Private declarations }
  public
    { Public declarations }
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
    Procedure SalvarAlteracoes; Virtual;
  end;

var
  FormCadastroPadrao: TFormCadastroPadrao;

implementation

{$R *.dfm}

uses UnComum;

procedure TFormCadastroPadrao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // if Key in [VK_DOWN, VK_RETURN] then
    perform(WM_NEXTDLGCTL, 0, 0);
end;

function TFormCadastroPadrao.GetDmConexao: TDmConexao;
begin
  if not Assigned(FDmConexao) then
    FDmConexao := TDmConexao.Create(Self);

  Result := FDmConexao;
end;

procedure TFormCadastroPadrao.SalvarAlteracoes;
begin
  //Método virtual, é utilizado em outras Units (Pode ser sobrescrito nas classes filhas)
end;

end.
