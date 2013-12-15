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
    imageFileName: string;

    constructor create(name, shortName, shortcut: string);

    destructor Destroy; override;

    function serialize: string; override;
    function deserialize: string; override;
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

destructor CContinent.Destroy;
var
  a:integer;
begin
  for a := 1 to Self.states.Count do begin
    Self.states.Items[a-1].Destroy;
  end;
  Self.states.Destroy;

  inherited;
end;

function CContinent.serialize: string;
begin
  // TODO revize

  result := '';
end;

function CContinent.deserialize: string;
begin
  // TODO revize

  result := '';
end;

end.
