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
    constructor create(id: integer); overload;

    destructor Destroy; override;

    function serialize: string; override;
    function deserialize: string; override;
  end;

var pokus:TWorld;

implementation

constructor TWorld.create;
begin
  inherited;

  continents := TContinentsList.create;
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

function TWorld.serialize: string;
begin
  // TODO revize

  result := 'Svet';
end;

function TWorld.deserialize: string;
begin
  // TODO revize

  result := '';
end;

end.
