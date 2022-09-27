unit UnComum;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls;

Procedure LimparCampos(Sender: TForm);

implementation

Procedure LimparCampos(Sender: TForm);
var
  i: integer;
begin
  for i := 0 to Sender.ControlCount - 1 do
  begin
    if (Sender.Controls[i] is TEdit) then
      (Sender.Controls[i] as TEdit).Clear;

    //if (Sender.Controls[i] is TComboBox) then
    //  (Sender.Controls[i] as TComboBox).Clear;
  end;

end;

end.
