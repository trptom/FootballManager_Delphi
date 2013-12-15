unit PagePanel;

interface

uses
  Forms, ExtCtrls, Classes, Controls, Graphics, Types, Jpeg, Constants;

type
  TPagePanel = class(TPanel)
  private
    bgImage: TPicture;
  public
    constructor create(AOwner: TForm); overload;
    constructor create(AOwner: TForm; bgImage: string); overload;
    procedure Paint; override;
  end;

implementation

constructor TPagePanel.create(AOwner: TForm);
begin
  Self.create(AOwner, '');
end;

constructor TPagePanel.create(AOwner: TForm; bgImage: string);
begin
  inherited create(AOwner);

  Self.Anchors := [ akLeft, akTop, akRight, akBottom ];
  Self.Left := 0;
  Self.Top := 0;
  Self.Width := AOwner.ClientWidth;
  Self.Height := AOwner.ClientHeight;

  Self.BorderStyle := bsNone;

  if (bgImage <> '') then begin
    Self.bgImage := TPicture.Create;
    Self.bgImage.LoadFromFile(_IMAGES_FOLDER + 'backgrounds/' + bgImage);
  end;
end;

procedure TPagePanel.Paint;
var
  bgCoords: TRect;
begin
  inherited;

  bgCoords.Left := 0;
  bgCoords.Top := 0;
  bgCoords.Right := Self.Width;
  bgCoords.Bottom := Self.Height;

  if (Self.bgImage <> nil) then begin
    Canvas.StretchDraw(bgCoords, Self.bgImage.Graphic);
  end;
end;

end.
