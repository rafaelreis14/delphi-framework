unit ClsDetalhe;

interface

uses
    System.Classes;

type
    TDetalhe = class
    private
        FPropriedadeDescricao: string;
        FNomeClasse: string;
        FPropriedadeID: String;
        FOutrasPropriedades: TStringList;
        procedure SetNomeClasse(const Value: string);
        procedure SetOutrasPropriedades(const Value: TStringList);
        procedure SetPropriedadeDescricao(const Value: string);
        procedure SetPropriedadeID(const Value: String);
    public
        property NomeClasse: string read FNomeClasse write SetNomeClasse;
        property PropriedadeID: String read FPropriedadeID write SetPropriedadeID;
        property PropriedadeDescricao: string read FPropriedadeDescricao write SetPropriedadeDescricao;
        property OutrasPropriedades: TStringList read FOutrasPropriedades write SetOutrasPropriedades;

        constructor Create;
        destructor Destroy; override;
    end;

implementation

uses
    System.SysUtils;

{ TDetalhe }

constructor TDetalhe.Create;
begin
    FOutrasPropriedades := TStringList.Create;
end;

destructor TDetalhe.Destroy;
begin
    FreeAndNil(FOutrasPropriedades);
    inherited;
end;

procedure TDetalhe.SetNomeClasse(const Value: string);
begin
    FNomeClasse := Value;
end;

procedure TDetalhe.SetOutrasPropriedades(const Value: TStringList);
begin
    FOutrasPropriedades := Value;
end;

procedure TDetalhe.SetPropriedadeDescricao(const Value: string);
begin
    FPropriedadeDescricao := Value;
end;

procedure TDetalhe.SetPropriedadeID(const Value: String);
begin
    FPropriedadeID := Value;
end;

end.
