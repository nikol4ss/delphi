# Modulo 08 - OOP, classes e objetos

Delphi 7 usa programacao orientada a objetos.

## Classe

Classe e o molde. Objeto e uma instancia desse molde.

```pascal
type
  TCliente = class
  private
    FNome: string;
  public
    property Nome: string read FNome write FNome;
  end;
```

## Padroes comuns

- Campos privados costumam comecar com `F`, como `FNome`.
- Propriedades expoem campos com controle.
- `constructor Create` inicializa o objeto.
- `destructor Destroy` finaliza o objeto.
- `inherited` chama comportamento da classe pai.
- `virtual` permite sobrescrever.
- `override` sobrescreve metodo virtual do pai.

## Memoria

Objetos sao criados no heap:

```pascal
Cliente := TCliente.Create;
try
  Cliente.Nome := 'Ana';
finally
  Cliente.Free;
end;
```

Se criou com `Create`, pense imediatamente em onde vai chamar `Free`.
