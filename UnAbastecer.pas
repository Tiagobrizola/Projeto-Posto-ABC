unit UnAbastecer;

interface

uses
  FireDAC.Comp.Client;

type
  TAbastecer = class
  private
    FData: TDate;
    FIdBomba: Integer;
    FValorTotal: Currency;
    FQtdLitros: Currency;
    FSqlConexao: TFDConnection;
    FValorImposto: Currency;
    procedure SetData(const Value: TDate);
    procedure SetIdBomba(const Value: Integer);
    procedure SetQtdLitros(const Value: Currency);
    procedure SetValorTotal(const Value: Currency);
    procedure SetValorImposto(const Value: Currency);

  public
    property Data: TDate read FData write SetData;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property QtdLitros: Currency read FQtdLitros write SetQtdLitros;
    property ValorImposto: Currency read FValorImposto write SetValorImposto;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;
    property SqlConexao: TFDConnection read FSqlConexao write FSqlConexao;
    Procedure Abastecer;
  end;

implementation

Uses
  System.SysUtils;

{ TAbastecer }

procedure TAbastecer.Abastecer;
var
  LQuery: TFDQuery;
begin
  try
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := SqlConexao;
    LQuery.SQL.Add
      ('INSERT INTO ABC_ABASTECIMENTO (ID_ABASTECIMENTO, ID_BOMBA, DATA, QTD_LITRO, VALOR, VALOR_IMPOSTO, VALOR_TOTAL)');
    LQuery.SQL.Add
      (' VALUES (GEN_ID(gn_abc_abastecimento, 1), :IdBomba, :Data, :QtdLitro, :Valor, :VlrImposto, :VlrTotal)');

    LQuery.ParamByName('IdBomba').AsInteger := IdBomba;
    LQuery.ParamByName('Data').AsDate := Data;
    LQuery.ParamByName('QtdLitro').AsCurrency := QtdLitros;
    LQuery.ParamByName('Valor').AsCurrency := QtdLitros;
    LQuery.ParamByName('VlrImposto').AsCurrency := ValorImposto;
    LQuery.ParamByName('VlrTotal').AsCurrency := ValorTotal;
    LQuery.ExecSQL;
  finally
    FreeAndNil(LQuery);
  end;
end;

procedure TAbastecer.SetIdBomba(const Value: Integer);
begin
  FIdBomba := Value;
end;

procedure TAbastecer.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TAbastecer.SetQtdLitros(const Value: Currency);
begin
  FQtdLitros := Value;
end;

procedure TAbastecer.SetValorImposto(const Value: Currency);
begin
  FValorImposto := Value;
end;

procedure TAbastecer.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.
