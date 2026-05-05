# Modulo 02 - Variaveis, tipos e operadores

Neste modulo voce aprende a guardar valores e fazer contas.

## Sintaxe principal

```pascal
var
  Idade: Integer;
  Preco: Currency;
  Nome: string;
  Ativo: Boolean;

begin
  Idade := 30;
  Preco := 19.90;
  Nome := 'Ana';
  Ativo := True;
end;
```

## Tipos basicos

- `Integer`: numero inteiro.
- `Double`: numero real com casas decimais.
- `Currency`: dinheiro, com precisao melhor para valores monetarios.
- `string`: texto.
- `Char`: um caractere.
- `Boolean`: `True` ou `False`.
- `TDateTime`: data e hora, vindo de `SysUtils`.

## Operadores importantes

- `+`, `-`, `*`: soma, subtracao e multiplicacao.
- `/`: divisao real.
- `div`: divisao inteira.
- `mod`: resto da divisao inteira.
- `and`, `or`, `not`: operadores logicos.
- `=`, `<>`, `>`, `<`, `>=`, `<=`: comparacoes.

## Constantes

```pascal
const
  TAXA_DESCONTO = 0.10;
  NOME_APP = 'Sistema de Estudos';
```

Use constantes quando o valor tem nome e nao deve mudar durante o programa.
