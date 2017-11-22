{*Created by @ReisCodeGenerator*}
unit UI.Empresa.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.Empresa, UI.Base.ConsultaPadrao;

type
    //TfrmConEmpresa = class(TFrmConsultaPadrao)
	TfrmConEmpresa = class(TControladorConsultaDesktop<TEmpresa>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConEmpresa: TfrmConEmpresa;

implementation

{$R *.dfm}

uses UI.Empresa.Cadastro;


procedure TfrmConEmpresa.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Empresa', 'Empresa', 150, RGrid.mtString);
    grDados.AddCol('Nome', 'Nome', 200, RGrid.mtString);

    Inicializar(TfrmCadEmpresa);    
end;

end.
