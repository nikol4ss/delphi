# Referencia de sintaxe Delphi 7

Use este arquivo como mapa de consulta. Os modulos ensinam passo a passo; este
arquivo mostra a sintaxe em formato concentrado.

## Arquivos

```pascal
program MeuPrograma;
library MinhaDll;
unit MinhaUnit;
```

- `program`: executavel.
- `library`: DLL.
- `unit`: codigo reutilizavel.

## Blocos principais

```pascal
interface
implementation
initialization
finalization
begin
end
```

`interface` expoe nomes para outras units. `implementation` guarda o codigo
interno. `initialization` roda quando a unit carrega. `finalization` roda quando
a unit descarrega.

## Comentarios

```pascal
// comentario de linha
{ comentario de bloco }
(* comentario de bloco *)
```

## Declaracoes

```pascal
label
  Fim;

const
  MAXIMO = 100;

resourcestring
  SErro = 'Erro ao processar';

type
  TIdade = Integer;

var
  Contador: Integer;

threadvar
  ValorPorThread: Integer;
```

## Tipos basicos

```pascal
var
  I: Integer;
  D: Double;
  C: Currency;
  S: string;
  Ch: Char;
  B: Boolean;
  Data: TDateTime;
```

## Operadores

```pascal
A := 10;
B := A + 5;
C := A div 2;
D := A mod 2;
Ok := (A > 0) and (B < 20);
```

- `:=`: atribuicao.
- `=`: comparacao.
- `<>`: diferente.
- `div`: divisao inteira.
- `mod`: resto.
- `and`, `or`, `not`, `xor`: logicos ou bitwise conforme o tipo.

## Controle de fluxo

```pascal
if X > 0 then
  Writeln('positivo')
else
  Writeln('zero ou negativo');

case Opcao of
  1: Writeln('Novo');
  2: Writeln('Salvar');
else
  Writeln('Invalido');
end;
```

## Lacos

```pascal
for I := 1 to 10 do
  Writeln(I);

for I := 10 downto 1 do
  Writeln(I);

while X > 0 do
  Dec(X);

repeat
  Inc(X);
until X >= 10;
```

## Procedures e functions

```pascal
procedure Mostrar(const Texto: string);
begin
  Writeln(Texto);
end;

function Somar(A, B: Integer): Integer;
begin
  Result := A + B;
end;
```

Parametros:

```pascal
procedure Aumentar(var Valor: Integer);
procedure Exibir(const Texto: string);
procedure Calcular(A, B: Integer);
```

- Sem modificador: recebe copia.
- `var`: recebe referencia e pode alterar quem chamou.
- `const`: recebe somente leitura.
- `out`: existe no Delphi 7, mas em codigo basico `var` aparece mais.

## Arrays

```pascal
var
  Fixo: array[1..10] of Integer;
  Dinamico: array of string;

SetLength(Dinamico, 3);
Dinamico[0] := 'A';
```

## Records

```pascal
type
  TCliente = record
    Nome: string;
    Idade: Integer;
  end;
```

Record variante:

```pascal
type
  TNumero = record
    case EhInteiro: Boolean of
      True: (ValorInt: Integer);
      False: (ValorDouble: Double);
  end;
```

## Enum e set

```pascal
type
  TDia = (diDomingo, diSegunda, diTerca);
  TDias = set of TDia;

var
  Dias: TDias;

Dias := [diSegunda, diTerca];
if diSegunda in Dias then
  Writeln('tem segunda');
```

## Classes

```pascal
type
  TCliente = class
  private
    FNome: string;
  public
    constructor Create(const ANome: string);
    function Descrever: string; virtual;
    property Nome: string read FNome write FNome;
  end;
```

Heranca:

```pascal
type
  TPessoaFisica = class(TCliente)
  public
    function Descrever: string; override;
  end;
```

Visibilidade:

- `private`: a propria unit/classe acessa.
- `protected`: classe e filhas acessam.
- `public`: todo mundo acessa.
- `published`: visivel para streaming/IDE, comum em componentes VCL.

## Interfaces

```pascal
type
  ISerializavel = interface
    ['{A7F91E8E-9F49-4D44-8A47-6096C4C55B11}']
    function ParaTexto: string;
  end;
```

Interfaces aparecem muito em SOAP no Delphi 7.

## Properties

```pascal
property Nome: string read FNome write FNome;
property Count: Integer read GetCount;
property Items[Index: Integer]: string read GetItem write SetItem; default;
```

## Ponteiros

```pascal
type
  PInteiro = ^Integer;

var
  P: PInteiro;

New(P);
P^ := 10;
Dispose(P);
```

## Excecoes

```pascal
try
  X := StrToInt(Texto);
except
  on E: Exception do
    Writeln(E.Message);
end;

Objeto := TObject.Create;
try
  { usar objeto }
finally
  Objeto.Free;
end;
```

## Diretivas comuns

```pascal
virtual
override
abstract
dynamic
overload
reintroduce
stdcall
cdecl
safecall
register
message
```

## VCL

```pascal
procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  ShowMessage('Salvo');
end;
```

Evento e uma procedure ligada a um componente.

## SOAP/XML

```pascal
type
  ICalculadoraSoap = interface(IInvokable)
    ['{4C8C260E-4D80-4E48-B78E-1823D9E52C66}']
    function Somar(A, B: Integer): Integer; stdcall;
  end;
```

SOAP em Delphi 7 normalmente usa:

- XML Envelope.
- WSDL.
- Interface `IInvokable`.
- Cliente `THTTPRIO`.
- Units `InvokeRegistry` e `SOAPHTTPClient`.
