{ *Created by @ReisCodeGenerator* }
unit UI.TipoEntrega.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
    Biz.TipoEntrega, UI.Base.ConsultaPadrao;

type
    // TfrmConTipoEntrega = class(TFrmConsultaPadrao)
    TfrmConTipoEntrega = class(TControladorConsultaDesktop<TTipoEntrega>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConTipoEntrega: TfrmConTipoEntrega;

implementation

{$R *.dfm}

uses UI.TipoEntrega.Cadastro;

procedure TfrmConTipoEntrega.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('CodigoFilial', 'CodigoFilial', 52, RGrid.mtString);
    grDados.AddCol('TipoEntrega', 'TipoEntrega', 53, RGrid.mtString);
    grDados.AddCol('Descricao', 'Descricao', 120, RGrid.mtString);
    grDados.AddCol('Cor', 'Cor', 70, RGrid.mtString);
    grDados.AddCol('MarcaOrcamento', 'MarcaOrcamento', 51, RGrid.mtString);
    grDados.AddCol('Delete', 'Delete', 51, RGrid.mtString);
    grDados.AddCol('Recno', 'Recno', 50, RGrid.mtInteger);
    grDados.AddCol('CodigoFilialReserva', 'CodigoFilialReserva', 52, RGrid.mtString);
    grDados.AddCol('TipoEntregaPadrao', 'TipoEntregaPadrao', 52, RGrid.mtString);
    Inicializar(TfrmCadTipoEntrega);
end;

end.
