unit GridPanel;

interface

uses
  Classes, ExtCtrls, Utils, Forms, Controls, Dialogs;

type
  TGridPanel = class(TPanel)
  private
    cols, rows: integer;

    procedure recount;
    procedure onResizeEvent(Sender: TObject); virtual;
  public
    constructor create(AOwner: TComponent; cols, rows: integer);
    procedure insertControl(AControl: TControl);
    procedure removeControl(AControl: TControl);
    procedure insertComponent(AComponent: TComponent);
    procedure removeComponent(AComponent: TComponent);
  end;

implementation

constructor TGridPanel.create(AOwner: TComponent; cols, rows: integer);
begin
  inherited create(AOwner);

  Self.cols := cols;
  Self.rows := rows;

  Self.BorderStyle := bsNone;
  
  Self.OnResize := Self.onResizeEvent;
//  Self.OnCo
end;

procedure TGridPanel.recount;
var
  id, a, b, w, h, endW, endH: integer;
begin
  w := round(100 / Self.cols);
  h := round(100 / Self.rows);

  for a := 1 to Self.rows do begin
    for b := 1 to Self.cols do begin
      id := ((a-1) * Self.cols) + b - 1;

      if Self.ControlCount >= id+1 then begin
        if (b = Self.cols) then begin
          endW := 100;
        end else begin
          endW := w*b;
        end;

        if (a = Self.rows) then begin
          endH := 100;
        end else begin
          endH := h*a;
        end;

        setPercPositionInCtrl(Self.Controls[id], w*(b-1), h*(a-1), endW, endH);
      end;
    end;
  end;
end;

procedure TGridPanel.onResizeEvent(Sender: TObject);
begin
  Self.recount;
end;

procedure TGridPanel.insertControl(AControl: TControl);
begin
  inherited insertControl(AControl);

  Self.recount;
end;

procedure TGridPanel.removeControl(AControl: TControl);
begin
  inherited removeControl(AControl);

  Self.recount;
end;

procedure TGridPanel.insertComponent(AComponent: TComponent);
begin
  inherited insertComponent(AComponent);

  Self.recount;
end;

procedure TGridPanel.removeComponent(AComponent: TComponent);
begin
  inherited removeComponent(AComponent);

  Self.recount;
end;

end.
