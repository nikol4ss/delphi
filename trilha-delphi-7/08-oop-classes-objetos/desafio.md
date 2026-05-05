# Desafio 08 - Classe de produto

Crie uma classe `TProduto`.

## Campos privados

- `FNome: string`
- `FPreco: Currency`
- `FEstoque: Integer`

## Requisitos

- Crie um constructor recebendo nome, preco e estoque.
- Crie properties `Nome`, `Preco` e `Estoque`.
- Crie uma procedure `AdicionarEstoque(Quantidade: Integer)`.
- Crie uma function `Vender(Quantidade: Integer): Boolean`.
- Crie uma function `Descrever: string`.

## Extra

Crie uma classe filha `TProdutoPerecivel` com campo `FDataValidade: TDateTime`
e sobrescreva `Descrever`.
