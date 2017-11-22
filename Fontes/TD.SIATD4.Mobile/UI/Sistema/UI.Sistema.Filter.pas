unit UI.Sistema.Filter;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FilterBase, Vcl.Menus, UntErrorProvider,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, RGrid, RComboBox,
    Vcl.ComCtrls;

type
    TFrmFilter = class(TFrmFilterBase)
        btnPesquisar: TSpeedButton;
        btnDados: TSpeedButton;
        Bevel2: TBevel;
        btnInformacaoCadastro: TBitBtn;
        Bevel3: TBevel;
        procedure FormShow(Sender: TObject);
        procedure btnPesquisarClick(Sender: TObject);
        procedure btnDadosClick(Sender: TObject);
        procedure btnFiltrarClick(Sender: TObject);
        procedure btnInformacaoCadastroClick(Sender: TObject);
    private
        { Private declarations }
    public
        procedure ValidarComponentes;
    end;

var
    FrmFilter: TFrmFilter;

implementation

{$R *.dfm}

uses Lib.Enumeradores;

procedure TFrmFilter.FormShow(Sender: TObject);
begin
    inherited;
    // grdSearch.Parent := pgPrincipal.Pages[1];
    // pgPrincipal.Pages[1].InsertControl(grdSearch);
    // grdSearch.Align := alClient;

    self.Height := 338;
    self.Width := 258;

    if self.FFilter._FilterType in [ftAlredyFilteredWithParameters, ftAlredyFilteredWithParametersChangingValues] then
    begin
        btnDadosClick(Sender);
    end;

end;

procedure TFrmFilter.btnDadosClick(Sender: TObject);
begin
    inherited;
    btnDados.Down := true;
    lbl1.Visible := false;
    cbComponents.Visible := false;
    cbIndexes.Visible := false;
    grdSearch.Visible := true;
    btnInformacaoCadastro.Visible := true;
end;

procedure TFrmFilter.btnFiltrarClick(Sender: TObject);
begin
    btnDadosClick(Sender);
    inherited;
end;

procedure TFrmFilter.btnInformacaoCadastroClick(Sender: TObject);
begin
    inherited;
    VisualizarCadastro1Click(Sender);
end;

procedure TFrmFilter.btnPesquisarClick(Sender: TObject);
begin
    inherited;
    btnPesquisar.Down := true;
    lbl1.Visible := true;
    cbComponents.Visible := true;
    cbIndexes.Visible := true;
    grdSearch.Visible := false;
    btnInformacaoCadastro.Visible := false;
    cbComponents.Width := 223;
    cbIndexes.Width := 160;
    cbIndexes.Visible := true;
end;

procedure TFrmFilter.ValidarComponentes;
begin
    btnPesquisar.Down := not btnPesquisar.Down;
    btnDados.Down := not btnPesquisar.Down;
    lbl1.Visible := not lbl1.Visible;
    cbComponents.Visible := not cbComponents.Visible;
    cbIndexes.Visible := not cbIndexes.Visible;
    grdSearch.Visible := not grdSearch.Visible;
    btnInformacaoCadastro.Visible := not btnInformacaoCadastro.Visible;
end;

end.
