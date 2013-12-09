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

    function serialize: integer; override;
    function deserialize: integer; override;
  end;

var pokus:CWorld;

implementation

constructor CWorld.create;
begin
  continents := TContinentsList.create;
end;

function CWorld.serialize: integer;
begin
  // TODO revize

  result := 0;
end;

function CWorld.deserialize: integer;
begin
  // TODO revize

  result := 0;
end;

end.
