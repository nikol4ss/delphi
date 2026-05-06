unit SintaxeDelphi7;

{
  ============================================================
  REFERÊNCIA COMPLETA DE SINTAXE - DELPHI 7
  ============================================================
  Este unit cobre toda a sintaxe essencial do Delphi 7,
  incluindo tipos, estruturas de controle, OOP, exceções,
  strings, arquivos, ponteiros e muito mais.
  Use como guia de estudos e consulta rápida.
  ============================================================
}

{$mode delphi} // Diretiva de compilação: usa modo Delphi (necessário no Free Pascal)

interface

uses
  SysUtils,  // Utilitários: formatação, exceções, datas, conversões
  Classes,   // TList, TStringList, TStream, TComponent etc
  Math;      // Funções matemáticas: Max, Min, Power, Sqrt etc

// ============================================================
// SEÇÃO 1: TIPOS BÁSICOS (Type Aliases)
// Você pode criar apelidos para tipos existentes
// ============================================================
type
  TInteiro   = Integer;   // 32 bits com sinal: -2.147.483.648 a 2.147.483.647
  TReal      = Double;    // Ponto flutuante 64 bits
  TTexto     = string;    // String dinâmica (comprimento variável)
  TBooleano  = Boolean;   // True ou False
  TByte      = Byte;      // 0 a 255 (sem sinal, 8 bits)
  TWord      = Word;      // 0 a 65535 (sem sinal, 16 bits)
  TInt64b    = Int64;     // 64 bits com sinal
  TChar1     = Char;      // Caractere único (1 byte)
  TWChar     = WideChar;  // Caractere Unicode (2 bytes)
  TCardinalu = Cardinal;  // Inteiro sem sinal 32 bits: 0 a 4.294.967.295

// ============================================================
// SEÇÃO 2: ENUMERAÇÕES (Enum)
// Define um conjunto de constantes nomeadas com valor ordinal
// ============================================================
type
  TDiaSemana = (
    dsDomingo,   // = 0 (valor implícito)
    dsSegunda,   // = 1
    dsTerca,     // = 2
    dsQuarta,    // = 3
    dsQuinta,    // = 4
    dsSexta,     // = 5
    dsSabado     // = 6
  );

  TCor = (clVermelho, clVerde, clAzul, clAmarelo);

  // Enum com valores explícitos
  TStatusHTTP = (
    stOK        = 200,
    stNotFound  = 404,
    stError     = 500
  );
// ============================================================
// SEÇÃO 3: CONJUNTOS (Set)
// Set é como um "checklist" de valores de um enum
// ============================================================
type
  TPermissoes  = set of (pLer, pEscrever, pExecutar, pAdmin);
  TDiasSemana  = set of TDiaSemana; // Conjunto de dias

// ============================================================
// SEÇÃO 4: SUBRANGE (Intervalo de valores)
// Restringe um tipo a um intervalo específico
// ============================================================
type
  TNota     = 0..10;         // Inteiro de 0 a 10
  TMaiusc   = 'A'..'Z';     // Caractere maiúsculo apenas
  TMes      = 1..12;        // Mês de 1 a 12

// ============================================================
// SEÇÃO 5: ARRAYS
// Array estático: tamanho fixo definido em tempo de compilação
// ============================================================
type
  TVetorInt    = array[0..9] of Integer;       // 10 inteiros (índice 0 a 9)
  TMatriz      = array[1..3, 1..3] of Double;  // Matriz 3x3 de doubles
  TArrayChar   = array[0..255] of Char;        // Buffer de caracteres

  // Array dinâmico: tamanho definido em tempo de execução
  TArrayDinamico = array of Integer;           // Declarado sem tamanho

// ============================================================
// SEÇÃO 6: RECORD (Estrutura de dados / Struct)
// Agrupa campos de diferentes tipos em uma única estrutura
// ============================================================
type
  TPessoa = record
    Nome   : string;
    Idade  : Integer;
    Altura : Double;
    Ativo  : Boolean;
  end;

  // Record com variante (Union): campos que compartilham memória
  TNumero = record
    case IsInteiro: Boolean of
      True:  (ValorInt: Integer);   // Ocupa o mesmo espaço
      False: (ValorReal: Double);   // que este campo
  end;

  // Record aninhado
  TEndereco = record
    Rua    : string;
    Numero : Integer;
    Cidade : string;
    UF     : string[2]; // String com tamanho fixo máximo
  end;

  TCliente = record
    Pessoa   : TPessoa;    // Record dentro de record
    Endereco : TEndereco;
    CPF      : string;
  end;

// ============================================================
// SEÇÃO 7: PONTEIROS
// Ponteiro = variável que armazena o ENDEREÇO de outra variável
// ============================================================
type
  PInteiro  = ^Integer;     // Ponteiro para Integer
  PPessoa   = ^TPessoa;     // Ponteiro para Record
  PStr      = ^string;      // Ponteiro para String

// ============================================================
// SEÇÃO 8: PROCEDIMENTOS E FUNÇÕES - DECLARAÇÕES
// Procedure = não retorna valor
// Function  = retorna um valor (Result)
// ============================================================

// Parâmetro por VALOR: recebe cópia, alteração não afeta o original
procedure SomaPorValor(A, B: Integer);

// Parâmetro por REFERÊNCIA (var): alteração afeta a variável original
procedure TrocaValores(var A, B: Integer);

// Parâmetro CONSTANTE (const): leitura apenas, mais eficiente para strings/records
function CalculaIMC(const Peso, Altura: Double): Double;

// Parâmetro de SAÍDA (out): apenas para retornar valor, não lê o original
procedure DivideCom(A, B: Integer; out Quociente, Resto: Integer);

// Função com overload: mesmo nome, parâmetros diferentes
function Soma(A, B: Integer): Integer; overload;
function Soma(A, B: Double): Double; overload;

// Função recursiva (declarada aqui, implementada abaixo)
function Fatorial(N: Integer): Int64;

// ============================================================
// SEÇÃO 9: TIPOS PROCEDURAIS (Ponteiro para função/procedure)
// Permite armazenar funções em variáveis e passá-las como parâmetros
// ============================================================
type
  TFuncaoInt    = function(A, B: Integer): Integer;
  TProcTexto    = procedure(const Texto: string);
  TEventoClick  = procedure(Sender: TObject) of object; // Evento de método

