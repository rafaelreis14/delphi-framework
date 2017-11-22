{*Created by @ReisCodeGenerator*}
unit UI.Modulo.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.Modulo, UI.Base.ConsultaPadrao;

type
    //TfrmConModulo = class(TFrmConsultaPadrao)
	TfrmConModulo = class(TControladorConsultaDesktop<TModulo>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConModulo: TfrmConModulo;

implementation

{$R *.dfm}

uses UI.Modulo.Cadastro;


procedure TfrmConModulo.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Modulo', 'Modulo', 200, RGrid.mtString);
    grDados.AddCol('Descricao', 'Descriçãoo', 200, RGrid.mtString);
    Inicializar(TfrmCadModulo);
end;

end.
