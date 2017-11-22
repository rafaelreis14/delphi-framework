unit Framework.Interfaces.Consultavel;

interface

uses
  Lib.Parametro, Lib.Lista, Framework.Interfaces.Listavel;
type
    IConsultavel<T: class> = interface(IListavel)
        function Consultar(parametros:TParametro): TLista<T>;
        function Obter(id: string): T;
    end;


implementation

end.
