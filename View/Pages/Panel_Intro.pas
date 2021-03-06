unit Panel_Intro;

interface

uses
  Forms, Classes, StdCtrls, Controls, SysUtils, Dialogs, Graphics,
  ExtCtrls, MPlayer, Types, Math,

  _Utils, _Constants,

  Component_PagePanel, Component_Button;

type
  TPanel_Intro = class(TPagePanel)
  private
    timer: TTimer;
    player: TMediaPlayer;
    videoSize: TRect;

    procedure updateDisplayRect;
    procedure evt_resize(Sender: TObject);
    procedure evt_timeout(Sender: TObject);
  public
    constructor create(AOwner: TForm);
    function introExists: boolean;
    procedure play;
    procedure stop;
  end;

const
  _INTRO_FILE = _VIDEO_FOLDER + 'intro.wmv';

implementation

constructor TPanel_Intro.create(AOwner: TForm);
begin
  inherited create(AOwner{, 'bg_intro.jpg'});

  Self.Color := clBlack;

  Self.timer := TTimer.Create(Self);

  Self.player := TMediaPlayer.Create(Self);
  Self.player.Display := Self;
  Self.player.Visible := false;
  Self.player.FileName := _INTRO_FILE;

  Self.InsertControl(Self.player);
end;

function TPanel_Intro.introExists: boolean;
begin
  result := FileExists(_INTRO_FILE);
end;

procedure TPanel_Intro.play;
begin
  // otevreni intra a ulozeni rozmeru videa pro pocitani
  Self.player.Open;

  // nastaveni a spusteni videa (pred timerem, aby nebyl usekly konec)
  Self.player.Play;
  Self.videoSize := Self.player.DisplayRect;
  Self.updateDisplayRect;
  Self.OnResize := Self.evt_resize; // musim az ted, jinak se mi to prepocitavalo i pri constructu

  // nastaveni a start timeru
  Self.timer.OnTimer := Self.OnClick;
  Self.timer.Interval := Self.player.TrackLength[0] + 100; // drobne zpozdeni, vypada to lip
  Self.timer.Enabled := true;
end;

procedure TPanel_Intro.stop;
begin
  // nejdriv ze vseho disabluju timer, aby to nehazelo errory
  Self.timer.Enabled := false;

  Player.Stop;
  Player.Close;
end;

procedure TPanel_Intro.updateDisplayRect;
var
  drect: TRect;
  ratio: extended;
  actW,actH,w,h: integer;
  rect: TRect;
begin
  actW := Self.player.DisplayRect.Right - Self.player.DisplayRect.Left;
  actH := Self.player.DisplayRect.Bottom - Self.player.DisplayRect.Top;

  ratio := Self.Width / actW;

  w := Round(actW * ratio);
  h := Round(actH * ratio);

  rect.Left := Round((Self.ClientWidth - w) / 2);
  rect.Top := Round((Self.ClientHeight - h) / 2);
  rect.Right := w;
  rect.Bottom := h;

  Self.player.DisplayRect := rect;
end;

procedure TPanel_Intro.evt_resize(Sender: TObject);
begin
  Self.updateDisplayRect;
end;

procedure TPanel_Intro.evt_timeout(Sender: TObject);
begin
  // nasimuluju click
  Self.Click;
end;

end.
