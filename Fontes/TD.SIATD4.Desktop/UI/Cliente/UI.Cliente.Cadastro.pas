unit UI.Cliente.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, REdit, UntErrorProvider, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, RComboBox, UI.Base.CadastroPadrao,
  UI.Base.Controlador.CadastroDesktop, Biz.Cliente;

type
  //TfrmCadCliente = class(TFrmCadastroPadrao)
  TfrmCadCliente = class(TControladorCadastroDesktop<TCliente>)
    TabSheet1: TTabSheet;
    Label8: TLabel;
    edRecno: TREdit;
    Label2: TLabel;
    REdit1: TREdit;
    REdit2: TREdit;
    Label3: TLabel;
    Label4: TLabel;
    REdit3: TREdit;
    REdit4: TREdit;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    REdit7: TREdit;
    Label10: TLabel;
    REdit8: TREdit;
    Label11: TLabel;
    REdit9: TREdit;
    Label12: TLabel;
    REdit10: TREdit;
    Label13: TLabel;
    REdit11: TREdit;
    Label14: TLabel;
    REdit12: TREdit;
    Label15: TLabel;
    REdit13: TREdit;
    Label16: TLabel;
    REdit14: TREdit;
    Label6: TLabel;
    cbTipoPessoa: TRComboBox;
    cbTipoCliente: TRComboBox;
    Label17: TLabel;
    REdit5: TREdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
  cbTipoPessoa.DataBind;
  cbTipoCliente.DataBind;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  if  TCliente(Objeto).TipoPessoa = 'J' then
      REdit3.MaskType := mtCNPJ;

end;

end.
