unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TabNotBk, Menus,

  _Constants, StdCtrls, ExtCtrls, GridPanel, ButtonedList;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Databze1: TMenuItem;
    Uloit1: TMenuItem;
    Nast1: TMenuItem;
    Program1: TMenuItem;
    Konec1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Sheet_Continent: TTabSheet;
    StatusBar1: TStatusBar;
    DatabaseGB: TGroupBox;
    Sheets: TPageControl;
    Sheet_Game: TTabSheet;
    Sheet_World: TTabSheet;
    ButtonedList1: TButtonedList;
    ListBox1: TListBox;
    procedure Konec1Click(Sender: TObject);
    procedure Nast1Click(Sender: TObject);
    procedure Uloit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Konec1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.Nast1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    showmessage('nacitam');
  end;
end;

procedure TMainForm.Uloit1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    showmessage('ukladam');
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '..\' + _DATABASE_FOLDER ;
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '..\' + _DATABASE_FOLDER ;
end;

end.
