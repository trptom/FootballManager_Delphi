unit _Utils;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Dialogs;

const
  Width_valueType_perc = 0;
  Width_valueType_abs = 1;

type
  PWidth = ^TWidth;
  TWidth = record
    value: double;
    valueType: integer;
  end;

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);
procedure setPercPositionInCtrl(component: TControl; left,top,left2,top2: integer);
function removeAllControls(component: TWinControl): integer;
procedure hideAllControls(component: TWinControl);
procedure EnDecryptFile(pathin, pathout: string; Chave: Word);

implementation

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);
begin
   ListOfStrings.clear;
   ListOfStrings.delimiter     := delimiter;
   ListOfStrings.delimitedText := str;
end;

procedure setPercPositionInCtrl(component: TControl; left,top,left2,top2: integer);
var w,h:integer;
begin
  if component.Owner is TWinControl then begin
    w := TPanel(component.Owner).Width;
    h := TPanel(component.Owner).Height;

    component.Left := round(w * (left/100));
    component.Top := round(h * (top/100));
    component.Width := round(w * (left2/100)) - component.Left;
    component.Height := round(h * (top2/100)) - component.Top;
  end else begin
    // TODO exception  
  end;
end;

function removeAllControls(component: TWinControl): integer;
var
  removed: integer;
begin
  removed := 0;
  while component.ControlCount > 0 do begin
    component.RemoveControl(component.Controls[0]);
    removed := removed + 1;
  end;
  result := removed;
end;

procedure hideAllControls(component: TWinControl);
var
  a: integer;
begin
  for a := 1 to component.ControlCount do begin
    component.Controls[a-1].Visible := false;
  end;
end;

procedure EnDecryptFile(pathin, pathout: string; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  cnt: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;
  try
    InMS.LoadFromFile(pathin) ;
    InMS.Position := 0;
    for cnt := 0 to InMS.Size - 1 do
      begin
        InMS.Read(C, 1) ;
        C := (C xor not (ord(chave shr cnt))) ;
        OutMS.Write(C, 1) ;
      end;
    OutMS.SaveToFile(pathout) ;
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

end.
