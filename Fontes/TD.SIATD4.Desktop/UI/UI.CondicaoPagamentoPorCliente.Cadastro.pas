{*Created by @ReisCodeGenerator*}
unit UI.CondicaoPagamentoPorCliente.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.CondicaoPagamentoPorCliente;

type
//  TfrmCadCondicaoPagamentoPorCliente = class(TFrmCadastroPadrao)
  TfrmCadCondicaoPagamentoPorCliente = class(TControladorCadastroDesktop<TCondicaoPagamentoPorCliente>)
    lblFilial: TLabel;
    edFilial: TREdit;
    lblCodigoCliente: TLabel;
    edCodigoCliente: TREdit;
    lblCodigoCondicaoPagamaneto: TLabel;
    edCodigoCondicaoPagamaneto: TREdit;
    lblBloqueado: TLabel;
    edBloqueado: TREdit;
    lblDelete: TLabel;
    edDelete: TREdit;
    lblRecno: TLabel;
    edRecno: TREdit;
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCondicaoPagamentoPorCliente: TfrmCadCondicaoPagamentoPorCliente;

implementation

{$R *.dfm}

procedure TfrmCadCondicaoPagamentoPorCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
