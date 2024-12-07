unit uTextBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmTextBox = class(TForm)
    pnl2: TPanel;
    lbl20: TLabel;
    edt1: TEdit;
    pnlOK: TPanel;
    procedure edt1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edt1Exit(Sender: TObject);
    procedure pnlOKClick(Sender: TObject);

  private
    { Private declarations }
    FValue: String;
  public
    { Public declarations }
    function ShowModalValue(const CurrentValue: String): Boolean;
    property Value: String read FValue;
  end;

var
  frmTextBox: TfrmTextBox;

implementation

{$R *.dfm}

procedure TfrmTextBox.FormCreate(Sender: TObject);
begin
  FValue := '';
end;

procedure TfrmTextBox.pnlOKClick(Sender: TObject);
begin
  FValue := edt1.Text;
  ModalResult := mrOk;
end;

procedure TfrmTextBox.edt1Exit(Sender: TObject);
begin
  FValue := edt1.Text;
  ModalResult := mrOk;
end;

procedure TfrmTextBox.edt1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlOKClick(Sender);
  end
  else if Key = VK_ESCAPE then
  begin
    ModalResult := mrCancel;
  end;
end;

function TfrmTextBox.ShowModalValue(const CurrentValue: String): Boolean;
begin
  edt1.Text := CurrentValue;
  FValue := '';
  Result := (ShowModal = mrOk);
end;


end.

