unit Data_Continent;

interface

uses
  SysUtils, Classes,

  Data_State, Data_Serializable;

type
  PContinent = ^CContinent;

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

  TContinentsList = class(TList)
  private
    function Get(Index: Integer): CContinent;
  public
    destructor Destroy; override;
    function Add(Value: CContinent): Integer;
    property Items[Index: Integer]: CContinent read Get; default;
  end;

implementation

{------------------------------------------------------------------------------}

function TContinentsList.Add(Value: CContinent): Integer;
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

function TContinentsList.Get(Index: Integer): CContinent;
begin
  Result := CContinent(inherited Get(Index));
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
