unit UI.Base.Controlador.ConsultaDesktop;

interface

uses UI.Base.ConsultaPadrao, Framework.Interfaces.CRUD, Lib.Biblioteca,
  Framework.Controlador.ConsultaBase, Vcl.Forms, Lib.ResultFilter;

type
    TControladorConsultaDesktop<T: Class> = class(TFrmConsultaPadrao)
    private
        FormularioCadastro: TFormClass;
        FResultFilter: TResultFilter;
        procedure SetResultFilter(const Value: TResultFilter);
    public
        property ResultFilter: TResultFilter read FResultFilter write SetResultFilter;

        procedure Inicializar(formCadastro: TFormClass);
        procedure Finalizar;

        procedure ExecutarInserirClick(sender: TObject); virtual;
        procedure ExecutarAlterarClick(sender: TObject); virtual;
        procedure ExecutarExcluirClick(sender: TObject); virtual;
        procedure ExecutarVisualizarClick(sender: TObject); virtual;
        procedure ExecutarPesquisarClick(sender: TObject); virtual;
    end;

implementation

uses
  System.SysUtils;



{ TControladorConsultaDesktop<T> }

procedure TControladorConsultaDesktop<T>.ExecutarAlterarClick(sender: TObject);
begin
    TControladorConsultaBase<T>.ExecutarAlterar(grDados,FormularioCadastro, ResultFilter);
end;

procedure TControladorConsultaDesktop<T>.ExecutarExcluirClick(sender: TObject);
begin
    TControladorConsultaBase<T>.ExecutarExcluir(grDados,ResultFilter);
end;

procedure TControladorConsultaDesktop<T>.ExecutarInserirClick(sender: TObject);
begin
    TControladorConsultaBase<T>.ExecutarInserir(grDados,FormularioCadastro,lblTotalDeRegistros);
end;

procedure TControladorConsultaDesktop<T>.ExecutarPesquisarClick(sender: TObject);
begin
    TControladorConsultaBase<T>.ExecutaPesquisar(grDados,lblTotalDeRegistros, fResultFilter);
end;

procedure TControladorConsultaDesktop<T>.ExecutarVisualizarClick(sender: TObject);
begin
    TControladorConsultaBase<T>.ExecutarVisualizar(grDados,FormularioCadastro);
end;

procedure TControladorConsultaDesktop<T>.Finalizar;
begin
    if FResultFilter <> nil then
        FreeAndNil(FResultFilter);
end;

procedure TControladorConsultaDesktop<T>.Inicializar(formCadastro: TFormClass);
begin
    FormularioCadastro := formCadastro;
    btnInserir.OnClick := ExecutarInserirClick;
    btnAlterar.OnClick := ExecutarAlterarClick;
    btnExcluir.OnClick := ExecutarExcluirClick;
    btnVisualizar.OnClick := ExecutarVisualizarClick;
    btnPesquisar.OnClick := ExecutarPesquisarClick;
end;


procedure TControladorConsultaDesktop<T>.SetResultFilter(const Value: TResultFilter);
begin
    FResultFilter := Value;
end;

end.
