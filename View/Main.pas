unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,

  Utils,

  World, Continent, State,
  DataController, ExtCtrls,

  PagePanel, Panel_MainMenu, Panel_Examples, SelectTeamPanel;

type
  TScreens = record
    mainMenu: TPanel_MainMenu;

    examples: TPanel_Examples;
  end;

  TMainForm = class(TForm)
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
  removeAllControls(Self);
  Self.InsertControl(screen);
end;

end.
