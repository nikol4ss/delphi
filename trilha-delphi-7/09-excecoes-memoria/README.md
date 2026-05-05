# Modulo 09 - Excecoes e memoria

Erros acontecem. Em Delphi, voce trata muitos deles com excecoes.

## Try/except

Use para capturar erro.

```pascal
try
  Numero := StrToInt(Texto);
except
  on E: Exception do
    Writeln(E.Message);
end;
```

## Try/finally

Use para garantir limpeza.

```pascal
Lista := TStringList.Create;
try
  Lista.Add('teste');
finally
  Lista.Free;
end;
```

## Diferenca essencial

- `except`: trata o erro.
- `finally`: sempre executa, com erro ou sem erro.

## Free

`Free` e seguro para objeto `nil`. Ele chama o destrutor se o objeto existir.
Em Delphi 7, se voce criou um objeto com `Create`, normalmente voce e
responsavel por liberar com `Free`.

## Exemplo extra: validar e lancar erro

```pascal
if Preco <= 0 then
  raise Exception.Create('Preco deve ser maior que zero');
```

`raise` interrompe o fluxo normal e manda o erro para algum `except`.

## Exemplo extra: tratar erro especifico primeiro

```pascal
try
  Idade := StrToInt(Texto);
except
  on E: EConvertError do
    Writeln('Numero invalido');
  on E: Exception do
    Writeln('Erro geral: ', E.Message);
end;
```

Sempre trate o erro mais especifico antes do erro geral.

## Regra de ouro

`try/finally` nao substitui `try/except`. Um limpa. O outro trata. Em muitos
sistemas reais voce vai ver os dois combinados.
