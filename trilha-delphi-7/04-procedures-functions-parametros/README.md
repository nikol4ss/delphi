# Modulo 04 - Procedures, functions e parametros

Procedures e functions separam o programa em partes menores.

## Procedure

Procedure executa uma acao e nao retorna valor.

```pascal
procedure MostrarLinha;
begin
  Writeln('----------------');
end;
```

## Function

Function calcula e retorna um valor.

```pascal
function Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;
```

## Tipos de parametro

- `A: Integer`: parametro por valor; recebe uma copia.
- `var A: Integer`: parametro por referencia; pode alterar quem chamou.
- `const Texto: string`: parametro somente leitura; bom para strings e records.

## Onde implementar

Em um programa `.dpr`, voce pode declarar procedures/functions antes do `begin`
principal. Em uma unit, voce declara na `interface` se quiser tornar publico, e
implementa na `implementation`.
