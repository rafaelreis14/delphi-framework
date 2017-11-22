program TesteDBConnectDelphi;

uses
  Vcl.Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  mscorlib_TLB in '..\TypeLibrary\mscorlib_TLB.pas',
  DBConnectSIATD_TLB in '..\TypeLibrary\DBConnectSIATD_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
