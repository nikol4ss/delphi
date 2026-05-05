# Desafio 09 - Validacao com excecoes

Crie uma classe de excecao `EProdutoInvalido = class(Exception);`.

## Requisitos

- Crie uma function `ValidarPreco(Preco: Currency): Currency`.
- Se o preco for menor ou igual a zero, lance `EProdutoInvalido`.
- No programa principal, chame a function dentro de `try/except`.
- Trate `EProdutoInvalido` primeiro.
- Trate `Exception` por ultimo.

## Extra

Crie um objeto qualquer com `Create`, use dentro de `try/finally` e libere com
`Free`, mesmo se um erro acontecer.
