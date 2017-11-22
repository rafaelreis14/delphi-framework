unit UI.Base.Controlador.CadastroDesktop;

interface

uses
  UI.Base.CadastroPadrao, Framework.Controlador.CadastroBase;

type
    TControladorCadastroDesktop<T: Class> = class(TFrmCadastroPadrao)
    private

    public
        procedure Inicializar;

        function Validar: boolean; virtual;

        procedure ExecutarEventoMostrarFormulario(sender: TObject);  virtual;
        procedure ExecutarEventoConfirmar(sender: TObject); virtual;
        procedure ExecutarEventoCancelar(sender: TObject); virtual;
    end;

implementation

{ TControladorCadastroDesktop<T> }

procedure TControladorCadastroDesktop<T>.ExecutarEventoCancelar(sender: TObject);
begin
    TControladorCadastroBase<T>.ExecutarCancelar(Self);
end;

procedure TControladorCadastroDesktop<T>.ExecutarEventoConfirmar(sender: TObject);
begin
   if not Validar then exit;

   TControladorCadastroBase<T>.ExecutarSalvar(T(Objeto),Self, ErrorProvider1,AcaoJanela);
end;

procedure TControladorCadastroDesktop<T>.ExecutarEventoMostrarFormulario(sender: TObject);
begin
    TControladorCadastroBase<T>.ExecutarMostrarFormulario(T(Objeto), Self, AcaoJanela, btnConfirmar);
end;

procedure TControladorCadastroDesktop<T>.Inicializar;
begin
    btnConfirmar.OnClick := ExecutarEventoConfirmar;
    btnCancelar.OnClick := ExecutarEventoCancelar;
    Self.OnShow := ExecutarEventoMostrarFormulario;
end;


function TControladorCadastroDesktop<T>.Validar: boolean;
begin
    result := true;
end;

end.
