program Exemplo08;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TConta = class
  private
    FTitular: string;
    FSaldo: Currency;
  public
    constructor Create(const ATitular: string);
    procedure Depositar(AValor: Currency);
    function Sacar(AValor: Currency): Boolean; virtual;
    function Descrever: string; virtual;
    property Titular: string read FTitular;
    property Saldo: Currency read FSaldo;
  end;

  TContaEspecial = class(TConta)
  private
    FLimite: Currency;
  public
    constructor Create(const ATitular: string; ALimite: Currency);
    function Sacar(AValor: Currency): Boolean; override;
    function Descrever: string; override;
    property Limite: Currency read FLimite write FLimite;
  end;

constructor TConta.Create(const ATitular: string);
begin
  inherited Create;
  FTitular := ATitular;
  FSaldo := 0;
end;

procedure TConta.Depositar(AValor: Currency);
begin
  if AValor > 0 then
    FSaldo := FSaldo + AValor;
end;

function TConta.Sacar(AValor: Currency): Boolean;
begin
  Result := AValor <= FSaldo;
  if Result then
    FSaldo := FSaldo - AValor;
end;

function TConta.Descrever: string;
begin
  Result := Format('%s - saldo %.2f', [FTitular, FSaldo]);
end;

constructor TContaEspecial.Create(const ATitular: string; ALimite: Currency);
begin
  inherited Create(ATitular);
  FLimite := ALimite;
end;

function TContaEspecial.Sacar(AValor: Currency): Boolean;
begin
  Result := AValor <= (Saldo + FLimite);
  if Result then
    FSaldo := FSaldo - AValor;
end;

function TContaEspecial.Descrever: string;
begin
  Result := inherited Descrever + Format(' - limite %.2f', [FLimite]);
end;

var
  Conta: TConta;

begin
  Conta := TContaEspecial.Create('Carla', 500);
  try
    Conta.Depositar(100);
    Conta.Sacar(250);
    Writeln(Conta.Descrever);
  finally
    Conta.Free;
  end;

  Readln;
end.
