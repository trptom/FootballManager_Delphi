unit ContentPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  CContentPanel = class(TPanel)
  public
    constructor create(AOwner: TForm);
  end;

implementation

constructor CContentPanel.create(AOwner: TForm);
begin
  inherited create(AOwner);

  Self.Anchors := [akTop, akLeft, akRight, akBottom];
  Self.Width := AOwner.ClientWidth;
  Self.Height := AOwner.ClientHeight;
end;

end.
