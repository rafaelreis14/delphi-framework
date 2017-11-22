unit untBlink;

interface
uses Classes, Controls, ExtCtrls, SysUtils, Forms;

type
TBlink = class(TThread)
private
  FImagem: TImage;
  FBlinks: Integer;
  FTime: Integer;
  procedure Blink;virtual;
  procedure Finalizar; virtual;
  procedure SetImagem(const Value: TImage);
  procedure SetBlinks(const Value: Integer);
  procedure SetTime(const Value: Integer);
public
  property Time: Integer read FTime write SetTime;
  property Blinks: Integer read FBlinks write SetBlinks;
  property Imagem: TImage read FImagem write SetImagem;
  procedure Execute; override;
end;

implementation

{ TBlink }

procedure TBlink.SetImagem(const Value: TImage);
begin
  FImagem := Value;
end;

procedure TBlink.Blink;
begin
  FImagem.Visible := not FImagem.Visible;
  FImagem.Parent.Refresh;
end;

procedure TBlink.execute;
Var
  i: Integer;
begin
  inherited;
  for i := 0 to FBlinks do
  begin
    Synchronize(Blink);
    Application.ProcessMessages;
    Sleep(FTime);
  end;
  Synchronize(Finalizar);
end;

procedure TBlink.Finalizar;
begin
  FImagem.Visible := true;
end;

procedure TBlink.SetBlinks(const Value: Integer);
begin
  FBlinks := Value;
end;

procedure TBlink.SetTime(const Value: Integer);
begin
  FTime := Value;
end;

end.
