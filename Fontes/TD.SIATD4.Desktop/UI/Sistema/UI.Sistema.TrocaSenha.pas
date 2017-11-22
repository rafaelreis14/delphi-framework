unit UI.Sistema.TrocaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Lib.Biblioteca, Vcl.Mask,
  REdit, Lib.Parametro, Lib.Enumeradores, Biz.UsuarioLogado, Framework.UI.TrocaSenhaBase;

type
  TFrmTrocaSenha = class(TFrmTrocaSenhaBase)
    Image1: TImage;
    Label1: TLabel;
    pnlAlteracaoSenha: TPanel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrocaSenha: TFrmTrocaSenha;

implementation

uses
  Data.DB;

{$R *.dfm}



end.



