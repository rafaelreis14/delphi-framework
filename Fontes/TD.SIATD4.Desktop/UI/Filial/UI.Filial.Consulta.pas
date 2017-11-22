unit UI.Filial.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, RGrid,
    Vcl.Buttons, Vcl.Menus, Biz.Filial, Lib.ResultFilter, RTTI, UI.Base.Controlador.ConsultaDesktop, UI.Base.ConsultaPadrao;

type
    //TfrmConFilial = class(TFrmConsultaPadrao)
    TfrmConFilial = class(TControladorConsultaDesktop<TFilial>)
        procedure FormCreate(Sender: TObject);
    end;

var
    frmConFilial: TfrmConFilial;

implementation

uses UI.Filial.Cadastro;

{$R *.dfm}

procedure TfrmConFilial.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Empresa', 'Empresa', 100, RGrid.mtString);
    grDados.AddCol('Filial', 'Filial', 100, RGrid.mtString);
    grDados.AddCol('Descricao', 'Descrição', 250, RGrid.mtString);
    Inicializar(TfrmCadFilial);
end;

end.
