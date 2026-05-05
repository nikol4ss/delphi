program Exemplo05;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  NomeCompleto: string;
  PrimeiroNome: string;
  PosicaoEspaco: Integer;
  IdadeTexto: string;
  Idade: Integer;
  Mensagem: string;

begin
  NomeCompleto := 'Maria Silva';
  PosicaoEspaco := Pos(' ', NomeCompleto);

  if PosicaoEspaco > 0 then
    PrimeiroNome := Copy(NomeCompleto, 1, PosicaoEspaco - 1)
  else
    PrimeiroNome := NomeCompleto;

  IdadeTexto := '28';
  Idade := StrToIntDef(IdadeTexto, 0);

  Mensagem := Format('Nome: %s | Primeiro nome: %s | Idade: %d',
    [NomeCompleto, PrimeiroNome, Idade]);

  Writeln(UpperCase(Mensagem));
  Writeln('Tamanho do nome completo: ', Length(NomeCompleto));
  Writeln('Nome sem espacos nas pontas: "', Trim('  Delphi 7  '), '"');

  Readln;
end.
