# Modulo 13 - WebService SOAP/XML em Delphi 7

SOAP e um padrao antigo, muito comum em sistemas Delphi 7 legados. Ele usa XML
para representar a chamada de um metodo remoto e HTTP para transportar essa
mensagem.

## O que voce vai aprender

- O que e SOAP.
- O que e XML Envelope.
- O que e WSDL.
- Como Delphi 7 representa um WebService SOAP.
- Como montar um XML SOAP manualmente.
- Como consumir SOAP com `THTTPRIO`.
- Como criar um esqueleto de servidor SOAP em Delphi 7.

## Mapa mental

Uma chamada SOAP tem esta ideia:

```text
Programa Delphi -> XML SOAP -> HTTP POST -> Servidor
Programa Delphi <- XML SOAP <- HTTP 200  <- Servidor
```

O XML SOAP geralmente tem:

- `Envelope`: raiz da mensagem.
- `Header`: metadados opcionais.
- `Body`: metodo chamado e parametros.
- `Result`: resposta do metodo.

## Exemplo de request SOAP

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Somar xmlns="http://tempuri.org/">
      <A>10</A>
      <B>20</B>
    </Somar>
  </soap:Body>
</soap:Envelope>
```

## Exemplo de response SOAP

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <SomarResponse xmlns="http://tempuri.org/">
      <SomarResult>30</SomarResult>
    </SomarResponse>
  </soap:Body>
</soap:Envelope>
```

## Duas formas de trabalhar no Delphi 7

Forma 1: manual.

- Voce monta o XML.
- Envia via HTTP.
- Le o XML de resposta.
- Bom para entender o protocolo.

Forma 2: `THTTPRIO` com WSDL.

- Delphi importa o WSDL.
- Gera uma interface Pascal.
- Voce chama como se fosse metodo local.
- Bom para codigo de producao quando o WSDL e estavel.

## Arquivos deste modulo

- `USoapXmlManual.pas`: monta e le XML SOAP manualmente.
- `exemplo13.dpr`: exemplo console que monta um envelope e interpreta resposta.
- `USoapRioCliente.pas`: modelo de cliente SOAP com `THTTPRIO`.
- `UCalculadoraSoapServer.pas`: esqueleto de servidor SOAP Delphi 7.
- `desafio.md`: desafio progressivo de SOAP.

## Sintaxe importante

```pascal
type
  ICalculadoraSoap = interface(IInvokable)
    ['{4C8C260E-4D80-4E48-B78E-1823D9E52C66}']
    function Somar(A, B: Integer): Integer; stdcall;
  end;
```

Leia assim:

1. `interface(IInvokable)` diz que isso pode ser exposto/invocado via SOAP.
2. O GUID identifica a interface.
3. `stdcall` define convencao de chamada comum em interoperabilidade.
4. `THTTPRIO` cria o proxy HTTP/SOAP.
5. `InvRegistry.RegisterInterface` registra a interface no runtime SOAP.

## Cuidado de Delphi 7

Delphi 7 e antigo. Em SOAP legado, erros comuns sao:

- Namespace errado.
- SOAPAction errado.
- Endpoint diferente do WSDL.
- Servidor exigindo TLS moderno que o ambiente antigo nao suporta nativamente.
- XML com acentos/encoding incompativel.
- WSDL gerando tipos que precisam de ajuste manual.

Por isso este modulo mostra tanto o XML manual quanto o modelo `THTTPRIO`.
