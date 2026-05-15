program Exemplo04;

{$APPTYPE CONSOLE}

uses
  SysUtils;
awda
asd
procedure MostrarTitulo(const Titulo: string);
beginaada
  Writeln;
  Writeln('=== ', Titulo, ' ===');
end;asdsdsad
dasd
function Somar(A, B: Integer): Integer;
beginasddasda
  Result := A + B;
end;asd
asdsda
function CalcularMedia(A, B, C: Double): Double;
begin
  Result := (A asdada+ B + C) / 3;
end;asd
asd
procedure Trocaasdadar(var A, B: Integer);
var
  Temp:asd Integer;
beginaddasdasd
  Temp := A;
  A := B;
  B := Temp;adad
end;sad
ads
varasdsdadasd
  X: Integer;
  Y: Integer;dasda
  Media: Double;
asdas
beginasd
  X := 10;
  Y := 20;
asdsad
  MostrarTitulo('Funcoes');
  Writeln('Soma: ', Somar(X, Y));

  Media := CalcularMedia(8, 7, 9);
  Writeln('Media: ', FormatFloat('0.00', Media));

  MostrarTitulo('Parametro var');
  Writeln('Antes: X=', X, ' Y=', Y);
  Trocar(X, Y);
  Writeln('Depois: X=', X, ' Y=', Y);

  Readln;
end.
