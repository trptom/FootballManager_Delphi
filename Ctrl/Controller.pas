unit Controller;

interface

uses
  Main, Panel_MainMenu, Dialogs, PagePanel;

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
