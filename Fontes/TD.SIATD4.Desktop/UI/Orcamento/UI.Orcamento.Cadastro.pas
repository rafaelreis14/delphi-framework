{ *Created by @ReisCodeGenerator* }

//LINHA 1078

unit UI.Orcamento.Cadastro;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls,
    UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
    Biz.Orcamento, Biz.OrcamentoItem, UI.Frame.PesquisaVendedor, UI.Frame.PesquisaCliente, RSearch, Vcl.Imaging.jpeg,
    Lib.Enumeradores, Vcl.Grids, RGrid, RComboBox, RRadioGroup, RCheckBox, UI.Frame.PesquisaEndereco;

type
//     TfrmCadOrcamento = class(TFrmCadastroPadrao)
    TfrmCadOrcamento = class(TControladorCadastroDesktop<TOrcamento>)
        grdOrcamentoItens: TRGrid;
        pnlProduto: TPanel;
        Label7: TLabel;
        edProduto: TREdit;
        Label8: TLabel;
        edValorTabela: TREdit;
        Label9: TLabel;
        edQuantidade: TREdit;
        Label10: TLabel;
        edValorNegociado: TREdit;
        Label11: TLabel;
        edPercentualDescontoProduto: TREdit;
        edValorTotalProduto: TREdit;
        edDescricaoProduto: TREdit;
        edValorLiquido: TREdit;
        Label6: TLabel;
        Label5: TLabel;
        edValorTotal: TREdit;
        edValorMercadoria: TREdit;
        Label4: TLabel;
        imgRodape: TImage;
        pnlDadosCliente: TPanel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Label18: TLabel;
        Label19: TLabel;
        Label20: TLabel;
        Label21: TLabel;
        Label22: TLabel;
        edLogradouroCliente: TREdit;
        edBairroCliente: TREdit;
        edCEPCliente: TREdit;
        edCidadeCliente: TREdit;
        edUFCliente: TREdit;
        edCGCCliente: TREdit;
        edInscricaoEstadualCliente: TREdit;
        edTelefoneCliente: TREdit;
        cbTabelaComissoes: TRComboBox;
        cbQuantidadeParcelas: TRComboBox;
        bbSimularPagamentoTabelas: TBitBtn;
        pnlCabecalho: TPanel;
        imgCabecalho: TImage;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        frmPesquisaCliente1: TfrmPesquisaCliente;
        frmPesquisaVendedor1: TfrmPesquisaVendedor;
        edNumeroOrcamento: TREdit;
        edDataEmissao: TREdit;
        edDataCadastro: TREdit;
        tsPagamento: TTabSheet;
        gpbNegociacao: TGroupBox;
        Label27: TLabel;
        Label28: TLabel;
        Label29: TLabel;
        Label30: TLabel;
        edValorEntrada: TREdit;
        edValorDesconto: TREdit;
        edPercentualDesconto: TREdit;
        edValorDespesa: TREdit;
        bbSimulaComissaoAplicada: TBitBtn;
        gpbGeracaoParcelas: TGroupBox;
        Label31: TLabel;
        Label32: TLabel;
        Label33: TLabel;
        Label34: TLabel;
        Label35: TLabel;
        Label36: TLabel;
        cbFormaPagamento: TRComboBox;
        cbAdministradora: TRComboBox;
        edValorGerarParcelas: TREdit;
        edQuatidadeGerarParcelas: TREdit;
        edDataPrimeiroVencimento: TREdit;
        rgIntervaloParcelas: TRRadioGroup;
        edIntervalo: TREdit;
        edValorRestante: TREdit;
        BBGerarParcelas: TBitBtn;
        BBCancelaForma: TBitBtn;
        BBLimpaCondicoes: TBitBtn;
        grdParcelas: TRGrid;
        grNCC: TRGrid;
        pnChequeDuplicata: TPanel;
        Label23: TLabel;
        Label24: TLabel;
        Label25: TLabel;
        Label37: TLabel;
        Label75: TLabel;
        Label76: TLabel;
        Label73: TLabel;
        Label38: TLabel;
        edAdministradoraBanco: TREdit;
        rgTipoCheque: TRadioGroup;
        edAgencia: TREdit;
        edConta: TREdit;
        edDocumento: TREdit;
        edNomeCliente: TREdit;
        edRG: TREdit;
        edCPFCNPJ: TREdit;
        edTelefone: TREdit;
        REdit1: TREdit;
        tsEntrega: TTabSheet;
        grbEnderecoEntrega: TGroupBox;
        Label42: TLabel;
        Label43: TLabel;
        edObservacao: TREdit;
        edPrevisaoEntrega: TREdit;
        frmPesquisaEndereco1: TfrmPesquisaEndereco;
        grbTransportadora: TGroupBox;
        Label44: TLabel;
        Label46: TLabel;
        Label47: TLabel;
        Label48: TLabel;
        Label49: TLabel;
        Label50: TLabel;
        Label51: TLabel;
        Label52: TLabel;
        Label53: TLabel;
        edCodigoTransportadora: TREdit;
        edNomeTransportadora: TREdit;
        edCidadeTransportadora: TREdit;
        edBairroTransportadora: TREdit;
        edUFTransportadora: TREdit;
        edLogradouroTransportadora: TREdit;
        edCEPTransportadora: TREdit;
        edVolume: TREdit;
        cbTipoFrete: TRComboBox;
        edPlaca: TREdit;
        tsServicos: TTabSheet;
        grdServicos: TRGrid;
        tsMargemContribuicao: TTabSheet;
        grMargemContriguicao: TRGrid;
        Panel1: TPanel;
        Label45: TLabel;
        Label54: TLabel;
        Label55: TLabel;
        Label56: TLabel;
        Label57: TLabel;
        Label83: TLabel;
        edPrecoMedioMC: TREdit;
        edTotalProdutosMC: TREdit;
        edCustoNotaMC: TREdit;
        edCustoCompraMC: TREdit;
        edPercentualMC: TREdit;
        tsLiberacao: TTabSheet;
        Panel7: TPanel;
        BBFechaTelaLiberacao: TBitBtn;
        BBLiberaOrcamento: TBitBtn;
        BBMargemcontrib: TBitBtn;
        BBLiberaTDP: TBitBtn;
        GroupBox3: TGroupBox;
        Panel4: TPanel;
        Label77: TLabel;
        edDataPrevisaoPE: TREdit;
        grProdutoSobEncomenda: TRGrid;
        GroupBox8: TGroupBox;
        Panel12: TPanel;
        lbTabela: TLabel;
        chbEstoqueCDLib: TRCheckBox;
        chbEstoqueLojaLib: TRCheckBox;
        cbhAcrecimoLib: TRCheckBox;
        dhbDescontoLib: TRCheckBox;
        grInconsistencias: TRGrid;
        GroupBox5: TGroupBox;
        Label60: TLabel;
        Label61: TLabel;
        Label65: TLabel;
        GroupBox10: TGroupBox;
        chbComLimiteCredito: TRCheckBox;
        chbSemLimiteCredito: TRCheckBox;
        bbRelatorioContasReceber: TBitBtn;
        bbVisualizaCadastroCliente: TBitBtn;
        pnlTokem: TPanel;
        Label58: TLabel;
        Label59: TLabel;
        edToken: TREdit;
        edMotivoToken: TREdit;
        edSaldoPendenteDuplicata: TREdit;
        edSaldoPendenteCheque: TREdit;
        edSaldoNCC: TREdit;
        SpeedButton1: TSpeedButton;
        Panel5: TPanel;
        Label12: TLabel;
        chbComboLib: TRCheckBox;
        chbPromocao: TRCheckBox;
        chbEncomenda: TRCheckBox;
        chbForaLinha: TRCheckBox;
        chbCampanha: TRCheckBox;
        chbCombo: TRCheckBox;
        SpeedButton2: TSpeedButton;
        procedure FormCreate(Sender: TObject);
        procedure ExecutarEventoMostrarFormulario(Sender: TObject); override;
        procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure edProdutoExit(Sender: TObject);
        procedure edQuantidadeEnter(Sender: TObject);
        procedure edQuantidadeExit(Sender: TObject);
        procedure edValorNegociadoEnter(Sender: TObject);
        procedure edValorNegociadoExit(Sender: TObject);
        procedure edPercentualDescontoProdutoExit(Sender: TObject);
        procedure grdOrcamentoItensKeyPress(Sender: TObject; var Key: Char);
        procedure frmPesquisaCliente1btnConsultaClienteClick(Sender: TObject);
        procedure frmPesquisaVendedor1btnConsultaVendedorClick(Sender: TObject);
        procedure cbTabelaComissoesClick(Sender: TObject);
        procedure cbTabelaComissoesExit(Sender: TObject);
        procedure cbQuantidadeParcelasClick(Sender: TObject);
        procedure cbQuantidadeParcelasExit(Sender: TObject);
        procedure edValorTotalProdutoExit(Sender: TObject);
        procedure grdOrcamentoItensClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure cbFormaPagamentoClick(Sender: TObject);
    private
        { Private declarations }
        Orcamento: TOrcamento;
        Procedure AtualizaTela;
        procedure MontaGridDeItens;
        procedure MontaGridDeServico;
        procedure AtualizaEditsProduto;
        // procedure SetOrcamento(const Value: TOrcamento);
    public
        { Public declarations }
        // property Orcamento: TOrcamento read FOrcamento write SetOrcamento;
    end;

