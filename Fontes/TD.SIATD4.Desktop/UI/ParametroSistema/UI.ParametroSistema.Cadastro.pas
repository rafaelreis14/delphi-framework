{*Created by @ReisCodeGenerator*}
unit UI.ParametroSistema.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.ParametroSistema, Lib.Enumeradores, RComboBox;

type
  //TfrmCadParametroSistema = class(TFrmCadastroPadrao)
  TfrmCadParametroSistema = class(TControladorCadastroDesktop<TParametroSistema>)
    lblNome: TLabel;
    edNome: TREdit;
    lblValor: TLabel;
    edValor: TREdit;
    Label1: TLabel;
    cbFilial: TRComboBox;
	procedure FormCreate(Sender: TObject);
    function Validar:boolean; override;
    procedure ExecutarEventoMostrarFormulario(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParametroSistema: TfrmCadParametroSistema;

implementation

uses
  Biz.UsuarioLogado, Biz.Filial;

{$R *.dfm}

procedure TfrmCadParametroSistema.ExecutarEventoMostrarFormulario(Sender: TObject);
var
    filial:TFilial;
begin
    filial := TFilial.Create;
    try
        cbFilial.DataSource<TFilial>(filial.ObterTodasFiliais);
        cbFilial.DataBind;
    finally
        FreeAndNil(filial);
    end;
    inherited;
end;

procedure TfrmCadParametroSistema.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

function TfrmCadParametroSistema.Validar: boolean;
begin
    if AcaoJanela = acInsercao then
        TParametroSistema(Objeto).CodigoEmpresa := TUsuarioLogado.ObterInstancia.Filial.Empresa;

    result := true;
end;

end.
