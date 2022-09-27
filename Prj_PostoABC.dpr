program Prj_PostoABC;

uses
  Vcl.Forms,
  UnPostoAbc in 'UnPostoAbc.pas' {FrmPostoABC},
  UnFormAbastecer in 'UnFormAbastecer.pas' {FrmAbastecimento},
  UnBomba in 'UnBomba.pas',
  UnConexaoDm in 'UnConexaoDm.pas' {DmConexao: TDataModule},
  UnAbastecer in 'UnAbastecer.pas',
  UnRelarioAbastecimento in 'UnRelarioAbastecimento.pas' {FrmImprimirReport},
  UnFormFiltroImpressao in 'UnFormFiltroImpressao.pas' {FrmImpressao},
  UnComum in 'UnComum.pas',
  UnFormCadastroBombas in 'UnFormCadastroBombas.pas' {FormCadastroBombas},
  UnFormCadastroPadrao in 'UnFormCadastroPadrao.pas' {FormCadastroPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPostoABC, FrmPostoABC);
  Application.CreateForm(TFrmAbastecimento, FrmAbastecimento);
  Application.CreateForm(TFrmImprimirReport, FrmImprimirReport);
  Application.CreateForm(TFrmImpressao, FrmImpressao);
  Application.CreateForm(TFormCadastroPadrao, FormCadastroPadrao);
  //Application.CreateForm(TFormCadastroPadrao, FormCadastroPadrao);
  Application.CreateForm(TFormCadastroBombas, FormCadastroBombas);
  // Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
