# Trilha Delphi 7

Esta pasta e uma trilha pratica para aprender Delphi 7 do jeito que aparece em
codigo real: `.dpr`, `.pas`, units, VCL, classes, exceptions, arquivos e SOAP.
Ela foi organizada para voce estudar em ordem, praticar sempre e terminar com
base suficiente para ler e escrever codigo Delphi basico.

## Confirmado

- Confirmado: ao concluir todos os modulos e fazer os desafios, o alvo e voce
  sair sabendo Delphi basico.
- Confirmado: a trilha ensina a sintaxe essencial do Delphi 7 e inclui uma
  referencia de sintaxe para consulta.
- Confirmado: os desafios progridem em dificuldade, saindo de `Writeln` e indo
  ate projeto final e WebService SOAP/XML.
- Confirmado: os exemplos evitam sintaxe moderna que nao pertence ao Delphi 7.

Leia tambem `OBJETIVOS_CONFIRMADOS.md` para ver o criterio do que significa
"sei Delphi basico".

## Como estudar

1. Leia o `README.md` do modulo.
2. Abra o exemplo `.pas` ou `.dpr` e leia linha por linha.
3. Reescreva o exemplo com pequenas mudancas, sem copiar e colar.
4. Faca o `desafio.md` sem olhar material externo primeiro.
5. Rode no Delphi 7 quando possivel.
6. Volte no exemplo e compare sua solucao com a ideia do modulo.
7. Marque no seu proprio caderno quais sintaxes voce ja reconhece sem ajuda.

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
13. `13-webservice-soap-xml`: SOAP, XML, WSDL, `THTTPRIO` e servidor SOAP.

## Referencias extras

- `REFERENCIA-SINTAXE-DELPHI7.md`: mapa de sintaxe para consulta rapida.
- `OBJETIVOS_CONFIRMADOS.md`: criterios do que voce deve saber ao terminar.
- `doc.pas`: arquivo bruto de referencia que ja existia no projeto.

## Como ler codigo Delphi

Procure primeiro a estrutura:

```pascal
program NomeDoPrograma;

{$APPTYPE CONSOLE}

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
- `uses` mostra de onde vem cada classe, function ou procedure.
- Evento VCL e apenas uma procedure chamada pela tela.
- SOAP em Delphi 7 normalmente aparece como XML + HTTP + interface importada por WSDL.

## Como saber se voce esta evoluindo

Voce esta evoluindo quando consegue abrir um `.pas` e responder:

1. Este arquivo e `program`, `unit` ou formulario VCL?
2. Quais units ele importa no `uses`?
3. Quais tipos, classes e records ele declara?
4. Quais procedures/functions fazem a regra principal?
5. Onde objetos sao criados com `Create`?
6. Onde objetos sao liberados com `Free`?
7. Onde erros sao tratados com `try/except`?
8. Onde limpeza e garantida com `try/finally`?
9. Quais dados entram, quais regras rodam e quais dados saem?
