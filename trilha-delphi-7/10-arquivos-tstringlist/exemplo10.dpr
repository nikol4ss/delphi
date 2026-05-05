program Exemplo10;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes;

var
  Clientes: TStringList;
  I: Integer;
  Arquivo: string;

begin
  Arquivo := 'clientes.txt';
  Clientes := TStringList.Create;
  try
    Clientes.Add('Ana;11999990000');
    Clientes.Add('Bruno;11888880000');
    Clientes.Add('Carla;11777770000');
    Clientes.SaveToFile(Arquivo);

    Clientes.Clear;
    Clientes.LoadFromFile(Arquivo);

    Writeln('Clientes carregados:');
    for I := 0 to Clientes.Count - 1 do
      Writeln(Clientes[I]);
  finally
    Clientes.Free;
  end;

  Readln;
end.
