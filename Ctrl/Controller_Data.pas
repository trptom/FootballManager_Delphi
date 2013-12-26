unit Controller_Data;

interface

uses
  Windows, SysUtils, Classes,

  Data_Serializable;

type
  CDataController = class
    class function save(data: TSerializable): integer;
  end;

implementation

class function CDataController.save(data: TSerializable): integer;
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
