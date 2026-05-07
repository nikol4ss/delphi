program CalculadoraCompra;

{$mode delphi}

uses
    SysUtils;

var
    Produto: String;
    Quantidade: Integer;
    Preco: Currency;
    Desconto: Double;
    Subtotal: Currency;
    TemDesconto: Boolean;
    Total: Currency;

begin
    WriteLn('Digite o Produto:');
    ReadLn(Produto);

    WriteLn('Digite a Quantidade:');
    ReadLn(Quantidade);

    WriteLn('Digite o Preco:');
    ReadLn(Preco);

    Desconto := 0.15;

    Subtotal := Quantidade * Preco;

    TemDesconto := (Quantidade >= 10) and (Subtotal > 100);

    if TemDesconto then
    begin
        Total := Subtotal - (Subtotal * Desconto);
    end
    else
    begin
        Total := Subtotal;
    end;

    WriteLn('Produto: ', Produto);
    WriteLn('Subtotal: ', Format('%.2f', [Subtotal]));
    WriteLn('Total: ', Format('%.2f', [Total]));
    WriteLn('Tem desconto? ', BoolToStr(TemDesconto, True));

    ReadLn;
end.
