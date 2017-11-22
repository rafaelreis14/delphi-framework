unit CadDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, REdit, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  ClsDetalhe;

type
  TfrmCadastroDetalhe = class(TForm)
    Panel2: TPanel;
    lblLetreiro: TLabel;
    pgcComponentes: TPageControl;
    tbPrincipal: TTabSheet;
    Panel3: TPanel;
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblModulo: TLabel;
    edNome: TREdit;
    lblDescricao: TLabel;
    edID: TREdit;
    Label1: TLabel;
    edDesc: TREdit;
    edOoutros: TREdit;
    Label2: TLabel;
    btnExcluir: TBitBtn;
    btnAdicionar: TBitBtn;
    lbOutros: TListBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    Detalhe: TDetalhe;
  end;

var
  frmCadastroDetalhe: TfrmCadastroDetalhe;

implementation

{$R *.dfm}

procedure TfrmCadastroDetalhe.btnAdicionarClick(Sender: TObject);
begin
    lbOutros.AddItem(edOoutros.Value, nil);
    edOoutros.Clear;
    edOoutros.SetFocus;
end;

procedure TfrmCadastroDetalhe.btnCancelarClick(Sender: TObject);
begin
   Detalhe := nil;
   close;
end;

procedure TfrmCadastroDetalhe.btnConfirmarClick(Sender: TObject);
var
    item: string;
    I: Integer;
begin
    Detalhe.NomeClasse := edNome.Value;
    Detalhe.PropriedadeID := edID.Value;
    Detalhe.PropriedadeDescricao := edDesc.Value;

    if lbOutros.Count > 0 then
        for I := 0 to lbOutros.Count-1 do
            Detalhe.OutrasPropriedades.Add(lbOutros.Items[I]);

    close;
end;



procedure TfrmCadastroDetalhe.btnExcluirClick(Sender: TObject);
begin
   lbOutros.DeleteSelected;
   edOoutros.SetFocus;
end;

end.
