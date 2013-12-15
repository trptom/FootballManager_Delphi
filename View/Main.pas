unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,

  Utils,

  World, Continent, State,
  DataController, ExtCtrls,

  PagePanel, Panel_MainMenu;

type
  TScreens = record
    mainMenu: TPanel_MainMenu;
  end;

  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

    procedure initScreens;
  public
    screens: TScreens;

    procedure setScreen(screen: TPagePanel);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.initScreens;

  Self.setScreen(Self.screens.mainMenu);
end;

procedure TMainForm.initScreens;
begin
  Self.screens.MainMenu := TPanel_MainMenu.create(Self);
end;

procedure TMainForm.setScreen(screen: TPagePanel);
begin
  removeAllControls(Self);
  Self.InsertControl(screen);
end;

end.
