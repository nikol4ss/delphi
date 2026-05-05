# Modulo 10 - Arquivos e TStringList

`TStringList` e uma das classes mais uteis do Delphi 7. Ela guarda uma lista de
strings e tambem carrega/salva arquivos texto.

## Operacoes comuns

```pascal
Lista := TStringList.Create;
try
  Lista.Add('Ana');
  Lista.Add('Bruno');
  Lista.SaveToFile('nomes.txt');
finally
  Lista.Free;
end;
```

## Ler arquivo

```pascal
Lista.LoadFromFile('nomes.txt');
```

## Name/Value

`TStringList` tambem trabalha bem com `chave=valor`.

```pascal
Lista.Values['nome'] := 'Ana';
Lista.Values['idade'] := '30';
```

Isso ajuda a criar configuracoes simples.