// ============================================================
// SEÇÃO 10: CLASSES
// OOP: encapsulamento, herança, polimorfismo
// ============================================================
type

  // --- Classe Base (Pai) ---
  TAnimal = class
  private
    // Campos privados: acessíveis apenas dentro da própria classe
    FNome    : string;
    FIdade   : Integer;
    FPeso    : Double;

  protected
    // Campos protegidos: acessíveis na classe e nas filhas (herdeiras)
    FVivo    : Boolean;
    procedure SetNome(const AValor: string); virtual; // virtual = pode ser sobrescrito

  public
    // Construtor: inicializa o objeto (sempre chame inherited!)
    constructor Create(const ANome: string; AIdade: Integer); virtual;

    // Destrutor: libera recursos (sempre chame inherited Destroy!)
    destructor Destroy; override;

    // Métodos públicos
    procedure Comer(const Comida: string);
    function  Descrever: string; virtual; // virtual permite override nas filhas

    // Método ABSTRATO: não tem implementação aqui, OBRIGA filhas a implementar
    procedure EmitirSom; virtual; abstract;

    // Propriedades: interface pública para os campos privados
    property Nome  : string  read FNome  write SetNome;
    property Idade : Integer read FIdade write FIdade;
    property Peso  : Double  read FPeso  write FPeso;
    property Vivo  : Boolean read FVivo;

    // Propriedade somente leitura
    property NomeCompleto: string read FNome;
  end;

  // --- Classe Filha: herda de TAnimal ---
  TCachorro = class(TAnimal)
  private
    FRaca : string;
  public
    constructor Create(const ANome, ARaca: string; AIdade: Integer); reintroduce;
    procedure EmitirSom; override;             // override = implementa o método virtual/abstract
    function  Descrever: string; override;     // sobrescreve o método do pai

    property Raca: string read FRaca write FRaca;
  end;

  // --- Outra Classe Filha ---
  TGato = class(TAnimal)
  private
    FEhCastrado: Boolean;
  public
    constructor Create(const ANome: string; AIdade: Integer; AEhCastrado: Boolean); reintroduce;
    procedure EmitirSom; override;
    function  Descrever: string; override;

    property EhCastrado: Boolean read FEhCastrado write FEhCastrado;
  end;

  // --- Classe com Interface (não é VCL, é pura) ---
  // Interface: contrato que a classe DEVE implementar
  ISerializavel = interface
    ['{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}'] // GUID obrigatório
    function ParaTexto: string;
    procedure DeTexto(const ATexto: string);
  end;

  // Classe que implementa a interface
  TConfiguracoes = class(TInterfacedObject, ISerializavel)
  private
    FChave : string;
    FValor : string;
  public
    constructor Create(const AChave, AValor: string);
    function  ParaTexto: string;           // Implementação da interface
    procedure DeTexto(const ATexto: string); // Implementação da interface
    property Chave : string read FChave write FChave;
    property Valor : string read FValor write FValor;
  end;

  // --- Classe com propriedade indexada ---
  TColecao = class
  private
    FItens : array of string;
    function  GetItem(Index: Integer): string;
    procedure SetItem(Index: Integer; const AValor: string);
    function  GetCount: Integer;
  public
    procedure Adicionar(const AItem: string);
    procedure Remover(AIndex: Integer);
    procedure Limpar;

    // Propriedade com índice (array property)
    property Items[Index: Integer]: string read GetItem write SetItem; default;
    property Count: Integer read GetCount;
  end;

// ============================================================
// SEÇÃO 11: EXCEÇÕES
// Classes de exceção personalizadas
// ============================================================
type
  EErroNegocio   = class(Exception);                      // Exceção genérica
  EValidacao      = class(EErroNegocio);                   // Mais específica
  EIdadeInvalida  = class(EValidacao);                     // Mais específica ainda
  EDivisaoPorZero = class(EMathError);                     // Herdando de exceção de Math

// ============================================================
// SEÇÃO 12: CONSTANTES
// ============================================================
const
  MAX_ITENS       = 100;
  PI_MANUAL       = 3.14159265358979;
  APP_NOME        = 'MeuApp Delphi 7';
  APP_VERSAO      = '1.0.0';
  SEPARADOR       = '----------------------------';
  // Array de constantes
  DIAS_NOMES: array[TDiaSemana] of string = (
    'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'
  );

// ============================================================
// SEÇÃO 13: VARIÁVEIS GLOBAIS (evite ao máximo em produção)
// ============================================================
var
  GContadorGlobal : Integer = 0;  // Variável global com valor inicial
  GAppAtivo       : Boolean = True;

// ============================================================
// FIM DA INTERFACE - Tudo abaixo é implementação privada do unit
// ============================================================

implementation

// ============================================================
// IMPLEMENTAÇÃO: PROCEDIMENTOS E FUNÇÕES SOLTAS
// ============================================================

procedure SomaPorValor(A, B: Integer);
// A e B são cópias, alterações aqui NÃO afetam quem chamou
var
  Resultado: Integer;
begin
  Resultado := A + B;  // A e B originais não são alterados
  // WriteLn(Resultado); // Apenas para demonstração
end;

procedure TrocaValores(var A, B: Integer);
// var = por referência: A e B aqui SÃO as variáveis originais
var
  Temp: Integer;
begin
  Temp := A;
  A    := B;
  B    := Temp;
  // Após retornar, os valores originais foram trocados
end;

function CalculaIMC(const Peso, Altura: Double): Double;
// const = leitura apenas: mais eficiente (sem cópia de memória para tipos grandes)
begin
  if Altura <= 0 then
    raise EValidacao.Create('Altura não pode ser zero ou negativa');
  Result := Peso / (Altura * Altura);
end;

procedure DivideCom(A, B: Integer; out Quociente, Resto: Integer);
// out = só para saída: Quociente e Resto não têm valor de entrada
begin
  if B = 0 then
    raise EDivisaoPorZero.Create('Divisão por zero não permitida');
  Quociente := A div B;  // Divisão inteira
  Resto     := A mod B;  // Resto da divisão
end;

function Soma(A, B: Integer): Integer;  // overload 1
begin
  Result := A + B;
end;

function Soma(A, B: Double): Double;    // overload 2
begin
  Result := A + B;
end;

function Fatorial(N: Integer): Int64;
// Recursão: a função chama a si mesma
begin
  if N <= 1 then
    Result := 1              // Caso base: para a recursão
  else
    Result := N * Fatorial(N - 1); // Chama a si mesmo com N-1
end;

// ============================================================
// IMPLEMENTAÇÃO: CLASSE TAnimal
// ============================================================

