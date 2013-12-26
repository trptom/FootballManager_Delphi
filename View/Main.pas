unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,

  Utils,

  World, Continent, State,
  DataController, ExtCtrls,

  PagePanel, Panel_MainMenu, Panel_Examples, Panel_Credits, Panel_GameSettings,
  Panel_Intro,
  SelectTeamPanel, MPlayer;

type
  TScreens = record
    intro: TPanel_Intro;
    mainMenu: TPanel_MainMenu;
    credits: TPanel_Credits;
    gameSettings: TPanel_GameSettings;

    examples: TPanel_Examples;
  end;

  TMainForm = class(TForm)
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure setScreen(screen: TPagePanel);
  end;

var
  MainForm: TMainForm;
  SCREENS: TScreens;

implementation

{$R *.dfm}

procedure TMainForm.setScreen(screen: TPagePanel);
begin
  // callback - before
  screen.beforeShow();

  // hide old
  hideAllControls(Self);

  // show new
  screen.Visible := true;

  // callback - after
  screen.afterShow();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := true;
end;

end.
