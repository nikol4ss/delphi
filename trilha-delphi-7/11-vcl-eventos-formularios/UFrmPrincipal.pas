unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPrincipal = class(TForm)
    EdtNome: TEdit;
    BtnSaudar: TButton;
    LblMensagem: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnSaudarClick(Sender: TObject);
  private
    function MontarSaudacao(const ANome: string): string;
  public
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := 'Exemplo VCL Delphi 7';
  LblMensagem.Caption := 'Digite seu nome e clique no botao.';
end;

procedure TFrmPrincipal.BtnSaudarClick(Sender: TObject);
begin
  LblMensagem.Caption := MontarSaudacao(EdtNome.Text);
end;

function TFrmPrincipal.MontarSaudacao(const ANome: string): string;
begin
  if Trim(ANome) = '' then
    Result := 'Informe um nome.'
  else
    Result := 'Ola, ' + Trim(ANome) + '!';
end;

end.
