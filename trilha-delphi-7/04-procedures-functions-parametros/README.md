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

## Exemplo extra: quando usar function

```pascal
function CalcularTotal(Preco: Currency; Quantidade: Integer): Currency;
begin
  Result := Preco * Quantidade;
end;
```

Use function quando a rotina tem uma resposta clara.

## Exemplo extra: quando usar procedure

```pascal
procedure ImprimirLinhaProduto(const Nome: string; Total: Currency);
begin
  Writeln(Nome, ' - ', FormatFloat('0.00', Total));
end;
```

Use procedure quando a rotina faz uma acao.

## Exemplo extra: parametro var

```pascal
procedure Zerar(var Valor: Integer);
begin
  Valor := 0;
end;
```

Com `var`, a variavel original muda. Sem `var`, o Delphi passa uma copia.
