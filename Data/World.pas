unit World;

interface

uses
  SysUtils, Classes,

  Continent, IDEntity;

type
  PWorld = ^CWorld;

  CWorld = class(CIDEntity)
  private
  
  public
    continents: TContinentsList;
    
    constructor create; overload;
    constructor create(id: integer); overload;

    function serialize: string; override;
    function deserialize: string; override;
  end;

var pokus:CWorld;

implementation

constructor CWorld.create;
begin
  inherited;

  continents := TContinentsList.create;
end;

constructor CWorld.create(id: integer);
begin
  inherited Create(id);

  continents := TContinentsList.create;
end;

function CWorld.serialize: string;
begin
  // TODO revize

  result := 'Svet';
end;

function CWorld.deserialize: string;
begin
  // TODO revize

  result := '';
end;

end.
