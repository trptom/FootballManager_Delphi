unit Data_Game;

interface

uses
  SysUtils,

  Data_Serializable, Data_World;

type
  TDatabase = record
    author: string;
    release: TDateTime;
    description: string;
    version: string;
  end;

  TGame = class(TSerializable)
  public
    world: TWorld;
    database: TDatabase;

    constructor create; overload;
    constructor create(var f: TextFile); overload;

    procedure saveAsText(var f: TextFile); override;
    procedure readAsText(var f: TextFile); override;
    function getSaveSize(): integer;
  end;

implementation

constructor TGame.create;
begin
  inherited create;

end;

constructor TGame.create(var f: TextFile);
begin
  Self.create;
  Self.readAsText(f);
end;

procedure TGame.saveAsText(var f: TextFile);
var
  a: integer;
begin
  Writeln(f, Self.database.author);
  Writeln(f, DateToStr(Self.database.release));
  Writeln(f, Self.database.description);
  Writeln(f, Self.database.version);

  Self.world.saveAsText(f);
end;

procedure TGame.readAsText(var f: TextFile);

begin
  Readln(f, Self.database.author);
  Readln(f, Self.database.release);
  Readln(f, Self.database.description);
  Readln(f, Self.database.version);

  Self.world.create(f);
end;

function TGame.getSaveSize: integer;
begin
  result := 1 + Self.world.getSaveSize;
end;

end.
