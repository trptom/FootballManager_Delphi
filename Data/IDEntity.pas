unit IDEntity;

interface

uses
  Generics.Collections;

type

  CIDEntity = class
  private
    id: integer;
  public
    constructor create;
  end;

var
  idCounter: TDictionary<string, integer>

implementation

idCounter = TDictionary.create;

class constructor CIDEntity.create;
begin
  CIDEntity.idCounter += 1;
  Self.id := CIDEntity.idCounter;
end;

class function CIDEntity.GetID: integer;
begin
  result := CIDEntity_ClassInt;
end;

class procedure CIDEntity.SetID(
  const Value: integer);
begin
  CIDEntity_ClassInt := value;
end;

end.
