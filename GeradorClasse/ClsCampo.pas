unit ClsCampo;

interface

type
  TCampo = class
  private
    FNomePropriedade: String;
    FTipoPropriedade: String;
    FNomeColuna: string;
    FTamanho: integer;
    procedure SetNomeColuna(const Value: string);
    procedure SetNomePropriedade(const Value: String);
    procedure SetTipoPropriedade(const Value: String);
    procedure SetTamanho(const Value: integer);
    function GetNomePropriedade: String;
  public
    property NomeColuna:string read FNomeColuna write SetNomeColuna;
    property TipoPropriedade:String read FTipoPropriedade write SetTipoPropriedade;
    property NomePropriedade: String read GetNomePropriedade write SetNomePropriedade;
    property Tamanho: integer read FTamanho write SetTamanho;
  end;
implementation

uses
  System.SysUtils;

{ TCampo }

function TCampo.GetNomePropriedade: String;
begin
    result := trim(FNomePropriedade);
end;

procedure TCampo.SetNomeColuna(const Value: string);
begin
  FNomeColuna := Value;
end;

procedure TCampo.SetNomePropriedade(const Value: String);
begin
  FNomePropriedade := Value;
end;

procedure TCampo.SetTamanho(const Value: integer);
begin
  FTamanho := Value;
end;

procedure TCampo.SetTipoPropriedade(const Value: String);
begin
  FTipoPropriedade := Value;
end;

end.
