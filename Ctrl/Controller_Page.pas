unit Controller_Page;

interface

uses Main, Dialogs, SysUtils,

  Controller,

  Component_PagePanel,

  Panel_MainMenu, Panel_Credits, Panel_Intro, Panel_Examples;

type
  TPageController = class(TController)
  public
    class function createPage:TPagePanel; virtual; abstract;
  end;

  TPageController_Intro = class(TPageController)
  private
    procedure panel_click(Sender: TObject);
  public
    function createPage:TPanel_Intro; virtual;
  end;

  TPageController_MainMenu = class(TPageController)
  private
    procedure but_newGame_click(Sender: TObject);
    procedure but_loadGame_click(Sender: TObject);
    procedure but_credits_click(Sender: TObject);
  public
    function createPage:TPanel_MainMenu; virtual;
  end;

  TPageController_Credits = class(TPageController)
  private
    procedure but_mainMenu_click(Sender: TObject);
  public
    function createPage:TPanel_Credits; virtual;
  end;

var
  PageController_MainMenu: TPageController_MainMenu;
  PageController_Credits: TPageController_Credits;
  PageController_Intro: TPageController_Intro;

implementation

procedure TPageController_Intro.panel_click(Sender: TObject);
begin
  SCREENS.intro.stop;
  MainForm.setScreen(SCREENS.mainMenu);
end;

function TPageController_Intro.createPage:TPanel_Intro;
begin
  result := TPanel_Intro.create(MainForm);
  result.OnClick := Self.panel_click;
end;

{------------------------------------------------------------------------------}

procedure TPageController_MainMenu.but_newGame_click(Sender: TObject);
begin
  Self.setScreen(SCREENS.examples);
end;

procedure TPageController_MainMenu.but_loadGame_click(Sender: TObject);
begin
  Self.setScreen(SCREENS.examples);
end;

procedure TPageController_MainMenu.but_credits_click(Sender: TObject);
begin
  Self.setScreen(SCREENS.credits);
end;

function TPageController_MainMenu.createPage:TPanel_MainMenu;
begin
  result := TPanel_MainMenu.create(MainForm);
  result.but_newGame.OnClick := Self.but_newGame_click;
  result.but_loadGame.OnClick := Self.but_loadGame_click;
  result.but_credits.OnClick := Self.but_credits_click;
end;

{------------------------------------------------------------------------------}

procedure TPageController_Credits.but_mainMenu_click(Sender: TObject);
begin
  MainForm.setScreen(SCREENS.mainMenu);
end;

function TPageController_Credits.createPage:TPanel_Credits;
begin
  result := TPanel_Credits.create(MainForm);
  result.but_mainMenu.OnClick := Self.but_mainMenu_click;
end;

{------------------------------------------------------------------------------}

begin
  PageController_MainMenu := TPageController_MainMenu.Create;
  PageController_Credits := TPageController_Credits.Create;
  PageController_Intro := TPageController_Intro.Create;
end.

