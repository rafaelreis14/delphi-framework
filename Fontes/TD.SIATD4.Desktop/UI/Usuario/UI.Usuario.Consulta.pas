unit UI.Usuario.Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  UntErrorProvider, Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, RGrid, Vcl.Buttons, UI.Usuario.Cadastro, UI.Base.ConsultaPadrao,
  UI.Base.Controlador.ConsultaDesktop, Biz.Usuario;

type
  //TfrmConUsuario = class(TFrmConsultaPadrao);
  TFrmConUsuario = class(TControladorConsultaDeskTop<TUsuario>)
    EmcriptarSenha1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure EmcriptarSenha1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConUsuario: TFrmConUsuario;

implementation

{$R *.dfm}

uses Lib.Lista, Lib.Biblioteca, Lib.Aguarde;

procedure TFrmConUsuario.EmcriptarSenha1Click(Sender: TObject);
var
    usuario: TUsuario;
begin
  inherited;
  try
      TAguarde.AguardandoFinalizacaoProcesso(Self, 'Aguarde finalização do processo');
      for usuario in grDados.GetDataSource<TUsuario> do
      begin
          usuario.Senha := Tlib.Encriptar(usuario.Senha);
          usuario.Alterar;
      end;
  finally
      TAguarde.ProcessoFinalizado;
  end;

end;

procedure TFrmConUsuario.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Login', 'Login', 100, RGrid.mtString);
    grDados.AddCol('Nome', 'Nome', 250, RGrid.mtString);
    Inicializar(TFrmCadUsuario);
end;

end.
