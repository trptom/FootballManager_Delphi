unit Component_Button;

interface

uses
  Controls, ExtCtrls, Classes, StdCtrls, Graphics, Types, Jpeg, Constants, PNGImage, Forms, Dialogs, SysUtils;

type
  TFMButtonImages = record
    corner_LT: TPicture;
    corner_RT: TPicture;
    corner_LB: TPicture;
    corner_RB: TPicture;
    border_T: TPicture;
    border_R: TPicture;
    border_B: TPicture;
    border_L: TPicture;
    center: TPicture;
  end;

  TFMButton = class(TLabel)
  private
    previousControl: TControl;
    but_pressed: boolean;
    but_mouseOver: boolean;
    firstPaint: boolean;
    text: string;

    procedure evt_mouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure evt_mouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure evt_mouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  protected
    procedure Paint; override;
  public
    constructor create(AOwner: TComponent; text:string); overload;
    constructor create(AOwner: TComponent; text:string; onClickEvent:TNotifyEvent); overload;

    procedure recountSize(anchors: TAnchors);
  end;

const
  _FMBUTTON_PADDING: array [0..3] of integer = (5, 20, 5, 20);

var
  FONT_FMBUTTON: TFont;
  FONT_FMBUTTON_MOUSEOVER: TFont;
  FONT_FMBUTTON_PRESSED: TFont;

  IMAGES_FMBUTTON: TFMButtonImages;
  IMAGES_FMBUTTON_MOUSEOVER: TFMButtonImages;
  IMAGES_FMBUTTON_PRESSED: TFMButtonImages;

implementation

uses Math;

constructor TFMButton.create(AOwner:TComponent; text:string);
begin
  inherited create(AOwner);

  Self.Transparent := true;
  Self.firstPaint := true;
  Self.but_pressed := false;
  Self.but_mouseOver := false;
  Self.text := text;
  Self.Font := FONT_FMBUTTON;

  Self.OnMouseDown := Self.evt_mouseDown;
  Self.OnMouseUp := Self.evt_mouseUp;
  Self.OnMouseMove := Self.evt_mouseMove;
end;

constructor TFMButton.create(AOwner:TComponent; text:string; onClickEvent:TNotifyEvent);
begin
  Self.create(AOwner, text);
  Self.OnClick := onClickEvent;
end;

procedure TFMButton.evt_mouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.but_pressed := true;
  Self.Paint;
end;

procedure TFMButton.evt_mouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.but_pressed := false;
  Self.Paint;
  Self.MouseMove(Shift, X, Y);
end;

procedure TFMButton.evt_mouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if GetCaptureControl <> Self then begin
    if (x < Self.Width) and (y < Self.Height) and (x >= 0) and (y >= 0) then begin
      Self.previousControl := GetCaptureControl;
      Self.but_mouseOver := true;
      SetCaptureControl(Self);
      Self.Paint;
//      showmessage('over');
    end;
  end else begin
    if (x >= Self.Width) or (y >= Self.Height) or (x < 0) or (y < 0) then begin
      Self.but_mouseOver := false;
      Self.but_pressed := false;
      SetCaptureControl(Self.previousControl);
      Self.previousControl := nil;
      Self.Paint;
    end;
  end;
end;

procedure TFMButton.Paint;
var
  imageCollection: TFMButtonImages;
  rect: TRect;
  font: TFont;
begin
  if Self.firstPaint = true then begin
    Self.recountSize(Self.Anchors);
    Self.firstPaint := false;
  end;

  //inherited Paint;

  if Self.but_pressed and Self.but_mouseOver then begin
    imageCollection := IMAGES_FMBUTTON_PRESSED;
    font := FONT_FMBUTTON_PRESSED;
  end else begin
    if Self.but_mouseOver then begin
      imageCollection := IMAGES_FMBUTTON_MOUSEOVER;
      font := FONT_FMBUTTON_MOUSEOVER;
    end else begin
      imageCollection := IMAGES_FMBUTTON;
      font := FONT_FMBUTTON;
    end;
  end;

  // rohy
  Self.Canvas.Draw(
      0,
      0,
      imageCollection.corner_LT.Graphic);
  Self.Canvas.Draw(
      Self.Width-imageCollection.corner_RT.Width,
      0,
      imageCollection.corner_RT.Graphic);
  Self.Canvas.Draw(
      Self.Width-imageCollection.corner_RB.Width,
      Self.Height-imageCollection.corner_RB.Height,
      imageCollection.corner_RB.Graphic);
  Self.Canvas.Draw(
      0,
      Self.Height-imageCollection.corner_LB.Height,
      imageCollection.corner_LB.Graphic);

  // horni ramecek
  rect.Left := imageCollection.corner_LT.Width;
  rect.Top := 0;
  rect.Right := Self.Width-imageCollection.corner_RT.Width;
  rect.Bottom := imageCollection.border_T.Height;
  Self.Canvas.StretchDraw(
      rect,
      imageCollection.border_T.Graphic);

  // dolni ramecek
  rect.Left := imageCollection.corner_LB.Width;
  rect.Top := Self.Height-imageCollection.border_B.Height;
  rect.Right := Self.Width-imageCollection.corner_RB.Width;
  rect.Bottom := Self.Height;
  Self.Canvas.StretchDraw(
      rect,
      imageCollection.border_B.Graphic);

  // levy ramecek
  rect.Left := 0;
  rect.Top := imageCollection.corner_LT.Height;
  rect.Right := imageCollection.border_L.Width;
  rect.Bottom := Self.Height-imageCollection.corner_LB.Height;
  Self.Canvas.StretchDraw(
      rect,
      imageCollection.border_L.Graphic);

  // pravy ramecek
  rect.Left := Self.Width-imageCollection.border_R.Width;
  rect.Top := imageCollection.corner_RT.Height;
  rect.Right := Self.Width;
  rect.Bottom := Self.Height-imageCollection.corner_RB.Height;
  Self.Canvas.StretchDraw(
      rect,
      imageCollection.border_R.Graphic);

  // stred
  rect.Left := Max(imageCollection.corner_LT.Width, imageCollection.corner_LB.Width);
  rect.Top := Max(imageCollection.corner_LT.Height, imageCollection.corner_RT.Height);
  rect.Right := Self.Width - Max(imageCollection.corner_RT.Width, imageCollection.corner_RB.Width);
  rect.Bottom := Self.Height - Max(imageCollection.corner_RB.Height, imageCollection.corner_LB.Width);
  Self.Canvas.StretchDraw(
      rect,
      imageCollection.center.Graphic);

  // text
  Self.Canvas.Font := font;
  Self.Canvas.Brush.Style := bsClear;
  Self.Canvas.TextOut(
      Round((Self.Width - Self.Canvas.TextWidth(Self.text)) / 2),
      Round((Self.Height - Self.Canvas.TextHeight(Self.text)) / 2),
      Self.text);
