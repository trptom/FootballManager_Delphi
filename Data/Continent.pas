unit Continent;

interface

uses
  SysUtils, Classes,

  State, Serializable;

type
  PContinent = ^CContinent;

  TContinentsList = class(TList)
  private
    function Get(Index: Integer): PContinent;
  public
    destructor Destroy; override;
    function Add(Value: PContinent): Integer;
    property Items[Index: Integer]: PContinent read Get; default;
  end;

  CContinent = class(CSerializable)
  private
  public
    name, shortName, shortcut: string;
    states: TStatesList;

    constructor create(name, shortName, shortcut: string);

    function serialize: integer; override;
    function deserialize: integer; override;
  end;

implementation

{------------------------------------------------------------------------------}

function TContinentsList.Add(Value: PContinent): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TContinentsList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(Items[i]);
  inherited;
end;

function TContinentsList.Get(Index: Integer): PContinent;
begin
  Result := PContinent(inherited Get(Index));
end;

{------------------------------------------------------------------------------}

constructor CContinent.create(name, shortName, shortcut: string);
begin
  Self.name := name;
  Self.shortName := shortName;
  Self.shortcut := shortcut;

  Self.states := TStatesList.Create;
end;

function CContinent.serialize: integer;
begin
  // TODO revize

  result := 0;
end;

function CContinent.deserialize: integer;
begin
  // TODO revize

  result := 0;
end;

end.
