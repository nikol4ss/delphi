unit USoapRioCliente;

interface

uses
  InvokeRegistry,
  SOAPHTTPClient,
  Types,
  XSBuiltIns;

type
  ICalculadoraSoap = interface(IInvokable)
    ['{4C8C260E-4D80-4E48-B78E-1823D9E52C66}']
    function Somar(A, B: Integer): Integer; stdcall;
  end;

function CriarCalculadoraSoap(const URL: string): ICalculadoraSoap;
function CriarCalculadoraSoapPorWSDL(const WSDL, Service, Port: string): ICalculadoraSoap;

implementation

function CriarCalculadoraSoap(const URL: string): ICalculadoraSoap;
var
  RIO: THTTPRIO;
begin
  RIO := THTTPRIO.Create(nil);
  try
    RIO.URL := URL;
    Result := RIO as ICalculadoraSoap;
  except
    RIO.Free;
    raise;
  end;
end;

function CriarCalculadoraSoapPorWSDL(const WSDL, Service, Port: string): ICalculadoraSoap;
var
  RIO: THTTPRIO;
begin
  RIO := THTTPRIO.Create(nil);
  try
    RIO.WSDLLocation := WSDL;
    RIO.Service := Service;
    RIO.Port := Port;
    Result := RIO as ICalculadoraSoap;
  except
    RIO.Free;
    raise;
  end;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ICalculadoraSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICalculadoraSoap),
    'http://tempuri.org/%operationName%');

end.
