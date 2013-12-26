unit Controller;

interface

uses
  Main, Dialogs,

  Component_PagePanel,

  Panel_MainMenu;

type
  TController = class
  private
  public
    procedure setScreen(screen: TPagePanel);
  end;

implementation

procedure TController.setScreen(screen: TPagePanel);
begin
  MainForm.setScreen(screen);
end;

end.
