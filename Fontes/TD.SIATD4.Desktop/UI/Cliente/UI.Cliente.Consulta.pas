unit UI.Cliente.Consulta;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
    RGrid, Vcl.Buttons, Vcl.Menus, UI.Base.ConsultaPadrao,
  UI.Base.Controlador.ConsultaDesktop, Biz.Cliente;

type
    //TfrmConCliente = class(TFrmConsultaPadrao)
	TfrmConCliente = class(TControladorConsultaDesktop<TCliente>)
    ConsultarSerasa1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ConsultarSerasa1Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmConCliente: TfrmConCliente;

implementation

{$R *.dfm}

uses Lib.Biblioteca, Lib.Aguarde, UI.Cliente.Cadastro;


procedure TfrmConCliente.ConsultarSerasa1Click(Sender: TObject);
begin
  inherited;
  if not grDados.IsEmpty then
  begin
     try
         try
             TAguarde.AguardandoFinalizacaoProcesso(Self, 'Aguarde, obtendo informa��es do Serasa.');
             if grDados.GetObject<TCliente>.ObterUltimaConsultaSerasa = nil then
             begin
                 grDados.GetObject<TCliente>.ConsultarSerasa;
                 TAguarde.ProcessoFinalizado;
                 tlib.MensagemInformacao('Informa��es inseridas corretamente, favor consult�-las no SIATD 1.0');
             end
             else
             begin
                TAguarde.ProcessoFinalizado;
                tlib.MensagemInformacao('J� existem informa��es do Serasa para este cliente, favor consult�-las no SIATD 1.0');
             end;
//             if grDados.GetObject<TCliente>.TipoPessoa_ = tpPessoaFisica then
//                 Tlib.AbrirFormulario(TfrmSerasaCPF, grDados.GetObject<TCliente>)
//               else
//                   Tlib.AbrirFormulario(TfrmSerasaCPF, grDados.GetObject<TCliente>)




         except
             on e: exception do
             begin
                 TAguarde.ProcessoFinalizado;
                 tlib.MensagemErro('Erro ao consultar Serasa.', e.Message);
             end;
         end;
     finally
          TAguarde.ProcessoFinalizado;
     end;
  end;
end;

procedure TfrmConCliente.FormCreate(Sender: TObject);
begin
    inherited;
    grDados.AddCol('Codigo', 'codigo', 56, RGrid.mtString);
    grDados.AddCol('Loja', 'loja', 52, RGrid.mtString);
    grDados.AddCol('Nome', 'Nome', 115, RGrid.mtString);
    grDados.AddCol('Endereco', 'Endereco', 115, RGrid.mtString);
    grDados.AddCol('Bairro', 'Bairro', 80, RGrid.mtString);
    grDados.AddCol('Municipio', 'Municipio', 110, RGrid.mtString);
    grDados.AddCol('Cep', 'Cep', 58, RGrid.mtString);
    grDados.AddCol('Estado', 'Estado', 52, RGrid.mtString);
    grDados.AddCol('Telefone', 'Telefone', 65, RGrid.mtString);
    grDados.AddCol('Cgc', 'Cgc', 64, RGrid.mtString);
    grDados.AddCol('Rg', 'Rg', 65, RGrid.mtString);
    grDados.AddCol('Inscricao', 'Inscricao', 68, RGrid.mtString);
    grDados.AddCol('Email', 'Email', 130, RGrid.mtString);
    Inicializar(TfrmCadCliente);   ;

end;

end.
