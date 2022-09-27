unit UnFormFiltroImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, UnConexaoDm;

type
  TFrmImpressao = class(TForm)
    Label1: TLabel;
    ControlBar1: TControlBar;
    BtnImprimir: TButton;
    DtDataInicial: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DtDataFinal: TDateTimePicker;
    CbBomba: TComboBox;
    BtnSair: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    FDmConexao: TDmConexao;
    function GetDmConexao: TDmConexao;
    Procedure SelecionarAbastecimentos;
    { Private declarations }
  public
    { Public declarations }
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;

  end;

var
  FrmImpressao: TFrmImpressao;

implementation

Uses
  FireDAC.Comp.Client, UnRelarioAbastecimento, Data.DB;

{$R *.dfm}

procedure TFrmImpressao.BtnImprimirClick(Sender: TObject);
begin
  FrmImprimirReport.DataInicial := DtDataInicial.Date;
  FrmImprimirReport.DataFinal := DtDataFinal.Date;
  FrmImprimirReport.IdBomba :=
    Integer(CbBomba.Items.Objects[CbBomba.ItemIndex]);
  SelecionarAbastecimentos;
  // FrmImprimirReport.Imprimir;
end;

procedure TFrmImpressao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpressao.FormShow(Sender: TObject);
var
  LQuery: TFDQuery;
begin
  DtDataInicial.Date := Date;
  DtDataFinal.Date := Date;

  try
    LQuery := TFDQuery.Create(Nil);
    LQuery.Connection := DmConexao.FDConnection;
    LQuery.Close;
    LQuery.SQL.Clear;

    LQuery.Open('SELECT * FROM ABC_BOMBA');

    while not LQuery.Eof do
    begin
      CbBomba.Items.AddObject(LQuery.FieldByName('NOME_BOMBA').AsString,
        TObject(LQuery.FieldByName('ID_BOMBA').AsInteger));
      LQuery.Next;
    end;
  finally
    FreeAndNil(LQuery);
  end;
end;

function TFrmImpressao.GetDmConexao: TDmConexao;
begin
  if not Assigned(FDmConexao) then
    FDmConexao := TDmConexao.Create(Self);

  Result := FDmConexao;
end;

procedure TFrmImpressao.SelecionarAbastecimentos;
const
  LSqlRelatorio = 'SELECT ABC_BOMBA.NOME_BOMBA, ' + sLineBreak +
    '       ABC_BOMBA.TANQUE, ' + sLineBreak + '       ABC_BOMBA.VALOR_LITRO, '
    + sLineBreak + '       ABC_ABASTECIMENTO.DATA, ' + sLineBreak +
    '       ABC_ABASTECIMENTO.QTD_LITRO, ' + sLineBreak +
    '       ABC_ABASTECIMENTO.VALOR, ' + sLineBreak +
    '       ABC_ABASTECIMENTO.VALOR_IMPOSTO, ' + sLineBreak +
    '       ABC_ABASTECIMENTO.VALOR_TOTAL ' + sLineBreak + '  FROM ABC_BOMBA ' +
    sLineBreak +
    ' INNER JOIN ABC_ABASTECIMENTO ON (ABC_BOMBA.ID_BOMBA = ABC_ABASTECIMENTO.ID_BOMBA) '
    + sLineBreak + ' WHERE ABC_BOMBA.ID_BOMBA = %0:d  ' + sLineBreak +
    '   AND ABC_ABASTECIMENTO.DATA BETWEEN %1:s AND %2:s ';
var
  LQuery: TFDQuery;
  LDataSource: TDataSource;
begin
  try
    LQuery := TFDQuery.Create(Nil);

    LDataSource := TDataSource.Create(Self);
    LDataSource.DataSet := LQuery;

    LQuery.Connection := DmConexao.FDConnection;
    LQuery.Close;
    LQuery.SQL.Clear;
    LQuery.Open(Format(LSqlRelatorio,
      [Integer(CbBomba.Items.Objects[CbBomba.ItemIndex]),
      QuotedStr(FormatDateTime('dd.mm.yyyy', DtDataInicial.Date)),
      QuotedStr(FormatDateTime('dd.mm.yyyy', DtDataFinal.Date))]));

    IF LQuery.RecordCount = 0 then
    begin
      ShowMessage('Não existem registros para exibir no relatório.');
      exit;
    end;

    FrmImprimirReport.RLReportAbastecimento.DataSource := LDataSource;
    FrmImprimirReport.Query := LQuery;

    FrmImprimirReport.RLReportAbastecimento.Preview();
  finally
    FreeAndNil(LQuery);
  end;
end;

end.
