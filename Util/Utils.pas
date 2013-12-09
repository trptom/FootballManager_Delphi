unit Utils;

interface

uses
  SysUtils, Classes;

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);

implementation

procedure split(delimiter: Char; str: string; listOfStrings: TStrings);
begin
   ListOfStrings.clear;
   ListOfStrings.delimiter     := delimiter;
   ListOfStrings.delimitedText := str;
end;

end.
