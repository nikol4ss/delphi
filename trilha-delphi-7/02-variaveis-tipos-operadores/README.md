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

## Como ler declaracoes

```pascal
var
  Total, Desconto: Currency;
  Quantidade: Integer;
  NomeCliente: string;
```

Leia assim: `Total` e `Desconto` sao do mesmo tipo. `Quantidade` e inteiro.
`NomeCliente` e texto.

## Exemplo extra: conversao mental de operadores

```pascal
Subtotal := Quantidade * PrecoUnitario;
TemDesconto := (Quantidade >= 10) and (Subtotal > 100);

if TemDesconto then
  Total := Subtotal * 0.90
else
  Total := Subtotal;
```

Aqui o programa calcula, guarda uma regra booleana e depois decide. Esse padrao
aparece em validacao, venda, financeiro e regras de tela.

## Dica de Delphi 7

Use `Currency` para dinheiro. `Double` e bom para calculo geral, mas pode ter
pequenas diferencas de ponto flutuante.
