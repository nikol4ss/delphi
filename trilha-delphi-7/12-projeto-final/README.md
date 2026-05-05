# Modulo 12 - Projeto final

Este modulo junta o basico que voce estudou.

## Ideia do projeto

Criar um cadastro simples de produtos em console.

## O que ele deve praticar

- Estrutura de programa `.dpr`.
- Variaveis e tipos.
- `case` para menu.
- `for` para listar.
- `record` para produto.
- `array` para guardar produtos.
- `function` para calcular valor total.
- `procedure` para organizar acoes.
- `TStringList` para salvar em arquivo.
- `try/finally` para liberar memoria.

## Modelo mental

O programa deve ter tres partes:

1. Dados: records, arrays e variaveis.
2. Regras: functions e procedures.
3. Interface console: menu, leitura e escrita na tela.

Esse e um desenho simples, mas ja e uma base para entender sistemas Delphi
maiores.

## Exemplo de menu final

```pascal
repeat
  MostrarMenu;
  Readln(Opcao);

  case Opcao of
    1: CadastrarProduto;
    2: ListarProdutos;
    3: SalvarProdutos;
    0: Writeln('Saindo...');
  else
    Writeln('Opcao invalida');
  end;
until Opcao = 0;
```

## Como organizar o projeto final

Comece simples em um unico `.dpr`. Quando funcionar, separe:

- `UProdutos.pas`: record, array e regras de produto.
- `UArquivos.pas`: salvar e carregar arquivo.
- `.dpr`: menu principal.

Essa separacao treina o que sistemas maiores fazem: tela/fluxo de um lado,
regra de negocio de outro.

## Criterio de conclusao

Voce concluiu a trilha basica quando conseguir alterar o projeto final sem
quebrar tudo: adicionar campo, mudar regra, salvar arquivo e entender onde cada
parte do codigo esta.
