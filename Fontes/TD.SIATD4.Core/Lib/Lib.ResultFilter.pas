unit Lib.ResultFilter;

interface

uses Classes, Lib.Parametro;

type
    TResultFilter = class
    private
        FParameters: TParametro;
        FResultList: TList;
        procedure SetParameters(const Value: TParametro);
        procedure SetResultList(const Value: Tlist);
    published
        property List:Tlist read FResultList write SetResultList;
        property Parameters:TParametro read FParameters write SetParameters;
        //
        destructor Destroy;override;
        constructor Create;
    end;

implementation

{ TResultFilter }

constructor TResultFilter.Create;
begin
    FResultList := TList.Create;
    FParameters := TParametro.Create;

end;

destructor TResultFilter.Destroy;
var
    i : Integer;
begin
  if FParameters <> nil then
    FParameters.Free;

  if Assigned(FResultList) then
  begin
       for I := 0 to FResultList.Count -1 do
          TObject(FResultList.items[I]).Free;
       //
       FResultList.Free;
  end;
  inherited Destroy;
end;

procedure TResultFilter.SetParameters(const Value: TParametro);
begin
  FParameters := Value;
end;

procedure TResultFilter.SetResultList(const Value: Tlist);
begin
  FResultList := Value;
end;

end.
