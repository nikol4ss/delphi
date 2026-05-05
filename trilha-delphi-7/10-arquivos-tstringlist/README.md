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

## Exemplo extra: ler linha por linha

```pascal
Lista.LoadFromFile('clientes.txt');

for I := 0 to Lista.Count - 1 do
  Writeln(Lista[I]);
```

`TStringList` usa indice comecando em `0`, diferente de string, que normalmente
comeca em `1`.

## Exemplo extra: arquivo de configuracao

```pascal
Config.Values['servidor'] := 'localhost';
Config.Values['porta'] := '8080';
Config.SaveToFile('config.ini');
```

Mesmo sem banco de dados, isso permite guardar configuracoes simples.

## Cuidado

Sempre crie `TStringList` com `Create` e libere com `Free` dentro de
`try/finally`.
