unit Dal.CondicaoConsulta;

interface

uses classes, Contnrs, System.SysUtils, Lib.Parametro, TypInfo, Lib.Biblioteca;

type
    TCondicao = (ccIgual, ccDiferente, ccMaior, ccMaiorIgual, ccMenor,
    ccMenorIgual, ccIn, ccNotIn, ccLike, ccNotLike, ccLikeInicio, ccLikeFim);
    TLogica = (lgAND, lgOR, lgNenhuma);

    TCampo = class
    private
        FLogica: TLogica;
        FNomeCampo: string;
        FCondicao: TCondicao;
        FAbreParentese: boolean;
        FFrechaParentese: boolean;
        FNomeParametro: string;
        FAlias: string;
        procedure SetCondicao(const Value: TCondicao);
        procedure SetLogica(const Value: TLogica);
        procedure SetNomeCampo(const Value: string);
        procedure SetAbreParentese(const Value: boolean);
        procedure SetFrechaParentese(const Value: boolean);
        procedure SetNomeParametro(const Value: string);
        procedure SetAlias(const Value: string);
    public
        procedure Free;
        property Alias: string read FAlias write SetAlias;
        property NomeCampo: string read FNomeCampo write SetNomeCampo;
        property NomeParametro: string read FNomeParametro write SetNomeParametro;
        property Condicao: TCondicao read FCondicao write SetCondicao;
        property Logica: TLogica read FLogica write SetLogica;
        property AbreParentese: boolean read FAbreParentese write SetAbreParentese;
        property FechaParentese: boolean read FFrechaParentese write SetFrechaParentese;
    end;

    TCondicaoConsulta = class
    private
        FCampos: TObjectList;
        FParametro: TParametro;
        function GetCampos(index: integer): TCampo;
        procedure SetCampos(index: integer; const Value: TCampo);
        procedure SetParametro(const Value: TParametro);
        procedure Adiciona(NomeCampo, NomeParametro: string; Condicao: TCondicao; Logica: TLogica; AbreParentese, FechaParentese: boolean; Alias: string); overload;
        function AchaCampoPorparametro(nome: string): TCampo;
        function ObterCondicao(Condicao: TCondicao): string;
        function ObterLogica(Logica: TLogica): string;
        function FormataParametro(Condicao: TCondicao;
          NomeParametro: string): string;
    public
        property Parametro: TParametro read FParametro write SetParametro;
        property Campos[index: integer]: TCampo read GetCampos write SetCampos;

        procedure Adiciona(NomeCampo, NomeParametro: string;  Condicao: TCondicao; Logica: TLogica; alias: string = ''); overload;
        procedure Adiciona(NomeCampo: string; Condicao: TCondicao; Logica: TLogica; alias: string = ''); overload;

        procedure AdicionaAbrindoParentese(NomeCampo, NomeParametro: string; Condicao: TCondicao; Logica: TLogica); overload;
        procedure AdicionaAbrindoParentese(NomeCampo: string; Condicao: TCondicao; Logica: TLogica); overload;

        procedure AdicionaFechandoParentese(NomeCampo, NomeParametro: string;Condicao: TCondicao; Logica: TLogica); overload;
        procedure AdicionaFechandoParentese(NomeCampo: string; Condicao: TCondicao; Logica: TLogica); overload;

        procedure AdicionaAbrindoFechandoParentese(NomeCampo,
          NomeParametro: string; Condicao: TCondicao; Logica: TLogica);
          overload;
        procedure AdicionaAbrindoFechandoParentese(NomeCampo: string;
          Condicao: TCondicao; Logica: TLogica); overload;
        function ToString(temWhere: boolean = false): string; reintroduce;

        constructor Create(const Parametro: TParametro);
        destructor Destroy; override;
    end;

implementation

{ TWhere }

procedure TCondicaoConsulta.Adiciona(NomeCampo, NomeParametro: string; Condicao: TCondicao;
  Logica: TLogica; AbreParentese, FechaParentese: boolean; Alias: string);
var
    campo: TCampo;
begin
    campo := TCampo.Create;
    campo.NomeCampo := NomeCampo;
    campo.NomeParametro := NomeParametro;
    campo.Condicao := Condicao;
    campo.Logica := Logica;
    campo.Alias := Alias;
    campo.AbreParentese := AbreParentese;
    campo.FechaParentese := FechaParentese;
    FCampos.Add(campo);
end;

function TCondicaoConsulta.AchaCampoPorparametro(nome: string): TCampo;
var
    I: integer;
begin
    result := nil;
    for I := 0 to FCampos.Count - 1 do
    begin
        if TCampo(FCampos[I]).NomeParametro = nome then
        begin
            result := TCampo(FCampos[I]);
            exit;
        end;
    end;
end;

procedure TCondicaoConsulta.Adiciona(NomeCampo, NomeParametro: string; Condicao: TCondicao;  Logica: TLogica; alias: string);
begin
    Adiciona(NomeCampo, NomeParametro, Condicao, Logica, false, false, alias);
end;

procedure TCondicaoConsulta.Adiciona(NomeCampo: string; Condicao: TCondicao; Logica: TLogica; alias: string = '');
begin
    Adiciona(NomeCampo, NomeCampo, Condicao, Logica, false, false, alias);
end;

procedure TCondicaoConsulta.AdicionaAbrindoFechandoParentese(NomeCampo,
  NomeParametro: string; Condicao: TCondicao; Logica: TLogica);
begin
    Adiciona(NomeCampo, NomeParametro, Condicao, Logica, true, true, EmptyStr);
end;

procedure TCondicaoConsulta.AdicionaAbrindoFechandoParentese(NomeCampo: string;
  Condicao: TCondicao; Logica: TLogica);
