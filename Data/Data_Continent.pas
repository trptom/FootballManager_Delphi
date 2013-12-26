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

constructor TContinent.create(name, shortName, shortcut: string);
begin
  Self.name := name;
  Self.shortName := shortName;
  Self.shortcut := shortcut;

  Self.states := TStatesList.Create;
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

function TContinent.serialize: string;
begin
  // TODO revize

  result := '';
end;

function TContinent.deserialize: string;
begin
  // TODO revize

  result := '';
end;

end.
