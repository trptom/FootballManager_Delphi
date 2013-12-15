unit State;

interface

uses
  SysUtils, Classes, Constants;

type
  PState = ^CState;

  TStatesList = class(TList)
  private
    function Get(Index: Integer): PState;
  public
    destructor Destroy; override;
    function Add(Value: PState): Integer;
    property Items[Index: Integer]: PState read Get; default;
  end;

  CState = class
  private
    function getFlagFile(): string;
  public
    name, shortName, shortcut: string;

    property flagFile: string read getFlagFile;

    constructor create(name, shortName, shortcut: string);

    destructor Destroy; override;
  end;

implementation

{------------------------------------------------------------------------------}

function TStatesList.Add(Value: PState): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TStatesList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(Items[i]);
  inherited;
end;

function TStatesList.Get(Index: Integer): PState;
begin
  Result := PState(inherited Get(Index));
end;

{------------------------------------------------------------------------------}

constructor CState.create(name, shortName, shortcut: string);
begin
  Self.name := name;
  Self.shortName := shortName;
  Self.shortcut := shortcut;
end;

destructor CState.Destroy;
var
  i: Integer;
begin
  // TODO

  inherited;
end;

function CState.getFlagFile(): string;
begin
  result := _IMAGES_FOLDER + 'flags/' + Self.flagFile;
end;

end.
