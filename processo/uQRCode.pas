unit uQRCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmQRCode = class(TForm)
    imgQRcode: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQRCode: TfrmQRCode;

implementation

{$R *.dfm}

procedure TfrmQRCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmQRCode.FormShow(Sender: TObject);
begin
  BorderStyle := bsNone;
  Position := poScreenCenter;
  WindowState := wsMaximized;

  ClientWidth := Screen.Width;
  ClientHeight := Screen.Height;
end;

end.
