# Trilha Delphi 7

Esta pasta e uma trilha pratica para aprender a ler e escrever codigo Delphi 7.
O objetivo nao e decorar tudo de uma vez. O objetivo e passar pelos modulos,
entender a forma do codigo, praticar a sintaxe e sair conseguindo olhar um
programa Delphi basico e entender o que esta acontecendo.

## Como estudar

1. Leia o `README.md` do modulo.
2. Abra o exemplo `.pas` ou `.dpr` e leia linha por linha.
3. Rode o exemplo no Delphi 7, se tiver o ambiente instalado.
4. Faca o `desafio.md` sem olhar material externo primeiro.
5. Volte no exemplo e compare sua solucao com a ideia do modulo.

## Ordem sugerida

1. `01-estrutura-de-programa`: programa, unit, `uses`, `begin/end`.
2. `02-variaveis-tipos-operadores`: tipos, constantes, atribuicao e operadores.
3. `03-controle-de-fluxo`: `if`, `case`, `for`, `while`, `repeat`.
4. `04-procedures-functions-parametros`: procedures, functions e parametros.
5. `05-strings-conversoes`: strings, formatacao e conversao de tipos.
6. `06-arrays-records-sets`: arrays, records, enums e sets.
7. `07-units-uses-escopo`: organizacao de codigo em units.
8. `08-oop-classes-objetos`: classes, objetos, propriedades e heranca.
9. `09-excecoes-memoria`: `try/except`, `try/finally`, `Free`.
10. `10-arquivos-tstringlist`: arquivos texto e `TStringList`.
11. `11-vcl-eventos-formularios`: estrutura de formularios VCL.
12. `12-projeto-final`: mini projeto juntando tudo.

## Como ler codigo Delphi

Procure primeiro a estrutura:

```pascal
program NomeDoPrograma;

uses
  SysUtils;

var
  X: Integer;

begin
  X := 10;
  Writeln(X);
end.
```

Leia assim:

1. `program` diz que este arquivo e um programa executavel.
2. `uses` lista bibliotecas/units usadas pelo codigo.
3. `var` declara variaveis.
4. `begin/end` delimita blocos.
5. `:=` atribui valor.
6. `;` separa instrucoes.
7. `end.` fecha o programa; `end;` fecha blocos internos.

## Regras mentais importantes

- Delphi nao usa `{}` para blocos. Ele usa `begin` e `end`.
- Comparacao usa `=`, atribuicao usa `:=`.
- Strings normalmente comecam no indice `1`, nao no `0`.
- Objetos criados com `Create` geralmente precisam de `Free`.
- `try/finally` serve para garantir limpeza.
- `try/except` serve para tratar erro.
- `interface` de uma unit e a parte visivel; `implementation` e a parte interna.

## Observacao sobre o arquivo original

O arquivo `delphi.pas` da raiz estava vazio. O arquivo `doc.pas` tinha bastante
conteudo de referencia, entao esta trilha reorganiza as ideias em modulos menores
e usa exemplos focados em Delphi 7.
