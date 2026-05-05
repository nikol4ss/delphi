# Modulo 07 - Units, uses e escopo

Units sao arquivos `.pas` reutilizaveis. Elas organizam codigo.

## Estrutura de uma unit

```pascal
unit UMinhaUnit;

interface

function Somar(A, B: Integer): Integer;

implementation

function Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;

end.
```

## Interface e implementation

- `interface`: o que outros arquivos podem enxergar.
- `implementation`: como aquilo funciona por dentro.

## Uses

`uses` importa outra unit.

```pascal
uses
  SysUtils, UCalculadora;
```

## Escopo

- Variavel local: existe dentro da procedure/function.
- Variavel global da unit: existe para toda a unit.
- Item na `interface`: pode ser usado por outros arquivos.
- Item na `implementation`: fica escondido dentro da unit.

## Exemplo extra: helper privado da unit

```pascal
implementation

function NormalizarNome(const Nome: string): string;
begin
  Result := Trim(UpperCase(Nome));
end;
```

Como essa function esta somente na `implementation`, ela ajuda a propria unit,
mas nao vira parte publica do sistema.

## Exemplo extra: unit publica

```pascal
interface

function CalcularDesconto(Total: Currency): Currency;
```

Se voce coloca na `interface`, esta dizendo: "outras partes do programa podem
chamar isso".

## Cuidado com uses circular

Se `UA` usa `UB` e `UB` usa `UA` na `interface`, o Delphi pode reclamar. Quando
precisar, tente mover um dos `uses` para a `implementation`.
