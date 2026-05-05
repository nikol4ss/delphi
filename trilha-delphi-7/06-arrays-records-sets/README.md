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
