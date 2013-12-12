unit Panel_MainMenu;

interface

uses
  Forms, Classes, StdCtrls,

  PagePanel;

type
  TPanel_MainMenu = class(TPagePanel)
  public
    but_newGame: TButton;
    but_loadGame: TButton;
    but_credits: TButton;

    constructor create(AOwner: TForm);
  end;

implementation

constructor TPanel_MainMenu.create(AOwner: TForm);
begin
  inherited create(AOwner);

  Self.but_newGame := TButton.create(Self);
  Self.but_loadGame := TButton.create(Self);
  Self.but_credits := TButton.create(Self);

  Self.InsertControl(Self.but_newGame);
  Self.InsertControl(Self.but_loadGame);
  Self.InsertControl(Self.but_credits);

  Self.but_newGame.Left := 50;
  Self.but_newGame.Top := 50;
  Self.but_newGame.Width := 200;
  Self.but_newGame.Height := 50;
  Self.but_newGame.Anchors := [];
  Self.but_newGame.Caption := 'Nov8 hra';

  Self.but_loadGame.Left := 50;
  Self.but_loadGame.Top := 150;
  Self.but_loadGame.Width := 200;
  Self.but_loadGame.Height := 50;
  Self.but_loadGame.Anchors := [];
  Self.but_loadGame.Caption := 'Nahr�t hru';

  Self.but_credits.Left := 50;
  Self.but_credits.Top := 250;
  Self.but_credits.Width := 200;
  Self.but_credits.Height := 50;
  Self.but_credits.Anchors := [];
  Self.but_credits.Caption := 'Credits';
end;

end.
