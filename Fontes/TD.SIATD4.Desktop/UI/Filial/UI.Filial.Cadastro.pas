unit UI.Filial.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, Biz.Filial, UI.Base.CadastroPadrao;

type
  //TfrmCadFilial = class(TFrmCadastroPadrao)
  TfrmCadFilial = class(TControladorCadastroDesktop<TFilial>)
    Label2: TLabel;
    REdit2: TREdit;
    Label3: TLabel;
    Label4: TLabel;
    REdit3: TREdit;
    TabSheet1: TTabSheet;
    REdit6: TREdit;
    REdit1: TREdit;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    REdit8: TREdit;
    Label9: TLabel;
    REdit9: TREdit;
    Label10: TLabel;
    Label11: TLabel;
    REdit10: TREdit;
    REdit11: TREdit;
    Label12: TLabel;
    REdit12: TREdit;
    Label13: TLabel;
    REdit5: TREdit;
    Label6: TLabel;
    REdit7: TREdit;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    REdit4: TREdit;
    Label5: TLabel;
    Label14: TLabel;
    REdit13: TREdit;
    Label15: TLabel;
    REdit14: TREdit;
    Label16: TLabel;
    REdit15: TREdit;
    REdit16: TREdit;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

{$R *.dfm}

procedure TfrmCadFilial.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
