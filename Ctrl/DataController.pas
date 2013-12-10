unit DataController;

interface

uses
  Windows, SysUtils, Classes,

  Serializable;

type
  CDataController = class
    class function save(data: CSerializable): integer;
  end;

implementation

class function CDataController.save(data: CSerializable): integer;
var
  f: TextFile;
begin
{  fs.Create('out.txt', fmOpenWrite);
  fs.Write(data, 1);
  fs.Free;}
  AssignFile(f, 'out.txt');
  Rewrite(f);
  Write(f, data.serialize);
  CloseFile(f);

  result := 0;
end;

end.