unit Data_State;

interface

uses
  SysUtils, Classes,

  _Constants;

type
  PState = ^TState;

  TState = class
  private
    function getFlagFile(): string;
  public
    name, shortName, shortcut: string;

    property flagFile: string read getFlagFile;

    constructor create(name, shortName, shortcut: string);

    destructor Destroy; override;
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

end.
