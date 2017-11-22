{*Created by @ReisCodeGenerator*}
unit UI.CondicaoPagamentoPorCliente.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.CondicaoPagamentoPorCliente, UI.Base.ConsultaPadrao;

type
//    TfrmConCondicaoPagamentoPorCliente = class(TFrmConsultaPadrao)
	TfrmConCondicaoPagamentoPorCliente = class(TControladorConsultaDesktop<TCondicaoPagamentoPorCliente>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConCondicaoPagamentoPorCliente: TfrmConCondicaoPagamentoPorCliente;

implementation

{$R *.dfm}

uses UI.CondicaoPagamentoPorCliente.Cadastro;


procedure TfrmConCondicaoPagamentoPorCliente.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Filial', 'Filial', 52, RGrid.mtString);
    grDados.AddCol('CodigoCliente', 'CodigoCliente', 56, RGrid.mtString);
    grDados.AddCol('CodigoCondicaoPagamaneto', 'CodigoCondicaoPagamaneto', 53, RGrid.mtString);
    grDados.AddCol('Bloqueado', 'Bloqueado', 51, RGrid.mtString);
    grDados.AddCol('Delete', 'Delete', 51, RGrid.mtString);
    grDados.AddCol('Recno', 'Recno', 50, RGrid.mtInteger);
    Inicializar(TfrmCadCondicaoPagamentoPorCliente);    
end;

end.
