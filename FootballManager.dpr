program FootballManager;

uses
  Forms,
  SysUtils,
  Dialogs,
  Main in 'View\Main.pas' {MainForm},
  Data_World in 'Data\Data_World.pas',
  Data_State in 'Data\Data_State.pas',
  Data_League in 'Data\Data_League.pas',
  Data_Team in 'Data\Data_Team.pas',
  Data_Continent in 'Data\Data_Continent.pas',
  Data_Player in 'Data\Data_Player.pas',
  Data_IDEntity in 'Data\Data_IDEntity.pas',
  Data_Serializable in 'Data\Data_Serializable.pas',

  Controller in 'Ctrl\Controller.pas',
  Controller_Data in 'Ctrl\Controller_Data.pas',
  Controller_Page in 'Ctrl\Controller_Page.pas',

  _Utils in 'Util\_Utils.pas',
  _Constants in 'Util\_Constants.pas',

  Panel_MainMenu in 'View\Pages\Panel_MainMenu.pas',
  Panel_GameSettings in 'View\Pages\Panel_GameSettings.pas',
  Panel_Credits in 'View\Pages\Panel_Credits.pas',
  Panel_Examples in 'View\Pages\Panel_Examples.pas',
  Panel_Intro in 'View\Pages\Panel_Intro.pas',

  Component_PagePanel in 'View\Component\Component_PagePanel.pas',
  Component_GridPanel in 'View\Component\Component_GridPanel.pas',
  Component_SelectTeamPanel in 'View\Component\Component_SelectTeamPanel.pas',
  Component_Button in 'View\Component\Component_Button.pas',
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
