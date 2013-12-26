unit Panel_Examples;

interface

uses
  Classes, Controls, Graphics, Types, Forms, Dialogs,

  Data_World, Data_Continent,

  Component_SelectTeamPanel, Component_PagePanel;

type
  TPanel_Examples = class(TPagePanel)

  private
    wld: TWorld;
    stp: TSelectTeamPanel;
  public
    constructor Create(AOwner: TForm);
    procedure beforeShow; override;
  end;

implementation

constructor TPanel_Examples.Create(AOwner: TForm);
begin
  inherited Create(AOwner);

  Self.wld := TWorld.create;
  Self.wld.continents.Add(TContinent.create('aaaaa', 'aaaa', 'aaa'));
  Self.wld.continents.Add(TContinent.create('bbbbb', 'bbbb', 'bbb'));

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
