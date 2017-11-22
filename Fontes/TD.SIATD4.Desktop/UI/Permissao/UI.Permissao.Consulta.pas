{*Created by @ReisCodeGenerator*}
unit UI.Permissao.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, RTTI, UI.Base.Controlador.ConsultaDesktop,
	Biz.Permissao, UI.Base.ConsultaPadrao;

type
    //TfrmConPermissao = class(TFrmConsultaPadrao)
	TfrmConPermissao = class(TControladorConsultaDesktop<TPermissao>)
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConPermissao: TfrmConPermissao;

implementation

{$R *.dfm}

uses UI.Permissao.Cadastro;


procedure TfrmConPermissao.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Permissao', 'Permissao', 110, RGrid.mtString);
    grDados.AddCol('Descricao', 'Descricao', 200, RGrid.mtString);
    Inicializar(TfrmCadPermissao);
end;

end.
