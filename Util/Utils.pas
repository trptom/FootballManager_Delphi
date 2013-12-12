unit Utils;

interface

uses
  SysUtils, Classes;

const
  Width_valueType_perc = 0;
  Width_valueType_abs = 1;

type
  PWidth = ^TWidth;
  TWidth = record
    value: double;
    valueType: integer;
  end;

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);

implementation

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);
begin
   ListOfStrings.clear;
   ListOfStrings.delimiter     := delimiter;
   ListOfStrings.delimitedText := str;
end;

end.
