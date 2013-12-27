unit Data_Continent;

interface

uses
  SysUtils, Classes,

  Data_State, Data_Serializable;

type
  PContinent = ^TContinent;

  TContinent = class(TSerializable)
  private
  public
    name, shortName, shortcut: string[50];
    states: TStatesList;
    imageFileName: string;

    constructor create(var f: TextFile); overload;
    constructor create(name, shortName, shortcut: string); overload;

    destructor Destroy; override;

    procedure saveAsText(var f: TextFile); override;
    procedure readAsText(var f: TextFile); override;
    function getSaveSize(): integer;
  end;

  TContinentsList = class(TList)
  private
    function Get(Index: Integer): TContinent;
  public
    destructor Destroy; override;
    function Add(Value: TContinent): Integer;
    property Items[Index: Integer]: TContinent read Get; default;
  end;

implementation

{------------------------------------------------------------------------------}

function TContinentsList.Add(Value: TContinent): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TContinentsList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Destroy;
  inherited;
end;

function TContinentsList.Get(Index: Integer): TContinent;
begin
  Result := TContinent(inherited Get(Index));
end;

{------------------------------------------------------------------------------}

constructor TContinent.create(var f: TextFile);
begin
  Self.states := TStatesList.Create;
  Self.readAsText(f);
end;

constructor TContinent.create(name, shortName, shortcut: string);
begin
  Self.states := TStatesList.Create;
  Self.name := name;
  Self.shortName := shortName;
  Self.shortcut := shortcut;
end;

destructor TContinent.Destroy;
var
  a:integer;
begin
  for a := 1 to Self.states.Count do begin
    Self.states.Items[a-1].Destroy;
  end;
  Self.states.Destroy;

  inherited;
end;

procedure TContinent.saveAsText(var f: TextFile);
var
  a: integer;
begin
  Writeln(f, Self.name);
  Writeln(f, Self.shortName);
  Writeln(f, Self.shortcut);
  Writeln(f, IntToStr(Self.states.Count));
  for a := 0 to Self.states.Count-1 do begin
    Self.states[a].saveAsText(f);
  end;
end;

procedure TContinent.readAsText(var f: TextFile);
var
  a, statesCount: integer;
begin
  Readln(f, Self.name);
  Readln(f, Self.shortName);
  Readln(f, Self.shortcut);
  Readln(f, statesCount);
  for a := 0 to statesCount-1 do begin
    Self.states.Add(TState.create(f));
  end;
end;

function TContinent.getSaveSize: integer;
var
  a: integer;
begin
  result := 1;
  for a := 0 to Self.states.Count-1 do begin
    result := result + Self.states[a].getSaveSize;
  end;
end;

end.
