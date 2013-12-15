program FootballManager;

uses
  Forms,
  SysUtils,
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
  Panel_Examples in 'View\Pages\Panel_Examples.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
