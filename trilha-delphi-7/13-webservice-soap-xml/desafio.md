# Desafio 13 - SOAP/XML em Delphi 7

Este desafio tem 3 niveis. Faca em ordem.

## Nivel 1 - Entender o XML

Use `USoapXmlManual.pas`.

Requisitos:

- Monte um envelope para uma operacao chamada `Multiplicar`.
- Parametros: `A` e `B`.
- Crie uma resposta fake com a tag `MultiplicarResult`.
- Extraia o resultado com uma function nova.

## Nivel 2 - Cliente SOAP

Use `USoapRioCliente.pas` como modelo.

Requisitos:

- Crie uma interface `IProdutoSoap`.
- Adicione a function `ConsultarPreco(const Codigo: string): Double; stdcall;`.
- Registre a interface no `initialization`.
- Crie uma function que retorna `IProdutoSoap` usando `THTTPRIO`.

## Nivel 3 - Servidor SOAP

Use `UCalculadoraSoapServer.pas` como modelo.

Requisitos:

- Crie uma interface `IProdutoServico`.
- Crie uma classe `TProdutoServico`.
- Implemente `ConsultarPreco`.
- Registre a interface e a classe no `initialization`.

## Perguntas para responder

- O que e Envelope?
- O que vai dentro de Body?
- Para que serve WSDL?
- Qual a diferenca entre montar XML manual e usar `THTTPRIO`?
- Onde o Delphi registra uma interface SOAP?
