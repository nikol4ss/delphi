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
