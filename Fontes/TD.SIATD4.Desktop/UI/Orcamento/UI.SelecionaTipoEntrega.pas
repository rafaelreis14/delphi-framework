unit UI.SelecionaTipoEntrega;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, RGrid,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UntErrorProvider,
    Biz.TipoEntrega, Framework.UI.FormBase, Biz.Orcamento, Lib.Lista,
  Biz.Produto;

type
    TfrmSelecionarTipoEntrega = class(TFrmBase)
        Panel2: TPanel;
        Label1: TLabel;
        Panel3: TPanel;
        pnlBotoes: TPanel;
        btnConfirmar: TBitBtn;
        btnCancelar: TBitBtn;
        GroupBox2: TGroupBox;
        grTipoEntrega: TRGrid;
        procedure FormShow(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure btnConfirmarClick(Sender: TObject);
        procedure btnCancelarClick(Sender: TObject);
    private
        FOrcamento: TOrcamento;
        FTiposEntrega: TLista<TTipoEntrega>;
        FProduto: TProduto;
        FTipoEntregaSelecionado: TTipoEntrega;
        procedure SetOrcamento(const Value: TOrcamento);
        procedure SetTiposEntrega(const Value: TLista<TTipoEntrega>);
        procedure SetProduto(const Value: TProduto);
        procedure SetTipoEntregaSelecionado(const Value: TTipoEntrega);
        property TiposEntrega: TLista<TTipoEntrega> read FTiposEntrega write SetTiposEntrega;
        { Private declarations }
    public
        property Orcamento: TOrcamento read FOrcamento write SetOrcamento;
        property Produto: TProduto read FProduto write SetProduto;
        property TipoEntregaSelecionado: TTipoEntrega read FTipoEntregaSelecionado write SetTipoEntregaSelecionado;
    end;

var
    frmSelecionarTipoEntrega: TfrmSelecionarTipoEntrega;

implementation

{$R *.dfm}

uses Biz.OrcamentoItem;
{ TfrmSelecionarTipoEntrega }

procedure TfrmSelecionarTipoEntrega.btnCancelarClick(Sender: TObject);
begin
    inherited;
    Close;
end;

procedure TfrmSelecionarTipoEntrega.btnConfirmarClick(Sender: TObject);
begin
    inherited;
    TipoEntregaSelecionado := grTipoEntrega.GetObject<TTipoEntrega>;
    Close;
end;

procedure TfrmSelecionarTipoEntrega.FormCreate(Sender: TObject);
begin
    inherited;
    FTiposEntrega := TLista<TTipoEntrega>.Create();
end;

procedure TfrmSelecionarTipoEntrega.FormDestroy(Sender: TObject);
begin
    inherited;
    if FTiposEntrega <> nil then
        FreeAndNil(FTiposEntrega);

end;

procedure TfrmSelecionarTipoEntrega.FormShow(Sender: TObject);
var
    tipoEntrega, item: TTipoEntrega;
    orcItem: TOrcamentoItem;
    inclui: boolean;

begin
    inherited;
    grTipoEntrega.AddCol('TipoEntrega', 'Tipo Entrega', 100, RGrid.mtString);
    grTipoEntrega.AddCol('Descricao', 'Descrição', 250, RGrid.mtString);

    for item in Orcamento.Filial_.TiposEntrega do
    begin
        inclui := false;
        if (item.tipoEntrega = 'LE') then { *LE ENTREGA LOJA ECOMMERCE * }
        begin
            if (Produto.TipoAbastecimento in [taCrossDock, taCrossDockLibVendasCD]) and (Produto.ProdutoEcommerce) then
                inclui := true;
        end
        else if (item.tipoEntrega = 'CE') then { *CE ENTREGA CD ECOMMECER * }
        begin
            if (Produto.TipoAbastecimento = taAbastecimentoCD) and (Produto.ProdutoEcommerce) then
                inclui := true;
        end
        else if (item.tipoEntrega = 'PE') then { *PRODUTO SOB ECONOMENDA * }
        begin
            if (Produto.ProdutoSobEncomenda) then
                inclui := true;

        end
        else if (item.tipoEntrega = 'DL') then { *PRODUTO DEPOSITO LOJA * }
        begin
            if (Produto.PodeEntregarDepositoLoja) then
                inclui := true;
        end
        else if (item.tipoEntrega = 'CD') then { *CENTRO DE DISTRIBUICAO E LOCAL NOTA * }
        begin
            //if (item.LocalNota = 'C') then
                inclui := true;
        end
        else
            inclui := true;

        orcItem := Orcamento.ObterItem(Produto.Codigo, item.tipoEntrega);
        if orcItem <> nil then
            inclui := false;

        if inclui then
        begin
            tipoEntrega := TTipoEntrega.Create;
            item.CopiarPara(tipoEntrega);
            TiposEntrega.Add(tipoEntrega)
        end;
    end;

    grTipoEntrega.DataSource<TTipoEntrega>(TiposEntrega);
    grTipoEntrega.DataBind;
    grTipoEntrega.SetFocus;
end;

procedure TfrmSelecionarTipoEntrega.SetOrcamento(const Value: TOrcamento);
begin
    FOrcamento := Value;
end;

procedure TfrmSelecionarTipoEntrega.SetProduto(const Value: TProduto);
begin
    FProduto := Value;
end;

procedure TfrmSelecionarTipoEntrega.SetTipoEntregaSelecionado(const Value: TTipoEntrega);
begin
    FTipoEntregaSelecionado := Value;
end;

procedure TfrmSelecionarTipoEntrega.SetTiposEntrega(const Value: TLista<TTipoEntrega>);
begin
    FTiposEntrega := Value;
end;

end.