var
    frmCadOrcamento: TfrmCadOrcamento;

implementation

uses Biz.Produto, Lib.ResultFilter, Lib.Biblioteca, Lib.Lista,
    Biz.UsuarioLogado, Biz.TabelaComissao, System.StrUtils, Biz.CursoSeguro,
    Biz.FormaPagamento, Biz.Adminsitradora;

{$R *.dfm}

procedure TfrmCadOrcamento.AtualizaEditsProduto;
begin
    if not grdOrcamentoItens.IsEmpty then
    begin
        edValorTabela.Value := CurrToStr(grdOrcamentoItens.GetObject<TOrcamentoItem>.ValorPrecoTabela);
        edQuantidade.Value := CurrToStr(grdOrcamentoItens.GetObject<TOrcamentoItem>.Quantidade);
        edValorNegociado.Value := CurrToStr(grdOrcamentoItens.GetObject<TOrcamentoItem>.ValorUnitarioNegociado);
        edValorTotalProduto.Value := CurrToStr(grdOrcamentoItens.GetObject<TOrcamentoItem>.ValorTotal);
        edPercentualDescontoProduto.Value := CurrToStr(grdOrcamentoItens.GetObject<TOrcamentoItem>.PercentualDesconto);
        edDescricaoProduto.Value := grdOrcamentoItens.GetObject<TOrcamentoItem>.CodigoProduto + ' - ' + //
            grdOrcamentoItens.GetObject<TOrcamentoItem>.DescricaoProduto + '   Comp.: ' + //
            grdOrcamentoItens.GetObject<TOrcamentoItem>.FormulaSelfColor;

        chbForaLinha.Checked := grdOrcamentoItens.GetObject<TOrcamentoItem>.ForaDeLinha;
        chbEncomenda.Checked := grdOrcamentoItens.GetObject<TOrcamentoItem>.Encomenda;
        chbPromocao.Checked := grdOrcamentoItens.GetObject<TOrcamentoItem>.Promocao;
        chbCombo.Checked := grdOrcamentoItens.GetObject<TOrcamentoItem>.Combo;
        chbCampanha.Checked := grdOrcamentoItens.GetObject<TOrcamentoItem>.CampanhaEstado;
    end;
