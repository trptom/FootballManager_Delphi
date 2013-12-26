unit _Constants;

interface

uses
  Graphics;

const
  _DATA_FOLDER = '_data\';
  _IMAGES_FOLDER = _DATA_FOLDER + 'images\';
  _VIDEO_FOLDER = _DATA_FOLDER + 'video\';
  _SKIN_FOLDER = _IMAGES_FOLDER + 'skin\';
  _DEFAULT_FONT_NAME = 'Times New Roman';

var
  FONT_H1: TFont;

implementation

uses Classes;

begin
  FONT_H1 := TFont.Create;
  FONT_H1.Size := 50;
  FONT_H1.Name := _DEFAULT_FONT_NAME;
end.
