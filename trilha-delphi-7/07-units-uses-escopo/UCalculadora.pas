unit UCalculadora;

interface

function Somar(A, B: Integer): Integer;
function Subtrair(A, B: Integer): Integer;
function Multiplicar(A, B: Integer): Integer;
function Dividir(A, B: Double): Double;

implementation

function Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;

function Subtrair(A, B: Integer): Integer;
begin
  Result := A - B;
end;

function Multiplicar(A, B: Integer): Integer;
begin
  Result := A * B;
end;

function Dividir(A, B: Double): Double;
begin
  if B = 0 then
    Result := 0
  else
    Result := A / B;
end;

end.
