{*Created by @ReisCodeGenerator*}
unit UI.ControleVersao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.ControleVersao, RComboBox;

type
  //TfrmCadControleVersao = class(TFrmCadastroPadrao)
  TfrmCadControleVersao = class(TControladorCadastroDesktop<TControleVersao>)  
    lblCodigoFilial: TLabel;
    lblVersao: TLabel;
    edVersao: TREdit;
    lblTipo: TLabel;
    lblStatus: TLabel;
    cbFilial: TRComboBox;
    cbTipo: TRComboBox;
    cbStatus: TRComboBox;
	procedure FormCreate(Sender: TObject);
  private
    procedure ExecutarEventoMostrarFormulario(Sender:TObject); override;
  public
    { Public declarations }
  end;

var
  frmCadControleVersao: TfrmCadControleVersao;

implementation

uses
  Biz.Filial;

{$R *.dfm}

procedure TfrmCadControleVersao.ExecutarEventoMostrarFormulario(Sender: TObject);
begin
    cbFilial.DataSource<TFilial>(TFilial.ObterTodasFiliais);
    cbFilial.DataBind;
    cbStatus.DataBind;
    cbTipo.DataBind;
    inherited;
end;

procedure TfrmCadControleVersao.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;

end;

end.