end;

procedure TfrmCadOrcamento.AtualizaTela;
var
    curso: TCursoSeguro;
begin
    frmPesquisaCliente1.Cliente := Orcamento.Cliente;
    edCidadeCliente.Value := Orcamento.Cliente.Municipio;
    edBairroCliente.Value := Orcamento.Cliente.Bairro;
    edUFCliente.Value := Orcamento.Cliente.Estado;
    edCEPCliente.Value := Orcamento.Cliente.Cep;
    edLogradouroCliente.Value := Orcamento.Cliente.Endereco;

    if Orcamento.Cliente.EFormatoCpf then
        edCGCCliente.MaskType := REdit.mtCPF
    else
        edCGCCliente.MaskType := REdit.mtCNPJ;

    edCGCCliente.Value := Orcamento.Cliente.Cgc;

    edInscricaoEstadualCliente.Value := Orcamento.Cliente.Inscricao;
    edTelefoneCliente.Value := Orcamento.Cliente.Telefone;

    frmPesquisaVendedor1.Vendedor := Orcamento.Vendedor;

    edDataEmissao.Value := Orcamento.DataEmissao;
    edDataCadastro.Value := Orcamento.DataCadastro;

    grdOrcamentoItens.DataSource<TOrcamentoItem>(Self.Orcamento.OrcamentoItens);
    grdOrcamentoItens.DataBind;


    AtualizaEditsProduto;
