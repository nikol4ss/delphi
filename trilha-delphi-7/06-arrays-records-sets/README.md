# Modulo 06 - Arrays, records, enums e sets

Este modulo ensina estruturas de dados simples.

## Array

Array guarda varios valores do mesmo tipo.

```pascal
var
  Notas: array[1..3] of Double;
```

Use `Low` e `High` para percorrer sem decorar indices.

## Record

Record agrupa campos.

```pascal
type
  TAluno = record
    Nome: string;
    Nota: Double;
  end;
```

## Enum

Enum cria uma lista de valores nomeados.

```pascal
type
  TDiaSemana = (dsDomingo, dsSegunda, dsTerca);
```

## Set

Set e um conjunto de valores de um enum ou intervalo.

```pascal
type
  TPermissao = (peLer, peEscrever, peExcluir);
  TPermissoes = set of TPermissao;
```

Use `in`, `Include` e `Exclude` para trabalhar com sets.

## Exemplo extra: array dinamico de records

```pascal
var
  Alunos: array of TAluno;

SetLength(Alunos, 2);
Alunos[0].Nome := 'Ana';
Alunos[1].Nome := 'Bruno';
```

Array dinamico com record e uma forma simples de guardar uma lista em memoria
antes de aprender banco de dados.

## Exemplo extra: set como permissao

```pascal
Permissoes := [peLer];
Include(Permissoes, peEscrever);

if peEscrever in Permissoes then
  Writeln('Pode alterar');
```

Set e otimo quando voce tem opcoes ligadas/desligadas.

## Como ler record em codigo real

Quando encontrar `TAlgo = record`, pense: "isso e um pacote de campos". Quando
encontrar `TAlgo = class`, pense: "isso e um objeto com dados e comportamento".
