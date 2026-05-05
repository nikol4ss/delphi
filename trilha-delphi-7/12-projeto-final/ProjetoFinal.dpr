program ProjetoFinal;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes;

type
  TProduto = record
    Nome: string;
    Preco: Currency;
    Estoque: Integer;
  end;

  TProdutos = array of TProduto;

procedure AdicionarProduto(var Produtos: TProdutos; const Nome: string;
  Preco: Currency; Estoque: Integer);
var
  NovoIndice: Integer;
begin
  NovoIndice := Length(Produtos);
  SetLength(Produtos, NovoIndice + 1);
  Produtos[NovoIndice].Nome := Nome;
  Produtos[NovoIndice].Preco := Preco;
  Produtos[NovoIndice].Estoque := Estoque;
end;

function ValorTotalEstoque(const Produto: TProduto): Currency;
begin
  Result := Produto.Preco * Produto.Estoque;
end;

procedure ListarProdutos(const Produtos: TProdutos);
var
  I: Integer;
begin
  Writeln('Produtos:');
  for I := 0 to Length(Produtos) - 1 do
  begin
    Writeln(I + 1, ' - ', Produtos[I].Nome,
      ' | Preco: ', FormatFloat('0.00', Produtos[I].Preco),
      ' | Estoque: ', Produtos[I].Estoque,
      ' | Total: ', FormatFloat('0.00', ValorTotalEstoque(Produtos[I])));
  end;
end;

procedure SalvarProdutos(const Produtos: TProdutos; const Arquivo: string);
var
  Lista: TStringList;
  I: Integer;
begin
  Lista := TStringList.Create;
  try
    for I := 0 to Length(Produtos) - 1 do
      Lista.Add(Produtos[I].Nome + ';' +
        CurrToStr(Produtos[I].Preco) + ';' +
        IntToStr(Produtos[I].Estoque));

    Lista.SaveToFile(Arquivo);
  finally
    Lista.Free;
  end;
end;

var
  Produtos: TProdutos;

begin
  SetLength(Produtos, 0);

  AdicionarProduto(Produtos, 'Mouse', 50, 10);
  AdicionarProduto(Produtos, 'Teclado', 120, 5);
  AdicionarProduto(Produtos, 'Monitor', 900, 2);

  ListarProdutos(Produtos);
  SalvarProdutos(Produtos, 'produtos.txt');

  Writeln;
  Writeln('Arquivo produtos.txt salvo.');
  Readln;
end.
