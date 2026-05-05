program Exemplo06;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TStatusAluno = (saAprovado, saRecuperacao, saReprovado);
  TPermissao = (peLer, peEscrever, peExcluir);
  TPermissoes = set of TPermissao;

  TAluno = record
    Nome: string;
    Notas: array[1..3] of Double;
    Media: Double;
    Status: TStatusAluno;
  end;

function CalcularMedia(const Aluno: TAluno): Double;
var
  I: Integer;
  Total: Double;
begin
  Total := 0;
  for I := Low(Aluno.Notas) to High(Aluno.Notas) do
    Total := Total + Aluno.Notas[I];

  Result := Total / 3;
end;

function ObterStatus(Media: Double): TStatusAluno;
begin
  if Media >= 7 then
    Result := saAprovado
  else if Media >= 5 then
    Result := saRecuperacao
  else
    Result := saReprovado;
end;

var
  Aluno: TAluno;
  Permissoes: TPermissoes;

begin
  Aluno.Nome := 'Joao';
  Aluno.Notas[1] := 8;
  Aluno.Notas[2] := 6;
  Aluno.Notas[3] := 9;
  Aluno.Media := CalcularMedia(Aluno);
  Aluno.Status := ObterStatus(Aluno.Media);

  Writeln('Aluno: ', Aluno.Nome);
  Writeln('Media: ', FormatFloat('0.00', Aluno.Media));

  case Aluno.Status of
    saAprovado: Writeln('Status: aprovado');
    saRecuperacao: Writeln('Status: recuperacao');
    saReprovado: Writeln('Status: reprovado');
  end;

  Permissoes := [peLer];
  Include(Permissoes, peEscrever);

  if peEscrever in Permissoes then
    Writeln('Usuario pode escrever.');

  Readln;
end.
