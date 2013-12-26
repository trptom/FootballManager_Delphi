unit Panel_MainMenu;

interface

uses
  Forms, Classes, StdCtrls, Controls, ExtCtrls,

  _Utils,
  
  Component_PagePanel, Component_GridPanel;

type
  TPanel_MainMenu = class(TPagePanel)
  public
    panel_buttons: TGridPanel;

    but_newGame: TButton;
    but_loadGame: TButton;
    but_credits: TButton;

    constructor create(AOwner: TForm);
  end;

implementation

constructor TPanel_MainMenu.create(AOwner: TForm);
begin
  inherited create(AOwner, 'bg1.jpg');

  Self.panel_buttons := TGridPanel.create(Self, 3, 1);
  Self.but_newGame := TButton.create(Self.panel_buttons);
  Self.but_loadGame := TButton.create(Self.panel_buttons);
  Self.but_credits := TButton.create(Self.panel_buttons);

  Self.InsertControl(Self.panel_buttons);
  Self.panel_buttons.InsertControl(Self.but_newGame);
  Self.panel_buttons.InsertControl(Self.but_loadGame);
  Self.panel_buttons.InsertControl(Self.but_credits);

  setPercPositionInCtrl(Self.panel_buttons, 25, 40, 75, 60);
  Self.panel_buttons.Anchors := [];

  Self.but_newGame.Anchors := [];
  Self.but_newGame.Caption := 'Nová hra';

  Self.but_loadGame.Anchors := [];
  Self.but_loadGame.Caption := 'Nahrát hru';

  Self.but_credits.Anchors := [];
  Self.but_credits.Caption := 'Credits';
end;

end.
