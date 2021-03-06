unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MPlayer,

  _Utils, _Constants,

  Data_World, Data_Continent, Data_State,

  Controller_Data,

  Component_SelectTeamPanel, Component_PagePanel,

  Panel_MainMenu, Panel_Examples, Panel_Credits, Panel_GameSettings,
  Panel_Intro;

type
  TScreens = record
    intro: TPanel_Intro;
    mainMenu: TPanel_MainMenu;
    credits: TPanel_Credits;
    gameSettings: TPanel_GameSettings;

    examples: TPanel_Examples;
  end;

  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure setScreen(screen: TPagePanel);
  end;

var
  MainForm: TMainForm;
  SCREENS: TScreens;
  Fout: File of TContinent;

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
var
  wld: TWorld;
  cnt: TContinent;
  ctrl: TDataController;
  f: TextFile;
begin
end;

end.
