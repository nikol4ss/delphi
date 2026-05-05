# Modulo 05 - Strings e conversoes

String e texto. Em Delphi 7, string comum e `AnsiString` por padrao.

## Pontos importantes

- String usa aspas simples: `'Delphi'`.
- Para juntar textos, use `+`.
- O primeiro caractere de uma string fica na posicao `1`.
- `Pos` retorna `0` quando nao encontra.

## Funcoes uteis

```pascal
Length('Delphi')              // 6
Copy('Delphi', 2, 3)          // 'elp'
Pos('phi', 'Delphi')          // 4
UpperCase('abc')              // 'ABC'
LowerCase('ABC')              // 'abc'
Trim('  texto  ')             // 'texto'
StringReplace('a-b', '-', '.', [rfReplaceAll])
```

## Conversoes

```pascal
IntToStr(10)
StrToInt('10')
StrToIntDef('abc', 0)
FloatToStr(3.14)
StrToFloat('3.14')
BoolToStr(True, True)
```

Use as versoes com `Def` quando voce nao quer que o programa quebre ao receber
entrada invalida.

## Exemplo extra: validando texto

```pascal
Nome := Trim(Nome);

if Nome = '' then
  Writeln('Nome obrigatorio')
else
  Writeln('Nome informado: ', Nome);
```

Quase todo sistema Delphi usa esse padrao em telas: le texto, remove espacos,
valida e depois continua.

## Exemplo extra: separar uma linha

```pascal
Linha := 'Ana;11999990000';
PontoVirgula := Pos(';', Linha);

if PontoVirgula > 0 then
begin
  Nome := Copy(Linha, 1, PontoVirgula - 1);
  Telefone := Copy(Linha, PontoVirgula + 1, MaxInt);
end;
```

Esse tipo de parsing aparece quando voce le arquivos `.txt`, `.csv` simples ou
retornos antigos de integracao.
