unit UnPostoAbc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Data.SqlExpr,
  System.Actions, Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.FMTBcd, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPostoABC = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Lanamento1: TMenuItem;
    Bomba1: TMenuItem;
    Lanarabastecimento1: TMenuItem;
    ActionList1: TActionList;
    act_abastecimento: TAction;
    act_cadastroBomba: TAction;
    FDQuery1: TFDQuery;
    Imprimir1: TMenuItem;
    Sair1: TMenuItem;
    Imprimirrelatrio1: TMenuItem;
    act_imprimir: TAction;
    procedure act_abastecimentoExecute(Sender: TObject);
    procedure act_cadastroBombaExecute(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure act_imprimirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPostoABC: TFrmPostoABC;

implementation

Uses
  UnFormAbastecer, UnFormCadastroBombas, UnFormFiltroImpressao;

{$R *.dfm}

procedure TFrmPostoABC.act_abastecimentoExecute(Sender: TObject);
begin
  FrmAbastecimento.Show;
  // FDQuery1.Close;
  // FDQuery1.SQL.Clear;
  // FDQuery1.SQL.Add('SELECT * FROM ABC_BOMBA');
  // FDQuery1.Open('SELECT * FROM ABC_BOMBA');

  // ShowMessage(IntToStr(FDQuery1.RecordCount));

end;

procedure TFrmPostoABC.act_cadastroBombaExecute(Sender: TObject);
begin
  FormCadastroBombas.Show;
end;

procedure TFrmPostoABC.act_imprimirExecute(Sender: TObject);
begin
  FrmImpressao.Show;
end;


procedure TFrmPostoABC.Sair1Click(Sender: TObject);
begin
  FrmPostoABC.Close;
end;

end.
