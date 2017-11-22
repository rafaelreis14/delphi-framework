{ *Created by @ReisCodeGenerator* }
unit UI.Rotina.Cadastro;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
    Biz.Rotina, RSearch, Vcl.Grids, RGrid, RRadioGroup, Vcl.CheckLst, RCheckListBox;

type
    //TfrmCadRotina = class(TFrmCadastroPadrao)
    TfrmCadRotina = class(TControladorCadastroDesktop<TRotina>)
        GroupBox1: TGroupBox;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        edRotina: TREdit;
        edAcaoMenu: TREdit;
        rgCategoria: TRRadioGroup;
        TabSheet1: TTabSheet;
        gdPermissaoRotina: TRGrid;
        Panel1: TPanel;
        Label8: TLabel;
        btnAdicionar: TBitBtn;
        srcRotinaItem: TRSearch;
        Label2: TLabel;
        edOrdem: TREdit;
        btnExcluir: TBitBtn;
        edDescricao: TREdit;
        TabSheet2: TTabSheet;
        cklModulos: TRCheckListBox;
        procedure FormCreate(Sender: TObject);
        procedure btnAdicionarClick(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
        procedure srcRotinaItemClick(Sender: TObject);
        procedure cklModulosClickCheck(Sender: TObject);
    private
        Rotina: TRotina;
        procedure ExecutarEventoMostrarFormulario(Sender: TObject); override;
        function Validar: boolean; override;
        procedure ManterModulo;

    public

    end;

var
    frmCadRotina: TfrmCadRotina;

implementation

uses Biz.Permissao, Lib.Biblioteca, Biz.Modulo, Biz.PermissaoRotina,
  Framework.Controlador.CadastroBase;

{$R *.dfm}

procedure TfrmCadRotina.btnAdicionarClick(Sender: TObject);
var
    PermissaoRotina: TPermissaoRotina;
begin
    if srcRotinaItem.Value = EmptyStr then
    begin
        tlib.MensagemAdvertencia('Necessário selecionar uma permissão.');
        exit;
    end;

    if edRotina.Value = EmptyStr then
    begin
        tlib.MensagemAdvertencia('Nome da rotina não foi preenchida.');
        exit;

    end;

    PermissaoRotina := TPermissaoRotina.Create;

    PermissaoRotina.Rotina := edRotina.Value;
    PermissaoRotina.Permissao := srcRotinaItem.Value;
    Rotina.AdicionarPermissaoRotina(PermissaoRotina);
    gdPermissaoRotina.DataSource<TPermissaoRotina>(Rotina.PermissoesRotina);
    gdPermissaoRotina.DataBind;
    srcRotinaItem.Clear;
    srcRotinaItem.SetFocus;

end;



procedure TfrmCadRotina.btnExcluirClick(Sender: TObject);
begin
    inherited;
    Rotina.DeletarPermissaoRotina(gdPermissaoRotina.GetObject<TPermissaoRotina>);
    gdPermissaoRotina.DataSource<TPermissaoRotina>(Rotina.PermissoesRotina);
    gdPermissaoRotina.DataBind;
end;

procedure TfrmCadRotina.cklModulosClickCheck(Sender: TObject);
begin
  inherited;
  ManterModulo;
end;

procedure TfrmCadRotina.ExecutarEventoMostrarFormulario(Sender: TObject);
var
    modulo: TModulo;
begin

    inherited;
    modulo:= TModulo.Create;
    Rotina := TRotina(Objeto);
    Rotina.CarregarPermissoesRotina;
    Rotina.CarregarModulosRotina;
    gdPermissaoRotina.DataSource<TPermissaoRotina>(Rotina.PermissoesRotina);
    gdPermissaoRotina.DataBind;
    cklModulos.DataSource<TModulo>(modulo.ObterTodosModulos);
    cklModulos.DataBind;
    cklModulos.Value := rotina.ModulosRotina.ToDelimiterList('Modulo');
end;

procedure TfrmCadRotina.FormCreate(Sender: TObject);
begin
    srcRotinaItem.CRUDGenerico := TPermissao.Create;
    gdPermissaoRotina.AddCol('Permissao');
    Inicializar;
    Inherited;
end;

procedure TfrmCadRotina.srcRotinaItemClick(Sender: TObject);
begin
    inherited;
    btnAdicionar.SetFocus;
end;

function TfrmCadRotina.Validar: boolean;
begin
    result := true;
end;

procedure TfrmCadRotina.ManterModulo;
var
    moduloRotina: TModuloRotina;
    modulo: TModulo;
begin
    if not cklModulos.IsSelectedItemChecked then
    begin
        modulo := cklModulos.GetObject<TModulo>;
        moduloRotina := Rotina.ObterModuloRotina(modulo.Modulo);
        Rotina.ModulosRotina.Delete(moduloRotina);
    end
    else
    begin
        modulo := cklModulos.GetObject<TModulo>;
        if modulo <> nil then
        begin
            moduloRotina := TModuloRotina.Create;

            if Rotina.Rotina = EmptyStr then

            TControladorCadastroBase<TRotina>.CarregarObjeto(Rotina,Self);

            if Rotina.Rotina = EmptyStr then
            begin
                Tlib.MensagemErro('Campo Rotina não foi prenechido.','Erro');
                exit;
            end;

            moduloRotina.Rotina := Rotina.Rotina;

            moduloRotina.Modulo := modulo.Modulo;
            Rotina.ModulosRotina.Add(moduloRotina);
        end;
    end;

    cklModulos.Value := Rotina.ModulosRotina.ToDelimiterList('Modulo');
end;

end.
