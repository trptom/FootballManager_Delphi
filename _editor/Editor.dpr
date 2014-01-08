program Editor;

uses
  Forms,
  Classes,
  Main in 'Main.pas' {MainForm},
  _Utils in '..\Util\_Utils.pas',
  _Constants in '..\Util\_Constants.pas',

  Data_Game in '..\Data\Data_Game.pas',
  Data_World in '..\Data\Data_World.pas',
  Data_State in '..\Data\Data_State.pas',
  Data_League in '..\Data\Data_League.pas',
  Data_Team in '..\Data\Data_Team.pas',
  Data_Continent in '..\Data\Data_Continent.pas',
  Data_Player in '..\Data\Data_Player.pas',
  Data_IDEntity in '..\Data\Data_IDEntity.pas',
  Data_Serializable in '..\Data\Data_Serializable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
