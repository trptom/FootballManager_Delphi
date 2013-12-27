unit Data_IDEntity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  Data_Serializable;

type
  PIDCounterMap = ^TIDCounterMap;
  PIDEntity = ^TIDEntity;
  PIDCounterList = ^TIDCounterList;

  TIDCounterMap = class
  public
    className: string;
    id: integer;

    constructor create(className: string);
  end;

  TIDCounterList = class(TList)
  private
    private newItem: TIDCounterMap;
    function Get(Index: Integer): PIDCounterMap;
  public
    destructor Destroy; override;
    function Add(className: string): Integer; overload;
    function Add(Value: PIDCounterMap): Integer; overload;
    property Items[Index: Integer]: PIDCounterMap read Get; default;
    function findByClassName(className: string): PIDCounterMap;
  end;

  TIDEntity = class(TSerializable)
  private
    id: integer;

    function findOrCreateCounter(): PIDCounterMap;
  public
    function getId: integer;
    constructor create; overload;
    constructor create(id: integer); overload;
  end;

  TIDEntityWithParent = class(TIDEntity)
  private
    parent: PIDEntity;
  public
    function getParent: PIDEntity;
    constructor create(parent: PIDEntity); overload;
    constructor create(id: integer; parent: PIDEntity); overload;
  end;

var
  idCounters: TIDCounterList;

implementation

{------------------------------------------------------------------------------}

constructor TIDCounterMap.create(className: string);
begin
  Self.className := className;
end;

{------------------------------------------------------------------------------}

function TIDCounterList.Add(className: string): Integer;
begin
  Self.newItem := TIDCounterMap.create(className);
  Self.Add(@Self.newItem);

  result := 0;
end;

function TIDCounterList.Add(Value: PIDCounterMap): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TIDCounterList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    FreeMem(Items[i]);
  inherited;
end;

function TIDCounterList.Get(Index: Integer): PIDCounterMap;
begin
  Result := PIDCounterMap(inherited Get(Index));
end;

function TIDCounterList.findByClassName(className: string): PIDCounterMap;
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

constructor TIDEntity.create;
var
  counter: PIDCounterMap;
begin
  counter := Self.findOrCreateCounter();

  counter^.id := counter^.id + 1;

  Self.id := counter^.id;
end;

constructor TIDEntity.create(id: integer);
var
  counter: PIDCounterMap;
begin
  Self.id := id;

  counter := Self.findOrCreateCounter();
  if (id > counter^.id) then begin
    counter^.id := id;
  end;
end;

function TIDEntity.findOrCreateCounter(): PIDCounterMap;
var
  counter: PIDCounterMap;
begin
  if idCounters = nil then begin
    idCounters := TIDCounterList.Create;
  end;

  counter := idCounters.findByClassName(Self.ClassName);
  if counter = nil then begin
    idCounters.Add(Self.ClassName);
    counter := idCounters.findByClassName(Self.ClassName);
  end;

  result := counter;
end;

function TIDEntity.getId(): integer;
begin
  result := Self.id;
end;

{------------------------------------------------------------------------------}

function TIDEntityWithParent.getParent: PIDEntity;
begin
  result := Self.parent;
end;

constructor TIDEntityWithParent.create(parent: PIDEntity);
begin
  inherited create;

  Self.parent := parent;
end;

constructor TIDEntityWithParent.create(id: integer; parent: PIDEntity);
begin
  inherited create(id);

  Self.parent := parent;
end;

end.
