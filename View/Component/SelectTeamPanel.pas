unit SelectTeamPanel;

interface

uses
  Classes, Controls, StdCtrls, ExtCtrls, Grids, GridPanel, World, Continent, Dialogs, SysUtils;

type
  TSelectTeamPanel = class(TPanel)
  private
    panel_butons: TGridPanel;
    but_continents: array of TButton;
    combo_states: TComboBox;
    combo_leagues: TComboBox;
    grid_teams: TStringGrid;

    world: PWorld;

    procedure updateStates;
    procedure updateLeagues;
  public
    constructor Create(AOwner: TComponent; world: PWorld);
    procedure updateComponent;
  end;

implementation

constructor TSelectTeamPanel.Create(AOwner: TComponent; world: PWorld);
begin
  inherited Create(AOwner);

  Self.world := world;

  Self.panel_butons := TGridPanel.create(Self, (world^).continents.Count, 1);
  Self.combo_states := TComboBox.Create(Self);
  Self.combo_leagues := TComboBox.Create(Self);
  Self.grid_teams := TStringGrid.Create(Self);

  Self.InsertControl(Self.panel_butons);
  Self.InsertControl(Self.combo_states);
  Self.InsertControl(Self.combo_leagues);
  Self.InsertControl(Self.grid_teams);

  Self.panel_butons.Left := 0;
  Self.panel_butons.Top := 0;
  Self.panel_butons.Width := Self.Width;
  Self.panel_butons.Anchors := [ akLeft, akTop, akRight ];

  Self.combo_states.Left := 0;
  Self.combo_states.Top := Self.panel_butons.Top + Self.panel_butons.Height + 10;
  Self.combo_states.Width := Self.Width;
  Self.combo_states.Anchors := [ akLeft, akTop, akRight ];
  Self.combo_states.style := csDropDownList;

  Self.combo_leagues.Left := 0;
  Self.combo_leagues.Top := Self.combo_states.Top + Self.combo_states.Height + 10;
  Self.combo_leagues.Width := Self.Width;
  Self.combo_leagues.Anchors := [ akLeft, akTop, akRight ];
  Self.combo_leagues.style := csDropDownList;

  Self.grid_teams.Left := 0;
  Self.grid_teams.Top := Self.combo_leagues.Top + Self.combo_leagues.Height + 10;
  Self.grid_teams.Width := Self.Width;
  Self.grid_teams.Height := Self.Height - Self.grid_teams.Top;
  Self.grid_teams.Anchors := [ akLeft, akTop, akRight, akBottom ];
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
    cont := Self.world.continents.Items[a-1];
    but.Caption := cont.shortName;
    Self.panel_butons.insertControl(but);
  end;

  Self.updateStates;
end;

procedure TSelectTeamPanel.updateStates;
var
  a: integer;
begin
  Self.combo_states.Items.Clear;

  // TODO
  Self.combo_states.Items.Add('Ceska republika');
  Self.combo_states.Items.Add('Slovensko');

  if Self.combo_states.Items.Count > 0 then begin
    Self.combo_states.ItemIndex := 0;
  end;

  Self.updateLeagues;
end;

procedure TSelectTeamPanel.updateLeagues;
var
  a: integer;
begin
  Self.combo_leagues.Items.Clear;

  // TODO
  Self.combo_leagues.Items.Add('Prvni liga');
  Self.combo_leagues.Items.Add('Druha liga');

  if Self.combo_leagues.Items.Count > 0 then begin
    Self.combo_leagues.ItemIndex := 0;
  end;
end;

end.
