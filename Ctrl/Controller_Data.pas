unit Controller_Data;

interface

uses
  Windows, SysUtils, Classes,

  _Utils,

  Data_Serializable;

type
  TDataController = class
    class function save(data: TSerializable; fileName: string): integer;
  end;

implementation

class function TDataController.save(data: TSerializable; fileName: string): integer;
var
  f: TextFile;
begin
  AssignFile(f, fileName + '.tmp');
  Rewrite(f);
  data.saveAsText(f);
  CloseFile(f);

  EnDecryptFile(fileName + '.tmp', fileName, 1);

  result := 0;
end;

end.
