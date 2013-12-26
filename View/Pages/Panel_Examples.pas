unit Panel_Examples;

interface

uses
  PagePanel, Classes, SelectTeamPanel, World, Continent, Controls, Graphics,
  Types, Forms, Dialogs;

type
  TPanel_Examples = class(TPagePanel)

  private
    wld: CWorld;
    stp: TSelectTeamPanel;
  public
    constructor Create(AOwner: TForm);
    procedure beforeShow; override;
  end;

implementation

constructor TPanel_Examples.Create(AOwner: TForm);
begin
  inherited Create(AOwner);

  Self.wld := CWorld.create;
  Self.wld.continents.Add(CContinent.create('aaaaa', 'aaaa', 'aaa'));
  Self.wld.continents.Add(CContinent.create('bbbbb', 'bbbb', 'bbb'));

  Self.stp := TSelectTeamPanel.Create(Self, @(Self.wld));
  Self.stp.Left := 10;
  Self.stp.Top := 10;
  Self.stp.Width := Self.Width-20;
  Self.stp.Height := Self.Height-20;
  Self.stp.Anchors := [ akLeft, akTop, akRight, akBottom ];

  Self.InsertControl(Self.stp);
end;

procedure TPanel_Examples.beforeShow;
begin
  Self.stp.updateComponent;
end;

end.