constructor TAnimal.Create(const ANome: string; AIdade: Integer);
begin
  inherited Create;   // SEMPRE chame o construtor do pai primeiro!
  FNome  := ANome;
  FIdade := AIdade;
  FPeso  := 0.0;
  FVivo  := True;
end;

destructor TAnimal.Destroy;
begin
  // Libere recursos alocados aqui (memória, handles, conexões etc)
  // Neste caso não há nada para liberar
  inherited Destroy;  // SEMPRE chame o destrutor do pai no final!
end;

procedure TAnimal.SetNome(const AValor: string);
begin
  if AValor = '' then
    raise EValidacao.Create('Nome não pode ser vazio');
  FNome := AValor;
end;

procedure TAnimal.Comer(const Comida: string);
begin
  if not FVivo then
    raise EErroNegocio.Create('Animal não está vivo');
  // Lógica de alimentação...
end;

function TAnimal.Descrever: string;
begin
  // Format é como sprintf: %s = string, %d = inteiro, %.2f = float 2 casas
  Result := Format('Animal: %s, %d anos', [FNome, FIdade]);
end;

// ============================================================
// IMPLEMENTAÇÃO: CLASSE TCachorro
// ============================================================

constructor TCachorro.Create(const ANome, ARaca: string; AIdade: Integer);
begin
  inherited Create(ANome, AIdade); // Chama o Create do TAnimal
  FRaca := ARaca;
end;

procedure TCachorro.EmitirSom;
begin
  // Implementação obrigatória do método abstract do pai
  // WriteLn(FNome + ' diz: Au Au!');
end;

function TCachorro.Descrever: string;
begin
  // inherited chama o método do pai e pega seu resultado
  Result := inherited Descrever + Format(', Raça: %s', [FRaca]);
end;

// ============================================================
// IMPLEMENTAÇÃO: CLASSE TGato
// ============================================================

constructor TGato.Create(const ANome: string; AIdade: Integer; AEhCastrado: Boolean);
begin
  inherited Create(ANome, AIdade);
  FEhCastrado := AEhCastrado;
end;

procedure TGato.EmitirSom;
begin
  // WriteLn(FNome + ' diz: Miau!');
end;

function TGato.Descrever: string;
var
  Castrado: string;
begin
  if FEhCastrado then Castrado := 'castrado' else Castrado := 'não castrado';
  Result := inherited Descrever + Format(', Gato %s', [Castrado]);
end;

// ============================================================
// IMPLEMENTAÇÃO: CLASSE TConfiguracoes
// ============================================================

constructor TConfiguracoes.Create(const AChave, AValor: string);
begin
  inherited Create;
  FChave := AChave;
  FValor := AValor;
end;

function TConfiguracoes.ParaTexto: string;
begin
  Result := FChave + '=' + FValor;
end;

procedure TConfiguracoes.DeTexto(const ATexto: string);
var
  Pos: Integer;
begin
  Pos := System.Pos('=', ATexto); // Pos retorna posição do caractere
  if Pos > 0 then
  begin
    FChave := Copy(ATexto, 1, Pos - 1);         // Copy(str, início, comprimento)
    FValor := Copy(ATexto, Pos + 1, MaxInt);
  end;
end;

// ============================================================
// IMPLEMENTAÇÃO: CLASSE TColecao
// ============================================================

function TColecao.GetItem(Index: Integer): string;
begin
  if (Index < 0) or (Index >= Length(FItens)) then
    raise ERangeError.CreateFmt('Índice %d fora do intervalo', [Index]);
  Result := FItens[Index];
end;

procedure TColecao.SetItem(Index: Integer; const AValor: string);
begin
  if (Index < 0) or (Index >= Length(FItens)) then
    raise ERangeError.CreateFmt('Índice %d fora do intervalo', [Index]);
  FItens[Index] := AValor;
end;

function TColecao.GetCount: Integer;
begin
  Result := Length(FItens);
end;

procedure TColecao.Adicionar(const AItem: string);
var
  N: Integer;
begin
  N := Length(FItens);
  SetLength(FItens, N + 1); // Redimensiona o array dinâmico
  FItens[N] := AItem;
end;

procedure TColecao.Remover(AIndex: Integer);
var
  I: Integer;
begin
  for I := AIndex to Length(FItens) - 2 do
    FItens[I] := FItens[I + 1];
  SetLength(FItens, Length(FItens) - 1);
end;

procedure TColecao.Limpar;
begin
  SetLength(FItens, 0); // Array dinâmico com tamanho 0 = vazio
end;

// ============================================================
// BLOCO DE EXEMPLOS GERAIS
// Esta procedure reúne todos os exemplos de sintaxe comentados
// ============================================================

procedure ExemploTiposEVariaveis;
var
  // --- Inteiros ---
  i, j, k : Integer;   // Múltiplas variáveis do mesmo tipo na mesma linha
  b        : Byte;
  w        : Word;
  n64      : Int64;

  // --- Reais ---
  f  : Single;    // 32 bits, ~7 casas decimais
  d  : Double;    // 64 bits, ~15 casas decimais
  e  : Extended;  // 80 bits, ~18 casas decimais (apenas x86)
  cu : Currency;  // Ponto fixo 4 casas decimais (ideal para dinheiro)

  // --- Texto ---
  s      : string;       // String dinâmica
  sf     : string[50];   // ShortString: tamanho fixo máximo 50 chars
  c      : Char;
  wc     : WideChar;
  ws     : WideString;   // String Unicode

  // --- Lógico ---
  ok     : Boolean;

  // --- Variante ---
  v      : Variant; // Pode armazenar qualquer tipo (use com cuidado, é lento)

