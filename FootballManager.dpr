program FootballManager;

uses
  Forms,
  SysUtils,
  Dialogs,
  Main in 'View\Main.pas' {MainForm},
  World in 'Data\World.pas',
  State in 'Data\State.pas',
  League in 'Data\League.pas',
  Team in 'Data\Team.pas',
  Continent in 'Data\Continent.pas',
  Player in 'Data\Player.pas',
  Serializable in 'Data\Serializable.pas',
  DataController in 'Ctrl\DataController.pas',
  Utils in 'Util\Utils.pas',
  IDEntity in 'Data\IDEntity.pas',
  Panel_MainMenu in 'View\Pages\Panel_MainMenu.pas',
  PagePanel in 'View\Component\PagePanel.pas',
  GridPanel in 'View\Component\GridPanel.pas',
  Controller in 'Ctrl\Controller.pas',
  Panel_Examples in 'View\Pages\Panel_Examples.pas',
  Constants in 'Util\Constants.pas',
  SelectTeamPanel in 'View\Component\SelectTeamPanel.pas',
  PageController in 'Ctrl\PageController.pas',
  Panel_GameSettings in 'View\Pages\Panel_GameSettings.pas',
  Panel_Credits in 'View\Pages\Panel_Credits.pas',
  Component_Button in 'View\Component\Component_Button.pas',
  Panel_Intro in 'View\Pages\Panel_Intro.pas',
  WMP in 'Lib\WMP.pas';

{$R *.res}

procedure evt_introClick(Sender: TObject);
begin
end;

procedure initApp;
begin
  SCREENS.intro := PageController_Intro.createPage;
  SCREENS.mainMenu := PageController_MainMenu.createPage;
  SCREENS.credits := PageController_Credits.createPage;
  SCREENS.examples := TPanel_Examples.Create(MainForm);

  MainForm.InsertControl(SCREENS.intro);
  MainForm.InsertControl(SCREENS.mainMenu);
  MainForm.InsertControl(SCREENS.credits);
  MainForm.InsertControl(SCREENS.examples);

  if SCREENS.intro.introExists then begin
    MainForm.setScreen(SCREENS.intro);
    SCREENS.intro.play;
  end else begin
    MainForm.setScreen(SCREENS.mainMenu);
  end;
end;

begin
  Application.Initialize;
  Application.Title := 'TPS Soccer Manager';
  Application.CreateForm(TMainForm, MainForm);
  initApp;
  Application.Run;
end.
