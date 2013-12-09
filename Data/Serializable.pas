unit Serializable;

interface

type
  CSerializable = class
  public
    function serialize: integer; dynamic; abstract;
    function deserialize: integer; dynamic; abstract;
  end;

implementation

end.
