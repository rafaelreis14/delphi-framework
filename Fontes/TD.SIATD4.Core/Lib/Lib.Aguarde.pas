unit Lib.Aguarde;

interface

uses SysUtils, windows, forms, Vcl.Controls, Vcl.Graphics;

type

  TStatusWindowHandle = type HWND;

  TAguarde = class
  private
    class var FHintWindow: THintWindow;
    class function CriaTela(formulario: TForm; texto: string; tamanho: integer; cor: TColor): THintWindow;

  public
    class procedure AguardandoFinalizacaoProcesso(formulario:TForm; tamanho: integer; texto: string; cor: TColor = clWhite); overload;
    class procedure AguardandoFinalizacaoProcesso(formulario:TForm; tamanho: integer; cor: TColor = clWhite); overload;
    class procedure AguardandoFinalizacaoProcesso(formulario:TForm; cor: TColor = clWhite); overload;
    class procedure AguardandoFinalizacaoProcesso(formulario:TForm; texto:string); overload;

    class procedure ProcessoFinalizado;
  end;
implementation

class procedure TAguarde.AguardandoFinalizacaoProcesso(formulario:TForm; cor: TColor);
begin
   FHintWindow :=  CriaTela(formulario, 'Aguarde, finalizando o Processo...', 15, cor);
end;

class procedure TAguarde.AguardandoFinalizacaoProcesso(formulario: TForm;  tamanho: integer; cor: TColor);
begin
  FHintWindow :=  CriaTela(formulario, 'Aguarde, finalizando o Processo...', tamanho, cor);
end;

class procedure TAguarde.AguardandoFinalizacaoProcesso(formulario: TForm;  tamanho: integer; texto: string; cor: TColor);
begin
  FHintWindow :=  CriaTela(formulario, texto, tamanho, cor);
end;

class function TAguarde.CriaTela(formulario: TForm; texto: string; tamanho: integer; cor: TColor): THintWindow;
var
  Rect: TRect;
begin
  texto  := ' '+texto+' ';
  Result := THintWindow.Create(nil);

  Result.Canvas.Font.Size := tamanho;
//  Result.Canvas.Font.Style := [fsBold];
  Result.Canvas.brush.Color := cor;
  Rect := Result.CalcHintRect(formulario.Width, texto, nil);
  OffsetRect(Rect, formulario.Left + (formulario.Width - Rect.Right) div 2,
                   formulario.Top + (formulario.Height - Rect.Bottom) div 2);
  Result.ActivateHint(Rect, texto);

  Result.Repaint;


end;

class procedure TAguarde.ProcessoFinalizado;
var int:Integer;
begin
    if FHintWindow <> nil then
      begin
          try
            FHintWindow.ReleaseHandle;
          finally
             FreeAndNil(FHintWindow);
          end;
      end;
end;

class procedure TAguarde.AguardandoFinalizacaoProcesso(formulario: TForm; texto: string);
begin
   FHintWindow :=  CriaTela(formulario, texto, 15, clWhite);

end;

end.
