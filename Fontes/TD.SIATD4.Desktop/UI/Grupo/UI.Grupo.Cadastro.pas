{*Created by @ReisCodeGenerator*}
unit UI.Grupo.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.Grupo;

type
  //TfrmCadGrupo = class(TFrmCadastroPadrao)
  TfrmCadGrupo = class(TControladorCadastroDesktop<TGrupo>)  
    lblGrupo: TLabel;
    edGrupo: TREdit;
    lblDescricao: TLabel;
    edDescricao: TREdit;
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation

{$R *.dfm}

procedure TfrmCadGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.