end;

procedure TfrmCadOrcamento.cbFormaPagamentoClick(Sender: TObject);
begin
    inherited;
    cbAdministradora.DataSource<TAdministradora>(TAdministradora.ObterListaAdmistradorasPorFormaPagto(cbFormaPagamento.GetObject<TFormaPagamento>.Tipo));
    cbAdministradora.DataBind;
    cbAdministradora.ItemIndex := 0;
end;

procedure TfrmCadOrcamento.cbQuantidadeParcelasClick(Sender: TObject);
begin
    inherited;
    try
        if (cbQuantidadeParcelas.Tag <> cbQuantidadeParcelas.ItemIndex) and (StrToIntDef(cbQuantidadeParcelas.Value, 0) > 0) then
        begin
            cbQuantidadeParcelas.Tag := cbQuantidadeParcelas.ItemIndex;
            Orcamento.TabelaComissaoQuantidadeParcelas := StrToIntDef(cbQuantidadeParcelas.Value, 0);
            Orcamento.TabelaComissaoRecalcular;
        end;
    finally
        AtualizaTela;
        // AtualizarEditsProduto;
    end;
end;

procedure TfrmCadOrcamento.cbQuantidadeParcelasExit(Sender: TObject);
begin
    inherited;
    edProduto.SetFocus;
end;

procedure TfrmCadOrcamento.cbTabelaComissoesClick(Sender: TObject);
var
    i: Integer;
