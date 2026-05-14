program Exemplo04;

{$APPTYPE CONSOLE}

uses
  SysUtils;
awda
asd
procedure MostrarTitulo(const Titulo: string);
begin
  Writeln;
  Writeln('=== ', Titulo, ' ===');
end;

function Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;

function CalcularMedia(A, B, C: Double): Double;
begin
  Result := (A + B + C) / 3;
end;

procedure Trocar(var A, B: Integer);
var
  Temp: Integer;
begin
  Temp := A;
  A := B;
  B := Temp;
end;

var
  X: Integer;
  Y: Integer;
  Media: Double;

begin
  X := 10;
  Y := 20;

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
