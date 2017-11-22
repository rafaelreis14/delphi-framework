unit UI.Base.Controlador.CadastroMobile;

interface

uses
  UI.Base.CadastroPadrao, Framework.Controlador.CadastroBase;

type
    TControladorCadastroMobile<T: Class> = class(TFrmCadastroPadrao)
    private

    public
        procedure Inicializar;

        procedure ExecutarEventoMostrarFormulario(sender: TObject);
        procedure ExecutarEventoConfirmar(sender: TObject);
        procedure ExecutarEventoCancelar(sender: TObject);
    end;

implementation

{ TControladorCadastroMobile<T> }

procedure TControladorCadastroMobile<T>.ExecutarEventoCancelar(sender: TObject);
begin
    TControladorCadastroBase<T>.ExecutarCancelar(Self);
end;

procedure TControladorCadastroMobile<T>.ExecutarEventoConfirmar(sender: TObject);
begin
   TControladorCadastroBase<T>.ExecutarSalvar(T(Objeto),Self, ErrorProvider1,AcaoJanela);
end;

procedure TControladorCadastroMobile<T>.ExecutarEventoMostrarFormulario(sender: TObject);
begin
    TControladorCadastroBase<T>.ExecutarMostrarFormulario(T(Objeto), Self, AcaoJanela, btnConfirmar);
end;

procedure TControladorCadastroMobile<T>.Inicializar;
begin
    btnConfirmar.OnClick := ExecutarEventoConfirmar;
    btnCancelar.OnClick := ExecutarEventoCancelar;
    Self.OnShow := ExecutarEventoMostrarFormulario;
end;

end.
