unit Panel_Examples;

interface

uses
  PagePanel, Classes, SelectTeamPanel, World, Continent;

type
  TPanel_Examples = class(TPagePanel)

  private
    wld: CWorld;
    stp: TSelectTeamPanel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

constructor TPanel_Examples.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.wld := CWorld.create;
  Self.wld.continents.Add(CContinent.create('aaaaa', 'aaaa', 'aaa'));

  Self.stp := TSelectTeamPanel.Create(Self, @(Self.wld));
  Self.stp.Left := 0;
  Self.stp.Top := 0;
  Self.stp.Width := Self.Width;
  Self.stp.Height := Self.Height;
  Self.stp.Anchors := [];

  Self.InsertControl(stp);
end;

end.
