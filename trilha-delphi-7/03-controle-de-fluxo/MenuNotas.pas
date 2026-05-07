program MenuNotas;
{$mode delphi}

uses
    SysUtils;

var
    i: Integer;
    Opcao: Integer;
    Nota1, Nota2, Nota3: Double;
    Media: Double;

begin
    WriteLn('Digite a Nota1: ');
    ReadLn(Nota1);

    WriteLn('Digite a Nota2: ');
    ReadLn(Nota2);

    WriteLn('Digite a Nota3: ');
    ReadLn(Nota3);

    WriteLn('Selecione a Opção: ');
    ReadLn(Opcao);

    case Opcao of
    1:
    begin
        WriteLn('Calcular Média');

        Media := (Nota1 + Nota2 + Nota3) / 3;

        WriteLn('Média das Notas: ', Format('%.2f', [Media]));

        if (Media >= 7) then
        begin
            WriteLn('Aprovado: ', Format('%.2f', [Media]));
        end
        else if (Media >= 5) and (Media < 7) then
        begin
            WriteLn('Recuperação: ', Format('%.2f', [Media]));
        end
        else if (Media < 5) then
        begin
            WriteLn('Reprovado: ', Format('%.2f', [Media]));
        end;
    end;

    2:
    begin
        Writeln('Listar Notas');
        for i := 1 to 10 do
            begin
                WriteLn(i);
            end;
    end;

    3:
    begin
        Writeln('Sair');
    end;

    else
        Writeln('Opção inválida');
end;
end.

