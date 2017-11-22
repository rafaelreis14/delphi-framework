program GeradorDeClasse;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmGeradorClasse},
  ClsCampo in 'ClsCampo.pas',
  ClsDetalhe in 'ClsDetalhe.pas',
  CadDetalhe in 'CadDetalhe.pas' {frmCadastroDetalhe},
  Lib.Lista in 'C:\Projetos TD\SIATD4\Fontes\TD.SIATD4.Core\Lib\Lib.Lista.pas',
  Lib.Enumeradores in 'C:\Projetos TD\SIATD4\Fontes\TD.SIATD4.Core\Lib\Lib.Enumeradores.pas',
  Lib.Base in 'C:\Projetos TD\SIATD4\Fontes\TD.SIATD4.Core\Lib\Lib.Base.pas';

{$R *.res}

begin
 // ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGeradorClasse, frmGeradorClasse);
  Application.CreateForm(TfrmCadastroDetalhe, frmCadastroDetalhe);
  Application.Run;
end.
