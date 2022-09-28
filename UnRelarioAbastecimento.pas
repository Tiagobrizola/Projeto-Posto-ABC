unit UnRelarioAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnConexaoDm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TFrmImprimirReport = class(TForm)
    RLReportAbastecimento: TRLReport;
    RLBandCabecalho: TRLBand;
    RLDrawCabecalho: TRLDraw;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBandDados: TRLBand;
    RLDrawDados: TRLDraw;
    RLLabelData: TRLLabel;
    RLBandDatelhe: TRLBand;
    RLDraw1: TRLDraw;
    RLLabelTanque: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabelBomba: TRLLabel;
    RLLabel: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabelValor: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabelImposto: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabelTotal: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabelDtInicial: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabelDtFinal: TRLLabel;
    RLBand1: TRLBand;
    RLDraw2: TRLDraw;
    RLLabel8: TRLLabel;
    RLLabelTotalGeral: TRLLabel;
    procedure RLBandDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandDatelheBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandCabecalhoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FDataFinal: TDate;
    FDataInicial: TDate;
    FDmConexao: TDmConexao;
    FIdBomba: Integer;
    FQuery: TFDQuery;
    FIdTotalGeralRel: Currency;
    procedure SetDataFinal(const Value: TDate);
    procedure SetDataInicial(const Value: TDate);
    function GetDmConexao: TDmConexao;
    procedure SetIdBomba(const Value: Integer);
    procedure SetQuery(const Value: TFDQuery);
    procedure SetTotalGeralRel(const Value: Currency);
    { Private declarations }
  public
    { Public declarations }
    property DataInicial: TDate read FDataInicial write SetDataInicial;
    property DataFinal: TDate read FDataFinal write SetDataFinal;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property TotalGeralRel: Currency read FIdTotalGeralRel
      write SetTotalGeralRel;
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
    property Query: TFDQuery read FQuery write SetQuery;
  end;

var
  FrmImprimirReport: TFrmImprimirReport;

implementation

{$R *.dfm}
{ TForm1 }

function TFrmImprimirReport.GetDmConexao: TDmConexao;
begin
  if not Assigned(FDmConexao) then
    FDmConexao := TDmConexao.Create(Self);

  Result := FDmConexao;
end;

procedure TFrmImprimirReport.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelTotalGeral.Caption := FormatCurr('##0.00', TotalGeralRel);
  TotalGeralRel := 0;
end;

procedure TFrmImprimirReport.RLBandCabecalhoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelDtInicial.Caption := FormatDateTime('dd/mm/yyyy', DataInicial);
  RLLabelDtFinal.Caption := FormatDateTime('dd/mm/yyyy', DataFinal);
end;

procedure TFrmImprimirReport.RLBandDadosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelData.Caption := Query.FieldByName('DATA').AsString;
end;

procedure TFrmImprimirReport.RLBandDatelheBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelTanque.Caption := Query.FieldByName('TANQUE').AsString;
  RLLabelBomba.Caption := Query.FieldByName('NOME_BOMBA').AsString;

  RLLabelValor.Caption := FormatCurr('##0.00', Query.FieldByName('VALOR')
    .AsCurrency);
  RLLabelImposto.Caption := FormatCurr('##0.00',
    Query.FieldByName('VALOR_IMPOSTO').AsCurrency);
  RLLabelTotal.Caption := FormatCurr('##0.00', Query.FieldByName('VALOR_TOTAL')
    .AsCurrency);
  TotalGeralRel := TotalGeralRel + Query.FieldByName('VALOR_TOTAL').AsCurrency;
end;

procedure TFrmImprimirReport.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TFrmImprimirReport.SetDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TFrmImprimirReport.SetIdBomba(const Value: Integer);
begin
  FIdBomba := Value;
end;

procedure TFrmImprimirReport.SetQuery(const Value: TFDQuery);
begin
  FQuery := Value;
end;

procedure TFrmImprimirReport.SetTotalGeralRel(const Value: Currency);
begin
  FIdTotalGeralRel := Value;
end;

end.
