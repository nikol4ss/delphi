program Exemplo13;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  USoapXmlManual;

var
  RequestXml: string;
  ResponseXml: string;
  Resultado: Integer;

begin
  RequestXml := MontarEnvelopeSomar(10, 20);

  Writeln('REQUEST SOAP:');
  Writeln(RequestXml);
  Writeln;

  ResponseXml :=
    '<?xml version="1.0" encoding="utf-8"?>' +
    '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
    '<soap:Body>' +
    '<SomarResponse xmlns="http://tempuri.org/">' +
    '<SomarResult>30</SomarResult>' +
    '</SomarResponse>' +
    '</soap:Body>' +
    '</soap:Envelope>';

  Resultado := ExtrairResultadoSomar(ResponseXml);

  Writeln('RESPONSE SOAP:');
  Writeln(ResponseXml);
  Writeln;
  Writeln('Resultado extraido: ', Resultado);
  Readln;
end.
