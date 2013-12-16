unit SelectTeamPanel;

interface

uses
  Classes, Controls, StdCtrls, ExtCtrls, Grids, GridPanel, World, Continent;

type
  TSelectTeamPanel = class(TPanel)
  private
    panel_butons: TGridPanel;
    but_continents: array of TButton;
    combo_states: TComboBox;
    combo_leagues: TComboBox;
    grid_teams: TStringGrid;

    world: CWorld;

    procedure updateComponent;
  public
    constructor Create(AOwner: TComponent; world: CWorld);

  end;

implementation

constructor TSelectTeamPanel.Create(AOwner: TComponent; world: CWorld);
begin
  inherited Create(AOwner);

  Self.InsertControl(Self.panel_butons);
  Self.InsertControl(Self.combo_states);
  Self.InsertControl(Self.combo_leagues);
  Self.InsertControl(Self.grid_teams);

  Self.updateComponent;
end;

procedure TSelectTeamPanel.updateComponent;
var
  a: integer;
  but: TButton;
  cont: CContinent;
begin
  while Self.panel_butons.ControlCount > 0 do begin
    Self.panel_butons.removeControl(Self.panel_butons.Controls[0]);
  end;

  for a := 1 to Self.world.continents.Count do begin
    but := TButton.Create(Self.panel_butons);
    cont := Self.world.continents.Items[a]^;
    but.Caption := cont.shortName;
    Self.panel_butons.insertControl(but);
  end;
end;

end.