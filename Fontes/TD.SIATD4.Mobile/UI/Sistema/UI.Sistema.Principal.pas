unit UI.Sistema.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, DB, System.StrUtils,
  Lib.Biblioteca, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  UntErrorProvider,Framework.UI.FormBase, Vcl.Grids, Vcl.DBGrids, MIDASLIB, Biz.Rotina, UI.Inventario.Operacao;

type
  TFrmPrincipal = class(TFrmBase)
    pnlBotoes: TPanel;
    btnEnviar: TBitBtn;
    cpgMenus: TCategoryPanelGroup;
    cpConsulta: TCategoryPanel;
    cpProcesso: TCategoryPanel;
    cpCadastro: TCategoryPanel;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActnRotinaExecute(Sender: TObject);
    procedure cpCadastroExpand(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ultimoLeft: integer;
    ultimoTop: integer;
    vColuna: integer;
    vTopAtual : integer;
    vLeftAtual : integer;
    vLinha: Integer;
    ultimaCategoria: string;

    const espaco: integer = 4;

    //ordemBotao: integer;

    procedure PreparaMenu;
    procedure CriarBotao(rotina:TRotina);
  protected

    { Private declarations }
  public
    mobile:boolean;

  published
    procedure MenuErro;

    {$REGION 'M�dulo Logistica'}
        {$REGION 'Cadastro'}

        {$ENDREGION}

        {$REGION 'Processo'}

        {$ENDREGION}
        procedure Inventario;
        {$REGION 'Utilit�rios'}

        {$ENDREGION}

        {$REGION 'Relat�rios'}

        {$ENDREGION}

        {$REGION 'Ajuda'}

        {$ENDREGION}
    {$ENDREGION}


  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Biz.UsuarioLogado;




{$R *.dfm}



procedure TFrmPrincipal.CriarBotao(rotina:TRotina);
var
    btn: TBitBtn;
    event: TNotifyEvent;
begin

    if ultimaCategoria <> UpperCase(rotina.Categoria)  then
    begin
        vColuna := 0;
        vTopAtual := espaco;
        vLeftAtual := espaco;
    end;

    btn := TBitBtn.Create(self);
    btn.Left := vLeftAtual;
    btn.Top := vTopAtual;
    btn.Width := 70;
    btn.Height := 41;
    btn.Action := action;
    btn.WordWrap := True;
    btn.Caption := rotina.Descricao;

    case AnsiIndexStr(UpperCase(Rotina.Categoria), ['CADASTRO', 'PROCESSO','COSULTA']) of
        0: cpCadastro.InsertControl(btn);
        1: cpProcesso.InsertControl(btn);
        2: cpConsulta.InsertControl(btn);
    end;

    TMethod(event).Code := MethodAddress(trim(rotina.AcaoMenu));
    TMethod(event).Data := self;

    if  Assigned(TMethod(event).Code) then
        btn.OnClick := event
    else
    begin
        TMethod(event).Code := MethodAddress('MenuErro');
        TMethod(event).Data := self;
        btn.OnClick := event;
    end;

    Inc(vColuna);

    if vColuna = 3 then
    begin
        vTopAtual := vTopAtual + btn.Height + espaco;
        vLeftAtual := espaco;
        vColuna := 0;
    end
    else
    begin
        vLeftAtual := vLeftAtual + btn.Width + espaco;
    end;
    ultimaCategoria := UpperCase(rotina.Categoria);
end;


procedure TFrmPrincipal.ActnRotinaExecute(Sender: TObject);
begin
  inherited;
    ShowMessage('Rotina');
end;


procedure TFrmPrincipal.btnEnviarClick(Sender: TObject);
begin
    inherited;
    Self.Close;
end;


procedure TFrmPrincipal.cpCadastroExpand(Sender: TObject);
begin
  inherited;
  cpCadastro.Collapsed := not (TCategoryPanel(sender) = cpCadastro);
  cpProcesso.Collapsed := not (TCategoryPanel(sender) = cpProcesso);
  cpConsulta.Collapsed := not (TCategoryPanel(sender) = cpConsulta);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Application.OnException := Tlib.TrataErro;
  Tlib.mobile := true;
  mobile := true;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    inherited;
    self.Width := MobileWidth;
    self.Height := MobileHeight;
    PreparaMenu;
end;



procedure TFrmPrincipal.Inventario;
begin
   Tlib.AbrirFormulario(TfrmInventario);
end;

procedure TFrmPrincipal.MenuErro;
begin
  Tlib.MensagemInformacao('A��o do Menu cadastrada de forma errada.','');
end;

procedure TFrmPrincipal.PreparaMenu();
var
    rotina: TRotina;
begin
    try
        inherited;
        TUsuarioLogado.ObterInstancia.CarregarGruposAcesso;
        TUsuarioLogado.ObterInstancia.ObterRotinasDeAcesso;

        for rotina in TUsuarioLogado.ObterInstancia.RotinasAcesso do
            CriarBotao(rotina);

    finally
    end;
end;

end.

