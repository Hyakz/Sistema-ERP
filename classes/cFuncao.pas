unit cFuncao;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     Vcl.Forms,
     Vcl.Buttons,
     cAcaoAcesso,
     cUsuarioLogado,
     RLReport,

     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.Graphics,
     Vcl.ExtDlgs;

type
  TFuncao = class

    private

    public
      class procedure CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection); static;
      class procedure CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection); static;
      class procedure CarregarImagem(aImage:TImage); static;
      class procedure LimparImagem(var aImage:TImage); static;
  end;

implementation

class procedure TFuncao.CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection);
var form: TForm;
begin
  try
    form := aNomeForm.Create(Application);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Form.Name, aConexao) then
    begin
      Form.ShowModal;
    end

    else
    begin
        MessageDlg('O Usuario: '+oUsuarioLogado.nome +' N�o possui Permiss�o de Acesso!! ',mtWarning,[mbOK],0);
    end;
  finally
    if Assigned(Form) then
       Form.Release;
  end;
end;

class procedure TFuncao.CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection);
var Form: TForm;
    aRelatorio: TRLReport;
    I: Integer;
begin
  try
    Form:=aNomeForm.Create(Application);

    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Form.Name, aConexao) then
    begin
      for I := 0 to Form.ComponentCount-1 do
      begin
        if Form.Components[i] is TRLReport then
        begin
          TRLReport(Form.Components[i]).PreviewModal;
          Break;
        end;
      end;
    end

    else
    begin
      MessageDlg('O Usuario '+oUsuarioLogado.nome +' N�o possui Permiss�o de Acesso!! ',mtWarning,[mbOK],0);
    end;

  finally
    if Assigned(Form) then
       Form.Release;
  end;
end;


// ----------------------------------------------------------- IMAGEM ----------------------------------------------------------

class procedure TFuncao.CarregarImagem(aImage: TImage);
var
  Bmp, BmpTrans: TBitmap;
  Jpg: TJPEGImage;
  Pic: TPicture;
  Png: TPngImage;
  opdSelecionar:TOpenPictureDialog;
  iWidth:Integer;
  iHeight:Integer;
begin
  Try
    iWidth:=180;
    iHeight:=180;
    opdSelecionar:=TOpenPictureDialog.Create(nil);
    opdSelecionar.Filter:=' All (*.bmp;*.jpg; *.jpeg;*.png)|*.jpg; *.jpeg; *.bmp;*.png|Bitmaps  '+
                          ' (*.bmp)|*.bmp|JPEG Image File (*.jpg;*.jpeg)|*.jpg; *.jpeg|         '+
                          ' PNG(*.png)|*.png                                                    ';

    opdSelecionar.Title:='Selecione a Imagem';
    opdSelecionar.Execute;

    if opdSelecionar.FileName<>EmptyStr then
    begin
      if (Pos('.JPG',UpperCase(opdSelecionar.FileName))>0) or ( Pos('.JPEG',UpperCase(opdSelecionar.FileName))>0) then
      begin
        Bmp := TBitmap.Create;
        Jpg := TJPEGImage.Create;
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          Jpg.Assign(Pic);
          Jpg.CompressionQuality :=7;
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), Jpg);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          Jpg.Free;
          Bmp.Free;
        end
      End

      else
      if Pos('.PNG',UpperCase(opdSelecionar.FileName))>0 then
      begin
        Bmp :=TBitmap.Create;
        png :=TPngImage.Create;
        Pic :=TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          png.Assign(Pic);
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), png);

          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          png.Free;
          Bmp.Free;
        end
      end
    end

    else
    begin
        try
          Bmp := TBitmap.Create;
          BmpTrans:= TBitmap.Create;
          Pic := TPicture.Create;

          Pic.LoadFromFile(opdSelecionar.FileName);
          BmpTrans.Assign(Pic.Bitmap);
          Bmp.Width :=iWidth;
          Bmp.Height:=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), BmpTrans);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          BmpTrans.Free;
          Bmp.Free;
        end;
    end;
  finally
    FreeAndNil(opdSelecionar);
  end
end;

class procedure TFuncao.LimparImagem(var aImage: TImage);
begin
  aImage.Picture.Assign(nil);
end;

end.
