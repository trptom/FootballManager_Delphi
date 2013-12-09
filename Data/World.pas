unit World;

interface

uses
  SysUtils, Classes,

  Continent, Serializable;

type
  PWorld = ^CWorld;

  CWorld = class(CSerializable)
  private
  
  public
    continents: TContinentsList;
    
    constructor create;

    function serialize: string; override;
    function deserialize: string; override;
  end;

var pokus:CWorld;

implementation

constructor CWorld.create;
begin
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
