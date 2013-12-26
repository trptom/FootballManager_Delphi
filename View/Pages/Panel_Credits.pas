unit Panel_Credits;

interface

uses
  Forms, Classes, StdCtrls, Controls, Dialogs, ExtCtrls,

  _Utils, _Constants,

  Component_PagePanel, Component_Button;

type
  TPanel_Credits = class(TPagePanel)
    label_title: TLabel;
    but_mainMenu: TFMButton;
  public
    constructor create(AOwner: TForm);
  end;

implementation

constructor TPanel_Credits.create(AOwner: TForm);
begin
  inherited create(AOwner, 'bg1.jpg');

  Self.label_title := TLabel.Create(Self);
  Self.label_title.Caption := 'Autoøi hry';
  Self.label_title.Left := 0;
  Self.label_title.Top := 0;
  Self.label_title.Width := Self.Width;
  Self.label_title.Anchors := [akLeft, akTop, akRight];
  Self.label_title.Font := FONT_H1;
  Self.label_title.Align := alRight;
  Self.label_title.Transparent := true;

  Self.but_mainMenu := TFMButton.create(Self, 'Zpìt');
  Self.but_mainMenu.Left := Self.Width-10-Self.but_mainMenu.Width;
  Self.but_mainMenu.Top := Self.Height-10-Self.but_mainMenu.Height;
  Self.but_mainMenu.Anchors := [akRight, akBottom];

  Self.InsertControl(Self.label_title);
  Self.InsertControl(Self.but_mainMenu);
end;

end.
