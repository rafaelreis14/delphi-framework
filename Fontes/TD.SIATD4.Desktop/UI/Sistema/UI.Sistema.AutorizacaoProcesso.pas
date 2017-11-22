unit UI.Sistema.AutorizacaoProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, Vcl.StdCtrls, Vcl.Mask,
  REdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, UntErrorProvider,    Framework.UI.AutorizacaoProcessoBase,
  Vcl.Imaging.jpeg;

type
  TfrmAutorizacaoProcesso = class(TfrmAutorizacaoProcessoBase)
    Panel1: TPanel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutorizacaoProcesso: TfrmAutorizacaoProcesso;

implementation

{$R *.dfm}

uses Lib.Biblioteca, Lib.Enumeradores;




end.