begin
    inherited;
    try
        if cbTabelaComissoes.ItemIndex <> cbTabelaComissoes.Tag then
        begin
            Orcamento.TabelaComissao_ := cbTabelaComissoes.GetObject<TTabelaComissao>;

            cbTabelaComissoes.Tag := cbTabelaComissoes.ItemIndex;

            if cbTabelaComissoes.Value <> 'T1' then
            begin
                for i := 1 to Orcamento.TabelaComissao_.QuantidadeParcelas do
                begin
                    cbQuantidadeParcelas.ListValue.Add(RightStr('0' + Trim(IntToStr(i)), 2) + 'x' + '=' + IntToStr(i));
                end;
                cbQuantidadeParcelas.DataBind;
                cbQuantidadeParcelas.ItemIndex := cbQuantidadeParcelas.Items.Count - 1;
                cbQuantidadeParcelas.Tag := cbQuantidadeParcelas.ItemIndex;
                cbQuantidadeParcelas.Enabled := True;
                Orcamento.TabelaComissaoQuantidadeParcelas := StrToIntDef(cbQuantidadeParcelas.Value, 0);

                edValorTabela.PasswordChar := '*';
                edPercentualDescontoProduto.PasswordChar := '*';
                edValorNegociado.Enabled := false;
                edPercentualDescontoProduto.Enabled := false;
                edPercentualDesconto.Enabled := false;
                edValorDesconto.Enabled := false;

                grdOrcamentoItens.GetColByName('ValorPrecoTabela').Invisible := True;
                grdOrcamentoItens.GetColByName('PercentualDescontoValorNegociado').Invisible := True;

                lbTabela.Visible := True;
                lbTabela.Caption := cbTabelaComissoes.Value + '  -  Taxa de Juros de ' + CurrToStr(Orcamento.TabelaComissao_.TaxaDeJuros) + '%  -  Parcelado em ' + cbQuantidadeParcelas.Value;

                if Orcamento.ValorEntrada > 0 then
                    edValorEntrada.Enabled := false
                else
                    edValorEntrada.Enabled := True;

                Orcamento.TabelaComissaoRecalcular;
            end
            else
            begin
                cbQuantidadeParcelas.Clear;
                cbQuantidadeParcelas.Enabled := false;
                Orcamento.TabelaComissaoQuantidadeParcelas := 0;

                Orcamento.TabelaComissaoZerar;;
                edValorTabela.PasswordChar := #0;
                edPercentualDescontoProduto.PasswordChar := #0;

                grdOrcamentoItens.GetColByName('ValorPrecoTabela').Invisible := false;
                grdOrcamentoItens.GetColByName('PercentualDescontoValorNegociado').Invisible := false;

                edValorNegociado.Enabled := True;
                edPercentualDescontoProduto.Enabled := True;
                edPercentualDesconto.Enabled := True;
                edValorDesconto.Enabled := True;
                lbTabela.Visible := false;
                lbTabela.Caption := '';
                edValorEntrada.Enabled := false;
            end;
        end;
    finally
        Orcamento.TabelaComissaoQuantidadeParcelas := StrToIntDef(cbQuantidadeParcelas.Value, 0);
        AtualizaTela;
    end;
end;

procedure TfrmCadOrcamento.cbTabelaComissoesExit(Sender: TObject);
begin
    inherited;
    if cbQuantidadeParcelas.Enabled = false then
        edProduto.SetFocus
    else
        cbQuantidadeParcelas.SetFocus;
end;

procedure TfrmCadOrcamento.edPercentualDescontoProdutoExit(Sender: TObject);
begin
    inherited;
    if (grdOrcamentoItens.Row + 1) <= (grdOrcamentoItens.RowCount - 1) then
        grdOrcamentoItens.Row := grdOrcamentoItens.Row + 1;

    grdOrcamentoItens.SetFocus;
    AtualizaTela;
end;

procedure TfrmCadOrcamento.edProdutoExit(Sender: TObject);
var
    Produto: TProduto;
    prod: TProduto;
    listaproduto: TLista<TProduto>;
    i, linhaPosicionar: Integer;
begin
    inherited;

    try
        try
            if edProduto.Value <> EmptyStr then
            begin
                Produto := TProduto.Create;
                listaproduto := TLista<TProduto>.Create();
                listaproduto := Produto.ObterLista(edProduto.Value);

                if listaproduto.Count > 0 then
                begin
                    if grdOrcamentoItens.IsEmpty then
                        linhaPosicionar := 1
                    else
                        linhaPosicionar := grdOrcamentoItens.RowCount;

                    for prod in listaproduto do
                    begin
                        // if prod.Preenchido then
                        Self.Orcamento.AddOrcamentoItem(prod, 0);
                    end;

                    grdOrcamentoItens.DataSource<TOrcamentoItem>(Self.Orcamento.OrcamentoItens);
                    grdOrcamentoItens.DataBind;

                    grdOrcamentoItens.Row := linhaPosicionar;
                end;
                AtualizaTela;

                edProduto.Clear;
            end;
        except
            on e: Exception do
            begin
                tlib.MensagemErro('Erro ao consultar produto.', e.Message);
            end;
        end;
    finally
        if listaproduto <> nil then
            FreeAndNil(listaproduto);
        if Produto <> nil then
            FreeAndNil(Produto);
    end;
end;

