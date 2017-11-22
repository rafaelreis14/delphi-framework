{*Created by @ReisCodeGenerator*}
unit UI.ControleVersao.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.ControleVersao, UI.Base.ConsultaPadrao;

type
    //TfrmConControleVersao = class(TFrmConsultaPadrao)
	TfrmConControleVersao = class(TControladorConsultaDesktop<TControleVersao>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConControleVersao: TfrmConControleVersao;

implementation

{$R *.dfm}

uses UI.ControleVersao.Cadastro;


procedure TfrmConControleVersao.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('CodigoFilial', 'CodigoFilial', 52, RGrid.mtString);
    grDados.AddCol('Versao', 'Versao', 100, RGrid.mtString);
    grDados.AddCol('Tipo_', 'Tipo', 100, RGrid.mtString);
    grDados.AddCol('Status_', 'Status', 100, RGrid.mtString);
    Inicializar(TfrmCadControleVersao);
end;

end.
