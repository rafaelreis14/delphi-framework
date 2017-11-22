{*Created by @ReisCodeGenerator*}
unit UI.Orcamento.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.Orcamento, UI.Base.ConsultaPadrao;

type
    //TfrmConOrcamento = class(TFrmConsultaPadrao)
	TfrmConOrcamento = class(TControladorConsultaDesktop<TOrcamento>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConOrcamento: TfrmConOrcamento;

implementation

{$R *.dfm}

uses UI.Orcamento.Cadastro;


procedure TfrmConOrcamento.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('CodigoFilial', 'CodigoFilial', 52, RGrid.mtString);
    grDados.AddCol('NumeroOrcamento', 'NumeroOrcamento', 56, RGrid.mtString);
    grDados.AddCol('CodigoVendedor', 'CodigoVendedor', 56, RGrid.mtString);
    grDados.AddCol('NomeVendedor', 'NomeVendedor', 65, RGrid.mtString);
    grDados.AddCol('LojaCliente', 'LojaCliente', 52, RGrid.mtString);
    grDados.AddCol('CodigoCliente', 'CodigoCliente', 56, RGrid.mtString);
    grDados.AddCol('NomeCliente', 'NomeCliente', 80, RGrid.mtString);
    grDados.AddCol('StatusOrcamento', 'StatusOrcamento', 55, RGrid.mtString);
    grDados.AddCol('DataEmissao', 'DataEmissao', 58, RGrid.mtDate);
    grDados.AddCol('ValorLiquido', 'ValorLiquido', 50, RGrid.mtCurrency);
    Inicializar(TfrmCadOrcamento);
end;

end.
