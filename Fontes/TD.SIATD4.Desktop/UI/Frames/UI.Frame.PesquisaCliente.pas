unit UI.Frame.PesquisaCliente;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
    Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
    Vcl.Mask, REdit, Biz.Cliente, Lib.Enumeradores, Lib.ResultFilter;

type
    TfrmPesquisaCliente = class(TFrame)
        Label2: TLabel;
        edLoja: TREdit;
        edCoigoCliente: TREdit;
        edNomeCliente: TREdit;
        btnConsultaCliente: TBitBtn;
        procedure btnConsultaClienteClick(Sender: TObject);
    private
        FCliente: TCliente;
        procedure popularCliente;
        procedure SetCliente(const Value: TCliente);
    public
        property Cliente: TCliente read FCliente write SetCliente;
        procedure Construir;
        procedure Destruir;
        procedure LimparCampos;
    end;

implementation

{$R *.dfm}

procedure TfrmPesquisaCliente.btnConsultaClienteClick(Sender: TObject);
var
    result: TResultFilter;
begin
    try
        if not assigned(Cliente) then
            exit;

        result := Cliente.Listar(otSelect, False);
        if (assigned(result)) and (result.List.Count > 0) then
        begin
            Cliente.PreencherObjeto(result.List[0]);
            popularCliente;
        end;
    finally
        if result <> nil then
            FreeAndNil(result);
    end;
end;

procedure TfrmPesquisaCliente.Construir;
begin
    FCliente := TCliente.Create;
end;

procedure TfrmPesquisaCliente.Destruir;
begin
    FreeAndNil(FCliente);
end;

procedure TfrmPesquisaCliente.LimparCampos;
begin
    edLoja.Clear;
    edCoigoCliente.Clear;
    edNomeCliente.Clear;
end;

procedure TfrmPesquisaCliente.popularCliente;
begin
    edLoja.Value := Cliente.Loja;
    edCoigoCliente.Value := Cliente.Codigo;
    edNomeCliente.Value := Cliente.Nome;
end;

procedure TfrmPesquisaCliente.SetCliente(const Value: TCliente);
begin
    FCliente := Value;
    if assigned(FCliente) then
        popularCliente;
end;

end.