begin
    AdicionaAbrindoFechandoParentese(NomeCampo, NomeCampo, Condicao, Logica);
end;

procedure TCondicaoConsulta.AdicionaAbrindoParentese(NomeCampo: string;
  Condicao: TCondicao; Logica: TLogica);
begin
    AdicionaAbrindoParentese(NomeCampo, NomeCampo, Condicao, Logica);
end;

procedure TCondicaoConsulta.AdicionaAbrindoParentese(NomeCampo, NomeParametro: string;
  Condicao: TCondicao; Logica: TLogica);
begin
    Adiciona(NomeCampo, NomeParametro, Condicao, Logica, true, false, EmptyStr);
end;

procedure TCondicaoConsulta.AdicionaFechandoParentese(NomeCampo, NomeParametro: string;
  Condicao: TCondicao; Logica: TLogica);
begin
    Adiciona(NomeCampo, NomeParametro, Condicao, Logica, false, true, EmptyStr);
end;

procedure TCondicaoConsulta.AdicionaFechandoParentese(NomeCampo: string;
  Condicao: TCondicao; Logica: TLogica);
begin
    AdicionaFechandoParentese(NomeCampo, NomeCampo, Condicao, Logica);
end;

constructor TCondicaoConsulta.Create(const Parametro: TParametro);
begin
    self.Parametro := Parametro;
    FCampos := TObjectList.Create;
end;

destructor TCondicaoConsulta.Destroy;
begin
    FCampos.Free;
end;

function TCondicaoConsulta.FormataParametro(Condicao: TCondicao;
  NomeParametro: string): string;
begin
    if (Condicao = ccIn) or (Condicao = ccNotIn) then
        result := ' (:' + NomeParametro + ')'
    else if (Condicao = ccLike) or (Condicao = ccNotLike) then
        result := ' ''%''+ :' + NomeParametro + ' +''%'''
    else if Condicao = ccLikeInicio then
        result := ' :' + NomeParametro + ' +''%'''
    else if Condicao = ccLikeFim then
        result := ' ''%''+ :' + NomeParametro
    else
        result := ' :' + NomeParametro;
end;

function TCondicaoConsulta.GetCampos(index: integer): TCampo;
begin
    result := TCampo(FCampos[index]);
end;


function TCondicaoConsulta.ObterCondicao(Condicao: TCondicao): string;
begin
    result := TLib.IfTernario(Condicao = ccIgual, ' = ',
      TLib.IfTernario(Condicao = ccDiferente, ' <> ',
      TLib.IfTernario(Condicao = ccMaiorIgual, ' >= ',
      TLib.IfTernario(Condicao = ccMenorIgual, ' <= ', TLib.IfTernario(Condicao = ccMaior,
      ' > ', TLib.IfTernario(Condicao = ccMenor, ' < ',
      TLib.IfTernario((Condicao = ccLike) or (Condicao = ccLikeInicio) or
      (Condicao = ccLikeFim), ' LIKE ', TLib.IfTernario(Condicao = ccNotLike,
      'NOT LIKE ', TLib.IfTernario(Condicao = ccIn, ' IN ',
      TLib.IfTernario(Condicao = ccNotIn, 'NOT IN ', EmptyStr))))))))));
end;

function TCondicaoConsulta.ObterLogica(Logica: TLogica): string;
begin
    result := TLib.IfTernario(Logica = lgAND, ' AND ', TLib.IfTernario(Logica = lgOR,
      ' OR ', EmptyStr));
end;

function TCondicaoConsulta.ToString(temWhere: boolean = false): string;
var
    item: TItemParametro;
    where: string;
    camp: TCampo;
begin
    if not temWhere then
        where := '  WHERE ';

    if Assigned(Parametro) then
    begin
        if (Parametro.item <> nil) then
        begin
            for item in Parametro.item do
            begin
                camp := AchaCampoPorparametro(item.Chave);
                if camp <> nil then
                begin
                    if (item.Chave <> 'INDICE') and (item.Valor <> 'NULL') then
                    begin
                        where := where + TLib.IfTernario(trim(where) = 'WHERE', EmptyStr,
                          ObterLogica(camp.Logica)) + TLib.IfTernario(camp.AbreParentese,
                          '( ', EmptyStr) + camp.Alias + camp.NomeCampo + ' ' +
                          ObterCondicao(camp.Condicao) +
                          FormataParametro(camp.Condicao, camp.NomeParametro) +
                          TLib.IfTernario(camp.FechaParentese, ') ', EmptyStr);
                    end;
                end;
            end;
            result := TLib.IfTernario(trim(where) = 'WHERE', EmptyStr, where);
        end;
    end;
end;

procedure TCondicaoConsulta.SetCampos(index: integer; const Value: TCampo);
begin
    FCampos[index] := Value;
end;

procedure TCondicaoConsulta.SetParametro(const Value: TParametro);
begin
    FParametro := Value;
end;

{ TCampo }

procedure TCampo.Free;
begin
    FreeAndNil(self);
end;

procedure TCampo.SetAbreParentese(const Value: boolean);
begin
    FAbreParentese := Value;
end;

procedure TCampo.SetAlias(const Value: string);
begin
    FAlias := Value;
end;

procedure TCampo.SetCondicao(const Value: TCondicao);
begin
    FCondicao := Value;
end;

procedure TCampo.SetFrechaParentese(const Value: boolean);
begin
    FFrechaParentese := Value;
end;

procedure TCampo.SetLogica(const Value: TLogica);
begin
    FLogica := Value;
end;

procedure TCampo.SetNomeCampo(const Value: string);
begin
    FNomeCampo := Value;
end;

procedure TCampo.SetNomeParametro(const Value: string);
begin
    FNomeParametro := Value;
end;

end.
