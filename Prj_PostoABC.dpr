program Prj_PostoABC;

uses
  Vcl.Forms,
  UnPostoAbc in 'UnPostoAbc.pas' {FrmPostoABC},
  UnFormCadastroBomba in 'UnFormCadastroBomba.pas' {FrmCadastroBomba},
  UnFormAbastecer in 'UnFormAbastecer.pas' {FrmAbastecimento},
  UnBomba in 'UnBomba.pas',
  UnConexaoDm in 'UnConexaoDm.pas' {DmConexao: TDataModule},
  UnAbastecer in 'UnAbastecer.pas',
  UnRelarioAbastecimento in 'UnRelarioAbastecimento.pas' {Form1},
  UnFormFiltroImpressao in 'UnFormFiltroImpressao.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPostoABC, FrmPostoABC);
  Application.CreateForm(TFrmCadastroBomba, FrmCadastroBomba);
  Application.CreateForm(TFrmAbastecimento, FrmAbastecimento);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  // Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
