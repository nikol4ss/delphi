unit USoapXmlManual;

interface

function XmlEscape(const Valor: string): string;
function MontarEnvelopeSomar(A, B: Integer): string;
function ExtrairValorTag(const Xml, Tag: string): string;
function ExtrairResultadoSomar(const Xml: string): Integer;

implementation

uses
  SysUtils;

function XmlEscape(const Valor: string): string;
begin
  Result := StringReplace(Valor, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&apos;', [rfReplaceAll]);
end;

function MontarEnvelopeSomar(A, B: Integer): string;
begin
  Result :=
    '<?xml version="1.0" encoding="utf-8"?>' + #13#10 +
    '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
    'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
    'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' + #13#10 +
    '  <soap:Body>' + #13#10 +
    '    <Somar xmlns="http://tempuri.org/">' + #13#10 +
    '      <A>' + IntToStr(A) + '</A>' + #13#10 +
    '      <B>' + IntToStr(B) + '</B>' + #13#10 +
    '    </Somar>' + #13#10 +
    '  </soap:Body>' + #13#10 +
    '</soap:Envelope>';
end;

function ExtrairValorTag(const Xml, Tag: string): string;
var
  TagInicio: string;
  TagFim: string;
  Inicio: Integer;
  Fim: Integer;
begin
  Result := '';
  TagInicio := '<' + Tag + '>';
  TagFim := '</' + Tag + '>';

  Inicio := Pos(TagInicio, Xml);
  if Inicio = 0 then
    Exit;

  Inicio := Inicio + Length(TagInicio);
  Fim := Pos(TagFim, Xml);
  if Fim = 0 then
    Exit;

  Result := Copy(Xml, Inicio, Fim - Inicio);
end;

function ExtrairResultadoSomar(const Xml: string): Integer;
var
  Texto: string;
begin
  Texto := ExtrairValorTag(Xml, 'SomarResult');
  Result := StrToIntDef(Texto, 0);
end;

end.
