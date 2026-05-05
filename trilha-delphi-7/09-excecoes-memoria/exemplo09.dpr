program Exemplo09;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes;

type
  EValorInvalido = class(Exception);

function ConverterIdade(const Texto: string): Integer;
begin
  Result := StrToInt(Texto);
  if Result < 0 then
    raise EValorInvalido.Create('Idade nao pode ser negativa.');
end;

var
  Lista: TStringList;
  Idade: Integer;

begin
  try
    Idade := ConverterIdade('abc');
    Writeln('Idade: ', Idade);
  except
    on E: EConvertError do
      Writeln('Erro de conversao: ', E.Message);
    on E: EValorInvalido do
      Writeln('Erro de validacao: ', E.Message);
    on E: Exception do
      Writeln('Erro inesperado: ', E.Message);
  end;

  Lista := TStringList.Create;
  try
    Lista.Add('Linha 1');
    Lista.Add('Linha 2');
    Writeln('Total de linhas: ', Lista.Count);
  finally
    Lista.Free;
  end;

  Readln;
end.
