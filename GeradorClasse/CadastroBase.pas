{*Created by @ReisCodeGenerator*}
unit UI.ClasseBase.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit, Vcl.ComCtrls, UI.Base.Controlador.CadastroDesktop, UI.Base.CadastroPadrao,
  Biz.ClasseBase;

type
  //TfrmCadClasseBase = class(TFrmCadastroPadrao)
  TfrmCadClasseBase = class(TControladorCadastroDesktop<TClasseBase>)  
    [CRIAR_COMPONENTES_PAS]
	procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClasseBase: TfrmCadClasseBase;

implementation

{$R *.dfm}

procedure TfrmCadClasseBase.FormCreate(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

end.