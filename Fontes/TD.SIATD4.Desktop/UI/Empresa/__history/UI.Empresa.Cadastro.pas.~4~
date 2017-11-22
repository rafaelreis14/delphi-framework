{*Created by @ReisCodeGenerator*}
unit UI.Empresa.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.Empresa;

type
  //TfrmCadEmpresa = class(TFrmCadastroPadrao)
  TfrmCadEmpresa = class(TControladorCadastroDesktop<TEmpresa>)  
    lblEmpresa: TLabel;
    edEmpresa: TREdit;
    lblNome: TLabel;
    edNome: TREdit;
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

{$R *.dfm}

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