begin
  // Atribuições básicas
  i  := 42;
  j  := -100;
  b  := 255;
  w  := 65000;
  n64 := 9999999999999;

  // Operações aritméticas
  k := i + j;          // Soma
  k := i - j;          // Subtração
  k := i * 2;          // Multiplicação
  k := i div 3;        // Divisão INTEIRA (trunca)
  k := i mod 3;        // Resto da divisão inteira
  d := i / 3;          // Divisão REAL (resulta em Double)

  // Funções matemáticas de SysUtils/Math
  d := Abs(-42.5);        // Valor absoluto: 42.5
  d := Sqrt(16.0);        // Raiz quadrada: 4.0
  d := Power(2, 10);      // Potência: 1024.0
  i := Round(3.7);        // Arredonda para o inteiro mais próximo: 4
  i := Trunc(3.9);        // Trunca a parte decimal: 3
  i := Ceil(3.1);         // Arredonda para cima: 4  (Math)
  i := Floor(3.9);        // Arredonda para baixo: 3 (Math)
  d := Max(10.0, 20.0);   // Máximo: 20.0 (Math)
  d := Min(10.0, 20.0);   // Mínimo: 10.0 (Math)

  // Operações com bits (bitwise)
  k := i and $FF;         // AND bit a bit
  k := i or  $01;         // OR bit a bit
  k := i xor $FF;         // XOR bit a bit
  k := not i;             // NOT (inverte todos os bits)
  k := i shl 2;           // Shift left (multiplica por 4)
  k := i shr 1;           // Shift right (divide por 2)

  // Strings
  s  := 'Olá Delphi 7';
  sf := 'Texto fixo';
  c  := 'A';
  ws := 'Unicode text';

  // Manipulação de strings (SysUtils)
  s := Length(s).ToString;              // Comprimento da string
  s := UpperCase('hello');              // 'HELLO'
  s := LowerCase('WORLD');             // 'world'
  s := Trim('  espaços  ');            // Remove espaços nas pontas
  s := TrimLeft('  esq');              // Remove espaços à esquerda
  s := TrimRight('dir  ');             // Remove espaços à direita
  s := Copy('Delphi', 2, 3);          // 'elp' (pos 2, 3 chars)
  i := Pos('lp', 'Delphi');           // 3 (posição onde começa)
  s := StringReplace('a-b-c', '-', '.', [rfReplaceAll]); // 'a.b.c'
  s := IntToStr(42);                   // Inteiro para string
  s := FloatToStr(3.14);               // Float para string
  s := FloatToStrF(3.14159, ffFixed, 8, 2); // '3.14' (formato, dígitos, decimais)
  i := StrToInt('42');                 // String para inteiro
  d := StrToFloat('3.14');             // String para float
  i := StrToIntDef('abc', 0);         // Converte ou retorna 0 se falhar
  ok := TryStrToInt('123', i);        // True se converteu, False se falhou

  // Concatenação de strings
  s := 'Olá' + ' ' + 'Mundo';        // Operador +
  s := Format('Nome: %s, Idade: %d, Nota: %.2f', ['Ana', 25, 9.75]);
  // %s = string, %d = inteiro, %f = float, %e = científico, %g = geral

  // Caracteres especiais em string
  s := 'Linha1' + #13#10 + 'Linha2'; // #13#10 = CRLF (quebra de linha Windows)
  s := 'Linha1' + #10 + 'Linha2';    // #10 = LF (quebra de linha Unix)
  s := 'Tab' + #9 + 'aqui';          // #9 = TAB

  // Boolean
  ok := True;
  ok := False;
  ok := (i > 0) and (d < 100.0);     // AND lógico
  ok := (i < 0) or  (d > 50.0);      // OR lógico
  ok := not ok;                        // NOT lógico

  // Conversões entre tipos (cast)
  i  := Integer(b);          // Byte para Integer (seguro, sempre cabe)
  b  := Byte(i and $FF);     // Integer para Byte (pega só os 8 bits menos significativos)
  d  := Double(i);            // Integer para Double
  i  := Integer(Round(d));    // Double para Integer (via Round)
  c  := Char(65);             // Inteiro para Char: 'A'
  i  := Ord(c);               // Char para inteiro: 65
  wc := WideChar(Ord(c));     // Char para WideChar

  // Variante (Variant)
  v  := 42;              // Armazena inteiro
  v  := 'texto';         // Agora armazena string (sem erro!)
  v  := 3.14;            // Agora armazena float
  i  := v;               // Converte de volta (pode falhar em runtime se incompatível)
end;

// ============================================================
procedure ExemploControleFluxo;
// Todos os tipos de controle de fluxo do Delphi
// ============================================================
var
  x, y, i, j : Integer;
  s           : string;
  dia         : TDiaSemana;
  ok          : Boolean;
begin
  x := 10;
  y := 3;

  // --- IF / ELSE IF / ELSE ---
  if x > 10 then
    s := 'Maior que 10'        // Sem begin/end quando uma única instrução
  else if x = 10 then
    s := 'Igual a 10'
  else
    s := 'Menor que 10';

  // IF com bloco (mais de uma instrução = obrigatório begin/end)
  if x > 5 then
  begin
    s := 'Grande';
    Inc(x);       // Inc(x) = x := x + 1 (mais rápido)
    Dec(y);       // Dec(y) = y := y - 1 (mais rápido)
  end
  else
  begin
    s := 'Pequeno';
    x := 0;
  end;

  // --- CASE (equivalente ao switch) ---
  case x of
    0:      s := 'Zero';
    1, 2:   s := 'Um ou Dois';      // Múltiplos valores separados por vírgula
    3..9:   s := 'Entre 3 e 9';     // Intervalo com ..
    10:
    begin
      s := 'Dez';      // Bloco com begin/end
      Inc(x);
    end;
  else
    s := 'Outro valor';              // else = default, caso nenhum bata
  end;

  // CASE com Char
  case s[1] of
    'A'..'Z': s := 'Maiúscula';
    'a'..'z': s := 'Minúscula';
    '0'..'9': s := 'Dígito';
  else
    s := 'Outro';
  end;

  // CASE com Enum
  dia := dsSegunda;
  case dia of
    dsDomingo, dsSabado: s := 'Fim de semana';
    dsSegunda..dsSexta:  s := 'Dia útil';
  end;

  // --- FOR (for clássico com contador) ---
  // Crescente: i vai de 1 até 10 (inclusivo)
  for i := 1 to 10 do
    Inc(GContadorGlobal);

  // Decrescente: i vai de 10 até 1 (inclusivo) - usa downto
  for i := 10 downto 1 do
    Dec(GContadorGlobal);

  // FOR aninhado
  for i := 1 to 3 do
    for j := 1 to 3 do
    begin
      x := i * j;
      if x > 6 then Break; // Break sai do for mais interno
    end;

  // --- FOR com Continue e Break ---
  for i := 1 to 20 do
  begin
    if i mod 2 = 0 then Continue; // Pula para próxima iteração (ignora pares)
    if i > 15      then Break;    // Encerra o loop completamente
    // Aqui só chegam os ímpares menores que 16
  end;

  // --- WHILE (testa condição ANTES de executar) ---
  x := 10;
  while x > 0 do
  begin
    Dec(x);
    if x = 3 then Break; // Pode usar Break e Continue aqui também
  end;

  // WHILE com condição composta
  x := 0;
  y := 100;
  while (x < 50) and (y > 0) do
  begin
    Inc(x, 5);   // Inc(x, 5) = x := x + 5
    Dec(y, 10);  // Dec(y, 10) = y := y - 10
  end;

  // --- REPEAT ... UNTIL (testa condição DEPOIS: executa pelo menos 1 vez) ---
  x := 0;
  repeat
    Inc(x);
  until x >= 5; // Condição de PARADA (oposto do while)

  // --- GOTO (evite! existe mas é má prática) ---
  // goto MinhaLabel;  // Salta para o label
  // MinhaLabel:       // Label: identificador seguido de :
