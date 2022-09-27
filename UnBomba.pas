unit UnBomba;

interface

uses
  FireDAC.Comp.Client, UnConexaoDm;

type
  TBomba = class
  private
    FNome: String;
    FTanque: String;
    FValorLitro: Currency;
    // FDmConexao: TDmConexao;
    FSqlConexao: TFDConnection;
    procedure SetNome(const Value: String);
    procedure SetTanque(const Value: String);
    procedure SetValorLitro(const Value: Currency);
    // function GetDmConexao: TDmConexao;

  public
    property Nome: String read FNome write SetNome;
    property Tanque: String read FTanque write SetTanque;
    property ValorLitro: Currency read FValorLitro write SetValorLitro;
    property SqlConexao: TFDConnection read FSqlConexao write FSqlConexao;
    // Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
    Procedure Cadastrar;

  end;

implementation

Uses
  System.SysUtils, Vcl.Dialogs;

{ TBomba }

procedure TBomba.Cadastrar;
var
  LQuery: TFDQuery;
begin
  try
    try
      LQuery := TFDQuery.Create(nil);
      LQuery.Connection := SqlConexao;
      LQuery.SQL.Add
        ('INSERT INTO ABC_BOMBA (ID_BOMBA, NOME_BOMBA, TANQUE, VALOR_LITRO)');
      LQuery.SQL.Add
        ('     VALUES (GEN_ID(GN_ABC_BOMBA, 1), :Nome, :Tanque, :Valor)');

      LQuery.ParamByName('Nome').AsString := Nome;
      LQuery.ParamByName('Tanque').AsString := Tanque;
      LQuery.ParamByName('Valor').AsCurrency := ValorLitro;
      SqlConexao.StartTransaction;
      LQuery.ExecSQL;
    finally
      SqlConexao.Commit;
      FreeAndNil(LQuery);
    end;
  Except
    On E: Exception Do
    Begin
      SqlConexao.Rollback;
      ShowMessage('Não foi possível inserir os dados na tabela.' + sLineBreak +
        'Erro: ' + E.Message);
    End;
  end;
end;

procedure TBomba.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TBomba.SetTanque(const Value: String);
begin
  FTanque := Value;
end;

procedure TBomba.SetValorLitro(const Value: Currency);
begin
  FValorLitro := Value;
end;

end.
