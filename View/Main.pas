unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  Utils,
  
  World, Continent, State,
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
var
   outputList: TStringList;
begin
  world := CWorld.Create;
  showmessage(inttostr(world.getId));

  world := CWorld.Create(5);
  showmessage(inttostr(world.getId));

  world := CWorld.Create;
  showmessage(inttostr(world.getId));

  CDataController.save(world);

//  outputList.Create;
//  split(':', 'word:doc,txt,docx', outputList) ;
end;

end.
