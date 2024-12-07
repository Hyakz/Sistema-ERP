unit Utilidades;

interface

type
  TUtilidades = class

  public
    class function RemoverAcentos(const ATexto: string): string; static;
  end;

implementation

uses
  System.SysUtils;

class function TUtilidades.RemoverAcentos(const ATexto: string): string;
const
  ComAcento = '��������������������������';
  SemAcento = 'aaaaeeiooouucAAAAEEIOOOUUC';
var
  I: Integer;
begin
  Result := ATexto;
  for I := 1 to Length(ComAcento) do
    Result := StringReplace(Result, ComAcento[I], SemAcento[I], [rfReplaceAll]);
end;

end.

