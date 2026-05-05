program Exemplo03;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  I: Integer;
  Nota: Integer;
  Opcao: Integer;

begin
  Nota := 8;

  if Nota >= 7 then
    Writeln('Aprovado')
  else if Nota >= 5 then
    Writeln('Recuperacao')
  else
    Writeln('Reprovado');

  Opcao := 2;
  case Opcao of
    1: Writeln('Menu: cadastrar');
    2: Writeln('Menu: listar');
    3: Writeln('Menu: sair');
  else
    Writeln('Menu: opcao invalida');
  end;

  Writeln('Contagem com for:');
  for I := 1 to 5 do
    Writeln(I);

  Writeln('Impares menores que 10:');
  I := 0;
  while I < 10 do
  begin
    Inc(I);
    if I mod 2 = 0 then
      Continue;
    Writeln(I);
  end;

  Readln;
end.
