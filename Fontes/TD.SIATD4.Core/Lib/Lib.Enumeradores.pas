unit Lib.Enumeradores;

interface

uses
    classes,Generics.Collections;

type
    TMaskTypes = (mtNone, mtString, mtInteger, mtDouble, mtCurrency, mtDate, mtLongTime, mtShortTime, mtPhone, mtShortPhone, mtCEP, mtCPF, mtCNPJ);

    TFieldTypes = (fdNormal, fdListCombo, fdDataListCombo, fdCheckList, fdDataCheckList, fdSearch);

    TOparationTypes = (otFilter, otSelect);
    TFilterType = (ftNormal, ftWithParameters, ftAlredyFilteredWithParameters, ftAlredyFilteredWithParametersChangingValues);

    TAlign = (alLeft, alRight, alCenter);

    TRetornoFormulario = (rfCancelado, rfOK, rfComErro);

    TAcaoJanela = (acAlteracao, acInsercao, acVisualizacao, acNenhumaAcao);

    TSituacao = (stAtivo, stInativo, stBloqueado, stCancelado);

    TPermissoesPadroes = (ppIncluir, ppAlterar, ppExcluir, ppVisualizar);

    TTipoVenda = (tvOutrosTipos, tvVendaBalcao, tvVendaFutura);

    TipoMensagem = (MSGErro, MSGInformacao, MSGAdvertencia, MSGPergunta, MSGCaixaEntrada);

    TGenerico = 0..255;

    TTipoAlternativo = (NenhumTipoAlternativo, CrossSelling, UpSelling, Similar);

    TTipoManutencao = (Consulta,Insercao, Alteracao, Exclusao);

    TConverteEnum<T:record> = class
    private
    public
        class procedure PopulateListEnum(AList: TStrings);
        class function ToEnum(const AStr: string):T;
        class function ToString(const eEnum:T):string;

    end;



implementation

  uses
    Variants,SysUtils,TypInfo;


{ TConvert }

class procedure TConverteEnum<T>.PopulateListEnum(AList: TStrings);
var
    i:integer;
    StrTexto:String;
    Enum:Integer;
begin
    i:=0;
    try
        repeat
            StrTexto:=trim(GetEnumName(TypeInfo(T), i));
            Enum:=GetEnumValue(TypeInfo(T),StrTexto);
            AList.Add(StrTexto);
            inc(i);
        until Enum < 0 ;
        AList.Delete(pred(AList.Count));
    except;
        raise EConvertError.Create('O Par�metro passado n�o corresponde a um Tipo ENUM');
    end;
end;

class function TConverteEnum<T>.ToEnum(const AStr: string):T;
var
    P:^T;
    num:Integer;
begin
    try
        num:=GetEnumValue(TypeInfo(T),Astr);
        if num = -1 then
            abort;
        P:=@num;
        result:=P^;
      except
          raise EConvertError.Create('O Par�metro "'+Astr+'" passado n�o '+sLineBreak+
                                      ' corresponde a um Tipo Enumerado');
      end;
end;


class function TConverteEnum<T>.ToString(const eEnum:T): String;
var
    P:PInteger;
    Num:integer;
begin
    try
        P:=@eEnum;
        Num:=integer(TGenerico((P^)));
        Result := GetEnumName(TypeInfo(T),Num);
    except
        raise EConvertError.Create('O Par�metro passado n�o corresponde a '+sLineBreak+
                                   'Ou a um Tipo Enumerado');
    end;
end;

end.
