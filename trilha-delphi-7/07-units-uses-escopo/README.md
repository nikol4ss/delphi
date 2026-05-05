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
