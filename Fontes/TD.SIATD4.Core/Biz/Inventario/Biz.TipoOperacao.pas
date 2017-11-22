unit Biz.TipoOperacao;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.Base, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Biblioteca, Lib.ResultFilter;

type
    TTipoOperacao = class(TBase)
    private
        FCodigoTipoOperacao: string;
        FDescricao: string;
        FDelet: string;
        FSigla: string;
        procedure SetCodigoTipoOperacao(const Value: string);
        procedure SetDelet(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetSigla(const Value: string);
    public
        ///	<summary>

        ///	<summary>
        ///	  M�todo que preenche a inst�ncia do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da inst�ncia
        ///	</param>
        procedure PopularObjeto(tipoOperacao: TTipoOperacao);

        [TPersistable(fgPersistable, 'Z16_TPMOV')]
        property Sigla: string read FSigla write SetSigla;

        [TPersistable(fgPersistable, 'Z16_CODIGO')]
        property CodigoTipoOperacao: string read FCodigoTipoOperacao write SetCodigoTipoOperacao;

        [TPersistable(fgPersistable, 'Z16_DESCRI')]
        property Descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgUpdateable, 'D_E_L_E_T_')]
        property Delet: string read FDelet write SetDelet;

    end;

implementation

{ TTipoOperacao }



{$REGION 'M�todos CRUD'}


{$ENDREGION}

{$REGION 'Regras de Neg�cio'}

procedure TTipoOperacao.PopularObjeto(tipoOperacao: TTipoOperacao);
begin
    Self.Sigla := tipoOperacao.Sigla;
    Self.CodigoTipoOperacao := tipoOperacao.CodigoTipoOperacao;
    Self.Descricao := tipoOperacao.Descricao;
    Self.Delet := tipoOperacao.Delet;

end;

{$ENDREGION}

{$REGION 'M�todos de Propriedades'}

procedure TTipoOperacao.SetCodigoTipoOperacao(const Value: string);
begin
    FCodigoTipoOperacao := Value;
end;

procedure TTipoOperacao.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TTipoOperacao.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TTipoOperacao.SetSigla(const Value: string);
begin
    FSigla := Value;
end;

{$ENDREGION}

end.