end;

// ============================================================
procedure ExemploArrays;
// Arrays estáticos, dinâmicos e operações
// ============================================================
var
  // Arrays estáticos
  Vetor    : array[0..4] of Integer;
  Matriz   : array[1..2, 1..3] of Integer;

  // Arrays dinâmicos
  Dinamico : array of Integer;
  Strings  : array of string;

  i, j     : Integer;
  Total    : Integer;
begin
  // --- Array Estático ---
  Vetor[0] := 10;
  Vetor[1] := 20;
  Vetor[2] := 30;
  Vetor[3] := 40;
  Vetor[4] := 50;

  // Percorrer com Low e High (mais seguro que hardcode)
  Total := 0;
  for i := Low(Vetor) to High(Vetor) do  // Low = índice mínimo, High = máximo
    Total := Total + Vetor[i];

  // Matriz 2D
  Matriz[1,1] := 1; Matriz[1,2] := 2; Matriz[1,3] := 3;
  Matriz[2,1] := 4; Matriz[2,2] := 5; Matriz[2,3] := 6;

  for i := 1 to 2 do
    for j := 1 to 3 do
      Matriz[i,j] := Matriz[i,j] * 2;

  // --- Array Dinâmico ---
  SetLength(Dinamico, 5);         // Aloca espaço para 5 elementos
  for i := 0 to Length(Dinamico) - 1 do
    Dinamico[i] := i * 10;

  SetLength(Dinamico, 10);        // Redimensiona (mantém valores anteriores)
  SetLength(Dinamico, 0);         // Libera (tamanho zero)

  // Array dinâmico de strings
  SetLength(Strings, 3);
  Strings[0] := 'Alpha';
  Strings[1] := 'Beta';
  Strings[2] := 'Gamma';

  // Append (adicionar ao final)
  SetLength(Strings, Length(Strings) + 1);
  Strings[High(Strings)] := 'Delta';

  // Copy de array: copia elementos de Source para Dest
  // Dinamico := Copy(OutroArray, Inicio, Quantidade);
end;

// ============================================================
procedure ExemploRecords;
// Uso prático de Records
// ============================================================
var
  P1, P2   : TPessoa;
  Cliente  : TCliente;
  Pessoas  : array of TPessoa;
  i        : Integer;
begin
  // Inicialização campo a campo
  P1.Nome   := 'Alice';
  P1.Idade  := 30;
  P1.Altura := 1.65;
  P1.Ativo  := True;

  // Records são tipos por VALOR: P2 := P1 cria uma CÓPIA completa
  P2 := P1;           // Cópia total do record
  P2.Nome := 'Bob';   // Alteração em P2 NÃO afeta P1

  // Record aninhado
  Cliente.Pessoa.Nome       := 'Carlos';
  Cliente.Pessoa.Idade      := 45;
  Cliente.Endereco.Rua      := 'Rua das Flores';
  Cliente.Endereco.Numero   := 123;
  Cliente.Endereco.Cidade   := 'São Paulo';
  Cliente.Endereco.UF       := 'SP';
  Cliente.CPF               := '123.456.789-00';

  // Array de records
  SetLength(Pessoas, 3);
  for i := 0 to 2 do
  begin
    Pessoas[i].Nome  := Format('Pessoa %d', [i + 1]);
    Pessoas[i].Idade := 20 + i;
  end;
end;

// ============================================================
procedure ExemploPonteiros;
// Ponteiros: acesso direto à memória
// ============================================================
var
  x       : Integer;
  p       : PInteiro;   // Ponteiro para Integer
  pp      : PPessoa;    // Ponteiro para Record TPessoa
  Pessoa  : TPessoa;
begin
  x := 42;

  // @ = operador "endereço de": captura o endereço de memória da variável
  p := @x;

  // ^ = operador "dereference": acessa o VALOR no endereço apontado
  p^ := 100;          // x agora vale 100 (alterou via ponteiro)

  // Alocação dinâmica na HEAP
  New(p);             // Aloca memória para um Integer e aponta p para ela
  p^ := 999;          // Define o valor na memória alocada
  Dispose(p);         // Libera a memória! SEMPRE libere o que alocou

  // Ponteiro para Record
  New(pp);
  pp^.Nome  := 'Ponteiro';    // Acessa campo do record via ponteiro
  pp^.Idade := 1;
  Dispose(pp);

  // Ponteiro não inicializado = PERIGO! Nunca use sem inicializar
  p := nil;            // nil = ponteiro nulo (seguro para checar)
  if p <> nil then
    p^ := 0;           // Só acessa se não for nil

  // Aritmética de ponteiros (use com cuidado extremo)
  p := @x;
  // Inc(p) avança o ponteiro pelo tamanho do tipo (SizeOf(Integer) bytes)
end;

// ============================================================
procedure ExemploConjuntos;
// Sets: operações de conjunto
// ============================================================
var
  Perm    : TPermissoes;
  Semana  : TDiasSemana;
begin
  // Criar um conjunto
  Perm := [pLer, pEscrever];          // Inicializa com 2 permissões

  // Adicionar elemento
  Include(Perm, pExecutar);            // Adiciona pExecutar ao conjunto

  // Remover elemento
  Exclude(Perm, pEscrever);           // Remove pEscrever do conjunto

  // Verificar se elemento pertence
  if pLer in Perm then                 // "in" verifica pertencimento
    ;  // tem permissão de leitura

  // Operações de conjunto
  Perm := Perm + [pAdmin];            // União (adiciona)
  Perm := Perm - [pLer];             // Diferença (remove)
  Perm := Perm * [pLer, pExecutar];  // Interseção (mantém apenas os comuns)

  // Conjunto de Enum
  Semana := [dsSegunda, dsTerca, dsQuarta, dsQuinta, dsSexta]; // Dias úteis
  if dsSabado in Semana then
    ;  // Não entra aqui

  // Testar igualdade de conjuntos
  if Semana = [dsSegunda..dsSexta] then // Intervalo em set
    ; // São iguais
