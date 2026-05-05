# Modulo 01 - Estrutura de programa

Neste modulo voce aprende a forma basica de um programa Delphi 7.

## O que voce precisa reconhecer

- `program`: cria um executavel.
- `unit`: cria um arquivo reutilizavel por outros programas.
- `uses`: importa units prontas, como `SysUtils` e `Classes`.
- `begin/end`: marca o inicio e o fim de um bloco.
- `;`: separa comandos.
- `.` no ultimo `end.`: fecha o arquivo principal do programa.
- Comentarios: `{ texto }`, `(* texto *)` ou `// texto`.

## Estrutura minima

```pascal
program MeuPrograma;

{$APPTYPE CONSOLE}

uses
  SysUtils;

begin
  Writeln('Ola Delphi 7');
  Readln;
end.
```

## Como pensar

Um programa Delphi 7 geralmente tem uma entrada principal (`.dpr`) e varias
units (`.pas`). O `.dpr` chama o inicio da aplicacao. As units guardam funcoes,
classes, formularios, regras de negocio e codigo reutilizavel.

## Erros comuns

- Esquecer `;` entre comandos.
- Usar `=` para atribuir valor. Em Delphi o correto e `:=`.
- Fechar o programa com `end;` em vez de `end.`.
- Esquecer `begin/end` quando um `if`, `for` ou `while` tem mais de um comando.

## Exemplo extra: programa chamando uma procedure

```pascal
program ProgramaComProcedure;

{$APPTYPE CONSOLE}

uses
  SysUtils;

procedure MostrarBoasVindas;
begin
  Writeln('Bem-vindo ao Delphi 7');
end;

begin
  MostrarBoasVindas;
  Readln;
end.
```

Leia assim: o Delphi primeiro conhece a procedure, depois executa o bloco
principal. Isso e muito comum em codigo legado: varias rotinas aparecem antes do
`begin` principal.

## Exemplo extra: estrutura de unit

```pascal
unit UMensagens;

interface

procedure MostrarErro(const Texto: string);

implementation

uses
  Dialogs;

procedure MostrarErro(const Texto: string);
begin
  ShowMessage(Texto);
end;

end.
```

Se algo esta na `interface`, outro arquivo pode usar. Se esta apenas na
`implementation`, fica escondido dentro da unit.
