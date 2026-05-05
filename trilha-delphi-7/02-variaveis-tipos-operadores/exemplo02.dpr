program Exemplo02;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  TAXA_DESCONTO = 0.10;

var
  Nome: string;
  Quantidade: Integer;
  PrecoUnitario: Currency;
  Subtotal: Currency;
  Desconto: Currency;
  Total: Currency;
  CompraGrande: Boolean;

begin
  Nome := 'Teclado';
  Quantidade := 3;
  PrecoUnitario := 120.50;

  Subtotal := Quantidade * PrecoUnitario;
  Desconto := Subtotal * TAXA_DESCONTO;
  Total := Subtotal - Desconto;
  CompraGrande := Total >= 300;

  Writeln('Produto: ', Nome);
  Writeln('Quantidade: ', Quantidade);
  Writeln('Subtotal: ', FormatFloat('0.00', Subtotal));
  Writeln('Desconto: ', FormatFloat('0.00', Desconto));
  Writeln('Total: ', FormatFloat('0.00', Total));
  Writeln('Compra grande? ', BoolToStr(CompraGrande, True));
  Readln;
end.