end;

// ============================================================
procedure ExemploOOP;
// Demonstração de OOP: criação, herança e polimorfismo
// ============================================================
var
  Animal   : TAnimal;    // Variável do tipo BASE
  Cachorro : TCachorro;
  Gato     : TGato;
  Lista    : array of TAnimal; // Array de tipos base (polimorfismo)
  i        : Integer;
begin
  // Criação de objetos (sempre no heap via construtor)
  Cachorro := TCachorro.Create('Rex', 'Labrador', 3);
  Gato     := TGato.Create('Mimi', 2, True);

  try
    // Uso direto
    Cachorro.EmitirSom;
    Gato.EmitirSom;

    // Acesso via propriedades
    Cachorro.Nome := 'Bolt';
    Cachorro.Peso := 25.5;

    // Polimorfismo: tratando tipos diferentes via tipo base
    SetLength(Lista, 2);
    Lista[0] := Cachorro;  // TCachorro onde se espera TAnimal (ok!)
    Lista[1] := Gato;      // TGato onde se espera TAnimal (ok!)

    for i := 0 to High(Lista) do
    begin
      Lista[i].EmitirSom;        // Chama a versão CORRETA (virtual dispatch)
      // WriteLn(Lista[i].Descrever);
    end;

    // Verificação de tipo em runtime
    for i := 0 to High(Lista) do
    begin
      if Lista[i] is TCachorro then             // "is" = verifica tipo (type check)
      begin
        Animal := TCachorro(Lista[i]);           // Cast seguro após verificação
        // Usar métodos específicos de TCachorro aqui
      end;

      // "as" = cast com exceção automática se tipo errado
      // Cachorro := Lista[i] as TCachorro;
    end;

  finally
    // SEMPRE libere no finally para garantir mesmo se houver exceção
    Cachorro.Free;    // Free = verifica nil antes e chama Destroy
    Gato.Free;
    // Lista[0] e Lista[1] já foram liberados acima, não libere de novo!
  end;
end;

// ============================================================
procedure ExemploExcecoes;
// Tratamento de erros com try/except/finally
// ============================================================
var
  x   : Integer;
  d   : Double;
  s   : string;
  obj : TAnimal;
begin
  obj := nil;

  // --- TRY / EXCEPT: captura e trata erros ---
  try
    x := 10 div 0; // Lança EDivByZero automaticamente
  except
    on E: EDivByZero do              // Captura tipo específico primeiro
      s := 'Divisão por zero: ' + E.Message;
    on E: EMathError do              // Depois o pai (mais genérico)
      s := 'Erro matemático: ' + E.Message;
    on E: Exception do               // Captura qualquer exceção (sempre por último)
      s := 'Erro genérico: ' + E.Message;
  end;

  // --- TRY / FINALLY: garante execução mesmo com erro ---
  // finally SEMPRE executa, com ou sem exceção
  obj := TAnimal.Create('Teste', 1);
  try
    // Código que pode falhar
    obj.Comer('Ração');
    x := StrToInt('não é número'); // Vai lançar exceção
  finally
    obj.Free;   // SEMPRE executa: garante que obj seja liberado
    obj := nil; // Boa prática: nil após Free evita double-free
  end;

  // --- TRY / EXCEPT / ELSE ---
  try
    x := StrToInt('123');
  except
    x := 0;  // Só executa se houve exceção
  // else:    // else do except = só executa se NÃO houve exceção (raro de usar)
  end;

  // --- LANÇAR exceções com RAISE ---
  try
    d := -5.0;
    if d < 0 then
      raise EValidacao.Create('Valor não pode ser negativo'); // Lança exceção

    if d = 0 then
      raise EValidacao.CreateFmt('Valor inválido: %.2f', [d]); // Com formatação
  except
    on E: EValidacao do
      s := 'Validação falhou: ' + E.Message;
  end;

  // --- RE-RAISE: relança a exceção após alguma ação ---
  try
    x := 10 div 0;
  except
    on E: Exception do
    begin
      // Logar o erro...
      raise; // Relança a mesma exceção para o chamador tratar
    end;
  end;

  // --- EXCEPT + FINALLY juntos ---
  try
    try
      x := StrToInt('abc');
    except
      on E: EConvertError do
        s := 'Erro de conversão: ' + E.Message;
    end;
  finally
    // Aqui você garante limpeza independente do que aconteceu
    GContadorGlobal := 0;
  end;
end;

// ============================================================
procedure ExemploStrings;
// Operações avançadas com strings
// ============================================================
var
  s, s2  : string;
  lista  : TStringList;
  i      : Integer;
begin
  s := 'Delphi 7 é incrível';

  // Comprimento
  i := Length(s);              // 20

  // Acessar caractere individual (strings em Delphi são 1-indexed!)
  s2 := s[1];                  // 'D' (ATENÇÃO: índice começa em 1, não 0!)
  s2 := s[Length(s)];          // Último caractere

  // Verificações
  if s = 'Teste' then ;                          // Comparação (case-sensitive)
  if CompareStr(s, s2) = 0 then ;                // Compara exato
  if CompareText(s, s2) = 0 then ;               // Compara ignorando maiúsc/minúsc
  if AnsiSameText(s, s2) then ;                  // Equivalente ao CompareText
  if AnsiStartsText('Delphi', s) then ;          // Começa com? (case insensitive)
  if AnsiEndsText('incrível', s) then ;          // Termina com?
  if AnsiContainsText(s, 'é') then ;             // Contém?

  // Busca
  i := Pos('7', s);             // 8 (1-indexed, 0 = não encontrou)
  i := AnsiPos('7', s);         // igual, mas com suporte a ANSI

  // Extração
  s2 := Copy(s, 1, 6);          // 'Delphi'
  s2 := Copy(s, 8, 1);          // '7'

  // Inserção e deleção (modificam s in-place)
  Insert(' Rocks', s, Length(s) + 1); // Insere no final: 'Delphi 7 é incrível Rocks'
  Delete(s, 1, 7);                    // Remove 7 chars a partir de 1

  // Substituição
  s2 := StringReplace(s, 'é', 'is', []);             // Substitui 1ª ocorrência
  s2 := StringReplace(s, 'i', 'I', [rfReplaceAll]);  // Substitui todas
  s2 := StringReplace(s, 'delphi', 'pascal',
    [rfReplaceAll, rfIgnoreCase]);                     // Todas, sem case sensitive

  // --- TStringList: lista de strings poderosa ---
  lista := TStringList.Create;
  try
    lista.Add('Linha 1');
    lista.Add('Linha 2');
    lista.Add('Linha 3');

    lista.Insert(1, 'Inserida');    // Insere na posição 1
    lista.Delete(0);                // Remove posição 0

    lista.Sorted := True;           // Ordena automaticamente
    lista.Duplicates := dupIgnore;  // Ignora duplicatas

    // Busca binária (só quando Sorted = True)
    if lista.Find('Linha 2', i) then
      s := lista[i]; // Encontrou na posição i

    // Percorrer
    for i := 0 to lista.Count - 1 do
      s := lista[i];   // Acessa pelo índice

    // Carregar/Salvar arquivo de texto
    // lista.LoadFromFile('arquivo.txt');
    // lista.SaveToFile('saida.txt');

    // Converter para string única (junta com LineBreak)
    s := lista.Text; // Todas as linhas juntas com #13#10

    // Delimiter e separadores
    lista.Delimiter := ',';
    lista.DelimitedText := 'a,b,c,d';  // Divide 'a,b,c,d' em 4 itens
    s := lista.DelimitedText;           // Une de volta com ','

    // CommaText (alias para DelimitedText com vírgula)
    lista.CommaText := '"item 1","item 2",item3';
    // Suporta aspas para itens com espaço

    // NameValueSeparator (para pares chave=valor)
    lista.NameValueSeparator := '=';
    lista.Add('nome=Alice');
    lista.Add('idade=30');
    s := lista.Values['nome'];   // 'Alice'
    s := lista.Values['idade'];  // '30'
    s := lista.Names[0];         // 'nome' (chave)

  finally
    lista.Free;
  end;
