unit _P_MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,

  ContentPanel;

type
  CPanel_MainMenu = class(CContentPanel)
  private
    panel: TGridPanel;
    buttonNewGame: TButton;
    buttonLoadGame: TButton;
  public
//    function getPercX(percentage: integer): integer;


    constructor create(AOwner: TForm);
  end;

implementation

constructor CPanel_MainMenu.create(AOwner: TForm);
begin
  inherited create(AOwner);

  Self.buttonNewGame := TButton.create(Self);
  Self.buttonNewGame.Anchors := [akTop, akLeft, akRight, akBottom];
  Self.buttonNewGame.Left := 100;
  Self.buttonNewGame.Top := 100;
  Self.buttonNewGame.Caption := 'Nová hra';
  Self.buttonNewGame.Width := 200;
  Self.buttonNewGame.Height := 50;

  Self.buttonLoadGame := TButton.create(Self);

  Self.InsertControl(buttonNewGame);
  Self.InsertControl(buttonLoadGame);
end;

end.
 