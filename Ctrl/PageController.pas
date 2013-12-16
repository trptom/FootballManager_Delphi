unit PageController;

interface

uses Main, Controller, PagePanel, Dialogs,
  Panel_MainMenu;

type
  TPageController = class(TController)
  public
    class function createPage:TPagePanel; virtual; abstract;
  end;

  TPageController_MainMenu = class(TPageController)
  private
    procedure but_newGame_click(Sender: TObject);
    procedure but_loadGame_click(Sender: TObject);
    procedure but_credits_click(Sender: TObject);
  public
    function createPage:TPanel_MainMenu; virtual;
  end;

var
  PageController_MainMenu: TPageController_MainMenu;

implementation

procedure TPageController_MainMenu.but_newGame_click(Sender: TObject);
begin
  Self.setScreen(SCREENS.examples);
end;

procedure TPageController_MainMenu.but_loadGame_click(Sender: TObject);
begin
end;

procedure TPageController_MainMenu.but_credits_click(Sender: TObject);
begin
end;

function TPageController_MainMenu.createPage:TPanel_MainMenu;
begin
  result := TPanel_MainMenu.create(MainForm);
  result.but_newGame.OnClick := Self.but_newGame_click;
  result.but_loadGame.OnClick := Self.but_loadGame_click;
  result.but_credits.OnClick := Self.but_credits_click;
end;

begin
  PageController_MainMenu := TPageController_MainMenu.Create;
end.
