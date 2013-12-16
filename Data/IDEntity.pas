unit IDEntity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  Serializable;

type
  PIDCounterMap = ^CIDCounterMap;
  PIDEntity = ^CIDEntity;
  PIDCounterList = ^CIDCounterList;

  CIDCounterMap = class
  public
    className: string;
    id: integer;

    constructor create(className: string);
  end;

  CIDCounterList = class(TList)
  private
    private newItem: CIDCounterMap;
    function Get(Index: Integer): PIDCounterMap;
  public
    destructor Destroy; override;
    function Add(className: string): Integer; overload;
    function Add(Value: PIDCounterMap): Integer; overload;
    property Items[Index: Integer]: PIDCounterMap read Get; default;
    function findByClassName(className: string): PIDCounterMap;
  end;

  CIDEntity = class(CSerializable)
  private
    id: integer;

    function findOrCreateCounter(): PIDCounterMap;
  public
    function getId: integer;
    constructor create; overload;
    constructor create(id: integer); overload;
  end;

var
  idCounters: CIDCounterList;

implementation

{------------------------------------------------------------------------------}

constructor CIDCounterMap.create(className: string);
begin
  Self.className := className;
end;

{------------------------------------------------------------------------------}

function CIDCounterList.Add(className: string): Integer;
begin
  Self.newItem := CIDCounterMap.create(className);
  Self.Add(@Self.newItem);

  result := 0;
end;

function CIDCounterList.Add(Value: PIDCounterMap): Integer;
begin
  Result := inherited Add(Value);
end;

destructor CIDCounterList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(Items[i]);
  inherited;
end;

function CIDCounterList.Get(Index: Integer): PIDCounterMap;
begin
  Result := PIDCounterMap(inherited Get(Index));
end;

function CIDCounterList.findByClassName(className: string): PIDCounterMap;
var
  i: Integer;
begin
  result := nil;
  for i := 0 to Count - 1 do begin
    if Items[i].className = className then begin
      result := Items[i];
    end;
  end;
end;

{------------------------------------------------------------------------------}

constructor CIDEntity.create;
var
  counter: PIDCounterMap;
begin
  counter := Self.findOrCreateCounter();

  counter^.id := counter^.id + 1;

  Self.id := counter^.id;
end;

constructor CIDEntity.create(id: integer);
var
  counter: PIDCounterMap;
begin
  Self.id := id;

  counter := Self.findOrCreateCounter();
  if (id > counter^.id) then begin
    counter^.id := id;
  end;
end;

function CIDEntity.findOrCreateCounter(): PIDCounterMap;
var
  counter: PIDCounterMap;
begin
  if idCounters = nil then begin
    idCounters := CIDCounterList.Create;
  end;

  counter := idCounters.findByClassName(Self.ClassName);
  if counter = nil then begin
    idCounters.Add(Self.ClassName);
    counter := idCounters.findByClassName(Self.ClassName);
  end;

  result := counter;
end;

function CIDEntity.getId(): integer;
begin
  result := Self.id;
end;

end.
