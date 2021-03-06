unit Data_State;

interface

uses
  SysUtils, Classes,

  _Constants,

  Data_IDEntity;

type
  PState = ^TState;

  TState = class(TIDEntity)
  private
    function getFlagFile(): string;
  public
    name, shortName, shortcut: string;

    property flagFile: string read getFlagFile;

    constructor create(var f: TextFile); overload;
    constructor create(name, shortName, shortcut: string); overload;

    destructor Destroy; override;

    procedure saveAsText(var f: TextFile); override;
    procedure readAsText(var f: TextFile); override;
    function getSaveSize(): integer;
  end;

  TStatesList = class(TList)
  private
    function Get(Index: Integer): TState;
  public
    destructor Destroy; override;
    function Add(Value: TState): Integer;
    property Items[Index: Integer]: TState read Get; default;
  end;

implementation

{------------------------------------------------------------------------------}

function TStatesList.Add(Value: TState): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TStatesList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Destroy;
  inherited;
end;

function TStatesList.Get(Index: Integer): TState;
begin
  Result := TState(inherited Get(Index));
end;

{------------------------------------------------------------------------------}

constructor TState.create(var f: TextFile);
begin
  Self.readAsText(f);
end;

constructor TState.create(name, shortName, shortcut: string);
begin
  Self.name := name;
  Self.shortName := shortName;
  Self.shortcut := shortcut;
end;

destructor TState.Destroy;
var
  i: Integer;
begin
  // TODO

  inherited;
end;

function TState.getFlagFile(): string;
begin
  result := _IMAGES_FOLDER + 'flags/' + Self.flagFile;
end;

procedure TState.saveAsText(var f: TextFile);
var
  a: integer;
begin
  Writeln(f, Self.name);
  Writeln(f, Self.shortName);
  Writeln(f, Self.shortcut);
  // TODO
end;

procedure TState.readAsText(var f: TextFile);
var
  a, statesCount: integer;
begin
  Readln(f, Self.name);
  Readln(f, Self.shortName);
  Readln(f, Self.shortcut);
  // TODO
end;

function TState.getSaveSize: integer;
var
  a: integer;
begin
  result := 1;
  // TODO
  {for a := 0 to Self.states.Count-1 do begin
    sum := sum + Self.states[a].getSaveSize;
  end;}
end;

end.
