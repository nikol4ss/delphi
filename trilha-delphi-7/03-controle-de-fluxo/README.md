# Modulo 03 - Controle de fluxo

Controle de fluxo decide qual caminho o programa segue.

## If

```pascal
if Idade >= 18 then
  Writeln('Maior de idade')
else
  Writeln('Menor de idade');
```

Com mais de uma instrucao, use `begin/end`:

```pascal
if Total > 100 then
begin
  Writeln('Compra aprovada');
  Writeln('Cliente ganhou pontos');
end;
```

## Case

```pascal
case Opcao of
  1: Writeln('Cadastrar');
  2: Writeln('Listar');
  3: Writeln('Sair');
else
  Writeln('Opcao invalida');
end;
```

## Lacos

- `for`: quando voce sabe quantas vezes quer repetir.
- `while`: testa antes de repetir.
- `repeat/until`: executa pelo menos uma vez e testa no final.

## Break e Continue

- `Break`: sai do laco.
- `Continue`: pula para a proxima repeticao.
