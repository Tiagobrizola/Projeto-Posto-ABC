unit UnFormAbastecer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Comp.DataSet, UnConexaoDm,
  Vcl.ComCtrls, Vcl.ExtCtrls, DBXCommon, sqlExpr;

type
  TFrmAbastecimento = class(TForm)
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    EdtQtdLitros: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtVlrTotal: TEdit;
    ControlBar1: TControlBar;
    BtnSalvar: TButton;
    DtData: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    EdtVlrLitro: TEdit;
    CbBomba: TComboBox;
    EdtVlrImposto: TEdit;
    Label6: TLabel;
    BtnSair: TButton;
    Label7: TLabel;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CbBombaChange(Sender: TObject);
    procedure EdtQtdLitrosExit(Sender: TObject);
  private
    SqlConectionBD: TSQLConnection;
    FDmConexao: TDmConexao;
    function GetDmConexao: TDmConexao;
    { Private declarations }
  public
    { Public declarations }
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
  end;

  TCaptionHelper = record helper for TCaption
  private
    function ToCurrency: Currency;
  end;

var
  FrmAbastecimento: TFrmAbastecimento;

implementation

Uses
  UnAbastecer, UnComum;

{$R *.dfm}

procedure TFrmAbastecimento.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAbastecimento.BtnSalvarClick(Sender: TObject);
var
  LAbastecer: TAbastecer;
begin
  if CbBomba.ItemIndex < 0 then
  begin
    ShowMessage('Informe uma bomba para realizar o lançamento.');
    CbBomba.SetFocus;
    Exit;
  end;

  try
    LAbastecer := TAbastecer.Create;
    LAbastecer.SqlConexao := DmConexao.FDConnection;
    LAbastecer.Data := DtData.Date;
    LAbastecer.IdBomba := Integer(CbBomba.Items.Objects[CbBomba.ItemIndex]);
    LAbastecer.QtdLitros := EdtQtdLitros.Text.ToCurrency;
    LAbastecer.ValorImposto := EdtVlrImposto.Text.ToCurrency;
    LAbastecer.ValorTotal := EdtVlrTotal.Text.ToCurrency;
    LAbastecer.Abastecer;

    ShowMessage('Abastecimento realizado com sucesso.');

    LimparCampos(FrmAbastecimento);
  finally
    FreeAndNil(LAbastecer);
  end;

end;

procedure TFrmAbastecimento.CbBombaChange(Sender: TObject);
Const
  LSql = 'SELECT ABC_BOMBA.VALOR_LITRO ' + sLineBreak + '  FROM ABC_BOMBA ' +
    sLineBreak + ' WHERE ABC_BOMBA.ID_BOMBA = %0:d';
Var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(Nil);
  try
    LQuery.Connection := DmConexao.FDConnection;
    LQuery.Close;
    LQuery.SQL.Clear;
    LQuery.Open(Format(LSql,
      [Integer(CbBomba.Items.Objects[CbBomba.ItemIndex])]));

    EdtVlrLitro.Text := FormatCurr('##0.00', LQuery.FieldByName('VALOR_LITRO')
      .AsCurrency);
  finally
    FreeAndNil(LQuery);
  end;
end;

procedure TFrmAbastecimento.EdtQtdLitrosExit(Sender: TObject);
var
  LCalculoTotal: Currency;
begin
  LCalculoTotal := EdtQtdLitros.Text.ToCurrency * EdtVlrLitro.Text.ToCurrency;
  EdtVlrImposto.Text := FormatCurr('##0.00', LCalculoTotal * 13 / 100);
  LCalculoTotal := LCalculoTotal + (LCalculoTotal * 13 / 100);
  EdtVlrTotal.Text := FormatCurr('##0.00', LCalculoTotal);
end;

procedure TFrmAbastecimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // if Key IN [VK_DOWN, VK_RETURN] then
  perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmAbastecimento.FormShow(Sender: TObject);
begin
  CbBomba.SetFocus;
  DtData.Date := Date;
  FDQuery1.Connection := DmConexao.FDConnection;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  try
    try
      DmConexao.FDConnection.StartTransaction;
      FDQuery1.Open('SELECT * FROM ABC_BOMBA');
    finally
      DmConexao.FDConnection.Commit;
    end;

    if FDQuery1.IsEmpty then
    begin
      ShowMessage
        ('Não existem bombas cadastradas, faça o cadastro de uma bomba.');
      Close;
    end;

  except
    On E: Exception Do
    Begin
      DmConexao.FDConnection.Rollback;
      ShowMessage(E.Message);
    End;
  end;

  while not FDQuery1.Eof do
  begin
    CbBomba.Items.AddObject(FDQuery1.FieldByName('NOME_BOMBA').AsString,
      TObject(FDQuery1.FieldByName('ID_BOMBA').AsInteger));
    FDQuery1.Next;
  end;

end;

function TFrmAbastecimento.GetDmConexao: TDmConexao;
begin
  if not Assigned(FDmConexao) then
    FDmConexao := TDmConexao.Create(Self);

  Result := FDmConexao;
end;

{ TCaptionHelper }

function TCaptionHelper.ToCurrency: Currency;
begin
  Result := StrToCurr(Self);
end;

end.
