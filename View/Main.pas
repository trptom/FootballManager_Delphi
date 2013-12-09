unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  World, State,
  DataController;

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
begin
  world := CWorld.Create;

  CDataController.save(world);
end;

end.
