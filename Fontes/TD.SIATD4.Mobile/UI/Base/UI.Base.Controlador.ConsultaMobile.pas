unit UI.Base.Controlador.ConsultaMobile;

interface

uses UI.Base.ConsultaPadrao, Framework.Interfaces.CRUD, Lib.Biblioteca,
  Framework.Controlador.ConsultaBase, Vcl.Forms, Lib.ResultFilter, UI.Base.CadastroPadrao;

type
    TControladorConsultaDesktop<T: Class> = class(TFrmConsultaPadrao)
    private
        FFormularioCadastro: TFormClass;
        FResultFilter: TResultFilter;
        procedure SetFormularioCadastro(const Value: TFormClass);
        procedure SetResultFilter(const Value: TResultFilter);
    public
        property FormularioCadastro: TFormClass read FFormularioCadastro write SetFormularioCadastro;
        property ResultFilter: TResultFilter read FResultFilter write SetResultFilter;

        procedure Inicializar(formCadastro: TFormClass);
        procedure Finalizar;

        procedure ExecutarInserirClick(sender: TObject); virtual;
        procedure ExecutarAlterarClick(sender: TObject); virtual;
        procedure ExecutarExcluirClick(sender: TObject); virtual;
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
    TControladorConsultaBase<T>.ExecutarInserir(grDados,FormularioCadastro,nil);
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
end;

procedure TControladorConsultaDesktop<T>.SetFormularioCadastro(
  const Value: TFormClass);
begin
    FFormularioCadastro := Value;
end;

procedure TControladorConsultaDesktop<T>.SetResultFilter(const Value: TResultFilter);
begin
    FResultFilter := Value;
end;

end.
