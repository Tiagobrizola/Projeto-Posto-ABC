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
    procedure BtnSalvarClick(Sender: TObject);
    procedure EdtQtdLitrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbBombaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    SqlConectionBD: TSQLConnection;
    FDmConexao: TDmConexao;
    function GetDmConexao: TDmConexao;
    { Private declarations }
  public
    { Public declarations }
    Property DmConexao: TDmConexao Read GetDmConexao write FDmConexao;
  end;

var
  FrmAbastecimento: TFrmAbastecimento;

implementation

Uses
  UnAbastecer;

{$R *.dfm}

procedure TFrmAbastecimento.BtnSalvarClick(Sender: TObject);
var
  LAbastecer: TAbastecer;
begin
  try
    LAbastecer := TAbastecer.Create;
    LAbastecer.SqlConexao := DmConexao.FDConnection;
    LAbastecer.Data := DtData.Date;
    LAbastecer.IdBomba := Integer(CbBomba.Items.Objects[CbBomba.ItemIndex]);
    LAbastecer.QtdLitros := StrToCurr(EdtQtdLitros.Text);
    LAbastecer.ValorImposto := StrToCurr(EdtVlrImposto.Text);
    LAbastecer.ValorTotal := StrToCurr(EdtVlrTotal.Text);
    LAbastecer.Abastecer;
  finally
    FreeAndNil(LAbastecer);
  end;

end;

procedure TFrmAbastecimento.CbBombaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Const
  LSql = 'SELECT ABC_BOMBA.VALOR_LITRO ' + sLineBreak + '  FROM ABC_BOMBA ' +
    sLineBreak + ' WHERE ABC_BOMBA.ID_BOMBA = %0:d';
Var
  LQuery: TFDQuery;
begin
  if Key in [VK_DOWN, VK_RETURN] then
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
      EdtQtdLitros.SetFocus;
    finally
      FreeAndNil(LQuery);
    end;
  end;
end;

procedure TFrmAbastecimento.EdtQtdLitrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LCalculoTotal: Currency;
begin
  if Key in [VK_DOWN, VK_RETURN] then
  begin
    LCalculoTotal := StrToCurr(EdtQtdLitros.Text) * StrToCurr(EdtVlrLitro.Text);
    EdtVlrImposto.Text := FormatCurr('##0.00', LCalculoTotal * 13 / 100);
    LCalculoTotal := LCalculoTotal + (LCalculoTotal * 13 / 100);
    EdtVlrTotal.Text := FormatCurr('##0.00', LCalculoTotal);
  end;
end;

procedure TFrmAbastecimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmAbastecimento.FormShow(Sender: TObject);
var
  LTrans: TDBXTransaction;
begin
  DtData.Date := Date;
  FDQuery1.Connection := DmConexao.FDConnection;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  // try
  try
    // LTrans := SqlConectionBD.BeginTransaction(TDBXIsolations.ReadCommitted);
    FDQuery1.Open('SELECT * FROM ABC_BOMBA');
  finally
    // SqlConectionBD.CommitFreeAndNil(LTrans);
  end;

  { except
    On E: Exception Do
    Begin
    SqlConectionBD.RollbackFreeAndNil(LTrans);
    ShowMessage(E.Message);

    End;
    end; }

  while not FDQuery1.Eof do
  begin
    // CbBomba.Items.Add(FDQuery1.FieldByName('NOME_BOMBA').AsString);
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

end.
