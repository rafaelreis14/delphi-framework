unit Framework.Interfaces.Listavel;

interface

uses Lib.Enumeradores, Lib.ResultFilter;
type
    IListavel = interface
        function Listar(tipoOperacao: TOparationTypes; MultiSelect: Boolean): TResultFilter;
    end;

implementation

end.
