unit Panel_MainMenu;

interface

uses
  Forms, Classes, StdCtrls, Controls,
  Utils, ExtCtrls,
  
  PagePanel, GridPanel;

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

  Self.panel_buttons := TGridPanel.create(Self, 2, 2);
  Self.but_newGame := TButton.create(Self.panel_buttons);
  Self.but_loadGame := TButton.create(Self.panel_buttons);
  Self.but_credits := TButton.create(Self.panel_buttons);

  Self.InsertControl(Self.panel_buttons);
  Self.panel_buttons.InsertControl(Self.but_newGame);
  Self.panel_buttons.InsertControl(Self.but_loadGame);
  Self.panel_buttons.InsertControl(Self.but_credits);

  Self.panel_buttons.Left := 10;
  Self.panel_buttons.Top := 10;
  Self.panel_buttons.Width := Self.Width-20;
  Self.panel_buttons.Height := Self.Height-20;
  Self.panel_buttons.Anchors := [ akLeft, akTop, akRight, akBottom ];

  {Self.but_newGame.Left := 50;
  Self.but_newGame.Top := 50;
  Self.but_newGame.Width := 200;
  Self.but_newGame.Height := 50;
  setPercPositionInCtrl(Self.but_newGame, 25, 25, 25, 25);}
  Self.but_newGame.Anchors := [];
  Self.but_newGame.Caption := 'Nová hra';

  {Self.but_loadGame.Left := 50;
  Self.but_loadGame.Top := 150;
  Self.but_loadGame.Width := 200;
  Self.but_loadGame.Height := 50;}
  Self.but_loadGame.Anchors := [];
  Self.but_loadGame.Caption := 'Nahrát hru';

  {Self.but_credits.Left := 50;
  Self.but_credits.Top := 250;
  Self.but_credits.Width := 200;
  Self.but_credits.Height := 50;}
  Self.but_credits.Anchors := [];
  Self.but_credits.Caption := 'Credits';
end;

end.
