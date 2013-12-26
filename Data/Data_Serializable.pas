unit Data_Serializable;

interface

type
  CSerializable = class
  public
    function serialize: string; dynamic; abstract;
    function deserialize: string; dynamic; abstract;

    constructor create;
  end;

implementation

constructor CSerializable.create;
begin
  inherited;
end;

end.
