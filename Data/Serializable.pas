unit Serializable;

interface

type
  CSerializable = class
  public
    function serialize: string; dynamic; abstract;
    function deserialize: string; dynamic; abstract;
  end;

implementation

end.
