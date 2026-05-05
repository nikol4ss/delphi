# Modulo 11 - VCL, eventos e formularios

Delphi 7 e muito usado com VCL, a biblioteca visual de formularios.

## Arquivos comuns de uma tela

- `.pas`: codigo da tela.
- `.dfm`: desenho da tela, componentes e propriedades visuais.
- `.dpr`: arquivo principal do projeto.

## Estrutura de um formulario

```pascal
type
  TFrmPrincipal = class(TForm)
    BtnSalvar: TButton;
    EdtNome: TEdit;
    procedure BtnSalvarClick(Sender: TObject);
  private
    function MontarMensagem: string;
  public
  end;
```

## Eventos

Evento e um metodo chamado pela VCL quando algo acontece.

- `FormCreate`: quando o form e criado.
- `ButtonClick`: quando um botao e clicado.
- `OnChange`: quando um texto muda.

O parametro `Sender` e o objeto que disparou o evento.

## Regra pratica

Deixe o evento pequeno. Ele deve pegar dados da tela, chamar uma regra e mostrar
resultado. Regras maiores devem ir para functions, procedures ou units separadas.

## Exemplo extra: evento pequeno

```pascal
procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  LblResultado.Caption := MontarResultado(EdtNome.Text);
end;
```

O evento so liga tela e regra. A regra fica em outro metodo.

## Exemplo extra: regra privada da tela

```pascal
function TFrmPrincipal.MontarResultado(const Nome: string): string;
begin
  if Trim(Nome) = '' then
    Result := 'Informe o nome'
  else
    Result := 'Ola, ' + Trim(Nome);
end;
```

Esse padrao deixa o formulario mais facil de manter.

## Como ler uma tela Delphi 7

Primeiro veja os componentes declarados no topo da classe. Depois procure os
eventos `Click`, `Create`, `Change` e `Close`. Eles mostram o comportamento da
tela.
