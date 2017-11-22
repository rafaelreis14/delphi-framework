{*Created by @ReisCodeGenerator*}
unit UI.ClasseBase.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.ClasseBase; 

type
    //TfrmConClasseBase = class(TFrmConsultaPadrao)
	TfrmConClasseBase = class(TControladorConsultaDesktop<TClasseBase>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConClasseBase: TfrmConClasseBase;

implementation

{$R *.dfm}

uses UI.ClasseBase.Cadastro;


procedure TfrmConClasseBase.FormCreate(Sender: TObject);
begin
    inherited;
    [CRIAR_GRID_CONSULTA]
    Inicializar(TfrmCadClasseBase);    
end;

end.