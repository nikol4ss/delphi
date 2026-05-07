program MeuPrimeiroPrograma;

{$mode delphi}

{ Variaveis do programa }
var
    Nome: string;
    Frase: string;
    MensagemFim: string;

begin
    { Aqui começa o programa }
    Nome := 'Nikolas';
    Frase := 'Estou aprendendo Delphi para trabalhar na Minerion';
    MensagemFim := 'Fim do programa';

    { WriteLn escreve texto }
    WriteLn(Nome);
    WriteLn(Frase);

    WriteLn('ENTER para finalizar o programa');

    { ReadLn pausa o terminal esperando um ENTER}
    ReadLn;

    WriteLn(MensagemFim);
end.


