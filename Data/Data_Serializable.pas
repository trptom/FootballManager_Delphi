unit Data_Serializable;

interface

type
  TSerializable = class
  public
    function serialize: string; dynamic; abstract;
    function deserialize: string; dynamic; abstract;

    constructor create;
  end;

implementation

constructor TSerializable.create;
begin
  inherited;
end;

end.
