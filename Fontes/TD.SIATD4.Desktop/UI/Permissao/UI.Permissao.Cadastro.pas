{*Created by @ReisCodeGenerator*}
unit UI.Permissao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.Permissao;

type
  //TfrmCadPermissao = class(TFrmCadastroPadrao)
  TfrmCadPermissao = class(TControladorCadastroDesktop<TPermissao>)  
    lblPermissao: TLabel;
    edPermissao: TREdit;
    lblDescricao: TLabel;
    edDescricao: TREdit;
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPermissao: TfrmCadPermissao;

implementation

{$R *.dfm}

procedure TfrmCadPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
