unit Data_Serializable;

interface

type
  TSerializable = class
  public
    procedure saveAsText(var f: TextFile); dynamic; abstract;
    procedure readAsText(var f: TextFile); dynamic; abstract;
    function getSaveSize(): integer; dynamic; abstract;

    constructor create;
  end;

implementation

constructor TSerializable.create;
begin
  inherited;
end;

end.