procedure TfrmCadOrcamento.edQuantidadeEnter(Sender: TObject);
begin
    inherited;
    edQuantidade.Hint := edQuantidade.Value;
end;

procedure TfrmCadOrcamento.edQuantidadeExit(Sender: TObject);
begin
    inherited;
    if edQuantidade.IsChanged then
    begin
        edQuantidade.Hint := edQuantidade.Value;
        if not grdOrcamentoItens.IsEmpty then
        begin
            grdOrcamentoItens.GetObject<TOrcamentoItem>.Quantidade := edQuantidade.ToDouble;
            AtualizaTela;
        end;
    end;
end;

procedure TfrmCadOrcamento.edValorNegociadoEnter(Sender: TObject);
begin
    inherited;
    edValorNegociado.Hint := edValorNegociado.Value;
end;

procedure TfrmCadOrcamento.edValorNegociadoExit(Sender: TObject);
begin
    inherited;
    if edValorNegociado.IsChanged then
    begin
        edValorNegociado.Hint := edValorNegociado.Value;
        if not grdOrcamentoItens.IsEmpty then
        begin
            grdOrcamentoItens.GetObject<TOrcamentoItem>.ValorUnitarioNegociado := edValorNegociado.ToDouble;
            AtualizaTela;
        end;
    end;
end;

procedure TfrmCadOrcamento.edValorTotalProdutoExit(Sender: TObject);
begin
    inherited;

    if (grdOrcamentoItens.Row + 1) <= (grdOrcamentoItens.RowCount - 1) then
        grdOrcamentoItens.Row := grdOrcamentoItens.Row + 1;

    grdOrcamentoItens.SetFocus;

    AtualizaEditsProduto;
end;

procedure TfrmCadOrcamento.ExecutarEventoMostrarFormulario(Sender: TObject);
begin
    inherited;
    Orcamento := TOrcamento(Objeto);

    pgcComponentes.ActivePage := tbPrincipal;

    MontaGridDeItens;
    MontaGridDeServico;

    cbTabelaComissoes.DataSource<TTabelaComissao>(TTabelaComissao.ObterTabelasComissao);
    cbTabelaComissoes.DataBind;
    cbTabelaComissoes.ItemIndex := cbTabelaComissoes.Items.Count - 1;
    cbTabelaComissoes.OnClick(Self);

    cbFormaPagamento.DataSource<TFormaPagamento>(TFormaPagamento.Consultar(True));
    cbFormaPagamento.ItemIndex := 0;

    if Self.AcaoJanela in [acAlteracao, acVisualizacao] then
    begin
        Orcamento.Cliente.Obter(Orcamento.LojaCliente, Orcamento.CodigoCliente);
        Orcamento.Vendedor.Obter(Orcamento.CodigoVendedor);
    end;

    if Self.AcaoJanela = acInsercao then
    begin
        Orcamento.Cliente.ObterClientePadrao(Orcamento.CodigoFilial);
        Orcamento.PopularClienteAoOrcamento;

        Orcamento.Vendedor.ObterVendedorPadrao(Orcamento.CodigoFilial);
        Orcamento.PopularVendedorAoOrcamento;

        Orcamento.Filial_.ObterListaTipoEntrega(Orcamento.CodigoFilial);
        Orcamento.TabelaComissao_ := cbTabelaComissoes.GetObject<TTabelaComissao>;

        Orcamento.DataEmissao := tlib.ObterDataAtual;
        Orcamento.DataCadastro := tlib.ObterDataAtual;
        Orcamento.DataValidade := tlib.ObterDataAtual;

        edProduto.SetFocus;
    end;

    AtualizaTela;

end;

procedure TfrmCadOrcamento.FormCreate(Sender: TObject);
begin
    inherited;
    Inicializar;
    frmPesquisaCliente1.Construir;
    frmPesquisaVendedor1.Construir;
    // frmPesquisaEndereco1.Construir;
end;

procedure TfrmCadOrcamento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    inherited;
    // F2
    if Key = 113 then
        frmPesquisaCliente1.btnConsultaCliente.Click;

    // F3
    if Key = 114 then
        frmPesquisaVendedor1.btnConsultaVendedor.Click;
