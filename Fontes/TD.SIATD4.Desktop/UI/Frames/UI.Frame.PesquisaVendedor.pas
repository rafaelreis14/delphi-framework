unit UI.Frame.PesquisaVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, REdit, Biz.Vendedor, Lib.Enumeradores, Lib.ResultFilter;

type
  TfrmPesquisaVendedor = class(TFrame)
    Label3: TLabel;
    edCodigoVendedor: TREdit;
    edNomeVendedor: TREdit;
    btnConsultaVendedor: TBitBtn;
    procedure btnConsultaVendedorClick(Sender: TObject);
  private
    FVendedor: TVendedor;
    procedure popularVendedor;
    procedure SetVendedor(const Value: TVendedor);
  public
    property Vendedor:TVendedor read FVendedor write SetVendedor;
    procedure Construir;
    procedure Destruir;
    procedure LimparCampos;
  end;

implementation

{$R *.dfm}

procedure TfrmPesquisaVendedor.btnConsultaVendedorClick(Sender: TObject);
var
    result : TResultFilter;
begin
    try
        if not Assigned(Vendedor) then exit;
        result := Vendedor.Listar(otSelect, False);
        if Assigned(result) and (result.list.Count > 0) then
        begin
            Vendedor.PreencherObjeto(result.list[0]);
            popularVendedor;
        end;
    finally
        if result <> nil then
            FreeAndNil(result);
    end;
end;

procedure TfrmPesquisaVendedor.Construir;
begin
    FVendedor := TVendedor.Create;
end;

procedure TfrmPesquisaVendedor.Destruir;
begin
   FreeAndNil(FVendedor);
end;

procedure TfrmPesquisaVendedor.LimparCampos;
begin
    edCodigoVendedor.Clear;
    edNomeVendedor.Clear;
end;

procedure TfrmPesquisaVendedor.popularVendedor;
begin
    edCodigoVendedor.Value := Vendedor.Codigo;
    edNomeVendedor.Value := Vendedor.NomeReduzido;
end;

procedure TfrmPesquisaVendedor.SetVendedor(const Value: TVendedor);
begin
  FVendedor := Value;
  if Assigned(FVendedor) then
    popularVendedor;
end;

end.
