{*Created by @ReisCodeGenerator*}
unit UI.TipoEntrega.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.TipoEntrega;

type
  //TfrmCadTipoEntrega = class(TFrmCadastroPadrao)
  TfrmCadTipoEntrega = class(TControladorCadastroDesktop<TTipoEntrega>)
    lblCodigoFilial: TLabel;
    edCodigoFilial: TREdit;
    lblTipoEntrega: TLabel;
    edTipoEntrega: TREdit;
    lblDescricao: TLabel;
    edDescricao: TREdit;
    lblCor: TLabel;
    edCor: TREdit;
    lblMarcaOrcamento: TLabel;
    edMarcaOrcamento: TREdit;
    lblDelete: TLabel;
    edDelete: TREdit;
    lblRecno: TLabel;
    edRecno: TREdit;
    lblCodigoFilialReserva: TLabel;
    edCodigoFilialReserva: TREdit;
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoEntrega: TfrmCadTipoEntrega;

implementation

{$R *.dfm}

procedure TfrmCadTipoEntrega.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
