unit AutosizeTable;

interface

uses
  Classes, Grids, Utils;

type
  TAutosizeTable = class(TStringGrid)
    public
      constructor create(AOwner: TComponent; sizes: array of TWidth);
      procedure FormResize(Sender: TObject);
  end;

implementation

constructor TAutosizeTable.create(AOwner: TComponent; sizes: array of TWidth);
begin
  inherited create(AOwner);
  Self.OnResize := Self.FormResize;
end;

procedure TAutosizeTable.FormResize(Sender: TObject);
var
  a, avgWidth, lastWidth: integer;
begin
  avgWidth := round(Self.Width / Self.ColCount);

  for a := 1 to Self.ColCount do begin
    Self.ColWidths[a-1] := avgWidth;
  end;
end;

end.
