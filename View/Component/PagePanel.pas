unit PagePanel;

interface

uses
  Forms, ExtCtrls, Classes, Controls;

type
  TPagePanel = class(TPanel)
    constructor create(AOwner: TForm);
  end;

implementation

constructor TPagePanel.create(AOwner: TForm);
begin
  inherited create(AOwner);

  Self.Anchors := [ akLeft, akTop, akRight, akBottom ];
  Self.Left := 0;
  Self.Top := 0;
  Self.Width := AOwner.ClientWidth;
  Self.Height := AOwner.ClientHeight;
end;

end.
