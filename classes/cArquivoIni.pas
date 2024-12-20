unit cArquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     System.SysUtils,
     System.IniFiles,
     Vcl.Forms;

type
  TArquivoIni = class
    private

    public
      class function ArquivoIni: string; static;
      class function LerIni (aSecao : string; aEntrada: string): string; static;
      class procedure AtualizarIni (aSecao, aEntrada, aValor: string); static;
end;

implementation

{ TArquivoIni }

class function TArquivoIni.ArquivoIni: string;
begin
  Result:= ChangeFileExt(Application.ExeName, '.INI');
end;

class procedure TArquivoIni.AtualizarIni(aSecao, aEntrada, aValor: string);
var Ini: TIniFile;
begin
  try
    Ini:=TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
    Ini.WriteString(aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

class function TArquivoIni.LerIni(aSecao, aEntrada: string): string;
Var Ini: TIniFile;
begin
  try
    Ini:=TIniFile.Create(ArquivoIni);
    Result := Ini.ReadString(aSecao, aEntrada, 'NAO ENCONTRADO' );
  finally
    Ini.Free;
  end;
end;

end.
