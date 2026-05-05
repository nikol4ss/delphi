# Desafio 11 - Mini formulario

Crie um formulario VCL no Delphi 7.

## Componentes

- `TEdit` chamado `EdtNome`.
- `TEdit` chamado `EdtIdade`.
- `TButton` chamado `BtnMostrar`.
- `TLabel` chamado `LblResultado`.

## Requisitos

- No clique do botao, leia nome e idade.
- Converta idade com `StrToIntDef`.
- Se nome estiver vazio, mostre `Informe o nome`.
- Se idade for zero, mostre `Idade invalida`.
- Caso contrario, mostre `Nome: X - Idade: Y`.

## Extra

Crie uma function privada `MontarResultado` e deixe o evento do botao com poucas
linhas.
