program Exemplo07;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UCalculadora;

begin
  Writeln('10 + 5 = ', Somar(10, 5));
  Writeln('10 - 5 = ', Subtrair(10, 5));
  Writeln('10 * 5 = ', Multiplicar(10, 5));
  Writeln('10 / 5 = ', FormatFloat('0.00', Dividir(10, 5)));
  Readln;
end.
