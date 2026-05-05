unit UCalculadoraSoapServer;

interface

uses
  InvokeRegistry,
  Types,
  XSBuiltIns;

type
  ICalculadoraServico = interface(IInvokable)
    ['{B41271F1-4F4A-4014-9CF5-246E986B3A8F}']
    function Somar(A, B: Integer): Integer; stdcall;
  end;

  TCalculadoraServico = class(TInvokableClass, ICalculadoraServico)
  public
    function Somar(A, B: Integer): Integer; stdcall;
  end;

implementation

function TCalculadoraServico.Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ICalculadoraServico), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterInvokableClass(TCalculadoraServico);

end.