end;

procedure TfrmCadOrcamento.frmPesquisaCliente1btnConsultaClienteClick(Sender: TObject);
begin
    inherited;
    frmPesquisaCliente1.btnConsultaClienteClick(Sender);
    Orcamento.PopularClienteAoOrcamento;
    AtualizaTela;
end;

procedure TfrmCadOrcamento.frmPesquisaVendedor1btnConsultaVendedorClick(Sender: TObject);
begin
    inherited;
    frmPesquisaVendedor1.btnConsultaVendedorClick(Sender);
    Orcamento.PopularVendedorAoOrcamento;
    AtualizaTela;
end;

procedure TfrmCadOrcamento.grdOrcamentoItensClick(Sender: TObject);
begin
    inherited;
    AtualizaEditsProduto;
end;

procedure TfrmCadOrcamento.grdOrcamentoItensKeyPress(Sender: TObject; var Key: Char);
begin
    inherited;
    if Key = #13 then
        edProduto.SetFocus;
end;

procedure TfrmCadOrcamento.MontaGridDeItens;
begin
    grdOrcamentoItens.AddCol('FilialReserva', 'Res', 30, mtString);
    grdOrcamentoItens.AddCol('TipoEntrega', 'TP', 30, mtString);
    grdOrcamentoItens.AddCol('Item', 'Item', 30, mtString);
    grdOrcamentoItens.AddCol('CodigoProduto', 'Produto', 60, mtString);
    grdOrcamentoItens.AddCol('DescricaoProduto', 'Descricao', 400, mtString);
    grdOrcamentoItens.AddCol('UnidadeMedida', 'UM', 30, mtString);
    grdOrcamentoItens.AddCol('Quantidade', 'Quantidade', 80, mtDouble);
    grdOrcamentoItens.AddCol('ValorPrecoTabela', 'Preco Tabela', 80, mtCurrency);
    grdOrcamentoItens.AddCol('ValorUnitarioNegociado', 'Preco Unitario', 80, mtCurrency);
    grdOrcamentoItens.AddCol('PercentualDescontoValorNegociado', '% Desc Neg', 80, mtDouble);
    grdOrcamentoItens.AddCol('ValorTotal', 'Valor Total', 80, mtCurrency);
    grdOrcamentoItens.AddCol('PercentualComissao', 'Comissao', 60, mtDouble);
    grdOrcamentoItens.AddCol('TabelaComissaoCodigo', 'T', 30, mtString);
    grdOrcamentoItens.AddCol('Armazem', 'Armazem', 60, mtString);
    grdOrcamentoItens.AddCol('PercentualDesconto', '% Descon', 60, mtDouble);
    grdOrcamentoItens.AddCol('ValorDesconto', 'Desconto', 60, mtCurrency);
    grdOrcamentoItens.AddCol('ValorDespesa', 'Despesa', 60, mtCurrency);
    grdOrcamentoItens.AddCol('CodigoTes', 'TES', 40, mtString);
    grdOrcamentoItens.AddCol('Cfop', 'CFOP', 40, mtString);
    grdOrcamentoItens.AddCol('CodigoTabelaPreco', 'Cod.Tabela', 60, mtString);
    grdOrcamentoItens.AddCol('CodigoFilial', 'Filial', 60, mtString);
    grdOrcamentoItens.AddCol('NumeroOrcamento', 'Orcamento', 60, mtString);
    grdOrcamentoItens.AddCol('DataEmissao', 'Emissao', 60, mtDate);
    grdOrcamentoItens.AddCol('CodigoVendedor', 'Vendedor', 60, mtString);
    grdOrcamentoItens.AddCol('Usuario', 'Usuario', 60, mtString);
    grdOrcamentoItens.AddCol('CodigoRegraComissaoAplicada', 'Regra', 60, mtString);
    grdOrcamentoItens.AddCol('CodigoItemComissaoAplicada', 'Item Regra', 60, mtString);
    grdOrcamentoItens.AddCol('ValorIcmsGerencial', 'Icms Ger.', 60, mtDouble);
    grdOrcamentoItens.AddCol('FormulaSelfColor', 'Formula', 80, mtString);
    grdOrcamentoItens.AddCol('Campanha', 'Campanha', 60, mtString);
    grdOrcamentoItens.AddCol('ItemPai', 'ItemPai', 60, mtString);
    grdOrcamentoItens.AddCol('CodigoGrupoSelfColor', 'Grp Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('CodigoProdutoSelfColor', 'Prod Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('CodigoBaseSelfColor', 'Base Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('CodigoEmbalagemSelfColor', 'Emb Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('CodigoCorSelfColor', 'Cor Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('CodigoColoranteSelfColor', 'Color Self', 60, mtDouble);
    grdOrcamentoItens.AddCol('Delete', 'Delete', 60, mtString);
    grdOrcamentoItens.AddCol('Recno', 'Recno', 60, mtInteger);
    grdOrcamentoItens.AddCol('RecnoDelete', 'RecnoDelete', 60, mtInteger);

    grdOrcamentoItens.DataSource<TOrcamentoItem>(Self.Orcamento.OrcamentoItens);
    grdOrcamentoItens.DataBind;
end;

procedure TfrmCadOrcamento.MontaGridDeServico;
begin
    grdServicos.AddCol('CodigoFilial', 'Filial', 50, mtString);
    grdServicos.AddCol('NumeroOrcamento', 'Orcamento', 60, mtString);
    grdServicos.AddCol('CodigoProduto', 'Produto', 60, mtString);
    // grdServicos.AddCol('DescricaoProduto', 'Descricao', 400, mtString);
    grdServicos.AddCol('DataEmissao', 'Data emissao', 80, mtString);
    grdServicos.AddCol('DataVigenciaInicio', 'Vig.Inicial', 80, mtString);
    grdServicos.AddCol('DataVigenciaFinal', 'Vig.Final', 80, mtString);
    grdServicos.AddCol('EnderecoRisco', 'Endereco riscoPreco Unitario', 400, mtString);
    grdServicos.AddCol('NumeroRisco', 'Numero', 60, mtString);
    grdServicos.AddCol('ComplementoRisco', 'Complemento', 250, mtString);
    grdServicos.AddCol('BairroRisco', 'Bairro Risco', 200, mtString);
    grdServicos.AddCol('MunicipioRisco', 'Municipio Risco', 200, mtString);
    grdServicos.AddCol('UFRisco', 'UF Risco', 60, mtString);
    grdServicos.AddCol('CepRisco', 'Cep Risco', 80, mtString);
    grdServicos.AddCol('ValorCoberturaPrincipal', 'Valor Cobertura Principal', 120, mtCurrency);
    grdServicos.AddCol('ValorPremio', 'Valor Premio', 80, mtCurrency);
    grdServicos.AddCol('NumeroSorteSerie1', 'Numero Sorte Serie 1', 120, mtString);
    grdServicos.AddCol('NumeroSorte1', 'Numero Sorte 1', 80, mtString);
    grdServicos.AddCol('NumeroContrato', 'Contrato', 80, mtString);
    grdServicos.AddCol('NumeroBilhete', 'Bilhete', 80, mtString);
    grdServicos.AddCol('DataCoberturaInicio', 'Inicio Contrato', 80, mtString);
    grdServicos.AddCol('DataCoberturaFinal', 'Fim Contrato', 80, mtString);

    // grdServicos.DataSource := Self.Orcamento.CursoSeguroLista.ToList;
    // grdServicos.DataBind;
end;

procedure TfrmCadOrcamento.SpeedButton1Click(Sender: TObject);
begin
    inherited;
    ExecutarEventoConfirmar(Sender);
end;

procedure TfrmCadOrcamento.SpeedButton2Click(Sender: TObject);
begin
    inherited;
    ExecutarEventoCancelar(Sender);
end;

end.