end;

// ============================================================
procedure ExemploDatasHoras;
// Trabalho com datas e horas (SysUtils)
// ============================================================
var
  Hoje       : TDate;      // Tipo Date (Double internamente)
  Agora      : TDateTime;  // Data + Hora
  Hora       : TTime;      // Só hora
  Ano, Mes, Dia  : Word;
  H, M, S, MS   : Word;
  s              : string;
begin
  Hoje  := Date;            // Data atual
  Agora := Now;             // Data e hora atual
  Hora  := Time;            // Hora atual

  // Decompor data
  DecodeDate(Hoje, Ano, Mes, Dia);
  // Decompor hora
  DecodeTime(Hora, H, M, S, MS);

  // Montar data específica
  Hoje := EncodeDate(2024, 12, 31);
  Hora := EncodeTime(23, 59, 59, 0);

  // Aritmética: TDateTime é um Double (1 = 1 dia)
  Agora := Hoje + 30;        // 30 dias depois
  Agora := Hoje - 7;         // 7 dias antes

  // Funções de extração
  Ano := YearOf(Agora);
  Mes := MonthOf(Agora);
  Dia := DayOf(Agora);
  H   := HourOf(Agora);
  M   := MinuteOf(Agora);
  S   := SecondOf(Agora);

  // Formatação
  s := DateToStr(Hoje);               // '31/12/2024' (depende do locale)
  s := TimeToStr(Hora);               // '23:59:59'
  s := DateTimeToStr(Agora);          // '31/12/2024 23:59:59'
  s := FormatDateTime('dd/mm/yyyy', Hoje);         // '31/12/2024'
  s := FormatDateTime('hh:nn:ss', Hora);            // '23:59:59'
  s := FormatDateTime('dd/mm/yyyy hh:nn:ss', Agora); // Completo

  // Parsing
  Hoje  := StrToDate('25/12/2024');
  Agora := StrToDateTime('25/12/2024 08:30:00');

  // Comparação
  if Hoje > Date then
    s := 'Futuro'
  else if Hoje < Date then
    s := 'Passado'
  else
    s := 'Hoje!';

  // Diferença entre datas (em dias)
  Mes := DaysBetween(EncodeDate(2024,1,1), EncodeDate(2024,12,31)); // 365
end;

// ============================================================
procedure ExemploArquivos;
// Leitura e escrita de arquivos (modo texto e binário)
// ============================================================
var
  ArqTexto    : TextFile;    // Arquivo de texto (legível)
  ArqBinario  : File;        // Arquivo binário (qualquer tipo)
  ArqTipado   : File of TPessoa; // Arquivo tipado (registros de tamanho fixo)
  s           : string;
  x           : Integer;
  Pessoa      : TPessoa;
begin
  // --- ARQUIVO TEXTO ---
  AssignFile(ArqTexto, 'saida.txt');   // Associa nome do arquivo

  // ESCRITA (cria ou sobrescreve)
  Rewrite(ArqTexto);                    // Abre para escrita (cria novo)
  try
    WriteLn(ArqTexto, 'Linha 1');       // Escreve com quebra de linha
    WriteLn(ArqTexto, 'Linha 2');
    Write(ArqTexto, 'Sem quebra');      // Escreve sem quebra de linha
    WriteLn(ArqTexto);                  // Só a quebra de linha
  finally
    CloseFile(ArqTexto);                // SEMPRE feche o arquivo
  end;

  // LEITURA
  AssignFile(ArqTexto, 'saida.txt');
  Reset(ArqTexto);                      // Abre para leitura
  try
    while not Eof(ArqTexto) do          // Eof = End of File
    begin
      ReadLn(ArqTexto, s);              // Lê uma linha
      // processar s...
    end;
  finally
    CloseFile(ArqTexto);
  end;

  // APPEND (adiciona ao final)
  AssignFile(ArqTexto, 'saida.txt');
  Append(ArqTexto);                     // Abre para adicionar no final
  try
    WriteLn(ArqTexto, 'Nova linha no final');
  finally
    CloseFile(ArqTexto);
  end;

  // --- FUNÇÕES DE SISTEMA DE ARQUIVOS ---
  if FileExists('saida.txt') then
    ; // Arquivo existe

  if DirectoryExists('C:\Temp') then
    ; // Diretório existe

  DeleteFile('saida.txt');              // Deleta arquivo
  RenameFile('velho.txt', 'novo.txt'); // Renomeia
  // CopyFile não é nativo no Delphi 7, use Windows.CopyFile ou SysUtils

  // Extrair partes do caminho
  s := ExtractFilePath('C:\Pasta\arq.txt'); // 'C:\Pasta\'
  s := ExtractFileName('C:\Pasta\arq.txt'); // 'arq.txt'
  s := ExtractFileExt('C:\Pasta\arq.txt');  // '.txt'
  s := ChangeFileExt('arq.txt', '.bak');    // 'arq.bak'
  s := GetCurrentDir;                        // Diretório atual
