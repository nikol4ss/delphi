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

## Exemplo extra: property com validacao

```pascal
procedure TProduto.SetPreco(AValor: Currency);
begin
  if AValor < 0 then
    raise Exception.Create('Preco invalido');

  FPreco := AValor;
end;
```

Property nao precisa escrever direto no campo. Ela pode chamar um setter para
validar a entrada.

## Exemplo extra: constructor

```pascal
constructor TProduto.Create(const ANome: string);
begin
  inherited Create;
  FNome := ANome;
  FEstoque := 0;
end;
```

Constructor deixa o objeto nascer em estado valido.

## Como ler OOP em Delphi legado

Procure campos `F...`, depois properties, depois constructors. Isso revela quais
dados o objeto guarda e como ele deve ser criado.
