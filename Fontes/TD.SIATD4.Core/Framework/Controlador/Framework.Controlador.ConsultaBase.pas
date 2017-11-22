unit Framework.Controlador.ConsultaBase;

interface

uses RGrid, Forms, Framework.Interfaces.CRUD, Lib.Biblioteca, Lib.Enumeradores,
    Vcl.StdCtrls, Lib.Base, Lib.Parametro, Lib.ResultFilter,
    Framework.UI.FormBase, Vcl.Controls, System.Generics.Collections;

type
    TControladorConsultaBase<T: Class> = class
    public
        class procedure ExecutaPesquisar(grid: TRGrid; labelTotal: TLabel; out ResultFilter: TResultFilter); static;
        class procedure ExecutarInserir(grid: TRGrid; formularioCadastro: TFormClass; labelTotal: TLabel); static;
        class procedure ExecutarAlterar(grid: TRGrid; formularioCadastro: TFormClass; resultFilter: TResultFilter); static;
        class procedure ExecutarExcluir(grid: TRGrid; resultFilter: TResultFilter); static;
        class procedure ExecutarVisualizar(grid: TRGrid; formularioCadastro: TFormClass); static;
    end;

implementation

uses
    System.Classes, System.SysUtils, Lib.Lista, Lib.ClasseBase;

{ TControladorConsultaBase<T> }

class procedure TControladorConsultaBase<T>.ExecutaPesquisar(grid: TRGrid; labelTotal: TLabel; out ResultFilter: TResultFilter);
var
    objeto: T;
begin
    try
        objeto := Tlib.CriaInstancia<T>;
        ResultFilter := ICRUD<T>(objeto).Listar(otFilter, false);
        grid.DataSource(ResultFilter.List);
        grid.DataBind;

        labelTotal.Caption := IntToStr(grid.GetTotalItens);

        grid.SetFocus;
    finally
        if objeto <> nil then
            FreeAndNil(objeto);
    end;
end;

class procedure TControladorConsultaBase<T>.ExecutarAlterar(grid: TRGrid; formularioCadastro: TFormClass; resultFilter: TResultFilter);
var
    objeto: T;
begin
    try
        objeto := nil;
        try
            if grid.IsEmpty then
                raise Exception.Create('Selecione um registro na grid para efetuar esta opera��o');

            objeto := grid.GetObject<T>;

            if Tlib.AbrirFormulario(formularioCadastro, acAlteracao, objeto) = rfOK then
            begin
                if objeto = nil then
                    objeto := Tlib.CriaInstancia<T>;

                if resultFilter = nil then
                begin
                    resultFilter := TResultFilter.Create;
                    resultFilter.Parameters := TClasseBase(objeto).ObjetoParaParametros(Consulta)
                end;



                grid.DataSource<T>(ICRUD<T>(objeto).Consultar(resultFilter.Parameters));
                grid.DataBind;
                grid.SetFocus;

                FreeAndNil(objeto);
            end;
        except
            on e: Exception do
                raise Exception.Create('Erro ao alterar registro' + #13 + e.Message);
        end;
    finally


    end;
end;

class procedure TControladorConsultaBase<T>.ExecutarExcluir(grid: TRGrid; resultFilter: TResultFilter);
var
    objeto: T;
    lista: TLista<T>;
begin
    try
        lista := nil;
        objeto := nil;
        if grid.IsEmpty then
            raise Exception.Create('Selecione um registro na grid para efetuar esta opera��o');

        if Tlib.MensagemPergunta('Deseja realmente excluir?', 'Exclus�o') = mrYes then
        begin
            try
                objeto := grid.GetObject<T>;
                ICRUD<T>(objeto).Excluir;
                if resultFilter <> nil then
                begin
                    lista := ICRUD<T>(objeto).Consultar(resultFilter.Parameters);
                    if lista <> nil then
                    begin
                        grid.DataSource<T>(lista);
                        grid.DataBind;
                    end;
                end
                else
                    grid.DeleteRow;

                grid.SetFocus;
            except
                on e: Exception do
                    raise Exception.Create('Erro ao excluir o registro' + #13 + e.Message);
            end;
        end;
    finally
        if objeto <> nil then
            FreeAndNil(objeto);

        if lista <> nil then
            FreeAndNil(lista);
    end;
end;

class procedure TControladorConsultaBase<T>.ExecutarInserir(grid: TRGrid; formularioCadastro: TFormClass; labelTotal: TLabel);
var
    objeto: T;
begin
    try
        objeto := Tlib.CriaInstancia<T>;

        if Tlib.AbrirFormulario(formularioCadastro, acInsercao, objeto) = rfOK then
        begin
            grid.ClearDataSource;

//            if not grid.IsAssigned then
//                grid.DataSource := TList.Create;

            grid.DataSource<T>(ICRUD<T>(objeto).Consultar(TClasseBase(objeto).ObjetoParaParametros(Insercao)));
            grid.DataBind;
            grid.Row := grid.RowCount - 1;
            labelTotal.Caption := IntToStr(grid.GetTotalItens);
            grid.SetFocus;
        end;
    except
        if objeto <> nil then
            FreeAndNil(objeto);
    end;
end;

class procedure TControladorConsultaBase<T>.ExecutarVisualizar(grid: TRGrid; formularioCadastro: TFormClass);
var
    objeto: T;
begin
    objeto := nil;
    try
        if grid.IsEmpty then
            raise Exception.Create('Selecione um registro na grid para efetuar esta opera��o');

        objeto := grid.GetObject<T>;
        Tlib.AbrirFormulario(formularioCadastro, acVisualizacao, objeto);
    finally

    end;
end;

end.
