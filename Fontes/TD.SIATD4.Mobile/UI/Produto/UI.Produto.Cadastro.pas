unit UI.Produto.Cadastro;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Biz.Produto, Vcl.StdCtrls,
    Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, REdit,
    UI.Base.Controlador.CadastroMobile, UI.Base.CadastroPadrao;

type
    //TfrmCadProdutoMobile = class(TFrmCadastroPadrao)
    TfrmCadProdutoMobile = class(TControladorCadastroMobile<TProduto>)
        edCodigo: TREdit;
        Label1: TLabel;
        edDescricao: TREdit;
        Label2: TLabel;
        edCodigoBarra1: TREdit;
        Label3: TLabel;
        edCodigoBarra2: TREdit;
        Label4: TLabel;
        edCodigoBarra3: TREdit;
        Label5: TLabel;
        REdit1: TREdit;
        REdit2: TREdit;
        Label6: TLabel;
        Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmCadProdutoMobile: TfrmCadProdutoMobile;

implementation

{$R *.dfm}

procedure TfrmCadProdutoMobile.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
