unit Lib.Erro;

interface

uses
    System.SysUtils, System.Classes, Lib.Enumeradores;

type
    Erro = class(Exception)
    private
        FCodigoErro: integer;
        FTipoMensagem: TipoMensagem;
        procedure SetTipoMensagem(const Value: TipoMensagem);
    public
        property CodigoErro : integer read FCodigoErro;
        property TipoMensagem: TipoMensagem read FTipoMensagem write SetTipoMensagem;
        constructor Create(const Msg: string; codigoErro: integer);overload;
        constructor Create(const Msg: string; tipoMensagem: TipoMensagem);overload;
        constructor Create(const Msg: string);overload;
    end;

implementation

{ TError }

constructor Erro.Create(const Msg: string; CodigoErro : integer);
begin
   Inherited Create(Msg);
   FCodigoErro := CodigoErro;
end;


constructor Erro.Create(const Msg: string);
begin
   Inherited Create(Msg);
end;

constructor Erro.Create(const Msg: string; tipoMensagem: TipoMensagem);
begin
    Inherited Create(Msg);
    FTipoMensagem := tipoMensagem;
end;

procedure Erro.SetTipoMensagem(const Value: TipoMensagem);
begin
  FTipoMensagem := Value;
end;

end.
