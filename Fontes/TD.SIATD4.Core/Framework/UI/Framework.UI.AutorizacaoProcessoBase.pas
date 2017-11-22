unit Framework.UI.AutorizacaoProcessoBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, REdit, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmAutorizacaoProcessoBase = class(TFrmBase)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblTiTuloAutorizacao: TLabel;
    edLogin: TREdit;
    edSenha: TREdit;
    btnEntrar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutorizacaoProcessoBase: TfrmAutorizacaoProcessoBase;

implementation

uses
  Lib.Biblioteca, Lib.Enumeradores;

{$R *.dfm}

procedure TfrmAutorizacaoProcessoBase.btnCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmAutorizacaoProcessoBase.btnEntrarClick(Sender: TObject);
begin
  inherited;
  if (edLogin.Value = EmptyStr) or (edSenha.Value = EmptyStr)  then
  begin
      TLib.MensagemAdvertencia('Necessário preencher todas as informações');
      edLogin.SetFocus;
      exit;
  end;

  RetornoFormulario := rfOK;
  close;

end;

procedure TfrmAutorizacaoProcessoBase.FormShow(Sender: TObject);
begin
  inherited;
  edLogin.SetFocus;
end;

end.
