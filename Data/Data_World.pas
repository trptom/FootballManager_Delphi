unit Data_World;

interface

uses
  SysUtils, Classes,

  Data_Continent, Data_IDEntity;

type
  PWorld = ^TWorld;

  TWorld = class(TIDEntity)
  private
  
  public
    continents: TContinentsList;

    constructor create; overload;
    constructor create(var f: TextFile); overload;
    constructor create(id: integer); overload;

    destructor Destroy; override;

    procedure saveAsText(var f: TextFile); override;
    procedure readAsText(var f: TextFile); override;
    function getSaveSize(): integer;
  end;

var pokus:TWorld;

implementation

constructor TWorld.create;
begin
  inherited;
  continents := TContinentsList.create;
end;

constructor TWorld.create(var f: TextFile);
begin
  inherited;
  continents := TContinentsList.create;
  Self.readAsText(f);
end;

constructor TWorld.create(id: integer);
begin
  inherited Create(id);
  continents := TContinentsList.create;
end;

destructor TWorld.Destroy;
var
  a:integer;
begin
  for a := 1 to Self.continents.Count do begin
    Self.continents.Items[a-1].Destroy;
  end;
  Self.continents.Destroy;

  inherited;
end;

procedure TWorld.saveAsText(var f: TextFile);
var
  a: integer;
begin
  Writeln(f, IntToStr(Self.Continents.Count));
  for a := 0 to Self.continents.Count-1 do begin
    Self.continents[a].saveAsText(f);
  end;
end;

procedure TWorld.readAsText(var f: TextFile);
var
  a, continentsCount: integer;
begin
  Readln(f, continentsCount);
  for a := 0 to continentsCount-1 do begin
    Self.continents.Add(TContinent.create(f));
  end;
end;

function TWorld.getSaveSize: integer;
var
  a: integer;
begin
  result := 1;
  for a := 0 to Self.continents.Count-1 do begin
    result := result + Self.continents[a].getSaveSize;
  end;
end;

end.