end;

// ============================================================
procedure ExemploTiposAuxiliares;
// TList, uso de With, constantes typed
// ============================================================
var
  Lista : TList;
  i     : Integer;
  p     : PPessoa;
  Pessoa: TPessoa;
  Vetor : TVetorInt;
begin
  // --- TList: lista de ponteiros (void*) ---
  Lista := TList.Create;
  try
    // Adicionar ponteiros para records
    New(p);
    p^.Nome  := 'Alice';
    p^.Idade := 25;
    Lista.Add(p);              // Adiciona ponteiro

    New(p);
    p^.Nome  := 'Bob';
    p^.Idade := 30;
    Lista.Add(p);

    // Percorrer e acessar
    for i := 0 to Lista.Count - 1 do
    begin
      p := PPessoa(Lista[i]); // Cast do ponteiro void* para PPessoa
      // WriteLn(p^.Nome);
    end;

    // Remover e limpar
    for i := 0 to Lista.Count - 1 do
      Dispose(PPessoa(Lista[i])); // Libera a memória dos records
    Lista.Clear;                  // Limpa a lista (mas não libera a memória dos itens!)

  finally
    Lista.Free;
  end;

  // --- WITH: atalho para acessar campos de record/objeto ---
  with Pessoa do
  begin
    Nome   := 'Carlos';    // Equivale a Pessoa.Nome := ...
    Idade  := 40;          // Equivale a Pessoa.Idade := ...
    Altura := 1.80;        // Equivale a Pessoa.Altura := ...
    Ativo  := True;
  end;
  // Evite with com múltiplos objetos (ambiguidade)

  // --- CONSTANTE TIPADA (inicializada, mas é variável!) ---
  // Em Delphi 7, "const tipada" dentro de procedure é na verdade uma variável global
  // que mantém seu valor entre chamadas (como static em C)
  // Isso é uma peculiaridade histórica do Delphi!
end;

// ============================================================
procedure ExemploMiscSintaxe;
// Outras construções da linguagem
// ============================================================
var
  s   : string;
  i, j: Integer;
begin
  // --- OPERADOR TERNÁRIO (não existe em Delphi! use if/else) ---
  // Em Delphi NÃO existe: x = (a > b) ? a : b;
  // Use: if a > b then x := a else x := b;
  if 10 > 5 then i := 10 else i := 5;

  // --- IfThen do Math (simula ternário para alguns tipos) ---
  i := IfThen(10 > 5, 10, 5);        // Retorna Integer
  s := IfThen(i > 3, 'sim', 'não');  // Retorna string (overload)

  // --- INC e DEC com passo ---
  Inc(i);        // i := i + 1
  Inc(i, 5);     // i := i + 5
  Dec(i);        // i := i - 1
  Dec(i, 3);     // i := i - 3

  // --- PRED e SUCC (predecessor e sucessor) ---
  i := Succ(10);   // 11 (próximo valor)
  i := Pred(10);   // 9  (valor anterior)
  // Funciona com Enum também:
  // dia := Succ(dsSegunda); // dsTerca

  // --- ODD e EVEN ---
  if Odd(i) then ;   // True se i é ímpar
  // Não existe Even nativo, use: if not Odd(i)

  // --- HIGH e LOW para tipos ---
  i := High(Integer);  // 2147483647
  i := Low(Integer);   // -2147483648
  i := High(Byte);     // 255
  i := Low(Byte);      // 0

  // --- SIZEOF ---
  i := SizeOf(Integer);  // 4 bytes
  i := SizeOf(Double);   // 8 bytes
  i := SizeOf(Char);     // 1 byte
  i := SizeOf(TPessoa);  // Soma dos campos

  // --- DEFAULT e ZERO (inicialização) ---
  // Variáveis LOCAIS em Delphi NÃO são inicializadas automaticamente
  // Variáveis GLOBAIS e campos de OBJETO são inicializados com zero/nil/''
  i := 0;    // Sempre inicialize variáveis locais explicitamente!
  s := '';

  // --- LABEL e GOTO (evite!) ---
  // goto MinhaLabel; // Salta para frente ou para trás
  // ...
  // MinhaLabel:      // Definição do label
end;

// ============================================================
procedure ExemploConversoes;
// Conversões entre tipos (casting e funções de conversão)
// ============================================================
var
  i  : Integer;
  d  : Double;
  s  : string;
  b  : Boolean;
  c  : Char;
begin
  // Integer <-> String
  i := StrToInt('42');            // '42' -> 42
  i := StrToIntDef('abc', -1);   // Falhou -> -1
  s := IntToStr(42);              // 42 -> '42'
  s := Format('%d', [42]);        // 42 -> '42'

  // Double <-> String
  d := StrToFloat('3.14');
  d := StrToFloatDef('abc', 0.0);
  s := FloatToStr(3.14);
  s := FloatToStrF(3.14159, ffFixed,  8, 2); // '3.14'
  s := FloatToStrF(3.14159, ffGeneral, 8, 4); // '3.142'
  s := Format('%.4f', [3.14159]);             // '3.1416'
  s := Format('%e',   [314159.0]);            // '3.1416e+05' (científico)

  // Boolean <-> String
  b := StrToBool('True');     // True
  b := StrToBool('1');        // True
  b := StrToBool('false');    // False
  s := BoolToStr(b, True);    // 'True' ou 'False' (True = usar palavras)
  s := BoolToStr(b);          // '-1' ou '0' (padrão sem o parâmetro True)

  // Integer <-> Boolean
  b := Boolean(1);   // True (qualquer != 0)
  b := Boolean(0);   // False
  i := Ord(b);       // True=1, False=0
  i := Integer(b);   // True=1, False=0 (depende do compilador, prefira Ord)

  // Char <-> Integer
  c := Chr(65);       // 'A'
  i := Ord('A');      // 65
  i := Ord('0');      // 48

  // Hexadecimal
  s := IntToHex(255, 4);   // '00FF' (valor, qtd de dígitos)
  i := StrToInt('$FF');    // 255 (prefixo $ = hex em Delphi)
  i := $FF;                // 255 (literal hexadecimal)
  i := $1A2B;              // 6699

  // Verificações seguras
  if TryStrToInt('123', i) then ;   // True se converteu
  if TryStrToFloat('1.5', d) then ; // True se converteu
end;

end.