//  inherited Paint;
end;

procedure TFMButton.recountSize(anchors: TAnchors);
var
  w, h: integer;
  e: TAnchorKind;
begin
  w := Self.Canvas.TextWidth(Self.text) + _FMBUTTON_PADDING[1] + _FMBUTTON_PADDING[3];
  h := Self.Canvas.TextHeight(Self.text) + _FMBUTTON_PADDING[0] + _FMBUTTON_PADDING[2];

  if (akRight in Self.Anchors) and
      not(akLeft in Self.Anchors) then begin
    Self.Left := Self.Left + (Self.Width - w);
  end else begin
    // nothing to do
  end;

  if (akBottom in Self.Anchors) and
      not(akTop in Self.Anchors) then begin
    Self.Top := Self.Top + (Self.Height - h);
  end else begin
    // nothing to do
  end;

  Self.Width := w;
  Self.Height := h;
end;

begin
  // create fonts
  FONT_FMBUTTON := TFont.Create;
  FONT_FMBUTTON.Size := 12;
  FONT_FMBUTTON.Name := _DEFAULT_FONT_NAME;
  FONT_FMBUTTON.Color := clRed;

  FONT_FMBUTTON_MOUSEOVER := TFont.Create;
  FONT_FMBUTTON_MOUSEOVER.Size := 12;
  FONT_FMBUTTON_MOUSEOVER.Name := _DEFAULT_FONT_NAME;
  FONT_FMBUTTON_MOUSEOVER.Color := clYellow;

  FONT_FMBUTTON_PRESSED := TFont.Create;
  FONT_FMBUTTON_PRESSED.Size := 12;
  FONT_FMBUTTON_PRESSED.Name := _DEFAULT_FONT_NAME;
  FONT_FMBUTTON_PRESSED.Color := clBlack;

  // create images
  IMAGES_FMBUTTON.corner_LT := TPicture.Create;
  IMAGES_FMBUTTON.corner_RT := TPicture.Create;
  IMAGES_FMBUTTON.corner_RB := TPicture.Create;
  IMAGES_FMBUTTON.corner_LB := TPicture.Create;
  IMAGES_FMBUTTON.border_T := TPicture.Create;
  IMAGES_FMBUTTON.border_R := TPicture.Create;
  IMAGES_FMBUTTON.border_B := TPicture.Create;
  IMAGES_FMBUTTON.border_L := TPicture.Create;
  IMAGES_FMBUTTON.center := TPicture.Create;
  IMAGES_FMBUTTON.corner_LT.LoadFromFile(_SKIN_FOLDER + 'button\corner_LT.png');
  IMAGES_FMBUTTON.corner_RT.LoadFromFile(_SKIN_FOLDER + 'button\corner_RT.png');
  IMAGES_FMBUTTON.corner_RB.LoadFromFile(_SKIN_FOLDER + 'button\corner_RB.png');
  IMAGES_FMBUTTON.corner_LB.LoadFromFile(_SKIN_FOLDER + 'button\corner_LB.png');
  IMAGES_FMBUTTON.border_T.LoadFromFile(_SKIN_FOLDER + 'button\border_T.png');
  IMAGES_FMBUTTON.border_R.LoadFromFile(_SKIN_FOLDER + 'button\border_R.png');
  IMAGES_FMBUTTON.border_B.LoadFromFile(_SKIN_FOLDER + 'button\border_B.png');
  IMAGES_FMBUTTON.border_L.LoadFromFile(_SKIN_FOLDER + 'button\border_L.png');
  IMAGES_FMBUTTON.center.LoadFromFile(_SKIN_FOLDER + 'button\center.png');

  IMAGES_FMBUTTON_MOUSEOVER := IMAGES_FMBUTTON;
  IMAGES_FMBUTTON_PRESSED := IMAGES_FMBUTTON;
end.
