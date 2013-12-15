unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,

  Utils,

  World, Continent, State,
  DataController, ExtCtrls,

  Panel_MainMenu, SelectTeamPanel;

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

  world: CWorld;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
   outputList: TStringList;
   world: CWorld;
   cont: CContinent;
begin
  world := CWorld.create;
  cont := CContinent.create('aaaaa', 'aaaa', 'aaa');
  world.continents.Add(@cont);

  Self.InsertControl(TPanel_MainMenu.create(Self));
  Self.InsertControl(TSelectTeamPanel.create(Self, world));
end;

end.
